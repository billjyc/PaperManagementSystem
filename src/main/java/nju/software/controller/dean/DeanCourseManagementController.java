package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanCourseManager;
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
 * 教务员课程管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class DeanCourseManagementController{
	private static Logger logger = LoggerFactory.getLogger(DeanCourseManagementController.class);

	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanCourseManager deanCourseManager;

	/**
	 * 所有课程列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/dean/getallcourses.do")
	@ResponseBody
	public void getAllCourses(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("_search") String search, 
			@RequestParam(value = "searchOper", required = false) String searchOper, 
			@RequestParam(value = "searchString", required = false) String searchString, 
			@RequestParam(value = "searchField", required = false) String searchField){
		JSONObject jsonobj = deanCourseManager.getAllCourses(search, searchField, searchOper, searchString);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 待分配课程列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/getallcourse.do")
	@ResponseBody
	public void getCousreList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		JSONObject jsonobj = deanCourseManager.getUnassignedCourseList();
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 课程分配列表
	 */
	@RequestMapping(value = "/dean/getCourseAssignList.do")
	@ResponseBody
	public void getCourseAssignList(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		JSONObject jsonobj = deanCourseManager.getCourseAssignList();
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 分配课程
	 */
	@RequestMapping(value = "/dean/assigncourse.do")
	@ResponseBody
	public void assignCourse(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam("list") String postData) {
		//获取当前操作者
		JSONObject jsonobj = deanCourseManager.assignCourse(postData);
		jsonUtil.sendJson(response,jsonobj);
	}

	/**
	 * 获取已分配学生的课程列表，分页
	 * @author cj
	 * wss
	 */
	@RequestMapping(value = "/dean/studentCourseInfoList.do")
	public void getStudentCourseInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("type") String typeS, @RequestParam("page") String pageS, 
			@RequestParam("rows") String rowsS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord, @RequestParam("_search") String search, 
			@RequestParam(value = "searchOper", required = false) String searchOper, 
			@RequestParam(value = "searchString", required = false) String searchString, 
			@RequestParam(value = "searchField", required = false) String searchField){
		JSONObject jsonobj = deanCourseManager.getStudentCourseInfo(typeS, pageS, rowsS, search, 
				sidx, sord, searchField, searchOper, searchString);
		jsonUtil.sendJson(response, jsonobj);
	}

	/*
	 * 编辑课程表
	 */
	@RequestMapping(value = "/dean/editcourse.do")
	@ResponseBody
	public void editCourse(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("oper") String oper, 
			@RequestParam(value = "courseId", required = false) String courseIdS, 
			@RequestParam(value = "courseName", required = false) String courseName,
			@RequestParam(value = "teacherNo", required = false) String teacherNo,
			@RequestParam(value = "teacherName", required = false) String teacherName,
			@RequestParam(value = "courseNo", required = false) String courseNo,
			@RequestParam(value = "date", required = false) String dateS) throws Exception {
		deanCourseManager.editCourse(oper, courseIdS, courseName, courseNo, teacherName, teacherNo, dateS);
	}

	/**
	 * 导入课程excel
	 * 2014-4-23下午09:25:39
	 * @author Jay，Wang
	 */
	@RequestMapping(value = "/dean/importCourse.do")
	@ResponseBody
	public void importCourse(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("jsonStr") String courseStr) {
		JSONObject jsonobj = deanCourseManager.importCourse(courseStr);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导入课程excel
	 * 2014-4-24上午09:25:39
	 * @author Jay，Wang
	 */
	@RequestMapping(value = "/dean/importCourseExcel.do")
	@ResponseBody
	public void importCourseExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanCourseManager.importCourseExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出课程excel
	 */
	@RequestMapping(value = "/dean/exportCourseExcel.do")
	@ResponseBody
	public void exportCourseExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		deanCourseManager.exportCourseExcel(response);
	}

	/**
	 * 导入选课excel
	 * 2014-4-25下午06:25:39
	 * @author Jay，Wang
	 */
	@RequestMapping(value = "/dean/importStudentCourseInfoExcel.do")
	@ResponseBody
	public void importStudentCourseInfoExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanCourseManager.importStudentCourseInfoExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出选课excel
	 */
	@RequestMapping(value = "/dean/exportStudentCourseInfoExcel.do")
	@ResponseBody
	public void exportStudentCourseInfoExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		deanCourseManager.exportStudentCourseInfoExcel(response);
	}
}
