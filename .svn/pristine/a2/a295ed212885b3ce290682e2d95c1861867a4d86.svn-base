package nju.software.dao;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Teacher;
import nju.software.entity.enums.TeacherEducation;
import nju.software.entity.enums.TeacherJobTitle;

@Repository("nju.software.dao.StudentCourseInfoDAO")
public interface TeacherDAO extends BaseDao<Teacher>{
	public abstract Teacher findById(java.lang.Integer id);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List<Teacher> findByTeacherName(Object teacherName);
	
	public abstract List<Teacher> findByTeacherNumber(Object teacherNumber);

	public abstract List<Teacher> findByTeacherEmail(Object teacherEmail);

	public abstract List<Teacher> findByTeacherPhone(Object teacherPhone);

	public abstract List<Teacher> findByTeacherJobTitle(Object teacherJobTitle);

	public abstract List<Teacher> findByTeacherEducation(Object teacherEducation);

	public abstract List<Teacher> findByTeacherClasses(Object teacherClasses);
	
	public abstract List<Teacher> findByTeacherQualification(Object teacherQualification);
	
	public abstract List<Object> findAllLimit(HashMap<String,Object> params);
	
    public abstract int count(String propertyName, Object value);
	
	public abstract int count();
	
	/**
	 * 获取高于指定职称的教师
	 * @param jobTitle
	 * @return
	 */
	public List<Teacher> getTeacherHigherThanJobTitle(TeacherJobTitle jobTitle);

	/**
	 * 获取高于指定学历的教师
	 * @param education
	 * @return
	 */
	public List<Teacher> getTeacherHigherThanEducation(TeacherEducation education);
}