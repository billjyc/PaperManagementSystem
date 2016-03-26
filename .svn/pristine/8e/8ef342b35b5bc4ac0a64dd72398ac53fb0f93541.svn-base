package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanTeachingPointManager;
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
 * 教务员教学点管理控制类
 * @author billjyc
 *
 */
@Controller
public class DeanTeachingPointManagementController {
	private static Logger logger = LoggerFactory.getLogger(DeanTeachingPointManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanTeachingPointManager deanTeachingPointManager;
	
	/**
	 * 获得教学点列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/dean/getallteachingpoint.do")
	@ResponseBody
	public void getAllTeachingPoint(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanTeachingPointManager.getAllTeachingPoint();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获得教学点负责人列表
	 * @param request
	 * @param response
	 * @param mode
	 */
	@RequestMapping(value="/dean/getalldirector.do")
	@ResponseBody
	public void getAllDirector(HttpServletRequest request, HttpServletResponse response, ModelMap mode){
		JSONObject jsonobj = deanTeachingPointManager.getAllDirector();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/*
	 * 编辑教学点列表
	 */
	@RequestMapping(value = "/dean/editteachingpoint.do")
	@ResponseBody
	public void editTeachingPoint(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("oper") String oper, 
			@RequestParam(value = "id", required = false) String idS,
			@RequestParam(value = "no", required = false) String no,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "directorNo", required = false) String directorNo,
			@RequestParam(value = "directorName", required = false) String directorName){
		deanTeachingPointManager.editTeachingPoint(oper, idS, no, name, location, directorName, directorNo);
	}
	
	/*
	 * 编辑教学点班主任列表
	 */
	@RequestMapping(value = "/dean/editdirector.do")
	@ResponseBody
	public void editDirector(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("oper") String oper, 
			@RequestParam(value = "id", required = false) String idS,
			@RequestParam(value = "no", required = false) String no,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "tel", required = false) String telS,
			@RequestParam(value = "email", required = false) String email){
		deanTeachingPointManager.editDirector(oper, idS, telS, no, email, name);
	}
	
	/*
	 * 导入教学点Excel
	 */
	@RequestMapping(value = "/dean/importTeachingPointExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importTeachingPointExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanTeachingPointManager.importTeachingPointExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/*
	 * 导出教学点excel
	 */
	@RequestMapping(value = "/dean/exportTeachingPointExcel.do")
	@ResponseBody
	public void exportTeachingPointExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=teachingPoint.xls");  
		deanTeachingPointManager.exportTeachingPointExcel(response);
	}
	
	/*
	 * 导入教学点负责人excel
	 */
	@RequestMapping(value = "/dean/importDirectorExcel.do")
	@ResponseBody
	public void importDirectorExcel(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)  {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanTeachingPointManager.importDirectorExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出教学点负责人excel
	 */
	@RequestMapping(value = "/dean/exportDirectorExcel.do")
	@ResponseBody
	public void exportDirectorExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=director.xls");  
		deanTeachingPointManager.exportDirectorExcel(response);
	}
}
