package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 中期报告 
 * @author jiayicong
 * @date 2015-3-2
 * 
 */
@Entity
@Table(name = "interim_report")
public class InterimReport implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4360760842990515417L;
	// Fields
	private Integer id;
	private String address;
	private Integer studentId;
	private Integer status;

	// Constructors

	/** default constructor */
	public InterimReport() {
	}

	/** full constructor */
	public InterimReport(String address, Integer studentId, Integer status) {
		this.address = address;
		this.studentId = studentId;
		this.status = status;
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

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "student_id", nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "status", nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}