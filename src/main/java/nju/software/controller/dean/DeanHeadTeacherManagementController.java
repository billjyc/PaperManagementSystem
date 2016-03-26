package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanHeadTeacherManager;
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
 * 教务员班主任管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class DeanHeadTeacherManagementController {
	private static Logger logger = LoggerFactory.getLogger(DeanHeadTeacherManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanHeadTeacherManager deanHeadTeacherManager;
	
	/**
	 * 获得班主任列表
	 * @param request
	 * @param response
	 * @param mode
	 */
	@RequestMapping(value="/dean/getallheadteachers.do")
	@ResponseBody
	public void getAllHeadTeacher(HttpServletRequest request, HttpServletResponse response, ModelMap mode){
		JSONObject jsonobj = deanHeadTeacherManager.getAllHeadTeacher();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/*
	 * 编辑班主任列表
	 */
	@RequestMapping(value = "/dean/editheadteacher.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editHeadTeacher(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("oper") String oper, 
			@RequestParam(value = "id", required = false) String idS,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "no", required = false) String no,
			@RequestParam(value = "tel", required = false) String telS,
			@RequestParam(value = "email", required = false) String email){
		deanHeadTeacherManager.editHeadTeacher(oper, idS, telS, no, name, email);
	}
	
	/*
	 * 导入班主任excel
	 */
	@RequestMapping(value = "/dean/importHeadTeacherExcel.do")
	@ResponseBody
	public void importHeadTeacherExcel(HttpServletRequest request,
			HttpServletResponse response, ModelMap model)  {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanHeadTeacherManager.importHeadTeacherExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出班主任excel
	 */
	@RequestMapping(value = "/dean/exportHeadTeacherExcel.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void exportHeadTeacherExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=headTeacher.xls");  
		deanHeadTeacherManager.exportHeadTeacherExcel(response);
	}
}
