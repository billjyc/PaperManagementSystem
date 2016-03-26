package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherCourseManager;
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
 * 教师成绩管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class TeacherCourseController {
	@Autowired
	private JSONUtil jsonUtil;
	private static Logger logger = LoggerFactory.getLogger(TeacherCourseController.class);
	
	@Autowired
	private TeacherCourseManager teacherCourseManager;
	
	/**
	 * 获得老师负责的课程信息列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/tutor/getallcourseInfo.do")
	@ResponseBody
	public void getGradeList(HttpServletRequest request,HttpServletResponse response,
			ModelMap model){
		HttpSession session = request.getSession();
		String teacherNo = (String) session.getAttribute("actorNo");
		
		JSONObject jsonobj = teacherCourseManager.getGradeList(teacherNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 获得老师负责的课程列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/tutor/getallcourse.do")
	@ResponseBody
	public void getCourseList(HttpServletRequest request,HttpServletResponse response,
			ModelMap model){
		HttpSession session = request.getSession();
		String teacherNo = (String) session.getAttribute("actorNo");

		JSONObject jsonobj = teacherCourseManager.getCourseList(teacherNo);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 导入成绩单excel
	 */
	@RequestMapping(value = "/teacher/importTranscriptExcel.do")
	@ResponseBody
	public void importTranscriptExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		
		JSONObject jsonobj = teacherCourseManager.importTranscriptExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 添加单条成绩信息
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/tutor/importTransript.do")
	@ResponseBody
	public void importTransript(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("jsonStr") String infoStr) {
		JSONObject jsonobj = teacherCourseManager.importTransript(infoStr);
		jsonUtil.sendJson(response, jsonobj);
	}

	/*
	 * 编辑成绩
	 */
	@RequestMapping(value = "/tutor/editgrade.do")
	@ResponseBody
	public void editCourse(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("oper") String oper, 
			@RequestParam(value = "courseInfoId", required = false) String courseInfoId, 
			@RequestParam(value = "courseNo", required = false) String courseNo,
			@RequestParam(value = "courseName", required = false) String courseName,
			@RequestParam(value = "studentNo", required = false) String studentNo,
			@RequestParam(value = "studentName", required = false) String studentName,
			@RequestParam(value = "score", required = false) String score) throws Exception {
		teacherCourseManager.editCourse(oper, courseInfoId, courseNo, courseName, studentNo, studentName, 
				score);
	}
}