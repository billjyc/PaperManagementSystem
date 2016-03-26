package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.StudentScore;

@Repository("nju.software.dao.StudentScoreDAO")
public interface StudentScoreDAO extends BaseDao<StudentScore>{
	public abstract StudentScore findById(java.lang.Integer id);
		
	public abstract List findByProperty(String propertyName, Object value);
	
	public abstract List<StudentScore> findByStudentId(Object studentId);
	
	public abstract List<StudentScore> findByExcellent(Object excellent);
	
	public abstract List<StudentScore> findByGood(Object good);
	
	public abstract List<StudentScore> findByMedium(Object medium);
	
	public abstract List<StudentScore> findByPass(Object pass);
}
