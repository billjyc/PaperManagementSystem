package nju.software.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.student.StudentProposalManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 学生开题报告控制类
 * @author billjyc
 *
 */
@Controller
public class StudentProposalController {
	
	private static Logger logger = LoggerFactory.getLogger(StudentProposalController.class);
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private StudentProposalManager studentProposalManager;
	
	/**
	 * 提交开题报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/submitproposal.do")
	@ResponseBody
	public void submitProposal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");
		logger.debug("student id: {}, actor id: {}", studentId, actorId);

		JSONObject jsonobj = studentProposalManager.submitProposal(request, actorId, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 更新开题报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/updateproposal.do")
	@ResponseBody
	public void updateProposal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");

		JSONObject jsonobj = studentProposalManager.updateProposal(request, actorId, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 下载开题报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/downloadproposal.do", method = RequestMethod.POST)
	public void downloadproposal(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		logger.info("download proposal");
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");

		JSONObject jsonobj = studentProposalManager.downloadProposal(response, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
}
