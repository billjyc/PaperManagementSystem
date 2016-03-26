package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanNoticeManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教务员通知管理控制类
 * @author billjyc
 *
 */
@Controller
public class DeanNoticeController {
	private static Logger logger = LoggerFactory.getLogger(DeanNoticeController.class);
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanNoticeManager deanNoticeManager;
	
	@RequestMapping(value = "/dean/editnotice.do")
	@ResponseBody
	public void editNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam("oper") String oper, 
			@RequestParam(value = "noticeIds", required = false) String noticeIds, 
			@RequestParam(value = "noticeLevel", required = false) String noticeLevelS, 
			@RequestParam(value = "noticeTheme", required = false) String noticeTheme, 
			@RequestParam(value = "noticeId", required = false) String noticeIdS) {
		Integer teacherId = (Integer)request.getSession().getAttribute("teacherId");
		deanNoticeManager.editNotice(oper, noticeIds, noticeLevelS, noticeTheme, teacherId, noticeIdS);
	}

	@RequestMapping(value = "/dean/editnoticecontent.do")
	@ResponseBody
	public void editNoticeContent(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("oper") String oper, @RequestParam("noticeId") String noticeIdS, 
			@RequestParam(value = "noticeContent", required = false) String noticeContent) {
		deanNoticeManager.editNoticeContent(oper, noticeIdS, noticeContent);
	}

	@RequestMapping(value = "/dean/getnotice.do")
	public void getNotice(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		int teacherId = (Integer)request.getSession().getAttribute("teacherId");
		JSONObject jsonobj = deanNoticeManager.getAllNotices(teacherId);
		jsonUtil.sendJson(response, jsonobj);
	}
}
