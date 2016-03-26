package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanClassManager;
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
 * 教务员教学点班级管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class DeanClassManagementController {
	private static Logger logger = LoggerFactory.getLogger(DeanClassManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanClassManager deanClassManager;
	
	/**
	 * 所有教学点班级列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/dean/getallclasses.do")
	@ResponseBody
	public void getAllClasses(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanClassManager.getAllClasses();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获取待分配班级列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/getclassassignlist.do")
	@ResponseBody
	public void getClassAssignList(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanClassManager.getClassAssignList();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获取已分配班级信息
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/dean/classAssignedList.do")
	public void getClassAssignedList(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanClassManager.getClassAssignedList();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 分配班级
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/dean/assignclass.do")
	@ResponseBody
	public void assignClass(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam("list") String postData){
		JSONObject jsonobj = deanClassManager.assignClass(postData);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/*
	 * 编辑教学点班级列表
	 */
	@RequestMapping(value = "/dean/editclasses.do")
	@ResponseBody
	public void editClasses(HttpServletRequest request, HttpServletResponse response,
			ModelMap model, @RequestParam("oper") String oper, 
			@RequestParam(value = "id", required = false) String idS,
			@RequestParam(value = "no", required = false) String no,
			@RequestParam(value = "graduateNum", required = false) String graduateNumS,
			@RequestParam(value = "headTeacherName", required = false) String headTeacherName,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "size", required = false) String sizeS,
			@RequestParam(value = "teachingPointNo", required = false) String teachingPointNo,
			@RequestParam(value = "teachingPointName", required = false) String teachingPointName,
			@RequestParam(value = "headTeacherNo", required = false) String headTeacherNo){
		deanClassManager.editClasses(oper, idS, no, graduateNumS, sizeS, name, headTeacherName,
				headTeacherNo, teachingPointName, teachingPointNo);
	}
	
	/*
	 * 导入班级信息Excel
	 */
	@RequestMapping(value = "/dean/importClassesExcel.do")
	@ResponseBody
	public void importClassesExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanClassManager.importClassesExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/*
	 * 导入班级分配Excel
	 */
	@RequestMapping(value = "/dean/importClassAssignExcel.do")
	@ResponseBody
	public void importClassAssignExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanClassManager.importClassAssignExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/*
	 * 导出班级信息Excel
	 */
	@RequestMapping(value = "/dean/exportClassesExcel.do")
	@ResponseBody
	public void exportClassesExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=classes.xls");  
		deanClassManager.exportClassesExcel(response);
	}

	/*
	 * 导出已分配班级学生列表
	 */
	@RequestMapping(value = "/dean/exportClassAssignedExcel.do")
	@ResponseBody
	public void exportClassAssignedExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=assignedClasses.xls");  
		deanClassManager.exportClassAssignedExcel(response);
	}
}
