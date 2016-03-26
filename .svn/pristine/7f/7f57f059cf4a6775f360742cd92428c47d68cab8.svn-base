package nju.software.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import nju.software.service.MessageService;
import nju.software.service.SuggestionService;
import nju.software.web.vo.Msg;
import nju.software.web.websocket.command.SendMessageCommand;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;

/**
 * 消息推送控制类
 * @author Cancy
 *
 */
@Controller
public class MessageController {
	@Autowired
	private MessageService messageService;
	@Autowired
	private SuggestionService suggestionService;
	
	private static Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	private SimpMessagingTemplate template;
	
	@Autowired
	public MessageController(SimpMessagingTemplate t) {
		this.template = t;
	}
	
	/**
	 * 教师登陆后初始化消息
	 * @param accountId
	 * @param teacherId
	 * @return
	 */
	@SubscribeMapping("/initMessage/{accountId}/{teacherId}")
	public Msg getMsg(@DestinationVariable("accountId") int accountId, 
			@DestinationVariable("teacherId") int teacherId) {
		logger.debug("teacher id is {}", teacherId);
		Msg msg = new Msg();
		
		if(teacherId != 0) {
			msg = messageService.getMsg(teacherId, accountId);
		}
		return msg;
	}
	
	/**
	 * 服务器端接收的地址是/getMsg/{accountId}/{teacherId}
	 * 需要发送到客户端的地址是/getMessage
	 * 
	 * @param accountId
	 * @param teacherId
	 * @return
	 */
	@MessageMapping("/getMsg/{accountId}/{teacherId}")
	@SendTo("/getMessage")
	public Msg getMsg2(@DestinationVariable("accountId") int accountId, 
			@DestinationVariable("teacherId") int teacherId) {
		logger.debug("send message");
		Msg msg = new Msg();
		
		if(teacherId != 0) {
			msg = messageService.getMsg(teacherId, accountId);
		}
		logger.debug("message: {}", msg);
		return msg;
		//this.template.convertAndSend("/getMsg", msg);
	}
	
	/**
	 * 返回未读消息的数量
	 * @param accountId
	 * @return
	 */
	@SubscribeMapping("/initMessage/getNotReadSuggestion/{accountId}")
	public Integer getNotReadSuggestion(@DestinationVariable int accountId) {
		logger.debug("receive message");
		String dest = "/receiveMessage/" + accountId;
		Integer notRead = suggestionService.getSuggestionNotRead(accountId);
		return notRead;
		//this.template.convertAndSend(dest, notRead);
	}
	
	@MessageMapping("/sendMessage/{accountId}")
	public void sendSuggestion(SendMessageCommand message, @DestinationVariable int accountId) throws UnsupportedEncodingException {
		logger.debug("receive message");
		String dest = "/receiveMessage/" + accountId;
		String content = URLDecoder.decode(message.getContent(), "utf-8");
		logger.debug(content);
		this.template.convertAndSend(dest, content);
	}
}
