package nju.software.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "notice")
public class Notice implements java.io.Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 929680950033598205L;
	// Fields
	private Integer noticeId;
	private String noticeTheme;
	private Date noticeTime;
	private Integer noticePublisherId;
	private String noticePublisherName;
	private String noticeContent;
	private Integer noticeLevel;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** full constructor */
	public Notice(String noticeTheme, Date noticeTime,
			Integer noticePublisherId, String noticePublisherName,
			String noticeContent, Integer noticeLevel) {
		this.noticeTheme = noticeTheme;
		this.noticeTime = noticeTime;
		this.noticePublisherId = noticePublisherId;
		this.noticePublisherName = noticePublisherName;
		this.noticeContent = noticeContent;
		this.noticeLevel = noticeLevel;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "notice_id", unique = true, nullable = false)
	public Integer getNoticeId() {
		return this.noticeId;
	}

	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}

	@Column(name = "notice_theme", length = 100)
	public String getNoticeTheme() {
		return this.noticeTheme;
	}

	public void setNoticeTheme(String noticeTheme) {
		this.noticeTheme = noticeTheme;
	}

	@Column(name = "notice_time", length = 19)
	public Date getNoticeTime() {
		return this.noticeTime;
	}

	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}

	@Column(name = "notice_publisher_id")
	public Integer getNoticePublisherId() {
		return this.noticePublisherId;
	}

	public void setNoticePublisherId(Integer noticePublisherId) {
		this.noticePublisherId = noticePublisherId;
	}

	@Column(name = "notice_publisher_name", length = 45)
	public String getNoticePublisherName() {
		return this.noticePublisherName;
	}

	public void setNoticePublisherName(String noticePublisherName) {
		this.noticePublisherName = noticePublisherName;
	}

	@Column(name = "notice_content")
	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	@Column(name = "notice_level")
	public Integer getNoticeLevel() {
		return this.noticeLevel;
	}

	public void setNoticeLevel(Integer noticeLevel) {
		this.noticeLevel = noticeLevel;
	}

}