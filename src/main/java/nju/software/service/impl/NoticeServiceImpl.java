package nju.software.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.NoticeDAO;
import nju.software.entity.Notice;
import nju.software.service.NoticeService;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;

	public List<Notice> getNoticeByPublisherId(int pid) {
		return noticeDAO.findAll();
	}

	public Notice addNotice(Notice notice){
		noticeDAO.save(notice);
		return notice;
	}

	public void delete(Notice notice) {
		noticeDAO.delete(notice);
	}

	public Notice getNoticeById(int id) {
		return noticeDAO.findById(id);
	}

	public void merge(Notice notice) {
		noticeDAO.merge(notice);
	}

	public List<Notice> getAllNotice() {
		return noticeDAO.findAll();
	}
	
}
