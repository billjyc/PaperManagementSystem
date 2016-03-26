package nju.software.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.StudentCourseInfoDAO;
import nju.software.dao.StudentScoreDAO;
import nju.software.entity.StudentCourseInfo;
import nju.software.service.StudentCourseInfoService;
@Service("studentCourseInfoServiceImpl")
public class StudentCourseInfoServiceImpl implements StudentCourseInfoService {
	@Autowired
    private StudentCourseInfoDAO studentCourseInfoDAO;
	public void addStudentCourseInfo(StudentCourseInfo sci) {
		studentCourseInfoDAO.save(sci);
	}
	/* 
	* 2014-4-24上午10:03:56
	* @author Jay，Wang
	 */
	public void approveStudentCourseInfo(Integer studentCourseInfoId) {
		StudentCourseInfo sci=studentCourseInfoDAO.findById(studentCourseInfoId);
		sci.setState(1);
		studentCourseInfoDAO.update(sci);
	}
	
	public List<StudentCourseInfo> findSearchStudentScore(String searchCondition){
		 List<StudentCourseInfo> sci=null;
		 try{
			 sci=studentCourseInfoDAO.findSearchStudentScore(searchCondition);
		 }catch(Exception e){
				e.printStackTrace();
				return null;
			}
		 return sci;
	}
	
public  List<Object> getStudentAssignedCourse(HashMap<String,Object> params) {
		List<Object> result = null;
		try{
			result = studentCourseInfoDAO.findStudentAssignedCourse(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public List<StudentCourseInfo> getAll() {
	
		return studentCourseInfoDAO.findAll();
	}
	public StudentCourseInfo getInfoById(Integer id) {
		
		return studentCourseInfoDAO.findById(id);
	}
	public List<StudentCourseInfo> getInfoByStudentNo(String studentNo) {
		
		return studentCourseInfoDAO.findByStudentNo(studentNo);
	}
	public List<StudentCourseInfo> getInfoByCourseNo(String courseNo) {
		return studentCourseInfoDAO.findByCourseNo(courseNo);
	}
	public List<StudentCourseInfo> getInfoByCourseName(String courseName) {
		return studentCourseInfoDAO.findByCourseName(courseName);
	}
	public List<StudentCourseInfo> getInfoByStudentName(String studentName) {
		return studentCourseInfoDAO.findByStudentName(studentName);
	}
	public void approveStudentCourseInfo() {
	List<StudentCourseInfo>	sciList= studentCourseInfoDAO.findByState(0);
	for(StudentCourseInfo sci:sciList){
		sci.setState(1);
		studentCourseInfoDAO.update(sci);
		
	}
	
	}
	public List<Object> getUncheckedTranscript(HashMap<String, Object> params) {
		List<Object> result = null;
		try{
			result = studentCourseInfoDAO.findUncheckedTranscript(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getCheckedTranscript(HashMap<String, Object> params) {
		List<Object> result = null;
		try{
			result = studentCourseInfoDAO.findCheckedTranscript(params);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public void rejectStudentCourseInfo() {
		List<StudentCourseInfo>	sciList= studentCourseInfoDAO.findByState(0);
		for(StudentCourseInfo sci:sciList){
			sci.setState(2);
			studentCourseInfoDAO.update(sci);
		
	}
}
	public void deleteStudentCourseInfo(StudentCourseInfo sci) {
		studentCourseInfoDAO.delete(sci);
		
	}
	public void rejectStudentCourseInfo(Integer studentCourseInfoId) {
		StudentCourseInfo sci=studentCourseInfoDAO.findById(studentCourseInfoId);
		sci.setState(2);
		studentCourseInfoDAO.update(sci);
		
	}
}