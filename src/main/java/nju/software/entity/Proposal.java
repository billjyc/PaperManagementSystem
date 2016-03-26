package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Proposal entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "proposal")
public class Proposal implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6755095036207431155L;
	
	// Fields
	private Integer proposalId;
	private String proposalAddress;
	private Integer studentId;
	private Integer status;

	// Constructors

	/** default constructor */
	public Proposal() {
	}

	/** full constructor */
	public Proposal(String proposalAddress, Integer studentId, Integer status) {
		this.proposalAddress = proposalAddress;
		this.studentId = studentId;
		this.status = status;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "proposal_id", unique = true, nullable = false)
	public Integer getProposalId() {
		return this.proposalId;
	}

	public void setProposalId(Integer proposalId) {
		this.proposalId = proposalId;
	}

	@Column(name = "proposal_address", nullable = false)
	public String getProposalAddress() {
		return this.proposalAddress;
	}

	public void setProposalAddress(String proposalAddress) {
		this.proposalAddress = proposalAddress;
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