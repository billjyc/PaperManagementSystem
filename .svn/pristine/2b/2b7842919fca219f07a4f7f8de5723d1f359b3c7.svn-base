package nju.software.jsonmodel;

import java.sql.Timestamp;
import nju.software.entity.Fee;

public class JsonFee{
	private Integer id;
	private Integer studentId;
	private Integer teacherId;
	private Float amount;
	private String feeType;
	private String grantType;
	private String grantTime;
	private String studentName;
	private String studentNum;
	private String teacherName;
	private String teacherNum;

	
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherNum() {
		return teacherNum;
	}
	public void setTeacherNum(String teacherNum) {
		this.teacherNum = teacherNum;
	}
	
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentNum() {
		return studentNum;
	}
	public void setStudentNum(String studentNum) {
		this.studentNum = studentNum;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public Integer getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public String getFeeType() {
		return feeType;
	}
	public void setFeeType(String feeType) {
		this.feeType = feeType;
	}
	public String getGrantType() {
		return grantType;
	}
	public void setGrantType(String grantType) {
		this.grantType = grantType;
	}
	public String getGrantTime() {
		return grantTime;
	}
	public void setGrantTime(Timestamp grantTime) {
		this.grantTime = grantTime.toString();
	}
	
	public JsonFee(Fee fee){	
		this.setAmount(fee.getAmount());
		this.setGrantTime(fee.getGrantTime());
		this.setId(fee.getId());
		this.setStudentId(fee.getStudentId());
		this.setTeacherId(fee.getTeacherId());
		switch (fee.getGrantType()){
			case 0:this.setGrantType("现金");break;
			case 1:this.setGrantType("工资卡");break;
		}
		
		switch (fee.getFeeType()) {
		case 0:this.setFeeType("指导费发放");break;
		case 1:this.setFeeType("评审费发放");break;
		case 2:this.setFeeType("答辩费发放");break;
		case 3:this.setFeeType("二次评审费发放");break;
		case 4:this.setFeeType("二次答辩费发放");break;
		case 5:this.setFeeType("二次评审费收取");break;
		case 6:this.setFeeType("二次答辩费收取");break;
		}

//		List<Student> students =studentService.findSearch("");
//		for (int i=0;i<students.size();i++){
//			Student student=students.get(i);
//			if (this.studentId==student.getStudentId()){
//				this.setStudentName(student.getStudentName());
//				this.setStudentNum(student.getStudentNumber());
//				break;
//			}
//		}
		
/*		Student student = studentService.getStudentById(this.getStudentId());
		this.setStudentName(student.getStudentName());
		this.setStudentNum(student.getStudentNumber());
		
		Teacher teacher=teacherService.getTeacherById(2);
		this.setTeacherName(teacher.getTeacherName());
		this.setTeacherNum(teacher.getTeacherNumber());*/
		}
}
