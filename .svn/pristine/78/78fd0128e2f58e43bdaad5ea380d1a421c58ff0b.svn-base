package nju.software.controller.dean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.dean.DeanScoreManager;
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
 * 教务员成绩管理控制类
 * @author billjyc
 *
 */
@Controller
public class DeanScoreManagementController extends AbstractDeanController{
	private static Logger logger = LoggerFactory.getLogger(DeanScoreManagementController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private DeanScoreManager deanScoreManager;
	
	/**
	 * 所有成绩列表 
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/dean/getAllTranscript.do")
	@ResponseBody
	public void getAllTranscript(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanScoreManager.getAllTranscript();
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获取所有成绩单列表，分页
	 * @author wss
	 * 
	 */
	@RequestMapping(value = "/dean/transciptList.do")
	public void getTranscript(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("page") String pageS, @RequestParam("rows") String rowsS, 
			@RequestParam("type") String typeS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord, @RequestParam("_search") String search,
			@RequestParam(value = "searchOper", required = false) String searchOper, 
			@RequestParam(value = "searchString", required = false) String searchString,
			@RequestParam(value = "searchField", required = false) String searchField){
		JSONObject jsonobj = deanScoreManager.getTranscript(typeS, pageS, rowsS, sidx, 
				sord, search, searchField, searchOper, searchString);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 获取没有审核通过的成绩列表，分页
	 * @author wss
	 * wss
	 */
	@RequestMapping(value = "/dean/uncheckedTranscript.do")
	public void getUncheckedTranscript(HttpServletRequest request, HttpServletResponse response,
			ModelMap model, @RequestParam("page") String pageS, @RequestParam("rows") String rowsS, 
			@RequestParam("type") String typeS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord){
		JSONObject jsonobj = deanScoreManager.getUncheckedTranscript(pageS, rowsS, sidx, sord);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 获取审核通过的成绩列表，分页
	 * @author wss
	 * wss
	 */
	@RequestMapping(value = "/dean/checkedTranscript.do")
	public void getCheckedTranscript(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("page") String pageS, @RequestParam("rows") String rowsS, 
			@RequestParam("type") String typeS, @RequestParam("sidx") String sidx, 
			@RequestParam("sord") String sord){
		JSONObject jsonobj = deanScoreManager.getCheckedTranscript(pageS, rowsS, sidx, sord);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 导入成绩单excel
	 * 2014-4-25下午07:25:39
	 * @author Jay，Wang
	 */
	@RequestMapping(value = "/dean/importTransciptExcel.do")
	@ResponseBody
	public void importTranscriptExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		JSONObject jsonobj = deanScoreManager.importTranscriptExcel(request, response);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 导出所有成绩excel
	 */
	@RequestMapping(value = "/dean/exportTranscriptExcel.do")
	@ResponseBody
	public void exportTranscriptExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=transcript.xls");  
		deanScoreManager.exportTranscriptExcel(response);
	}

	/**
	 * 导出指定课程成绩单excel
	 */
	@RequestMapping(value = "/dean/exportCourseTranscriptExcel.do")
	@ResponseBody
	public void exportCourseTranscriptExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		String courseNo="cs112";
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename="+courseNo+" transcript.xls");  
		deanScoreManager.exportCourseTranscriptExcel(response, courseNo);
	}


	/**
	 * 导出指定学生成绩单excel
	 */
	@RequestMapping(value = "/dean/exportStudentTranscriptExcel.do")
	@ResponseBody
	public void exportStudentTranscriptExcel(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("transcripstr") String transcripstr) {
		JSONObject jsonobj = deanScoreManager.exportStudentTranscriptExcel(response, transcripstr);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 审核通过所有成绩单
	 */
	@RequestMapping(value = "/dean/approveTranscript.do")
	@ResponseBody
	public void approveTranscript(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanScoreManager.approveTranscript();
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 审核通过某个成绩单
	 */
	@RequestMapping(value = "/dean/dealWithTranscript.do")
	@ResponseBody
	public void dealWithTranscript(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("transcripstr") String transcripstr){
		JSONObject jsonobj = deanScoreManager.dealWithTranscript(transcripstr);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 驳回所有成绩单
	 */
	@RequestMapping(value = "/dean/rejectTranscript.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void rejectTranscript(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		JSONObject jsonobj = deanScoreManager.rejectTranscript();
		jsonUtil.sendJson(response, jsonobj);
	}
}
