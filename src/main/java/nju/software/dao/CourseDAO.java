package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Course;

@Repository("nju.software.CourseDAO")
public interface CourseDAO extends BaseDao<Course>{	
	public List<Course> findByProperty(String propertyName, Object value);
	public List<Course> findByNo(String courseNo);
	public List<Course> findByCourseName(String courseName);
	public List<Course> findByTeacherName(String teacherName);
	public List<Course> findByDate(Integer date);
	public List<Course> findByTeacherNo(String teacherNo);
	public Course findById(Integer id);
	public List<Course> findSearchCourse(String searchCondition);
}
