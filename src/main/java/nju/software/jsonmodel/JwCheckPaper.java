package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;

public class JwCheckPaper {
	private Integer paperId;
    private Integer studentId;
    private String paperTitle;
    private String paperAddress;
	private String studentName;
	private String studentNumber;
	private long taskId;
	
	public Integer getPaperId() {
		return paperId;
	}
	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getPaperTitle() {
		return paperTitle;
	}
	public void setPaperTitle(String paperTitle) {
		this.paperTitle = paperTitle;
	}
	public String getPaperAddress() {
		return paperAddress;
	}
	public void setPaperAddress(String paperAddress) {
		this.paperAddress = paperAddress;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	
	public long getTaskId() {
		return taskId;
	}
	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}
	
	public static JwCheckPaper toJwCheckPaper(Paper p ,Student s ,long taskId){
		JwCheckPaper j = new JwCheckPaper();
		j.setPaperAddress(p.getPaperAddress());
		j.setPaperId(p.getPaperId());
		j.setPaperTitle(p.getPaperTitle());
		j.setStudentId(p.getStudentId());
		j.setStudentName(s.getStudentName());
		j.setStudentNumber(s.getStudentNumber());
		j.setTaskId(taskId);
		return j;
	}
}
