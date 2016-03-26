package nju.software.jsonmodel;

import nju.software.entity.InterimReport;
import nju.software.entity.Student;

public class InterimReportTask {
	private Integer interimReportId;
    private Integer studentId;
	private String studentNumber;
	private String studentName;
	private String interimReportAddress;
	private long taskId;
	
    public InterimReportTask(InterimReport interimReport, Student student, long taskId){
    	setInterimReportId(interimReport.getId());
    	setInterimReportAddress(interimReport.getAddress());
    	setStudentId(student.getStudentId());
    	setStudentNumber(student.getStudentNumber());
    	setStudentName(student.getStudentName());
    	setTaskId(taskId);
    }
    
	public void setInterimReportId(Integer interimReportId) {
		this.interimReportId = interimReportId;
	}
	public Integer getInterimReportId() {
		return interimReportId;
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
	public void setInterimReportAddress(String interimReportAddress) {
		this.interimReportAddress = interimReportAddress;
	}
	public String getInterimReportAddress() {
		return interimReportAddress;
	}

	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}

	public long getTaskId() {
		return taskId;
	}
	
}
