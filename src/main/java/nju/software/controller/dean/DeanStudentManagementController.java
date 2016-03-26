package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanStudentManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教务员学生管理控制类
 * @author billjyc
 *
 */
@Controller
public class DeanStudentManagementController{
	private static Logger logger = LoggerFactory.getLogger(DeanStudentManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanStudentManager deanStudentManager;
	
	/**
	 * 所有学生列表，分页
	 * @author Jason
	 */
	@RequestMapping(value="/dean/getallstudents.do")
	@ResponseBody
	public void getAllStudents(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("type") String typeS, @RequestParam("page") String pageS, 
			@RequestParam("rows") String rowsS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord, @RequestParam("_search") String search, 
			@RequestParam(value = "searchOper", required = false) String searchOper, 
			@RequestParam(value = "searchString", required = false) String searchString, 
			@RequestParam(value = "searchField", required = false) String searchField){
		JSONObject jsonobj = deanStudentManager.getAllStudents(typeS, pageS, rowsS, sidx, sord, search, 
				searchField, searchOper, searchString);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 添加学生账号
	 * @param request
	 * @param response
	 * @param model
	 * @param studentstr
	 */
	@RequestMapping(value = "/dean/importstudent.do")
	@ResponseBody
	public void importStudent(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("jsonStr")String studentstr) {
		JSONObject jsonobj = deanStudentManager.importStudent(studentstr);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 导入学生excel
	 */
	@RequestMapping(value = "/dean/importStudentExcel.do")
	@ResponseBody
	public void importStudentExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		logger.debug("import student excel----->");
		JSONObject jsonobj = deanStudentManager.importStudentExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出学生excel
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/exportStudentExcel.do")
	@ResponseBody
	public void exportStudentExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=student.xls");  
		deanStudentManager.exportStudentExcel(response);
	}
	
	/**
	 * 编辑学生表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/editstudent.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void editStudent(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam(value = "studentNumber", required = false) String studentNumber, 
			@RequestParam(value = "studentName", required = false) String studentName, 
			@RequestParam(value = "studentGrade", required = false) String studentGrade, 
			@RequestParam(value = "studentDegreeType", required = false) String studentDegreeTypeS, 
			@RequestParam(value = "studentPhone1", required = false) String studentPhone1, 
			@RequestParam(value = "studentPhone2", required = false) String studentPhone2, 
			@RequestParam(value = "studentEmail", required = false) String studentEmail, 
			@RequestParam(value = "studentType", required = false) String studentTypeS, 
			@RequestParam(value = "studentId", required = false) String studentIdS, 
			@RequestParam("oper") String oper) {
		deanStudentManager.editStudent(oper, studentIdS, studentDegreeTypeS, studentNumber, 
				studentEmail, studentGrade, studentName, studentPhone1, studentPhone2, 
				studentTypeS);
	}
	
	/**
	 * 学生列表页面导入成绩
	 */
	@RequestMapping(value = "/dean/importScoreExcel.do")
	@ResponseBody
	public void importScoreExcel(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)  {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanStudentManager.importScoreExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}
}
