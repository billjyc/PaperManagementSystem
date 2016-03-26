package nju.software.jsonmodel;

import nju.software.entity.Classes;

public class JsonClasses {
	private Integer id;
	private String no;
	private Integer graduateNum;
	private String headTeacherName;
	private String monitorName;
	private String name;
	private Integer size;
	private String openDate;
	private String teachingPointNo;
	private String teachingPointName;
	private String headTeacherNo;
	
	public JsonClasses(Classes s){
		this.setId(s.getId());
		this.setNo(s.getNo());
		this.setName(s.getName());
		this.setGraduateNum(s.getGraduateNum());
		//this.setOpenDate(s.getOpenDate().toString());
		this.setSize(s.getSize());
		this.setHeadTeacherNo(s.getHeadTeacherNo());
		this.setHeadTeacherName(s.getHeadTeacherName());
		this.setMonitorName(s.getMonitorName());
		this.setTeachingPointNo(s.getTeachingPointNo());
		this.setTeachingPointName(s.getTeachingPointName());
	}

	public JsonClasses() {
		// TODO Auto-generated constructor stub
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setGraduateNum(Integer graduateNum) {
		this.graduateNum = graduateNum;
	}

	public Integer getGraduateNum() {
		return graduateNum;
	}

	

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getSize() {
		return size;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getHeadTeacherName() {
		return headTeacherName;
	}

	public void setHeadTeacherName(String headTeacherName) {
		this.headTeacherName = headTeacherName;
	}

	public String getMonitorName() {
		return monitorName;
	}

	public void setMonitorName(String monitorName) {
		this.monitorName = monitorName;
	}

	public String getTeachingPointNo() {
		return teachingPointNo;
	}

	public void setTeachingPointNo(String teachingPointNo) {
		this.teachingPointNo = teachingPointNo;
	}

	public String getTeachingPointName() {
		return teachingPointName;
	}

	public void setTeachingPointName(String teachingPointName) {
		this.teachingPointName = teachingPointName;
	}

	public String getHeadTeacherNo() {
		return headTeacherNo;
	}

	public void setHeadTeacherNo(String headTeacherNo) {
		this.headTeacherNo = headTeacherNo;
	}
}
