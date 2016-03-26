package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.InterimReport;

@Repository("nju.software.dao.InterimReportDAO")
public interface InterimReportDAO extends BaseDao<InterimReport>{
	public InterimReport findById(Integer id);

	public List findByProperty(String propertyName, Object value);

	public List<InterimReport> findByStudentId(Object studentId);

	public List<InterimReport> findByAddress(Object address);

	public List<InterimReport> findByStatus(Object status);
	
    public abstract int count(String propertyName, Object value);
    
    public abstract int countByTeacher(Object value);
	
	public abstract int count();
	
	public abstract int countByTeacherAndStatus(Integer value, Integer status);

	public List<InterimReport> findByStatus(int status, int teacherId);
}
