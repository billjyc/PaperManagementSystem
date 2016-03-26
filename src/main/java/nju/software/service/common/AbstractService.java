package nju.software.service.common;

import java.io.Serializable;
import java.util.List;

import nju.software.dao.common.BaseDao;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public abstract class AbstractService<T> implements BaseDao<T> {
	
	protected abstract BaseDao<T> getDao();

	public T findById(Serializable id) {
		return getDao().findById(id);	
	}

	public Serializable save(T entity) {
		return getDao().save(entity);
	}

	public void update(T entity) {
		getDao().update(entity);
	}

	public void delete(T entity) {
		getDao().delete(entity);
	}

	public void delete(Serializable id) {
		getDao().delete(id);
	}

	public List<T> findAll() {
		return getDao().findAll();
	}

	public long findCount() {
		return getDao().findCount();
	}
	
	public void create(T entity){
		getDao().create(entity);
	}

}
