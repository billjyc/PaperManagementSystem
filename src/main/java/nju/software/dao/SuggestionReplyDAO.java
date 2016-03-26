package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.SuggestionReply;

@Repository("nju.software.dao.StudentCourseInfoDAO")
public interface SuggestionReplyDAO extends BaseDao<SuggestionReply>{
	
	public abstract SuggestionReply findById(java.lang.Integer id);
	
	public abstract List findByProperty(String propertyName, Object value);
	
	public abstract List<SuggestionReply> findBySuggestionId(Object suggestion_id);
	
	public abstract List<SuggestionReply> findByReplySuggestionId(Object reply_suggestion_id);
}
