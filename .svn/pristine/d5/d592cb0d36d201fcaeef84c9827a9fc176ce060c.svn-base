package nju.software.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Fee entity. 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "fee")
public class Fee implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5990218916519494309L;
	// Fields
	private Integer id;
	private Integer studentId;
	private Integer teacherId;
	private Float amount;
	private Integer feeType;
	private Integer grantType;
	private Timestamp grantTime;

	// Constructors

	/** default constructor */
	public Fee() {
	}

	/** minimal constructor */
	public Fee(Integer studentId, Integer teacherId, Float amount,
			Integer feeType, Integer grantType) {
		this.studentId = studentId;
		this.teacherId = teacherId;
		this.amount = amount;
		this.feeType = feeType;
		this.grantType = grantType;
	}

	/** full constructor */
	public Fee(Integer studentId, Integer teacherId, Float amount,
			Integer feeType, Integer grantType, Timestamp grantTime) {
		this.studentId = studentId;
		this.teacherId = teacherId;
		this.amount = amount;
		this.feeType = feeType;
		this.grantType = grantType;
		this.grantTime = grantTime;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "student_id", nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "teacher_id", nullable = false)
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "amount", nullable = false, precision = 12, scale = 0)
	public Float getAmount() {
		return this.amount;
	}

	public void setAmount(Float amount) {
		this.amount = amount;
	}

	@Column(name = "fee_type", nullable = false)
	public Integer getFeeType() {
		return this.feeType;
	}

	public void setFeeType(Integer feeType) {
		this.feeType = feeType;
	}

	@Column(name = "grant_type", nullable = false)
	public Integer getGrantType() {
		return this.grantType;
	}

	public void setGrantType(Integer grantType) {
		this.grantType = grantType;
	}

	@Column(name = "grant_time", length = 19)
	public Timestamp getGrantTime() {
		return this.grantTime;
	}

	public void setGrantTime(Timestamp grantTime) {
		this.grantTime = grantTime;
	}

}