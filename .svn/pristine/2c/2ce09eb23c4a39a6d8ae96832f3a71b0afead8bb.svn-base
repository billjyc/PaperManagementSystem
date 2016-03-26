package nju.software.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.StudentCourseInfo;

@Repository("nju.software.dao.StudentCourseInfoDAO")
public interface StudentCourseInfoDAO extends BaseDao<StudentCourseInfo>{
	public abstract StudentCourseInfo findById(Integer studentCourseInfoId);
	public abstract List<StudentCourseInfo> findByStudentNo(String studentNo);
	public abstract List<StudentCourseInfo> findByStudentName(String studentName);
	public abstract List<StudentCourseInfo> findByCourseNo(String courseNo);
	public abstract List<StudentCourseInfo> findByCourseName(String courseName);

	public abstract List<StudentCourseInfo> findBySIdCNo(String studentId,String courseNo);
	public abstract List<StudentCourseInfo> findByState(Integer state);
	public abstract List<StudentCourseInfo> findByScore(Integer score);
	public abstract List<StudentCourseInfo> findByDate(Integer date);
	public List<StudentCourseInfo> findSearchStudentScore(String searchCondition);

	public List<Object> findStudentAssignedCourse(HashMap<String,Object> params);

	public abstract List<Object> findUncheckedTranscript(
			HashMap<String, Object> params);
	public abstract List<Object> findCheckedTranscript(
			HashMap<String, Object> params);
}
