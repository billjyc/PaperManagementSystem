package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Fee;

@Repository("nju.software.dao.FeeDAO")
public interface FeeDAO extends BaseDao<Fee>{
	public Fee findById(java.lang.Integer id);

	public List findByProperty(String propertyName, Object value);

	public List<Fee> findByStudentId(Object studentId);

	public List<Fee> findByTeacherId(Object teacherId);

	public List<Fee> findByAmount(Object amount);

	public List<Fee> findByFeeType(Object feeType);

	public List<Fee> findByGrantType(Object grantType);
}