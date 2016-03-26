package nju.software.dao.impl;

import java.util.List;

import nju.software.dao.SuggestionReplyDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.SuggestionReply;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for
 * SuggestionReply entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see nju.software.dataobject.SuggestionReply
 * @author MyEclipse Persistence Tools
 */

@Repository("nju.software.dao.impl.SuggestionReplyDAOImpl")
public class SuggestionReplyDAOImpl extends BaseDaoImpl<SuggestionReply> implements SuggestionReplyDAO{
	private static final Logger log = LoggerFactory
			.getLogger(SuggestionReplyDAOImpl.class);
	// property constants
	public static final String SUGGESTION_ID = "suggestionId";
	public static final String REPLY_SUGGESTION_ID = "replySuggestionId";

	public SuggestionReplyDAOImpl(){
		super();
		this.setClazz(SuggestionReply.class);
	}

	public SuggestionReply findById(java.lang.Integer id) {
		return super.findById(id);
	}

	public List<SuggestionReply> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public List<SuggestionReply> findBySuggestionId(Object suggestionId) {
		return findByProperty(SUGGESTION_ID, suggestionId);
	}

	public List<SuggestionReply> findByReplySuggestionId(
			Object replySuggestionId) {
		return findByProperty(REPLY_SUGGESTION_ID, replySuggestionId);
	}
}