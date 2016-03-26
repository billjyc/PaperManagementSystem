package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.Teacher;

public class JsonJudgeAssigned {
	private Integer paperId;
    private Integer studentId;
	private String studentNumber;
    private String studentName;
    private String paperTitle;
    private String paperAddress;
    private Integer innerTeacherId;
    private String innerTeacherName;
    private Integer outerTeacherId;
    private String outerTeacherName;

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

	public void setInnerTeacherId(Integer innerTeacherId) {
		this.innerTeacherId = innerTeacherId;
	}
	public Integer getInnerTeacherId() {
		return innerTeacherId;
	}
	public void setInnerTeacherName(String innerTeacherName) {
		this.innerTeacherName = innerTeacherName;
	}
	public String getInnerTeacherName() {
		return innerTeacherName;
	}
	public void setOuterTeacherId(Integer outerTeacherId) {
		this.outerTeacherId = outerTeacherId;
	}
	public Integer getOuterTeacherId() {
		return outerTeacherId;
	}
	public void setOuterTeacherName(String outerTeacherName) {
		this.outerTeacherName = outerTeacherName;
	}
	public String getOuterTeacherName() {
		return outerTeacherName;
	}
	
    public JsonJudgeAssigned(){}
    
    public static JsonJudgeAssigned convertPaper(Paper p, Teacher inner, Teacher outer, Student student){
    	JsonJudgeAssigned json = new JsonJudgeAssigned();
    	json.setInnerTeacherId(inner.getTeacherId());
		json.setInnerTeacherName(inner.getTeacherName());
		json.setOuterTeacherId(outer.getTeacherId());
		json.setOuterTeacherName(outer.getTeacherName());
    	json.setPaperAddress(p.getPaperAddress());
    	json.setPaperId(p.getPaperId());
    	json.setPaperTitle(p.getPaperTitle());
    	json.setStudentId(p.getStudentId());
    	json.setStudentName(student.getStudentName());
    	json.setStudentNumber(student.getStudentNumber());
    	return json;
    }
}
