package nju.software.dao;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Student;

@Repository("nju.software.dao.StudentDAO")
public interface StudentDAO extends BaseDao<Student>{
	public abstract Student findById(java.lang.Integer id);

	public abstract List<Student> findByProperty(String propertyName, Object value);

	public abstract List<Student> findByStudentName(Object studentName);

	public abstract List<Student> findByStudentNumber(Object studentNumber);

	public abstract List<Student> findByStudentEmail(Object studentEmail);

	public abstract List<Student> findByStudentGrade(Object studentGrade);

	public abstract List<Student> findByStudentPhone(Object studentPhone);
	
	public abstract List<Student> findByStudentPhoneX(Object studentPhoneX);
	
	public abstract List<Student> findByNominalTeacherId(Object nominalTeacherId);
	
	public abstract List<Student> findByDegreeType(Object degreeType);
	
	public abstract List<Student> findByStudyTime(Object studyTime);
	
	public abstract List<Student> findByScore(Object score);
	
	public abstract List<Object> findAllWithTeacherLimit(HashMap<String,Object> params);
	
	public abstract List<Student> findAllWithOutTeacher();
	public abstract List<Student> findAllWithOutClass();
	public abstract List<Student> findAllWithClass();
	
	public abstract int count(String propertyName, Object value);
	
	public abstract int count();
	
	public abstract HashMap<String,Object> calculateLimits(HashMap<String,Object> params);
	
	public abstract List<Object> findByPropertyLimit(String propertyName, Object value,HashMap<String,Object> params);

	public abstract List<Object> findAllLimit(HashMap<String,Object> params);

	public abstract List<Student> getStudentByTPNo(String tPNo);
	
	public abstract List<Student> findSearch(String searchCondition) ;
}