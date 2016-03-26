package nju.software.manager.teacher;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Account;
import nju.software.entity.Student;
import nju.software.entity.Teacher;
import nju.software.jsonmodel.JsonStudent;
import nju.software.jsonmodel.JsonTeacher;
import nju.software.service.AccountService;
import nju.software.service.StudentService;
import nju.software.service.TeacherService;
import nju.software.util.Constants;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class TeacherInfoManager {
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AccountService accountService;
	
	public static final int MAX_RESULT = 1000;
	
	private static Logger logger = LoggerFactory.getLogger(TeacherInfoManager.class);
	
	/**
	 * 学生列表
	 * @param teacherId
	 * @param pageS
	 * @param rowsS
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject studentList(Integer teacherId, String pageS, String rowsS, String sidx, String sord) {
		int page=0;
		int rows= MAX_RESULT;

		page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		rows = (rowsS == null) ? MAX_RESULT : Integer.parseInt(rowsS);

		HashMap<String, Object> params=new HashMap<String, Object>();
		params.put("page", page);
		params.put("limit", rows);
		params.put("sidx", sidx);
		params.put("sord", sord);

		List<Student> studentList = null;
		List<JsonStudent> jsonStudentList = null;
		HashMap<String,Object> limits = null;

		String result_json = "";
		try{
			List<Object> result= studentService.getStudentsByTeacherIdLimit(teacherId, params);
			studentList = (List<Student>)result.get(0);	//查询的学生列表
			limits = (HashMap<String, Object>) (result.get(1));	//分页信息

			jsonStudentList = new ArrayList<JsonStudent>();
			for(Student student: studentList){
				int accountId = accountService.getAccountByAccountname(student.getStudentNumber()).getAccountId();
				JsonStudent jsonStudent= new JsonStudent(student);
				jsonStudent.setAccountId(accountId);
				jsonStudentList.add(jsonStudent);
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("exception", e);
			result_json = Constants.FAIL;
		}

		JSONArray jsonlist = JSONArray.fromObject(jsonStudentList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", jsonlist);
		jsonobj.put("page", limits.get("page"));
		jsonobj.put("total_pages", limits.get("total_pages"));
		jsonobj.put("records", limits.get("count"));
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 教师信息
	 * @param teacherId
	 * @return
	 */
	public JSONObject teacherInfo(Integer teacherId) {
		Teacher teacher = null;
		String result_json = "";
		try {
			teacher = teacherService.getTeacherById(teacherId);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		// 转换为jsonstudent
		JsonTeacher jsonteacher = new JsonTeacher(teacher);

		// 返回json数据
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("teacher", jsonteacher);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 更新教师信息
	 * @param teacherId
	 * @param email
	 * @param phone
	 * @return
	 */
	public JSONObject updateTeacherInfo(Integer teacherId, String email, String phone) {
		logger.debug("email: {}, phone: {}", email, phone);
		Teacher teacher = null;
		String result_json = "";
		try {
			teacher = teacherService.getTeacherById(teacherId);
			teacher.setTeacherEmail(email);
			teacher.setTeacherPhone(phone);
			teacherService.updateTeacherInfo(teacher);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			logger.error("更新教师信息失败！", e);
			result_json = Constants.FAIL;
		}
		// 返回json数据
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 修改密码
	 * @param accountId
	 * @param oPassword
	 * @param nPassword
	 * @return
	 */
	public JSONObject changePassword(Integer accountId, String oPassword, String nPassword) {
		logger.debug("accountId: {}, oPassword: {}, nPassword: {}", accountId, oPassword, nPassword);
		Account account = null;
		String result_json = "";
		try {
			account = accountService.getAccountByAccountId(accountId);

			if(account.getAccountPassword().equals(oPassword)){
				account.setAccountPassword(nPassword);
				accountService.updateAccount(account);
				result_json = Constants.SUCCESS;	
			}
			else{
				result_json = Constants.FAIL;
			}
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		// 返回json数据
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
}
