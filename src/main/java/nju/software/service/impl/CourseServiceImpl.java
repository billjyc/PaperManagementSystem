package nju.software.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.CourseDAO;
import nju.software.dao.impl.ClassesDAOImpl;
import nju.software.entity.Course;
import nju.software.service.CourseService;


@Service("coursesServiceImpl")
public class CourseServiceImpl implements CourseService {
	private static final Logger log = LoggerFactory.getLogger(ClassesDAOImpl.class);
	@Autowired
	private CourseDAO courseDao;
	
	public boolean addCourse(Course course) {
		
		try{
			courseDao.save(course);
			return true;
		}catch(Exception e){
			return false;
		}
	}

public List<Course> findSearchCourse(String searchCondition){
	List<Course> courseList=null;
	try{
		courseList = courseDao.findSearchCourse(searchCondition);
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}
	return courseList;
	
}
	
    public List<Course> getAllCourse() {
    	List<Course> result = null;
    	try {
			result = courseDao.findAll();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}
    
	public List<Course> getCoursesByTeacherId(Integer teacherId) {
		List<Course> courseList = null;
		try{
			courseList = courseDao.findByProperty("teacherId", teacherId);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return courseList;
	}

	public Course getCourseById(int id) {
		
		return courseDao.findById(id);
	}

	public List<Course> getCourseByNo(String courseNo) {
	
		return  courseDao.findByNo(courseNo);
	}

	public boolean deleteCourseInfo(Integer courseId) {
		try{
			courseDao.delete(courseDao.findById(courseId));
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}

	}

public Course updateCourse(Course course){
	try{
		courseDao.update(course);
		
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}
	
	return course;
	
}

public List<Course> getCoursesByTeacherNo(String teacherNo) {
	
	return courseDao.findByTeacherNo(teacherNo);
}

}
