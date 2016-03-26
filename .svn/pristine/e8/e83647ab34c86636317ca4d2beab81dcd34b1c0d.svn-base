package nju.software.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.student.StudentCourseManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 学生课程信息控制类
 * @author billjyc
 * @date 2015-3-21
 *
 */
@Controller
public class StudentCourseController {
	private static Logger logger = LoggerFactory.getLogger(StudentCourseController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private StudentCourseManager studentCourseManager;
	
	/**
	 * 获得学生的课程信息
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/getcourseinfo.do")
	@ResponseBody
	public void getCousreInfoList(HttpServletRequest request,HttpServletResponse response,
			ModelMap model){
		HttpSession session = request.getSession();
		String studentNo = (String) session.getAttribute("actorId");
		
		JSONObject jsonobj = studentCourseManager.getCousreInfoList(studentNo);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	@RequestMapping(value = "/student/exportTranscriptExcel.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void exportStudentTranscriptExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		String studentNo = (String) session.getAttribute("actorId");
		
		JSONObject jsonobj = studentCourseManager.exportStudentTranscriptExcel(studentNo, response);
		jsonUtil.sendJson(response, jsonobj);
	}
}
