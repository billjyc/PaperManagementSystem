package nju.software.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Classes entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "classes")
public class Classes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5339599519952167332L;
	// Fields

	private Integer id;
	private String no;
	private Integer graduateNum;
	private String headTeacherName;
	private String monitorName;
	private String name;
	private Integer size;
	private Date openDate;
	private String teachingPointNo;
	private String teachingPointName;
	private String headTeacherNo;
	
	
	private String headTeacher;
	private String monitor;

	// Constructors

	/** default constructor */
	public Classes(String no,Integer graduateNum,String headTeacherName,
			String monitorName,String name,Integer size,Date openDate,String teachingPointNo,
			String teachingPointName,String headTeacherNo) {
		this.name = name;
		this.no=no;
		this.size = size;
		this.openDate = openDate;
		this.graduateNum = graduateNum;
		this.headTeacherName=headTeacherName;
		this.headTeacherNo=headTeacherNo;
		this.monitorName=monitorName;
		this.teachingPointName=teachingPointName;
		this.teachingPointNo=teachingPointNo;
	}

	/** full constructor */
	public Classes() {
		
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 225)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "size")
	public Integer getSize() {
		return this.size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	@Column(name = "open_date", length = 19)
	public Date getOpenDate() {
		return this.openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	@Column(name = "graduate_num")
	public Integer getGraduateNum() {
		return this.graduateNum;
	}

	public void setGraduateNum(Integer graduateNum) {
		this.graduateNum = graduateNum;
	}

	@Column(name = "head_teacher", length = 225)
	public String getHeadTeacher() {
		return this.headTeacher;
	}

	public void setHeadTeacher(String headTeacher) {
		this.headTeacher = headTeacher;
	}

	@Column(name = "monitor", length = 225)
	public String getMonitor() {
		return this.monitor;
	}

	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	@Column(name = "teaching_point_no", length = 225)
	public String getTeachingPointNo() {
		return teachingPointNo;
	}

	public void setTeachingPointNo(String teachingPointNo) {
		this.teachingPointNo = teachingPointNo;
	}
	
	@Column(name = "no", length = 225)
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	@Column(name = "head_teacher_name", length = 225)
	public String getHeadTeacherName() {
		return headTeacherName;
	}

	public void setHeadTeacherName(String headTeacherName) {
		this.headTeacherName = headTeacherName;
	}

	@Column(name = "monitor_name", length = 225)
	public String getMonitorName() {
		return monitorName;
	}

	public void setMonitorName(String monitorName) {
		this.monitorName = monitorName;
	}

	@Column(name = "teaching_point_name", length = 225)
	public String getTeachingPointName() {
		return teachingPointName;
	}

	public void setTeachingPointName(String teachingPointName) {
		this.teachingPointName = teachingPointName;
	}
	@Column(name = "head_teacher_no", length = 225)
	public String getHeadTeacherNo() {
		return headTeacherNo;
	}

	public void setHeadTeacherNo(String headTeacherNo) {
		this.headTeacherNo = headTeacherNo;
	}

}