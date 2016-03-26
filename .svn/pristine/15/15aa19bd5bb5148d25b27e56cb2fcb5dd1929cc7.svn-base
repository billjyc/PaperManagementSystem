package nju.software.service.impl;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import nju.software.dao.AccessoryDAO;
import nju.software.dao.SuggestionDAO;
import nju.software.dao.SuggestionReplyDAO;
import nju.software.entity.Accessory;
import nju.software.entity.Suggestion;
import nju.software.entity.SuggestionReply;
import nju.software.service.SuggestionService;
import nju.software.util.FileOperateUtil;

@Transactional
@Service("suggestionServiceImpl")
public class SuggestionServiceImpl implements SuggestionService{
	@Autowired
	private SuggestionDAO suggestionDAO;
	@Autowired
	private SuggestionReplyDAO suggestionReplyDAO;
	@Autowired
	private AccessoryDAO accessoryDAO;

	public int addSuggestion(Suggestion s) throws Exception {
		Suggestion new_s = s;
		try {
			suggestionDAO.save(new_s);
		} catch (Exception e) {
			throw e;
		}
		return new_s.getSuggestionId(); 
	}
	public List<Suggestion> getSuggestionByUserId(int userId) {
		return suggestionDAO.findByUserId(userId);
	}
	public List<Suggestion> getSuggestionByReceiverId(int receiverId) {
		return suggestionDAO.findByReceiverId(receiverId);
	}
	public List<SuggestionReply> getSuggestionBySubjectId(int subjectId) {
		return suggestionReplyDAO.findBySuggestionId(subjectId);
	}
	public void addSuggestionReply(SuggestionReply r) throws Exception {
		suggestionReplyDAO.save(r);

	}
	public Suggestion getSuggestionBySuggestionId(int suggestionId) {
		return suggestionDAO.findById(suggestionId);
	}
	public LinkedHashMap<String, LinkedHashMap<String, List<Suggestion>>> getAllSuggestionMapByUserIdByType(
			int userId, String type) {
		LinkedHashMap<String,LinkedHashMap<String,List<Suggestion>>> result=new LinkedHashMap<String,LinkedHashMap<String,List<Suggestion>>>();
		if(type.equals("theme")){

		}else{
			//contact
			HashMap<Integer,String> contacts=suggestionDAO.findAllContanctsByUserId(userId);
			Iterator<Integer> iter=contacts.keySet().iterator();
			while(iter.hasNext()){
				int index=iter.next();
				List<Suggestion> temp=suggestionDAO.findBetween2(userId, index);
				//date,list
				LinkedHashMap<String,List<Suggestion>> map=new LinkedHashMap<String,List<Suggestion>>();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				//the first node
				String date=simpleDateFormat.format(temp.get(0).getSuggestTime());
				List<Suggestion> lst=new ArrayList<Suggestion>();
				lst.add(temp.get(0));
				//the others
				for(int i=1;i<temp.size();i++){
					Suggestion s=temp.get(i);
					if(simpleDateFormat.format(s.getSuggestTime()).equals(date))
						lst.add(s);
					else{
						map.put(date, lst);
						date=simpleDateFormat.format(s.getSuggestTime());
						lst=new ArrayList<Suggestion>();
						lst.add(s);	
					}
				}
				//the last node
				map.put(date, lst);
				result.put(contacts.get(index), map);
			}
		}
		return result;
	}
	public void updateSuggestion(Suggestion s) throws Exception {
		suggestionDAO.merge(s);
	}
	public List<Suggestion> getSuggestionByReceiverIdAndLevel(int receiverId,
			int level) {
		return suggestionDAO.findByReceiverIdByLevel(receiverId, level);
	}
	public List<Accessory> getAccessoryBySuggestionId(int suggestionId){
		return accessoryDAO.findBySuggestionId(suggestionId);
	}
	
	public void addAccessory(Accessory a) throws Exception{
		try {
			accessoryDAO.save(a);
		} catch (Exception e) {
			throw e;
		}
	}
	
	@Override
	public void sendSuggestion(Suggestion suggestion, File file) throws Exception {
		int new_sugg_id = addSuggestion(suggestion);
		String affix = "";
		if(file != null) {
			affix = FileOperateUtil.getRelativeFilePath(file
				.getAbsolutePath());
			Accessory a = new Accessory();
			a.setPath(affix);
			a.setSuggestionId(new_sugg_id); //添加附件
			addAccessory(a);
		}
	}
	
	@Override
	public Suggestion createSuggestion(String title, String content,
			Integer senderId, String senderName, Integer receiverId,
			Integer paperId) {
		return new Suggestion(paperId, senderId, senderName, receiverId, 
				new Timestamp(new Date().getTime()), 
				content, title, 0, false);
	}
	@Override
	public Integer getSuggestionNotRead(Integer accountId) {
		Integer numNotRead = suggestionDAO.countByNotRead(accountId);
		return numNotRead;
	}
	
	@Override
	public void setSuggestionHasRead(Integer suggestionId) {
		Suggestion suggestion = suggestionDAO.findById(suggestionId);
		if(!suggestion.getIsRead()) {
			suggestion.setIsRead(true);
			suggestionDAO.update(suggestion);
		}
	}
}
