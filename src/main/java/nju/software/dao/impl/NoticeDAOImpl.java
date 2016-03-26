package nju.software.dao.impl;

import java.util.List;

import nju.software.dao.NoticeDAO;
import nju.software.dao.common.impl.BaseDaoImpl;
import nju.software.entity.Notice;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * A data access object (DAO) providing persistence and search support for
 * Notice entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see nju.software.dataobject.Notice
 * @author MyEclipse Persistence Tools
 */
@Repository("nju.software.dao.impl.NoticeDAOImpl")
public class NoticeDAOImpl extends BaseDaoImpl<Notice> implements NoticeDAO{
	private static final Logger log = LoggerFactory.getLogger(NoticeDAOImpl.class);
	// property constants
	public static final String NOTICE_THEME = "noticeTheme";
	public static final String NOTICE_PUBLISHER_ID = "noticePublisherId";
	public static final String NOTICE_PUBLISHER_NAME = "noticePublisherName";
	public static final String NOTICE_CONTENT = "noticeContent";
	public static final String NOTICE_LEVEL = "noticeLevel";
	public static final String NOTICE_ID = "noticeId";

	public NoticeDAOImpl(){
		super();
		this.setClazz(Notice.class);
	}

	public Notice findById(java.lang.Integer id) {
		return super.findById(id);
	}

	public List<Notice> findByProperty(String propertyName, Object value) {
		return super.findByProperty(propertyName, value);
	}

	public List<Notice> findByNoticeTheme(Object noticeTheme) {
		return findByProperty(NOTICE_THEME, noticeTheme);
	}

	public List<Notice> findByNoticePublisherId(Object noticePublisherId) {
		return findByProperty(NOTICE_PUBLISHER_ID, noticePublisherId);
	}

	public List<Notice> findByNoticePublisherName(Object noticePublisherName) {
		return findByProperty(NOTICE_PUBLISHER_NAME, noticePublisherName);
	}

	public List<Notice> findByNoticeContent(Object noticeContent) {
		return findByProperty(NOTICE_CONTENT, noticeContent);
	}

	public List<Notice> findByNoticeLevel(Object noticeLevel) {
		return findByProperty(NOTICE_LEVEL, noticeLevel);
	}
}