package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherDefenseManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 教师答辩工作控制类
 * @author Emmy
 *
 */
@Controller
public class TeacherDefenseController {
	@Autowired
	private JSONUtil jsonUtil;
	
	private static Logger logger = LoggerFactory.getLogger(TeacherDefenseController.class);

	@Autowired
	private TeacherDefenseManager teacherDefenseManager;
	
	/**
	 * 答辩待决议列表（答辩秘书）
	 * @author Emmy
	 */
	@RequestMapping(value="/tutor/defenselist.do")
	public void getDefenseList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		HttpSession session = request.getSession();
		String actorNo = (String)session.getAttribute("actorNo");
		
		JSONObject jsonobj = teacherDefenseManager.getDefenseList(actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 答辩决议（文秘）
	 * @author Emmy
	 */
	@RequestMapping(value = "/tutor/defensedecision.do")
	public void defenseDecision(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("paperid") String paperIdS, @RequestParam("taskid") String taskIdS, 
			@RequestParam("result") String result, @RequestParam("defense_content") String defenseContent, 
			@RequestParam("three_one") String threeOne) {
		logger.info("defense decision");
		Integer paperId = Integer.parseInt(paperIdS);
		logger.debug("paper ID: {}", paperId);
		String actorNo = (String) request.getSession().getAttribute("actorNo");

		JSONObject jsonobj = teacherDefenseManager.makeDefenseDecision(paperId, 
				defenseContent, result, threeOne, request, taskIdS, actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 暂缓评审待决议列表（答辩评委）
	 */
	@RequestMapping(value="/tutor/reprievedecisionlist.do")
	public void getReprieveDecisionList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		HttpSession session = request.getSession();
		String actorNo = (String)session.getAttribute("actorNo");
		
		JSONObject jsonobj = teacherDefenseManager.getReprieveDecisionList(actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 暂缓评审决议（答辩评委）
	 * @author Emmy
	 */
	@RequestMapping(value = "/tutor/reprievedecision.do")
	public void reprieveDecision(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("paperid") String paperidS, @RequestParam("taskid") String taskIdS, 
			@RequestParam("result") String resultS, @RequestParam("reprieve_content") String reprieveContent) {
		String actorNo = (String) request.getSession().getAttribute("actorNo");
		
		JSONObject jsonobj = teacherDefenseManager.reprieveDecision(paperidS, resultS, 
				reprieveContent, request, actorNo, taskIdS);
		jsonUtil.sendJson(response, jsonobj);
	}
	/**
	 * 已答辩列表
	 * @author Emmy
	 */
	@RequestMapping(value="/tutor/defensedlist.do")
	public void getDefensedList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		HttpSession session = request.getSession();
		String actorNo = (String)session.getAttribute("actorNo");
		int teacherId = (int)session.getAttribute("teacherId");
		
		JSONObject jsonobj = teacherDefenseManager.getDefensedList(teacherId,actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}
}
