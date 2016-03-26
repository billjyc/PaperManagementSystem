package nju.software.manager.dean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Notice;
import nju.software.jsonmodel.JsonNotice;
import nju.software.service.NoticeService;
import nju.software.service.TeacherService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanNoticeManager {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private TeacherService teacherService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DeanNoticeManager.class);
	
	/**
	 * 编辑通知
	 * @param oper
	 * @param noticeIds 前端传递的json字符串
	 * @param noticeLevelS
	 * @param noticeTheme
	 * @param teacherId
	 * @param noticeIdS
	 */
	@Transactional(rollbackFor = Exception.class)
	public void editNotice(String oper, String noticeIds, String noticeLevelS, String noticeTheme, 
			Integer teacherId, String noticeIdS) {
		if(oper != null && oper.equals("del")){
			JSONArray array = JSONArray.fromObject(noticeIds);
			try{
				for(int i = 0;i<array.size();i++){
					Notice notice = noticeService.getNoticeById(array.getInt(i));
					noticeService.delete(notice);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper != null){
			Integer noticeLevel= Integer.parseInt(noticeLevelS);

			Notice n = new Notice();
			n.setNoticeLevel(noticeLevel);
			n.setNoticePublisherId(teacherId);
			n.setNoticePublisherName(teacherService.getTeacherById(teacherId).getTeacherName());
			n.setNoticeTheme(noticeTheme);
			n.setNoticeTime(new Date());

			try{
				if(oper.equals("edit")){
					int nid = Integer.parseInt(noticeIdS);
					n.setNoticeId(nid);
					n.setNoticeContent(noticeService.getNoticeById(nid).getNoticeContent());
					noticeService.merge(n);
				}else if(oper.equals("add")){
					noticeService.addNotice(n);
				}
			}catch(Exception e){
				LOGGER.error("编辑通知失败！", e);
			}
		} 
	}
	
	/**
	 * 编辑通知内容
	 * @param oper
	 * @param noticeIdS
	 * @param noticeContent
	 */
	@Transactional(rollbackFor = Exception.class)
	public void editNoticeContent(String oper, String noticeIdS, String noticeContent) {
		Integer noticeId = Integer.parseInt(noticeIdS);
		if(oper != null && oper.equals("edit")){
			try{
				Notice n = noticeService.getNoticeById(noticeId);
				n.setNoticeContent(noticeContent);
				noticeService.merge(n);
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
	}
	
	/**
	 * 获取所有通知
	 * @param teacherId
	 * @return
	 */
	public JSONObject getAllNotices(Integer teacherId) {
		List<Notice> data = noticeService.getNoticeByPublisherId(teacherId);
		List<JsonNotice> noticeList = new ArrayList<JsonNotice>();
		for(Notice n : data){
			noticeList.add(new JsonNotice(n));
		}
		JSONArray listObj = JSONArray.fromObject(noticeList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", listObj);
		return jsonobj;
	}
}
