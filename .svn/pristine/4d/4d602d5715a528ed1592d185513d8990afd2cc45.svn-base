package nju.software.jsonmodel;

import nju.software.entity.Proposal;
import nju.software.entity.Student;

public class JsonProposal {
	private Integer proposalId;
    private Integer studentId;
    private String studentName;
	private String studentNumber;
	private String proposalAddress;
	private Integer proposalStatus;
	
	public JsonProposal(Proposal p, Student s){
		setProposalId(p.getProposalId());
		setProposalAddress(p.getProposalAddress());
		setProposalStatus(p.getStatus());
		setStudentId(s.getStudentId());
		setStudentNumber(s.getStudentNumber());
		setStudentName(s.getStudentName());
	}
	
	
	public void setProposalId(Integer proposalId) {
		this.proposalId = proposalId;
	}
	public Integer getProposalId() {
		return proposalId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setProposalAddress(String proposalAddress) {
		this.proposalAddress = proposalAddress;
	}
	public String getProposalAddress() {
		return proposalAddress;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getStudentNumber() {
		return studentNumber;
	}


	public void setProposalStatus(Integer proposalStatus) {
		this.proposalStatus = proposalStatus;
	}


	public Integer getProposalStatus() {
		return proposalStatus;
	}

	
}
