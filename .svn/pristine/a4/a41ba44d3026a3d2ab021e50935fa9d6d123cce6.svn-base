package nju.software.dao.impl;

import java.util.List;

import nju.software.dao.AccessoryDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Accessory;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for
 * Accessory entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see nju.software.dataobject.Accessory
 * @author MyEclipse Persistence Tools
 */

@Repository("nju.software.dao.impl.AccessoryDAOImpl")
public class AccessoryDAOImpl extends BaseDaoImpl<Accessory> implements AccessoryDAO{
	private static final Logger LOGGER = LoggerFactory
			.getLogger(AccessoryDAOImpl.class);
	// property constants
	public static final String SUGGESTION_ID = "suggestionId";
	public static final String PATH = "path";

	public AccessoryDAOImpl(){
		super();
		this.setClazz(Accessory.class);
	}

	public List<Accessory> findBySuggestionId(Integer suggestionId) {
		String hql = "from Accessory as a where a.suggestionId = ?";
		return find(hql, suggestionId);
	}

	public List<Accessory> findByPath(String path) {
		String hql = "from Accessory as a where a.path = ?";
		return find(hql, path);
	}

	@Override
	public Accessory findById(Integer id) {
		return super.findById(id);
	}
}