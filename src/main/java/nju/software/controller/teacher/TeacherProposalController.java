package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherProposalManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教师开题报告控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class TeacherProposalController {
	@Autowired
	private JSONUtil jsonUtil;
	private static Logger logger = LoggerFactory.getLogger(TeacherProposalController.class);
	@Autowired
	private TeacherProposalManager teacherProposalManager;


	/**
	 * 获得待审开题报告
	 */
	@RequestMapping(value = "/tutor/getuncheckedproposal.do")
	@ResponseBody
	public void getUncheckedProposal(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		String actorNo = (String) request.getSession().getAttribute("actorNo");
		
		JSONObject jsonobj = teacherProposalManager.getUncheckedProposal(actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 获得已通过开题报告
	 */
	@RequestMapping(value = "/tutor/getpassedproposal.do")
	@ResponseBody
	public void getPassedProposal(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		int teacherId = (Integer) request.getSession().getAttribute("teacherId");
		
		JSONObject jsonobj = teacherProposalManager.getPassedProposal(teacherId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 判定开题报告是否通过
	 */
	@RequestMapping(value="/tutor/judgeproposal.do")
	@ResponseBody
	public void judgeProposal(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("jsonstr") String judgestr) {
		JSONObject jsonobj = teacherProposalManager.judgeProposal(judgestr);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 下载开题报告
	 * @param request
	 * @param response
	 * @param model
	 * @param path
	 */
	@RequestMapping(value = "/tutor/downloadproposal.do", method = RequestMethod.POST)
	@ResponseBody
	public void downloadproposal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model, @RequestParam("path") String path) {
		teacherProposalManager.downloadProposal(path, response);
	}	
}
