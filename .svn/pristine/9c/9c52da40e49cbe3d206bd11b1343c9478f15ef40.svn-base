package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanTeacherManager;
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
 * 教务员教师管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class DeanTeacherManagementController {
	private static Logger logger = LoggerFactory.getLogger(DeanTeacherManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanTeacherManager deanTeacherManager;
	
	/**
	 * 所有老师列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/getallteachers.do")
	@ResponseBody
	public void getAllTeachers(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam("page") String pageS, 
			@RequestParam("rows") String rowsS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord){
		JSONObject jsonobj = deanTeacherManager.getAllTeachers(pageS, rowsS, sidx, sord);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 导入老师excel
	 */
	@RequestMapping(value = "/dean/importTeacherExcel.do")
	@ResponseBody
	public void importTeacherExcel(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)  {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanTeacherManager.importTeacherExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出老师excel
	 */
	@RequestMapping(value = "/dean/exportTeacherExcel.do")
	@ResponseBody
	public void exportTeacherExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=teacher.xls");  
		deanTeacherManager.exportTeacherExcel(request, response);
	}
	
	/**
	 * 编辑老师表
	 * @param request
	 * @param response
	 * @param model
	 * @param oper 操作类型 del,edit,add
	 * @throws Exception
	 */
	@RequestMapping(value = "/dean/editteacher.do")
	@ResponseBody
	public void editTeacher(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("oper") String oper, 
			@RequestParam(value = "teacherId", required = false) String teacherIdS, 
			@RequestParam(value = "teacherNumber", required = false) String teacherNumber, 
			@RequestParam(value = "teacherName", required = false) String teacherName, 
			@RequestParam(value = "teacherClasses", required = false) String teacherClasses, 
			@RequestParam(value = "teacherEducation", required = false) String teacherEducation, 
			@RequestParam(value = "teacherJobTitle", required = false) String teacherJobTitle, 
			@RequestParam(value = "teacherQualification", required = false) String teacherQualification, 
			@RequestParam(value = "teacherPhone", required = false) String teacherPhone, 
			@RequestParam(value = "teacherEmail", required = false) String teacherEmail) throws Exception {
		deanTeacherManager.editTeacher(oper, teacherIdS, teacherName, teacherClasses, teacherEducation,
				teacherEmail, teacherJobTitle, teacherNumber, teacherPhone, teacherQualification);
	}
}
