package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Notice;

@Repository("nju.software.dao.NoticeDAO")
public interface NoticeDAO extends BaseDao<Notice>{
	public abstract Notice findById(java.lang.Integer id);
	
	public List<Notice> findByNoticeTheme(Object noticeTheme);
	
	public List<Notice> findByNoticePublisherId(Object noticePublisherId);
	
	public List<Notice> findByNoticePublisherName(Object noticePublisherName);
	
	public List<Notice> findByNoticeContent(Object noticeContent);
	
	public List<Notice> findByNoticeLevel(Object noticeLevel);
}
