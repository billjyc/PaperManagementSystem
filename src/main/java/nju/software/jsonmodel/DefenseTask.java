package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.enums.PaperState;

public class DefenseTask {
	private Integer studentId;
	private String studentName;
	private String studentNumber;
	private Integer paperId;
    private String paperTitle;
    private PaperState paperState;
    private long taskId;
    private Integer paperVersion;
    private String paperAddress;
    
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
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
	public Integer getPaperId() {
		return paperId;
	}
	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
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
    public long getTaskId() {
		return taskId;
	}
	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}
	
	public String getPaperAddress(){
		return this.paperAddress;
	}
	
	public void setPaperAddress(String paperAddress){
		this.paperAddress=paperAddress;
	}
	
	public Integer getPaperVersion(){
		return this.paperVersion;
	}
	
	public void setPaperVersion(Integer paperVersion){
		this.paperVersion=paperVersion;
	}
	
	public static DefenseTask toDefenseTask(Student s ,Paper p ,long taskId){
    	DefenseTask j = new DefenseTask();
    	j.setPaperId(p.getPaperId());
    	j.setPaperState(p.getPaperState());
    	j.setPaperTitle(p.getPaperTitle());
    	j.setStudentId(s.getStudentId());
    	j.setStudentName(s.getStudentName());
    	j.setStudentNumber(s.getStudentNumber());
    	j.setTaskId(taskId);
    	j.setPaperAddress(p.getPaperAddress());
    	j.setPaperVersion(p.getPaperVersion());
    	return j;
    }
}