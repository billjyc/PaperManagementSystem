package nju.software.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.student.StudentInterimReportManager;
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
 * 学生中期报告控制类
 * @author jiayicong
 * @date 2015-3-21
 *
 */
@Controller
public class StudentInterimReportController {
	private static Logger logger = LoggerFactory.getLogger(StudentInterimReportController.class);

	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private StudentInterimReportManager studentInterimReportManager;
	
	/**
	 * 提交中期报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/submitinterimreport.do")
	@ResponseBody
	public void submitInterimReport(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)  {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");
		
		JSONObject jsonobj = studentInterimReportManager.submitInterimReport(request, actorId, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 更新中期报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/updateinterimreport.do")
	@ResponseBody
	public void updateInterimReport(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");

		JSONObject jsonobj = studentInterimReportManager.updateInterimReport(request, actorId, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 下载中期报告
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/downloadinterimreport.do", method = RequestMethod.POST)
	public void downloadinterimreport(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		
		JSONObject jsonobj = studentInterimReportManager.downloadInterimReport(response, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
}
