package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.TeachingPoint;

@Repository("nju.software.dao.TeachingPointDAO")
public interface TeachingPointDAO extends BaseDao<TeachingPoint>{
	public abstract List<TeachingPoint> findByProperty(String propertyName, Object value);
	public abstract TeachingPoint findById(Integer id);
	public abstract List<TeachingPoint> findByNo(String no);
	public abstract List<TeachingPoint> findByName(String name);
	public abstract List<TeachingPoint> findByDirectorNo(String directorNo);
	public abstract List<TeachingPoint> findByDirectorName(String directorName);
	public abstract List<TeachingPoint> findByLocation(String location);
}
