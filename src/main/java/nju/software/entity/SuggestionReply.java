package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * SuggestionReply entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "suggestion_reply")
public class SuggestionReply implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -100701425043414520L;
	// Fields
	private Integer suggestionReplyId;
	private Integer suggestionId;
	private Integer replySuggestionId;

	// Constructors

	/** default constructor */
	public SuggestionReply() {
	}

	/** full constructor */
	public SuggestionReply(Integer suggestionId, Integer replySuggestionId) {
		this.suggestionId = suggestionId;
		this.replySuggestionId = replySuggestionId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "suggestion_reply_id", unique = true, nullable = false)
	public Integer getSuggestionReplyId() {
		return this.suggestionReplyId;
	}

	public void setSuggestionReplyId(Integer suggestionReplyId) {
		this.suggestionReplyId = suggestionReplyId;
	}

	@Column(name = "suggestion_id")
	public Integer getSuggestionId() {
		return this.suggestionId;
	}

	public void setSuggestionId(Integer suggestionId) {
		this.suggestionId = suggestionId;
	}

	@Column(name = "reply_suggestion_id")
	public Integer getReplySuggestionId() {
		return this.replySuggestionId;
	}

	public void setReplySuggestionId(Integer replySuggestionId) {
		this.replySuggestionId = replySuggestionId;
	}

}