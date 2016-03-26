package nju.software.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import nju.software.dao.DirectorDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Director;

@Repository("nju.software.dao.impl.DirectorDAOImpl")
public class DirectorDAOImpl extends BaseDaoImpl<Director> implements DirectorDAO {
	private static final Logger log = LoggerFactory.getLogger(DirectorDAOImpl.class);

	public static final String ID= "id";
	public static final String NO= "no";
	public static final String NAME= "name";
	public static final String TEL="tel";	
	public static final String EMAIL="email";

	public DirectorDAOImpl() {
		super();
		this.setClazz(Director.class);
	}

	public List<Director> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public Director findById(Integer id) {
		return super.findById(id);
	}

	public List<Director> findByNo(String no) {
		return findByProperty(NO, no);
	}

	public List<Director> findByName(String name) {
		return findByProperty(NAME, name);
	}

	@Override
	public List<Director> findSearchDirector(String searchCondition) {
		String hql = "from Director " + searchCondition;
		return find(hql);
	}
}
