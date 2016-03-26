package nju.software.jsonmodel;

import nju.software.entity.Notice;

public class JsonNotice {
	private Integer noticeId;
    private String noticeContent;
    private Integer noticeLevel;
    private Integer noticePublisherId;
    private String noticePublisherName;
    private String noticeTheme;
	private String noticeTime;
	
    public JsonNotice(Notice notice){
    	setNoticeId(notice.getNoticeId());
    	setNoticeContent(notice.getNoticeContent());
    	setNoticeLevel(notice.getNoticeLevel());
    	setNoticePublisherId(notice.getNoticePublisherId());
    	setNoticePublisherName(notice.getNoticePublisherName());
    	setNoticeTheme(notice.getNoticeTheme());
    	setNoticeTime(notice.getNoticeTime().toString().substring(0, 19));
    }

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	public Integer getNoticeId() {
		return noticeId;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeLevel(Integer noticeLevel) {
		this.noticeLevel = noticeLevel;
	}

	public Integer getNoticeLevel() {
		return noticeLevel;
	}

	public void setNoticePublisherId(Integer noticePublisherId) {
		this.noticePublisherId = noticePublisherId;
	}

	public Integer getNoticePublisherId() {
		return noticePublisherId;
	}

	public void setNoticePublisherName(String noticePublisherName) {
		this.noticePublisherName = noticePublisherName;
	}

	public String getNoticePublisherName() {
		return noticePublisherName;
	}

	public void setNoticeTheme(String noticeTheme) {
		this.noticeTheme = noticeTheme;
	}

	public String getNoticeTheme() {
		return noticeTheme;
	}

	public void setNoticeTime(String noticeTime) {
		this.noticeTime = noticeTime;
	}

	public String getNoticeTime() {
		return noticeTime;
	}
}
