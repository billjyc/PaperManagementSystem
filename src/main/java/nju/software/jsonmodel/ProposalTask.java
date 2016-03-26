package nju.software.jsonmodel;

import nju.software.entity.Proposal;
import nju.software.entity.Student;

public class ProposalTask {
	private Integer proposalId;
    private Integer studentId;
	private String studentNumber;
	private String studentName;
	private String proposalAddress;
	private long taskId;
	
    public ProposalTask(Proposal proposal, Student student, long taskId){
    	setProposalId(proposal.getProposalId());
    	setProposalAddress(proposal.getProposalAddress());
    	setStudentId(student.getStudentId());
    	setStudentNumber(student.getStudentNumber());
    	setStudentName(student.getStudentName());
    	setTaskId(taskId);
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
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getStudentNumber() {
		return studentNumber;
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

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public long getTaskId() {
		return taskId;
	}
	
}
