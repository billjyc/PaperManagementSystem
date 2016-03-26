package nju.software.jsonmodel;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import nju.software.entity.Suggestion;

public class JsonSuggestion {
	private Integer suggestionId;
    private Integer paperId;
    private Integer userId;
    private String senderName;
    private Integer receiverId;
    private String suggestTime;
    private String suggestContent;
    private Integer level;
    private String suggestTitle;
    private ArrayList<String> affixList = new ArrayList<String>();
    private Boolean isRead;
    public void setSuggestionId(int s){
    	this.suggestionId = s;
    }
    public int getSuggestionId(){
    	return suggestionId;
    }
    public void setPaperId(int p){
    	this.paperId = p;
    }
    public int getPaperId(){
    	return paperId;
    }
    public void setUserId(int u){
    	this.userId = u;
    }
    public int getUserId(){
    	return userId;
    }
    public void setSenderName(String s){
    	this.senderName = s;
    }
    public String getSenderName(){
    	return senderName;
    }
    public int getReceiverId(){
    	return receiverId;
    }
    public void setReceiverId(int r){
    	this.receiverId = r;
    }
    public void setSuggestTime(String time){
    	this.suggestTime = time;
    }
    public String getSuggestTime(){
    	return suggestTime;
    }
    public void setSuggestContent(String c){
    	this.suggestContent = c;
    }
    public String getSuggestContent(){
    	return suggestContent;
    }
    public void setLevel(int level){
    	this.level = level;
    }
    public int getLevel(){
    	return level;
    }
    public void setSuggestTitle(String s){
    	this.suggestTitle = s;
    }
    public String getSuggestTitle(){
    	return suggestTitle;
    }
    public ArrayList<String> getAffixList(){
    	return affixList;
    }
    public void setAffixList(ArrayList<String> list){
    	this.affixList = list;
    }
    
    public Boolean getIsRead() {
		return isRead;
	}
    
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	public static JsonSuggestion suggestion2JsonSuggestion(Suggestion t){
		JsonSuggestion j = new JsonSuggestion();
		Date date = new Date(t.getSuggestTime().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		String time = sdf.format(date);
		j.setLevel(t.getLevel());
		j.setPaperId(t.getPaperId());
		j.setReceiverId(t.getReceiverId());
		//j.setSubjectId(t.getSubjectId());
		j.setSuggestionId(t.getSuggestionId());
		j.setSuggestContent(t.getSuggestContent());
		j.setSuggestTitle(t.getSuggestTitle());
		j.setSuggestTime(time);
		j.setUserId(t.getUserId());
		j.setSenderName(t.getSenderName());
		j.setIsRead(t.getIsRead());
		return j;
	}
}
