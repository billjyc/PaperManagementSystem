package nju.software.manager.teacher;

import java.util.ArrayList;
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
import nju.software.service.CourseService;
import nju.software.service.StudentCourseInfoService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class TeacherCourseManager {
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentCourseInfoService studentCourseInfoService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherCourseManager.class);
	
	/**
	 * 获得老师负责的课程信息列表
	 * @param teacherNo
	 * @return
	 */
	public JSONObject getGradeList(String teacherNo) {
		List<Course> courseList = courseService.getCoursesByTeacherNo(teacherNo);
		List<StudentCourseInfo> courseInfoList = new ArrayList<StudentCourseInfo>();
		for (int i = 0; i < courseList.size(); i++){
			String courseNo = courseList.get(i).getCourseNo();
			List<StudentCourseInfo> tempCourseInfo = studentCourseInfoService.getInfoByCourseNo(courseNo);
			for (int j = 0; j < tempCourseInfo.size(); j++){				
				courseInfoList.add(tempCourseInfo.get(j));
			}
			tempCourseInfo = null;
		}
		String result_json = "";
		ArrayList<JsonStudentCourseInfo> jsonCourseInfoList  = new ArrayList<JsonStudentCourseInfo>();
		try{
			if(courseInfoList != null){
				for(int i=0; i<courseInfoList.size(); i++){
					StudentCourseInfo courseInfo = courseInfoList.get(i);
					if(courseInfo != null){						
						jsonCourseInfoList.add(new JsonStudentCourseInfo(courseInfo));
					}
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			LOGGER.error("get course list failed: ",e);
			result_json = Constants.FAIL;
		}
		JSONArray jsonlist = JSONArray.fromObject(jsonCourseInfoList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", jsonlist);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 获得老师负责的课程列表
	 * @param teacherNo
	 * @return
	 */
	public JSONObject getCourseList(String teacherNo) {
		List<Course> courseList = courseService.getCoursesByTeacherNo(teacherNo);
		String result_json = "";
		ArrayList<JsonCourse> jsonCourseList = new ArrayList<JsonCourse>();
		try{
			if(courseList!=null){
				for(int i=0;i < courseList.size(); i++){
					Course course = courseList.get(i);
					if(course != null){
						JsonCourse jsonCourse = JsonCourse.course2JsonCourse(course);
						jsonCourseList.add(jsonCourse);
					}
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			LOGGER.error("get course list failed: ",e);
			result_json = Constants.FAIL;
		}
		JSONArray jsonlist = JSONArray.fromObject(jsonCourseList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", jsonlist);
		jsonobj.put("result_json", result_json);
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
			ExcelUtil excel = new ExcelUtil();
			List<ArrayList<String>> dataLst = excel.
					importExcel(request, response, "file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {
				ArrayList<String> innerLst = it.next();
				StudentCourseInfo studentCourseInfo = new StudentCourseInfo();
				if(!innerLst.get(0).equals("")){
					studentCourseInfo.setCourseNo(innerLst.get(0));
					studentCourseInfo.setCourseName(innerLst.get(1));
					studentCourseInfo.setStudentNo(innerLst.get(2));

					studentCourseInfo.setStudentName(innerLst.get(3));		
					studentCourseInfo.setDate(Integer.getInteger(innerLst.get(4)));
					studentCourseInfo.setScore(Integer.getInteger(innerLst.get(5)));

					try{
						// Add studentCourseInfo
						studentCourseInfoService.addStudentCourseInfo(studentCourseInfo);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				result = "导入成功";
			}
		}catch(Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页成绩单列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importTransript(String infoStr) {
		JSONObject info_json = JSONObject.fromObject(infoStr);

		StudentCourseInfo studentCourseInfo = new StudentCourseInfo();

		studentCourseInfo.setCourseNo((String)info_json.getString("courseNo"));
		studentCourseInfo.setStudentNo((String)info_json.getString("studentNo"));
		studentCourseInfo.setScore(Integer.getInteger((String)info_json.getString("score")));
		studentCourseInfo.setCourseName((String)info_json.getString("courseName"));
		studentCourseInfo.setStudentName((String)info_json.getString("studentName"));		
		studentCourseInfo.setDate(Integer.getInteger((String)info_json.getString("date")));		

		String result_json = "";
		try {
			studentCourseInfoService.addStudentCourseInfo(studentCourseInfo);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			result_json = Constants.FAIL;
			LOGGER.error("添加成绩信息失败：", e);
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result_json);
		return jsonobj;
	}
	
	/**
	 * 修改课程成绩
	 * @param oper
	 * @param request
	 */
	@Transactional(rollbackFor = Exception.class)
	public void editCourse(String oper, String courseInfoIdS, String courseNo, String courseName, String studentNo, 
			String studentName, String score) {
		if(oper != null && oper.equals("del")){
			int courseInfoId=Integer.parseInt(courseInfoIdS);
			//int courseId=Integer.parseInt(request.getParameter("courseId"));
			try{
				//courseService.deleteCourseInfo(courseId);
				StudentCourseInfo courseInfo = studentCourseInfoService.getInfoById(courseInfoId);
				studentCourseInfoService.deleteStudentCourseInfo(courseInfo);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			StudentCourseInfo newCourseInfo=new StudentCourseInfo();
			newCourseInfo.setCourseName(courseName);
			newCourseInfo.setCourseNo(courseNo);
			newCourseInfo.setScore(Integer.valueOf(score));			
			newCourseInfo.setStudentName(studentName);
			newCourseInfo.setStudentNo(studentNo);
			try{
				if(oper.equals("edit")){
					newCourseInfo.setCourseNo(courseNo);
				}else if(oper.equals("add")){
					studentCourseInfoService.addStudentCourseInfo(newCourseInfo);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
