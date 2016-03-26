package nju.software.jsonmodel;

import nju.software.entity.Student;

public class JsonStudent {
	private Integer studentId;
	private String studentNumber;
	private String studentName;
	private String studentGrade;
	private String className;
	private String  classNo;
	private Integer studentDegreeType;
	private Integer studentType;
	private String studentPhone1;
	private String studentPhone2;
	private String studentEmail;
	private Integer teacherId;
	private String teacherName;		//已分配导师列表中显示 导师姓名
	private Integer accountId;
	private Integer absense;
	private String teachingPointNo;
	
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentGrade() {
		return studentGrade;
	}
	public void setStudentGrade(String studentGrade) {
		this.studentGrade = studentGrade;
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
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public Integer getAccountId(){
		return accountId;
	}
	public void setAccountId(int a){
		this.accountId = a;
	}
	
	public String getTeacherName(){
		return teacherName;
	}
	public void setTeacherName(String name){
		this.teacherName = name;
	}
	public void setStudentDegreeType(Integer studentDegreeType) {
		this.studentDegreeType = studentDegreeType;
	}
	public Integer getStudentDegreeType() {
		return studentDegreeType;
	}
	public void setStudentType(Integer studentType) {
		this.studentType = studentType;
	}
	public Integer getStudentType() {
		return studentType;
	}
	public void setStudentPhone1(String studentPhone1) {
		this.studentPhone1 = studentPhone1;
	}
	public String getStudentPhone1() {
		return studentPhone1;
	}
	public void setStudentPhone2(String studentPhone2) {
		this.studentPhone2 = studentPhone2;
	}
	public String getStudentPhone2() {
		return studentPhone2;
	}
	
	public JsonStudent(){}
	public JsonStudent(Student s){
		this.setStudentId(s.getStudentId());
		this.setStudentNumber(s.getStudentNumber());
		this.setStudentName(s.getStudentName());
		this.setStudentGrade(s.getStudentGrade());
		this.setStudentDegreeType(s.getDegreeType());
		this.setStudentType(s.getStudyTime());
		this.setStudentPhone1(s.getStudentPhone());
		this.setStudentPhone2(s.getStudentPhoneX());
		this.setStudentEmail(s.getStudentEmail());
		this.setTeacherId(s.getTeacherId());
		this.setClassName(s.getClassName());
		this.setTeachingPointNo(s.getTeachingPointNo());
		this.setClassNo(s.getClassNo());
		this.setAbsense(s.getAbsence());
	}
	
	public void setClassName(String className) {
		this.className = className;
	}
	public String getClassName() {
		return className;
	}
	
	public void setAbsense(Integer absense) {
		this.absense = absense;
	}
	public Integer getAbsense() {
		return absense;
	}
	public String getClassNo() {
		return classNo;
	}
	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	public String getTeachingPointNo() {
		return teachingPointNo;
	}
	public void setTeachingPointNo(String teachingPointNo) {
		this.teachingPointNo = teachingPointNo;
	}
	
}
