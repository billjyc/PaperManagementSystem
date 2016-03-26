package nju.software.manager.student;

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
public class StudentInfoManager {
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AccountService accountService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(StudentInfoManager.class);
	
	/**
	 * 获取学生信息
	 * @param studentId
	 * @return
	 */
	public JSONObject studentInfo(Integer studentId) {
		Student student = null;
		String result_json = "";
		try {
			student = studentService.getStudentById(studentId);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;
		}
		// 转换为jsonstudent
		JsonStudent jsonstudent = new JsonStudent(student);

		// 返回json数据
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("student", jsonstudent);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 更新学生信息
	 * @param studentId
	 * @param email
	 * @param phone
	 * @return
	 */
	public JSONObject updateStudentInfo(Integer studentId, String email, String phone) {
		LOGGER.debug("email: {}, phone: {}", email, phone);
		Student student = null;
		String result_json = "";
		try {
			student = studentService.getStudentById(studentId);
			student.setStudentEmail(email);
			student.setStudentPhone(phone);
			studentService.updateStudentInfo(student);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;
		}

		// 返回json数据
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 获取导师信息
	 * @param studentId
	 * @return
	 */
	public JSONObject studentTeacherInfo(Integer studentId) {
		JsonTeacher jsonteacher = new JsonTeacher();
		Teacher teacher = null;
		String result_json = "";
		// 获得老师信息块

		try {
			teacher = teacherService.getTeacherByStudentId(studentId);
			result_json = Constants.SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			result_json = Constants.FAIL;

		}
		// 返回json数据
		int accountId = accountService.getAccountByAccountname(
				teacher.getTeacherNumber()).getAccountId();
		jsonteacher = JsonTeacher.teacher2JsonTeacher(teacher);
		jsonteacher.setAccountId(accountId);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("teacher", jsonteacher);
		jsonobj.put("teacherJobTitle", teacher.getTeacherJobTitle().getTitle());
		jsonobj.put("teacherEducation", teacher.getTeacherEducation().getEducation());
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 修改密码
	 * @param accountId
	 * @param oPassword	原密码
	 * @param nPassword	新密码
	 */
	public JSONObject changePassword(Integer accountId, String oPassword, String nPassword) {
		LOGGER.debug("accountId: {}, oPassword:{}, nPassword: {}", accountId, oPassword, nPassword);
		String result_json = "";
		Account account = null;
		try {
			account = accountService.getAccountByAccountId(accountId);

			if(account.getAccountPassword().equals(oPassword)){
				account.setAccountPassword(nPassword);
				accountService.updateAccount(account);	
				result_json = Constants.SUCCESS;
			} else{
				result_json = Constants.WRONPASSWORD;
			}
		} catch (Exception e) {
			LOGGER.error("修改密码失败！", e);
			result_json =Constants.FAIL;
		}
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
}
