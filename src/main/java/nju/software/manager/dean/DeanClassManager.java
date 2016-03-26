package nju.software.manager.dean;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Classes;
import nju.software.entity.Student;
import nju.software.jsonmodel.JsonClasses;
import nju.software.jsonmodel.JsonStudent;
import nju.software.service.AccountService;
import nju.software.service.ClassesService;
import nju.software.service.ReportService;
import nju.software.service.StudentService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanClassManager {
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private ClassesService classesService;
	@Autowired
	private StudentService studentService;
	
	/**
	 * 所有教学点班级列表
	 * @return
	 */
	public JSONObject getAllClasses() {
		List<Classes> result=classesService.getAllClasses();
		List<JsonClasses> classlist_j=jsonUtil.converToJsonClasses(result);
		JSONArray classlist_jsonobj=JSONArray.fromObject(classlist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",classlist_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 获取待分配班级列表
	 * @return
	 */
	public JSONObject getClassAssignList() {
		List<Classes> classList = null;
		List<Student> studentList = null;
		List<JsonClasses> classlist_j=null;
		List<JsonStudent> studentlist_j=null;
		String result_json = "";
		try{
			classList = classesService.getAllClasses();
			//System.out.println(classList.get(0).getHeadTeacherName());
			studentList = studentService.getStudentWithoutClass();
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		studentlist_j = jsonUtil.converToJsonStudent(studentList);
		classlist_j = jsonUtil.converToJsonClasses(classList);

		// 前台数据返回块
		JSONArray studentlist_jsonobj = JSONArray.fromObject(studentlist_j);
		JSONArray classlist_jsonobj = JSONArray.fromObject(classlist_j);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("studentlist", studentlist_jsonobj);
		jsonobj.put("classlist", classlist_jsonobj);

		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 获取已分配班级信息
	 * @return
	 */
	public JSONObject getClassAssignedList() {
		JSONObject jsonobj = new JSONObject();
		List<Student> studentList=studentService.getStudentWithClass();
		//System.out.println(studentList.get(0).getStudentName());
		List <JsonStudent> jsonStudentList=jsonUtil.converToJsonStudent(studentList);
		JSONArray studentList_jsonobj = JSONArray.fromObject(jsonStudentList);
		jsonobj.put("list", studentList_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 分配班级
	 * @param postData
	 * @return
	 */
	public JSONObject assignClass(String postData) {
		JSONArray assignedList = JSONArray.fromObject(postData);
		String result_json = "";
		try {
			//遍历分配数据，对每一条记录进行分配操作
			for (int i = 0; i < assignedList.size(); i++){
				JSONObject record = JSONObject.fromObject(assignedList.get(i));

				//System.out.printf("lala "+record.toString());
				String no= record.getString("no");
				String name= record.getString("name");
				int studentId = Integer.parseInt(record.getString("studentId"));
				String teachingPointNo=record.getString("teachingPointNo");
				Student s=studentService.getStudentById(studentId);
				s.setClassNo(no);
				s.setClassName(name);
				s.setTeachingPointNo(teachingPointNo);
				studentService.updateStudentInfo(s);

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
	 * 编辑班级
	 * @param oper
	 * @param idS
	 * @param no
	 * @param graduateNumS
	 * @param sizeS
	 * @param name
	 * @param headTeacherName
	 * @param headTeacherNo
	 * @param teachingPointName
	 * @param teachingPointNo
	 */
	@Transactional(rollbackFor=Exception.class)
	public void editClasses(String oper, String idS, String no, String graduateNumS, 
			String sizeS, String name, String headTeacherName, String headTeacherNo, 
			String teachingPointName, String teachingPointNo) {
		if(oper != null && oper.equals("del")){
			int id=Integer.parseInt(idS);
			try{
				classesService.deleteClass(id);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper != null){
			Integer graduateNum=Integer.parseInt(graduateNumS);
			Integer size=Integer.parseInt(sizeS);
			Classes c=new Classes();
			c.setNo(no);
			c.setName(name);
			c.setGraduateNum(graduateNum);
			c.setHeadTeacherNo(headTeacherNo);
			c.setHeadTeacherName(headTeacherName);
			c.setTeachingPointNo(teachingPointNo);
			c.setTeachingPointName(teachingPointName);
			c.setSize(size);
			try{
				if(oper.equals("edit")){
					c.setId(Integer.parseInt(idS));
					classesService.updateClass(c);
				}else if(oper.equals("add")){
					classesService.addClass(c);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 导入班级信息Excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importClassesExcel(HttpServletRequest request, HttpServletResponse response) {
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
				Classes c=new Classes();
				if(!innerLst.get(0).equals("")){
					c.setNo(innerLst.get(0));
					c.setName(innerLst.get(1));
					c.setGraduateNum(Integer.parseInt(innerLst.get(2)));
					c.setSize(Integer.parseInt(innerLst.get(3)));
					c.setHeadTeacherNo(innerLst.get(4));
					c.setHeadTeacherName(innerLst.get(5));
					c.setTeachingPointNo(innerLst.get(6));
					c.setTeachingPointName(innerLst.get(7));
					try{
						// Add course
						classesService.addClass(c);

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
	 * 导入班级分配Excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importClassAssignExcel(HttpServletRequest request, HttpServletResponse response) {
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
				Student student=new Student();
				if(!innerLst.get(0).equals("")){
					try{
						student=studentService.getStudentByStudentNumber(innerLst.get(0));
						if(student.getStudentName().equals(innerLst.get(1))){
							student.setClassNo(innerLst.get(2));
							System.out.println(innerLst.get(2));
							student.setClassName(innerLst.get(3));
							student.setTeachingPointNo(innerLst.get(4));
							studentService.updateStudentInfo(student);
						}
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
	 * 导出班级信息Excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportClassesExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportClasses();
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
	 * 导出已分配班级学生列表
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportClassAssignedExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportAssignedClasses();
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
