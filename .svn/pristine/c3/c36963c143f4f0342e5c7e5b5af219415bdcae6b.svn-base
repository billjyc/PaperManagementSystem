package nju.software.jsonmodel;

import nju.software.entity.Teacher;
import nju.software.entity.enums.TeacherEducation;
import nju.software.entity.enums.TeacherJobTitle;
import nju.software.entity.enums.TeacherQualification;
import nju.software.entity.enums.TeacherType;

public class JsonTeacher {
	private Integer teacherId;
    private String teacherNumber;
    private String teacherName;
    private String teacherEmail;
    private String teacherPhone;
    private TeacherJobTitle teacherJobTitle;
    private TeacherEducation teacherEducation;
    private TeacherType teacherClasses;
    private TeacherQualification teacherQualification;
    private Integer accountId;
	
    public JsonTeacher() {
		// TODO Auto-generated constructor stub
	}
	
	public JsonTeacher(Teacher t){
		this.teacherClasses = t.getTeacherClasses();
		this.teacherEducation = t.getTeacherEducation();
		this.teacherEmail = t.getTeacherEmail();
		this.teacherId = t.getTeacherId();
		this.teacherJobTitle = t.getTeacherJobTitle();
		this.teacherName = t.getTeacherName();
		this.teacherNumber = t.getTeacherNumber();
		this.teacherPhone = t.getTeacherPhone();
    	this.teacherQualification = t.getTeacherQualification();
    }
	
	
    public Integer getTeacherId() {
		return teacherId;
	}
    
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	
	public String getTeacherNumber() {
		return teacherNumber;
	}
	
	public void setTeacherNumber(String teacherNumber) {
		this.teacherNumber = teacherNumber;
	}
	
	public String getTeacherName() {
		return teacherName;
	}
	
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	
	public String getTeacherEmail() {
		return teacherEmail;
	}
	
	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail = teacherEmail;
	}

	public TeacherJobTitle getTeacherJobTitle() {
		return teacherJobTitle;
	}
	
	public void setTeacherJobTitle(TeacherJobTitle teacherJobTitle) {
		this.teacherJobTitle = teacherJobTitle;
	}
	
	public TeacherEducation getTeacherEducation() {
		return teacherEducation;
	}
	
	public void setTeacherEducation(TeacherEducation teacherEducation) {
		this.teacherEducation = teacherEducation;
	}
	
	public TeacherType getTeacherClasses() {
		return teacherClasses;
	}
	
	public void setTeacherClasses(TeacherType teacherClasses) {
		this.teacherClasses = teacherClasses;
	}
	
	public TeacherQualification getTeacherQualification(){
		return teacherQualification;
	}
	
	public void setTeacherQualification(TeacherQualification teacherQualification){
		this.teacherQualification = teacherQualification;
	}
	
    public String getTeacherPhone() {
		return teacherPhone;
	}
    
	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
	
	public Integer getAccountId(){
		return accountId;
	}
	
	public void setAccountId(int a){
		this.accountId = a;
	}

	public static JsonTeacher teacher2JsonTeacher(Teacher t){
		return new JsonTeacher(t);
	}

	@Override
	public String toString() {
		return "JsonTeacher [teacherId=" + teacherId + ", teacherNumber="
				+ teacherNumber + ", teacherName=" + teacherName
				+ ", teacherEmail=" + teacherEmail + ", teacherPhone="
				+ teacherPhone + ", teacherJobTitle=" + teacherJobTitle
				+ ", teacherEducation=" + teacherEducation
				+ ", teacherClasses=" + teacherClasses
				+ ", teacherQualification=" + teacherQualification
				+ ", accountId=" + accountId + "]";
	}
}
