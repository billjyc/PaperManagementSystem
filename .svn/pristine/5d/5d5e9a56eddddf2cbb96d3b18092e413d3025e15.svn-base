package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.Teacher;

public class JsonDefenseAssigned {
	private Integer paperId;
    private Integer studentId;
	private String studentNumber;
    private String studentName;
    private String paperTitle;
    private String paperAddress;
    private Integer teacher1Id;
    private String teacher1Name;
    private Integer teacher2Id;
    private String teacher2Name;
    private Integer teacher3Id;
    private String teacher3Name;
    private Integer secretaryId;
    private String secretaryName;

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
    public void setTeacher1Id(Integer teacher1Id) {
		this.teacher1Id = teacher1Id;
	}
	public Integer getTeacher1Id() {
		return teacher1Id;
	}
	public void setTeacher1Name(String teacher1Name) {
		this.teacher1Name = teacher1Name;
	}
	public String getTeacher1Name() {
		return teacher1Name;
	}
	public void setTeacher2Id(Integer teacher2Id) {
		this.teacher2Id = teacher2Id;
	}
	public Integer getTeacher2Id() {
		return teacher2Id;
	}
	public void setTeacher2Name(String teacher2Name) {
		this.teacher2Name = teacher2Name;
	}
	public String getTeacher2Name() {
		return teacher2Name;
	}
	public void setTeacher3Id(Integer teacher3Id) {
		this.teacher3Id = teacher3Id;
	}
	public Integer getTeacher3Id() {
		return teacher3Id;
	}
	public void setTeacher3Name(String teacher3Name) {
		this.teacher3Name = teacher3Name;
	}
	public String getTeacher3Name() {
		return teacher3Name;
	}
	public void setSecretaryId(Integer secretaryId) {
		this.secretaryId = secretaryId;
	}
	public Integer getSecretaryId() {
		return secretaryId;
	}
	public void setSecretaryName(String secretaryName) {
		this.secretaryName = secretaryName;
	}
	public String getSecretaryName() {
		return secretaryName;
	}
	
	public JsonDefenseAssigned(Paper p, Teacher t1, Teacher t2, Teacher t3, Teacher secretary, Student student){
		setPaperId(p.getPaperId());
    	setPaperAddress(p.getPaperAddress());
    	setPaperTitle(p.getPaperTitle());
    	setStudentId(student.getStudentId());
    	setStudentName(student.getStudentName());
    	setStudentNumber(student.getStudentNumber());
    	setTeacher1Name(t1.getTeacherName());
    	setTeacher2Name(t2.getTeacherName());
    	setTeacher3Name(t3.getTeacherName());
    	setSecretaryName(secretary.getTeacherName());
		
	}
}
