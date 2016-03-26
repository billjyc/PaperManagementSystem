package nju.software.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import nju.software.dao.CourseDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Course;

@Repository("nju.software.dao.impl.CourseDAOImpl")
public class CourseDAOImpl  extends BaseDaoImpl<Course> implements CourseDAO {
	private static final Logger log = LoggerFactory.getLogger(CourseDAOImpl.class);

	public static final String ID= "id";
	public static final String COURSE_NO= "courseNo";
	public static final String COURSE_NAME= "courseName";
	public static final String  DATE="date";	
	public static final String  TEACHER_NO="teacherNo";
	public static final String  TEACHER_NAME="teacherName";

	public CourseDAOImpl(){
		super();
		this.setClazz(Course.class);
	}

	public List<Course> findByNo(String courseNo) {
		return findByProperty(COURSE_NO, courseNo);
	}

	public List<Course> findByCourseName(String courseName) {
		return findByProperty(COURSE_NAME, courseName);
	}

	public List<Course> findByDate(Integer date) {
		return findByProperty(DATE, date);
	}

	public List<Course> findByTeacherNo(String teacherNo) {
		return findByProperty(TEACHER_NO, teacherNo);
	}
	
	public List<Course> findByTeacherName(String teacherName) {
		return findByProperty(TEACHER_NAME, teacherName);
	}

	public List<Course> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	@Override
	public Course findById(Integer id) {
		return super.findById(id);
	}

	@Override
	public List<Course> findSearchCourse(String searchCondition) {
		String hql = "from Course " + searchCondition;
		return find(hql);
	}
}
