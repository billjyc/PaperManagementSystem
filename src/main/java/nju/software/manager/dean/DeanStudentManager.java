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
import nju.software.entity.Account;
import nju.software.entity.Student;
import nju.software.entity.StudentScore;
import nju.software.jsonmodel.JsonStudent;
import nju.software.service.AccountService;
import nju.software.service.ReportService;
import nju.software.service.StudentScoreService;
import nju.software.service.StudentService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.commons.lang3.Validate;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanStudentManager extends AbstractDeanManager{
	@Autowired
	private AccountService accountService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private StudentScoreService studentScoreService;
	@Autowired
	private JSONUtil jsonUtil;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DeanStudentManager.class);
	
	/**
	 * 获取所有学生
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
	public JSONObject getAllStudents(String typeS, String pageS, String rowsS, String sidx, 
			String sord, String search, String searchField, String searchOper, String searchString) {
		LOGGER.info("dean gets all students----->");

		Integer type = Integer.parseInt(typeS);
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 9999 : Integer.parseInt(rowsS);

		LOGGER.debug("type: {}, page: {}, limit: {}", type, page, limit);
		LOGGER.debug("sidx: {}, sord: {}", sidx, sord);
		LOGGER.debug("search: {}", search);

		List<Student> studentList = null;
		JSONObject jsonobj = new JSONObject();
		if(search.equalsIgnoreCase("true")){
			String searchCondition = getSearch(searchField, searchOper, searchString);
			studentList = studentService.findSearch(searchCondition);
		}else{
			HashMap<String,Object> params=new HashMap<String,Object>();
			params.put("page", page);
			params.put("limit", limit);
			params.put("sidx", sidx);
			params.put("sord", sord);
			params.put("type", type);

			List<Object> result = studentService.getAllLimit(params);
			studentList = (List<Student>)result.get(0);
			HashMap<String,Object> limits = (HashMap<String,Object>)result.get(1);

			jsonobj.put("page", limits.get("page"));
			jsonobj.put("total_pages", limits.get("total_pages"));
			jsonobj.put("records", limits.get("count"));
		}

		List<JsonStudent> studentlist_j = jsonUtil.converToJsonStudent(studentList);
		JSONArray studentlist_jsonobj = JSONArray.fromObject(studentlist_j);
		jsonobj.put("list", studentlist_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 添加单个学生
	 * @param studentstr
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importStudent(String studentstr) {
		JSONObject stu_json = JSONObject.fromObject(studentstr);

		Student student = new Student();	//Persistent Object
		student.setStudentName((String) stu_json.get("name"));
		student.setStudentNumber((String) stu_json.get("num"));
		student.setStudentEmail((String) stu_json.get("email"));
		student.setStudentGrade((String) stu_json.get("grade"));
		student.setStudentPhone((String) stu_json.get("phone"));

		String result_json = "";
		try {
			student = studentService.addStudentInfo(student);
			LOGGER.debug("student is null? {}" , studentstr == null);
			Validate.notNull(student);
			//student = studentService.getStudentByStudentNumber(student.getStudentNumber());	
			Account studentAccount = new Account();
			studentAccount.setAccountLevel(Constants.STUDENT);
			studentAccount.setAccountName(student.getStudentNumber());
			studentAccount.setAccountPassword(student.getStudentNumber());
			studentAccount.setStudentId(student.getStudentId());

			result_json = accountService.addAccount(studentAccount) ? Constants.SUCCESS : Constants.FAIL;
		} catch (Exception e) {
			result_json = Constants.FAIL;
			LOGGER.error("添加学生信息失败：", e);
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result_json);
		return jsonobj;
	}
	
	/**
	 * 导入学生excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importStudentExcel(HttpServletRequest request, HttpServletResponse response) {
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst = excel.importExcel(request, response, "file");	//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {
				ArrayList<String> innerLst = it.next();
				Student student = new Student();
				if(!innerLst.get(0).equals("")){
					student.setStudentNumber(innerLst.get(0));
					student.setStudentName(innerLst.get(1));
					student.setStudentGrade(studentService.
							formatGrade(innerLst.get(2))+"");
					student.setClassName(innerLst.get(3));
					student.setDegreeType(studentService.
							formatDegreeType(innerLst.get(4)));
					student.setStudyTime(studentService.
							formatStudyTime(innerLst.get(5)));
					student.setStudentPhone(innerLst.get(6));
					student.setStudentPhoneX(innerLst.get(7));
					student.setStudentEmail(innerLst.get(8));

					try{
						// Add student
						studentService.addStudentInfo(student);
						// Get student id
						student = studentService.
								getStudentByStudentNumber(student.getStudentNumber());
						// Add account
						Account studentAccount = new Account();
						studentAccount.setAccountLevel(Constants.STUDENT);
						studentAccount.setAccountName(student.getStudentNumber());
						studentAccount.setAccountPassword(student.getStudentNumber());
						studentAccount.setStudentId(student.getStudentId());
						if (accountService.addAccount(studentAccount))
							result = "导入成功";
					}catch(Exception e){
						result = "用户名重复，已存在" + innerLst.get(0);
						e.printStackTrace();
					}
				}
			}
		}catch(Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页学生列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 导出学生excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportStudentExcel( HttpServletResponse response) {
		HSSFWorkbook wb = reportService.exportStudent(); 
		OutputStream outputStream;
		try {
			outputStream = response.getOutputStream();
			wb.write(outputStream);  
			outputStream.flush();  
			outputStream.close();  
		}catch(IOException e) {
			LOGGER.error("导出学生excel失败！", e);
		}  
	}
	
	/**
	 * 编辑学生
	 * @param oper 操作 del,add,edit
	 * @param studentIdS
	 * @param studentDegreeTypeS
	 * @param studentNumber
	 * @param studentEmail
	 * @param studentGrade
	 * @param studentName
	 * @param studentPhone1
	 * @param studentPhone2
	 * @param studentTypeS
	 */
	public void editStudent(String oper, String studentIdS, String studentDegreeTypeS, 
			String studentNumber, String studentEmail, String studentGrade, 
			String studentName, String studentPhone1, String studentPhone2, String studentTypeS) {
		LOGGER.debug("oper: {}", oper);

		if(oper != null && oper.equals("del")){
			int studentId = Integer.parseInt(studentIdS);
			LOGGER.debug("student id: {}", studentId);
			try{
				String studentNum = studentService.getStudentById(studentId).getStudentNumber();
				int accountId = accountService.getAccountByAccountname(studentNum).getAccountId();
				accountService.deleteAccount(accountId);
				studentService.deleteStudentInfo(studentId);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper != null){
			Integer studentDegreeType = Integer.parseInt(studentDegreeTypeS);
			Integer studentType = Integer.parseInt(studentTypeS);

			Student student = new Student();
			student.setStudentEmail(studentEmail);
			student.setStudentGrade(studentGrade);
			student.setStudentName(studentName);
			student.setStudentNumber(studentNumber);
			student.setStudentPhone(studentPhone1);
			student.setStudentPhoneX(studentPhone2);
			student.setDegreeType(studentDegreeType);
			student.setStudyTime(studentType);

			try{
				if(oper.equals("edit")){
					int studentId = Integer.parseInt(studentIdS);
					LOGGER.debug("student id: {}", studentId);
					student.setStudentId(studentId);
					studentService.updateStudentInfo(student);
				}else if(oper.equals("add")){
					//验证是否存在该学生号
					LOGGER.debug("student number: {}", studentNumber);
					Student s = studentService.getStudentByStudentNumber(studentNumber);
					Validate.isTrue(s == null);

					studentService.addStudentInfo(student);
					student = studentService.getStudentByStudentNumber(student.getStudentNumber());	
					Account studentAccount = new Account();
					studentAccount.setAccountLevel(Constants.STUDENT);
					studentAccount.setAccountName(student.getStudentNumber());
					studentAccount.setAccountPassword(student.getStudentNumber());
					studentAccount.setStudentId(student.getStudentId());
					accountService.addAccount(studentAccount);
				}
			}catch (IllegalArgumentException ie) {
				LOGGER.error("该学生号已经存在！", ie);
			}catch (Exception e) {
				LOGGER.error("exception", e);
			}
		} 
	}
	
	/**
	 * 导入成绩excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importScoreExcel(HttpServletRequest request,
			HttpServletResponse response) {
		String result = "";
		try{
			List<ArrayList<String>> dataLst = new ExcelUtil().importExcel(request, response, "scorefile");
			Iterator<ArrayList<String>> it = dataLst.iterator();
			LOGGER.debug("it.next(): {}", it.next());
			while(it.hasNext()){ 
				ArrayList<String> innerLst = it.next();
				String studentNumber = innerLst.get(0);
				LOGGER.debug("student number: {}", studentNumber);
				try{
					Student student=studentService.getStudentByStudentNumber(studentNumber);

					StudentScore score=new StudentScore();
					score.setStudentId(student.getStudentId());
					score.setExcellent(Integer.parseInt(innerLst.get(2)));
					score.setGood(Integer.parseInt(innerLst.get(3)));
					score.setMedium(Integer.parseInt(innerLst.get(4)));
					score.setPass(Integer.parseInt(innerLst.get(5)));
					studentScoreService.addScore(score);
				}catch(Exception e) { 
					result = "不存在" + innerLst.get(0);
					LOGGER.error(result, e);
				}
			}
			result = "导入成功";   
		}catch(Exception e) {
			if(result != null)  result = "请输入正确的文件,格式必须正确";
			LOGGER.error(result, e);
		}	   

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
}
