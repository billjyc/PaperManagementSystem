package nju.software.service;

import java.util.HashMap;
import java.util.List;

import nju.software.entity.StudentCourseInfo;

public interface StudentCourseInfoService {

	public void addStudentCourseInfo(StudentCourseInfo sci);
	
	public void deleteStudentCourseInfo(StudentCourseInfo sci);
	
	public void approveStudentCourseInfo(Integer studentCourseInfoId);
	public void approveStudentCourseInfo();
	
	
	public List<StudentCourseInfo> getAll();
	
	public StudentCourseInfo getInfoById(Integer id);
	
	
	public List<StudentCourseInfo> getInfoByStudentNo(String studentNo);

	
	public List<StudentCourseInfo> getInfoByCourseNo(String courseNo);
	public List<StudentCourseInfo> getInfoByCourseName(String courseName);
	public List<StudentCourseInfo> getInfoByStudentName(String studentName);

	public  List<Object> getStudentAssignedCourse(HashMap<String,Object> params);
	public List<StudentCourseInfo> findSearchStudentScore(String searchCondition);

	public  List<Object> getUncheckedTranscript(HashMap<String,Object> params);

	public List<Object> getCheckedTranscript(HashMap<String, Object> params);

	public void rejectStudentCourseInfo();

	public void rejectStudentCourseInfo(Integer transcriptId);
	
	
	
}
