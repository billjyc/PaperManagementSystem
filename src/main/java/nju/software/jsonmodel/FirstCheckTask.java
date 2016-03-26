package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.enums.PaperState;

public class FirstCheckTask {
	private Integer paperId;
    private Integer studentId;
    private String paperTitle;
    private PaperState paperState;
    private Integer paperVersion;
    private String paperAddress;
    private String paperGuideAddress;
    private String paperAffix1;
    private String paperAffix2;
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
	public PaperState getPaperState() {
		return paperState;
	}
	public void setPaperState(PaperState paperState) {
		this.paperState = paperState;
	}
	public Integer getPaperVersion() {
		return paperVersion;
	}
	public void setPaperVersion(Integer paperVersion) {
		this.paperVersion = paperVersion;
	}
	public String getPaperAddress() {
		return paperAddress;
	}
	public void setPaperAddress(String paperAddress) {
		this.paperAddress = paperAddress;
	}
	public String getPaperGuideAddress() {
		return paperGuideAddress;
	}
	public void setPaperGuideAddress(String paperGuideAddress) {
		this.paperGuideAddress = paperGuideAddress;
	}
	public String getPaperAffix1() {
		return paperAffix1;
	}
	public void setPaperAffix1(String paperAffix1) {
		this.paperAffix1 = paperAffix1;
	}
	public String getPaperAffix2() {
		return paperAffix2;
	}
	public void setPaperAffix2(String paperAffix2) {
		this.paperAffix2 = paperAffix2;
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
	public FirstCheckTask(){}
	public static FirstCheckTask toFirstCheckTask(Paper p,Student s, long taskId){
		FirstCheckTask f = new FirstCheckTask();
		f.setPaperAddress(p.getPaperAddress());
		f.setPaperAffix1(p.getPaperAffix1());
		f.setPaperAffix2(p.getPaperAffix2());
		f.setPaperGuideAddress(p.getPaperGuideAddress());
		f.setPaperId(p.getPaperId());
		f.setPaperState(p.getPaperState());
		f.setPaperTitle(p.getPaperTitle());
		f.setPaperVersion(p.getPaperVersion());
		f.setStudentId(p.getStudentId());
		f.setStudentName(s.getStudentName());
		f.setStudentNumber(s.getStudentNumber());
		f.setTaskId(taskId);
		return f;
	}
}
