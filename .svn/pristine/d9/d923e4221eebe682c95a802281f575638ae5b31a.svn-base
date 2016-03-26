package nju.software.service;


import java.util.List;

import nju.software.entity.Course;

public interface CourseService {
	public boolean addCourse(Course course);
	/**
	 * 找到所有课程
	 * @author cj
	 */
	 public List<Course> getAllCourse() ;
	
	/**
	 * 找到某个老师所有课程
	 * @param teacherId
	 * 老师的主键
	 * @return
	 * 该老师的课程列表
	 * @author Jerry.Lu
	 */
	public List<Course> getCoursesByTeacherId(Integer teacherId);
	
	/**
	 * 返回课程实例
	 * @param courseId
	 * @author Jerry.Lu
	 */
	public List<Course> getCourseByNo(String courseNo);
	public Course getCourseById(int courseId);
	
	public abstract boolean deleteCourseInfo(Integer courseId);
	public Course updateCourse(Course course);
	public List<Course> findSearchCourse(String searchCondition);
	public List<Course> getCoursesByTeacherNo(String teacherNo);
	
}
