package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * StudentScore entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student_score")
public class StudentScore implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6656650673958281774L;
	// Fields
	private Integer Id;
	private Integer studentId;
	private Integer excellent;
	private Integer good;
	private Integer medium;
	private Integer pass;

	// Constructors

	/** default constructor */
	public StudentScore() {
	}

	/** full constructor */
	public StudentScore(Integer studentId, Integer excellent, Integer good,
			Integer medium, Integer pass) {
		this.studentId = studentId;
		this.excellent = excellent;
		this.good = good;
		this.medium = medium;
		this.pass = pass;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.Id;
	}

	public void setId(Integer Id) {
		this.Id = Id;
	}

	@Column(name = "student_id")
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "excellent")
	public Integer getExcellent() {
		return this.excellent;
	}

	public void setExcellent(Integer excellent) {
		this.excellent = excellent;
	}

	@Column(name = "good")
	public Integer getGood() {
		return this.good;
	}

	public void setGood(Integer good) {
		this.good = good;
	}

	@Column(name = "medium")
	public Integer getMedium() {
		return this.medium;
	}

	public void setMedium(Integer medium) {
		this.medium = medium;
	}

	@Column(name = "pass")
	public Integer getPass() {
		return this.pass;
	}

	public void setPass(Integer pass) {
		this.pass = pass;
	}

}