package nju.software.manager.dean;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Course;
import nju.software.entity.StudentCourseInfo;
import nju.software.jsonmodel.JsonCourse;
import nju.software.jsonmodel.JsonStudentCourseInfo;
import nju.software.service.AccountService;
import nju.software.service.CourseService;
import nju.software.service.ReportService;
import nju.software.service.StudentCourseInfoService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanScoreManager extends AbstractDeanManager{
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentCourseInfoService studentCourseInfoService;
	@Autowired
	private JSONUtil jsonUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DeanScoreManager.class);
	
	/**
	 * 所有成绩列表 
	 * @return
	 */
	public JSONObject getAllTranscript() {
		List<Course> result=courseService.getAllCourse();
		List<JsonCourse> courselist_j=jsonUtil.converToJsonCourse(result);
		JSONArray courselist_jsonobj=JSONArray.fromObject(courselist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",courselist_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 获取所有成绩单列表，分页
	 * @param typeS
	 * @param pageS
	 * @param rowsS
	 * @param sidx
	 * @param sord
	 * @param search
	 * @param searchField
	 * @param searchOper
	 * @param searchString
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getTranscript(String typeS, String pageS, String rowsS, String sidx,
			String sord, String search, String searchField, String searchOper, String searchString) {
		Integer type = Integer.parseInt(typeS);
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 1000 : Integer.parseInt(rowsS);
		List<StudentCourseInfo> sci=null;
		JSONObject jsonobj = new JSONObject();
		if(search.equalsIgnoreCase("true")){
			String searchCondition = getSearch(searchField,searchOper,searchString);
			sci = studentCourseInfoService.findSearchStudentScore(searchCondition);
		}else{
			HashMap<String,Object> params=new HashMap<String,Object>();
			params.put("page", page);
			params.put("limit", limit);
			params.put("sidx", sidx);
			params.put("sord", sord);
			params.put("type", type);

			List<Object> result = studentCourseInfoService.getStudentAssignedCourse(params);
			sci = (List<StudentCourseInfo>)result.get(0);
			HashMap<String,Object> limits = (HashMap<String,Object>)result.get(1);

			jsonobj.put("page", limits.get("page"));
			jsonobj.put("total_pages", limits.get("total_pages"));
			jsonobj.put("records", limits.get("count"));
		}
		List<JsonStudentCourseInfo> sci_j = jsonUtil.converToJsonStudentCourseInfo(sci);

		JSONArray sci_jsonobj = JSONArray.fromObject(sci_j);
		jsonobj.put("list", sci_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 获取没有审核通过的成绩列表，分页
	 * @param pageS
	 * @param rowsS
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getUncheckedTranscript(String pageS, String rowsS, String sidx, String sord) {
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 1000 : Integer.parseInt(rowsS);

		HashMap<String,Object> params=new HashMap<String,Object>();
		params.put("page", page);
		params.put("limit", limit);
		params.put("sidx", sidx);
		params.put("sord", sord);

		List<Object> result = studentCourseInfoService.getUncheckedTranscript(params);
		List<StudentCourseInfo> studentCourseList = (List<StudentCourseInfo>)result.get(0);

		HashMap<String,Object> limits = (HashMap<String,Object>)result.get(1);
		List<JsonStudentCourseInfo> courseList_j = jsonUtil.converToJsonStudentCourseInfo(studentCourseList);
		JSONArray courseList_jsonobj = JSONArray.fromObject(courseList_j);

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", courseList_jsonobj);
		jsonobj.put("page", limits.get("page"));
		jsonobj.put("total_pages", limits.get("total_pages"));
		jsonobj.put("records", limits.get("count"));
		return jsonobj;
	}
	
	/**
	 * 获取审核通过的成绩列表，分页
	 * @param pageS
	 * @param rowsS
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getCheckedTranscript(String pageS, String rowsS, String sidx, String sord) {
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 1000 : Integer.parseInt(rowsS);

		HashMap<String,Object> params=new HashMap<String,Object>();
		params.put("page", page);
		params.put("limit", limit);
		params.put("sidx", sidx);
		params.put("sord", sord);

		List<Object> result = studentCourseInfoService.getCheckedTranscript(params);
		List<StudentCourseInfo> studentCourseList = (List<StudentCourseInfo>)result.get(0);

		HashMap<String,Object> limits = (HashMap<String,Object>)result.get(1);

		List<JsonStudentCourseInfo> courseList_j = jsonUtil.converToJsonStudentCourseInfo(studentCourseList);
		JSONArray courseList_jsonobj = JSONArray.fromObject(courseList_j);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", courseList_jsonobj);
		jsonobj.put("page", limits.get("page"));
		jsonobj.put("total_pages", limits.get("total_pages"));
		jsonobj.put("records", limits.get("count"));
		return jsonobj;
	}
	
	/**
	 * 导入成绩单excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importTranscriptExcel(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {
				ArrayList<String> innerLst = it.next();
				StudentCourseInfo sci = new StudentCourseInfo();
				if(!innerLst.get(0).equals("")){
					sci.setCourseNo(innerLst.get(0));
					sci.setCourseName(innerLst.get(1));
					sci.setStudentNo(innerLst.get(2));
					sci.setStudentName(innerLst.get(3));
					sci.setScore(Integer.valueOf(innerLst.get(4)));
					sci.setDate(Integer.valueOf(innerLst.get(5)));
					try{
						// Add course
						studentCourseInfoService.addStudentCourseInfo(sci);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				result = "导入成功";
			}
		}catch(Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页成绩列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 导出所有成绩excel
	 * @param response
	 */
	@Transactional(rollbackFor = Exception.class)
	public void exportTranscriptExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportTranscript();
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e){
			e.printStackTrace();
		}  
	}
	
	/**
	 * 导出指定学生成绩单excel
	 * @param response
	 * @param courseNo
	 */
	@Transactional(rollbackFor = Exception.class)
	public void exportCourseTranscriptExcel(HttpServletResponse response, String courseNo) {
		HSSFWorkbook wb =reportService.exportTranscriptByCourseNo(courseNo);
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e){
			e.printStackTrace();
		}  
	}
	
	/**
	 * 导出指定学生成绩单excel
	 * @param response
	 * @param transcripstr
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject exportStudentTranscriptExcel(HttpServletResponse response, String transcripstr) {
		String result = Constants.FAIL;
		JSONObject paper_json = JSONObject.fromObject(transcripstr);
		String studentNo = paper_json.getString("studentNo");
		HSSFWorkbook wb =reportService.exportTranscriptByStudentNo(studentNo);
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename="+studentNo+" transcript.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e){
			e.printStackTrace();
		}  
		result = Constants.SUCCESS;
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 审核通过所有成绩单
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject approveTranscript() {
		String result="";
		try{
			studentCourseInfoService.approveStudentCourseInfo();
			result = Constants.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			result = Constants.FAIL;
		} 

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 审核通过某个成绩单
	 * @param transcripstr
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject dealWithTranscript(String transcripstr) {
		JSONObject paper_json = JSONObject.fromObject(transcripstr);
		Integer transcriptId = paper_json.getInt("id");
		String detection = paper_json.getString("detection");
		String result="";
		try{
			if(detection.equals("true")){
				studentCourseInfoService.approveStudentCourseInfo(transcriptId);
			}
			else if(detection.equals("false")){
				studentCourseInfoService.rejectStudentCourseInfo(transcriptId);
			}
			result = Constants.SUCCESS;
		}catch(Exception e){
			result = Constants.FAIL;
			e.printStackTrace();
		} 
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 驳回所有成绩单
	 * @return
	 */
	public JSONObject rejectTranscript() {
		String result="";
		try{
			studentCourseInfoService.rejectStudentCourseInfo();
			result = Constants.SUCCESS;
		}catch(Exception e){
			result = Constants.FAIL;
			e.printStackTrace();
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
}
