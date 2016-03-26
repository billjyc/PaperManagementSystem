package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Accessory entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "accessory")
public class Accessory implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2318053568446257974L;
	
	// Fields
	private Integer accessoryId;
	private Integer suggestionId;
	private String path;

	// Constructors

	/** default constructor */
	public Accessory() {
	}

	/** full constructor */
	public Accessory(Integer suggestionId, String path) {
		this.suggestionId = suggestionId;
		this.path = path;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "accessory_id", unique = true, nullable = false)
	public Integer getAccessoryId() {
		return this.accessoryId;
	}

	public void setAccessoryId(Integer accessoryId) {
		this.accessoryId = accessoryId;
	}

	@Column(name = "suggestion_id")
	public Integer getSuggestionId() {
		return this.suggestionId;
	}

	public void setSuggestionId(Integer suggestionId) {
		this.suggestionId = suggestionId;
	}

	@Column(name = "path", length = 100)
	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}