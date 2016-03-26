package nju.software.service.activiti.impl;

import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import nju.software.entity.Student;
import nju.software.entity.Teacher;
import nju.software.service.activiti.ActivitiAccountService;

@Service
@Transactional
public class ActivitiAccountServiceImpl implements ActivitiAccountService {
	private static Logger logger = LoggerFactory.getLogger(ActivitiAccountServiceImpl.class);
	@Autowired
	private IdentityService identityService;

	@Override
	public void addStudent(Student student) {
		logger.info("向activiti数据库中添加学生信息----->");
		UserQuery userQuery = identityService.createUserQuery();
		List<User> users = userQuery.userId(student.getStudentNumber()).list();
		
		if(users.size() == 1) {
			logger.info("该用户id已经存在！");
			updateStudent(student);
			return;
		}else if(users.size() > 1) {
			String errorMsg = "发现重复用户：id=" + student.getStudentNumber();
            logger.error(errorMsg);
            throw new RuntimeException(errorMsg);
		} else {
			User user = identityService.newUser(student.getStudentNumber());
			user.setEmail(student.getStudentEmail());
			user.setLastName(student.getStudentName());
			user.setPassword(student.getStudentNumber());
			identityService.saveUser(user);
			//将该学生加入“student"组中
			identityService.createMembership(user.getId(), "student");
		}
	}

	@Override
	public void addTeacher(Teacher teacher) {
		logger.info("向activiti数据库中添加教师信息----->");
		//先检验数据库中有无重复数据
		String userId = teacher.getTeacherNumber();
		UserQuery userQuery = identityService.createUserQuery();
		List<User> users = userQuery.userId(userId).list();
		
		if(users.size() == 1) {
			logger.info("该用户id已经存在！");
			return;
		}else if(users.size() > 1) {
			String errorMsg = "发现重复用户：id=" + userId;
            logger.error(errorMsg);
            throw new RuntimeException(errorMsg);
		} else {
			User user = identityService.newUser(userId);
			user.setEmail(teacher.getTeacherEmail());
			user.setLastName(teacher.getTeacherName());
			user.setPassword(teacher.getTeacherNumber());
			identityService.saveUser(user);
			//将该教师加入“teacher”组中
			identityService.createMembership(user.getId(), "teacher");
		}
	}

	@Override
	public void updateStudent(Student student) {
		logger.info("update student info, student number: {}", student.getStudentNumber());
		String studentNo = student.getStudentNumber();
		List<User> users = identityService.createUserQuery().userId(studentNo).list();
		
		User user = null;
		
		if(users.isEmpty()) {
			user = identityService.newUser(studentNo);
			identityService.createMembership(studentNo, "student");
		} else {
			user = identityService.createUserQuery().userId(studentNo).singleResult();
		}
		
		user.setEmail(student.getStudentEmail());
		user.setLastName(student.getStudentName());
		user.setPassword(studentNo);
		
		identityService.saveUser(user);
	}

	@Override
	public void deleteUser(String userId, String groupId) throws Exception {
		deleteMemberShip(userId, groupId);
		identityService.deleteUser(userId);
	}
	
	private void deleteMemberShip(String userId, String group){
		identityService.deleteMembership(userId, group);
	}

	@Override
	public void updateTeacher(Teacher teacher) {
		logger.info("update teacher info, teacher number: {}", teacher.getTeacherNumber());
		String teacherNumber = teacher.getTeacherNumber();
		List<User> users = identityService.createUserQuery().userId(teacherNumber).list();
		
		User user = null;
		
		if(users.isEmpty()) {  //如果教师号是新的，在数据库中创建一个新的教师user
			user = identityService.newUser(teacherNumber);
			identityService.saveUser(user);
			identityService.createMembership(teacherNumber, "teacher");
		} else {
			user = identityService.createUserQuery().userId(teacherNumber).singleResult();
		}
		
		user.setEmail(teacher.getTeacherEmail());
		user.setLastName(teacher.getTeacherName());
		user.setPassword(teacher.getTeacherNumber());
		
		identityService.saveUser(user);
	}

}
