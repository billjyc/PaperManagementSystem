package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Director;

@Repository("nju.software.DirectorDAO")
public interface DirectorDAO extends BaseDao<Director>{
	public abstract List<Director> findByProperty(String propertyName, Object value);
	public abstract Director findById(Integer id);
	public abstract List<Director> findByNo(String no);
	public abstract List<Director> findByName(String name);
	public List<Director> findSearchDirector(String searchCondition);
}
