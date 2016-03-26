package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Classes;

@Repository("nju.software.ClassesDAO")
public interface ClassesDAO extends BaseDao<Classes>{	
	public abstract List<Classes> findByProperty(String propertyName, Object value);
	
	public abstract List<Classes> findByName(String name);
	
	public abstract List<Classes> findBySize(Integer size);
	
	public abstract List<Classes> findByTeachingPointNo(String tpno);
	
	public abstract List<Classes> findByGraduateNum(Integer graduateNum);
	
	public abstract List<Classes> findByHeadTeacher(String headTeacher);
	
	public abstract List<Classes> findByMonitor(String monitor);
	
	public Classes findById(Integer id);
}
