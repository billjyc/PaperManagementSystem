package nju.software.entity;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student", uniqueConstraints = @UniqueConstraint(columnNames = "student_number"))
public class Student implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6895882515479894439L;
	
	// Fields
	private Integer studentId;
	private String className;
	private Integer degreeType;
	private Integer nominalTeacherId;
	private Integer score;
	private String studentEmail;
	private String studentGrade;
	private String studentName;
	private String studentNumber;
	private String studentPhone;
	private String studentPhoneX;
	private Integer studyTime;
	private Integer teacherId;
	private String teachingPointNo;
	
	private String classNo;
	private Integer absence;

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** full constructor */
	public Student(String className, Integer degreeType,
			Integer nominalTeacherId, Integer score, String studentEmail,
			String studentGrade, String studentName, String studentNumber,
			String studentPhone, String studentPhoneX, Integer studyTime,
			Integer teacherId) {
		this.className = className;
		this.degreeType = degreeType;
		this.nominalTeacherId = nominalTeacherId;
		this.score = score;
		this.studentEmail = studentEmail;
		this.studentGrade = studentGrade;
		this.studentName = studentName;
		this.studentNumber = studentNumber;
		this.studentPhone = studentPhone;
		this.studentPhoneX = studentPhoneX;
		this.studyTime = studyTime;
		this.teacherId = teacherId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "student_id", unique = true, nullable = false)
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "class_name")
	public String getClassName() {
		return this.className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	@Column(name = "degree_type")
	public Integer getDegreeType() {
		return this.degreeType;
	}

	public void setDegreeType(Integer degreeType) {
		this.degreeType = degreeType;
	}

	@Column(name = "nominal_teacher_id")
	public Integer getNominalTeacherId() {
		return this.nominalTeacherId;
	}

	public void setNominalTeacherId(Integer nominalTeacherId) {
		this.nominalTeacherId = nominalTeacherId;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "student_email")
	public String getStudentEmail() {
		return this.studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	@Column(name = "student_grade")
	public String getStudentGrade() {
		return this.studentGrade;
	}

	public void setStudentGrade(String studentGrade) {
		this.studentGrade = studentGrade;
	}

	@Column(name = "student_name")
	public String getStudentName() {
		return this.studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	@Column(name = "student_number", unique = true, length = 11)
	public String getStudentNumber() {
		return this.studentNumber;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	@Column(name = "student_phone")
	public String getStudentPhone() {
		return this.studentPhone;
	}

	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}

	@Column(name = "student_phone_x")
	public String getStudentPhoneX() {
		return this.studentPhoneX;
	}

	public void setStudentPhoneX(String studentPhoneX) {
		this.studentPhoneX = studentPhoneX;
	}

	@Column(name = "study_time")
	public Integer getStudyTime() {
		return this.studyTime;
	}

	public void setStudyTime(Integer studyTime) {
		this.studyTime = studyTime;
	}

	@Column(name = "teacher_id")
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	@Column(name = "class_no")
	public String getClassNo() {
		return classNo;
	}

	public void setClassNo(String classNo) {
		this.classNo = classNo;
	}
	@Column(name = "absence")
	public Integer getAbsence() {
		return absence;
	}

	public void setAbsence(Integer absence) {
		this.absence = absence;
	}

	
	@Column(name = "teaching_point_no")
	public String getTeachingPointNo() {
		return teachingPointNo;
	}

	public void setTeachingPointNo(String teachingPointNo) {
		this.teachingPointNo = teachingPointNo;
	}



	
	
	
}