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
import nju.software.entity.Student;
import nju.software.entity.StudentCourseInfo;
import nju.software.jsonmodel.JsonCourse;
import nju.software.jsonmodel.JsonStudent;
import nju.software.jsonmodel.JsonStudentCourseInfo;
import nju.software.service.AccountService;
import nju.software.service.CourseService;
import nju.software.service.ReportService;
import nju.software.service.StudentCourseInfoService;
import nju.software.service.StudentService;
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
public class DeanCourseManager extends AbstractDeanManager{
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private StudentCourseInfoService studentCourseInfoService;
	@Autowired
	private JSONUtil jsonUtil;

	private static final Logger LOGGER = LoggerFactory.getLogger(DeanCourseManager.class);
	/**
	 * 所有课程列表
	 * @param search
	 * @param searchField
	 * @param searchOper
	 * @param searchString
	 * @return
	 */
	public JSONObject getAllCourses(String search, String searchField, String searchOper, String searchString) {
		List<Course> result=null;
		if(search.equalsIgnoreCase("true")){
			String searchCondition=getSearch(searchField,searchOper,searchString);
			result=courseService.findSearchCourse(searchCondition);
		}else{
			result=courseService.getAllCourse();
		}

		List<JsonCourse> courselist_j=jsonUtil.converToJsonCourse(result);
		JSONArray courselist_jsonobj=JSONArray.fromObject(courselist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",courselist_jsonobj );
		return jsonobj;
	}

	/**
	 * 未分配课程列表
	 * @return
	 */
	public JSONObject getUnassignedCourseList() {
		List<Course> courseList = null;
		List<Student> studentList = null;
		List<JsonCourse> courselist_j = null;
		List<JsonStudent> studentlist_j = null;

		String result_json = "";

		try{
			courseList = courseService.getAllCourse();
			studentList = studentService.getAllStudent();
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		courselist_j = jsonUtil.converToJsonCourse(courseList);
		studentlist_j = jsonUtil.converToJsonStudent(studentList);

		JSONArray courselist_jsonobj = JSONArray.fromObject(courselist_j);
		JSONArray studentlist_jsonobj = JSONArray.fromObject(studentlist_j);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("courselist", courselist_jsonobj);
		jsonobj.put("studentlist", studentlist_jsonobj);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}

	/**
	 * 已分配课程列表
	 * @return
	 */
	public JSONObject getCourseAssignList() {
		List<Student> studentList = null;
		List<Course> courseList = null;
		List<StudentCourseInfo> studentCourseInfo = new ArrayList<StudentCourseInfo>();
		List<JsonStudent> studentlist_j = null;
		List<JsonCourse> courselist_j = null;
		List<JsonStudentCourseInfo> studentCourseInfo_j = new ArrayList<JsonStudentCourseInfo>();

		//初始化
		StudentCourseInfo sci =new StudentCourseInfo();
		studentCourseInfo.add(sci);

		String result_json = "";
		try{
			studentList = studentService.getAllStudent();
			courseList = courseService.getAllCourse();
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		studentlist_j = jsonUtil.converToJsonStudent(studentList);
		courselist_j = jsonUtil.converToJsonCourse(courseList);

		// 前台数据返回块
		JSONArray studentlist_jsonobj = JSONArray.fromObject(studentlist_j);
		JSONArray courselist_jsonobj = JSONArray.fromObject(courselist_j);
		JSONArray studentCourseInfo_jsonobj = JSONArray.fromObject(studentCourseInfo_j);

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("studentlist", studentlist_jsonobj);
		jsonobj.put("courselist", courselist_jsonobj);
		jsonobj.put("studentCourseInfolist", studentCourseInfo_jsonobj);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}

	/**
	 * 分配课程
	 * @param postData
	 * @return
	 */
	public JSONObject assignCourse(String postData) {
		//获取前端导师分配数据并转换为JSONArray对象
		JSONArray assignedList = JSONArray.fromObject(postData);
		String result_json = "";
		try {
			//遍历分配数据，对每一条记录进行分配操作
			for (int i = 0; i < assignedList.size(); i++){
				JSONObject record = JSONObject.fromObject(assignedList.get(i));

				//System.out.printf("lala "+record.toString());
				String courseNo= record.getString("courseNo");
				String courseName= record.getString("courseName");
				String studentNo = record.getString("studentNumber");
				String studentName = record.getString("studentName");
				Integer date = record.getInt("date");
				StudentCourseInfo sci=new StudentCourseInfo(studentNo,studentName,courseNo,courseName,date);
				studentCourseInfoService.addStudentCourseInfo(sci);
				//assignService.addCourseByOne(courseId , studentId, actorId);	

			}
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;
		}

		//将结果以JSONObject传回前端
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 获取已分配学生的课程列表
	 * @param typeS
	 * @param pageS
	 * @param rowsS
	 * @param search
	 * @param sidx
	 * @param sord
	 * @param searchField
	 * @param searchOper
	 * @param searchString
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getStudentCourseInfo(String typeS, String pageS, String rowsS, 
			String search, String sidx, String sord,  
			String searchField, String searchOper, String searchString) {
		Integer type = Integer.parseInt(typeS);
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 1000 : Integer.parseInt(rowsS);
		List<StudentCourseInfo> sci = null;
		JSONObject jsonobj = new JSONObject();
		if(search.equalsIgnoreCase("true")){
			String searchCondition=getSearch(searchField, searchOper, searchString);
			sci=studentCourseInfoService.findSearchStudentScore(searchCondition);
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
	 * 编辑课程
	 * @param oper
	 * @param courseIdS
	 * @param courseName
	 * @param courseNo
	 * @param teacherName
	 * @param teacherNo
	 * @param dateS
	 */
	@Transactional(rollbackFor = Exception.class)
	public void editCourse(String oper, String courseIdS, String courseName, String courseNo, 
			String teacherName, String teacherNo, String dateS) {
		if(oper != null&&oper.equals("del")){
			int courseId=Integer.parseInt(courseIdS);
			try{
				courseService.deleteCourseInfo(courseId);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			Integer date=Integer.valueOf(dateS);

			Course course=new Course();
			course.setCourseName(courseName);
			course.setCourseNo(courseNo);
			course.setDate(date);
			course.setTeacherNo(teacherNo);
			course.setTeacherName(teacherName);
			try{
				if(oper.equals("edit")){
					course.setId(Integer.parseInt(courseIdS));
					courseService.updateCourse(course);
				}else if(oper.equals("add")){
					courseService.addCourse(course);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 导入课程excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importCourseExcel(HttpServletRequest request, HttpServletResponse response) {
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
				Course course = new Course();
				if(!innerLst.get(0).equals("")){
					course.setCourseNo(innerLst.get(0));
					course.setCourseName(innerLst.get(1));
					course.setTeacherNo(innerLst.get(2));
					course.setTeacherName(innerLst.get(3));
					course.setDate(Integer.valueOf(innerLst.get(4)));
					try{
						// Add course
						courseService.addCourse(course);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				result = "导入成功";
			}
		}catch(Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页课程列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 导入课程
	 * @param courseStr
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importCourse(String courseStr) {
		JSONObject course_json = JSONObject.fromObject(courseStr);
		Course course = new Course();
		course.setCourseNo((String)course_json.getString("courseNo"));
		course.setCourseName((String)course_json.getString("courseName"));
		course.setTeacherNo((String)course_json.getString("teacherNo"));
		course.setTeacherName((String)course_json.getString("teacherName"));
		course.setDate((Integer.valueOf((String)course_json.getString("date"))));

		String result_json = "";
		try {
			courseService.addCourse(course);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			result_json = Constants.FAIL;
			LOGGER.error("添加课程信息失败：", e);
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result_json);
		return jsonobj;
	}
	
	/**
	 * 导出课程excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportCourseExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportCourse();
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=course.xls");  
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
	 * 导入选课excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importStudentCourseInfoExcel(HttpServletRequest request, HttpServletResponse response) {
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
					sci.setDate(Integer.valueOf(innerLst.get(4)));
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
				result = "请输入正确的文件,格式依照本页课程列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 导出学生选课excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportStudentCourseInfoExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportStudentCourseInfo();
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=studentCourseInfo.xls");  
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
}
