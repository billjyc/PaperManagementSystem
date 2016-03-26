package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.HeadTeacher;

@Repository("nju.software.dao.HeadTeacherDAO")
public interface HeadTeacherDAO extends BaseDao<HeadTeacher>{
	public abstract List<HeadTeacher> findByProperty(String propertyName, Object value);
	public abstract HeadTeacher findById(Integer id);
	public abstract List<HeadTeacher> findByNo(String no);
	public abstract List<HeadTeacher> findByName(String name);
	public List<HeadTeacher> findSearchHeadTeacher(String searchCondition);
}
