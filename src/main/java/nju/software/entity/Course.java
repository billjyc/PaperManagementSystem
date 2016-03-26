package nju.software.entity;

import static javax.persistence.GenerationType.IDENTITY;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="course")
public class Course implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;	
    private String courseNo;
    private String courseName;
    private Integer date;	
    private String teacherNo;
    private Integer teacherId;
	private String teacherName;
    private Integer studentId;
    
    public Course(){
    	
    }
    
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Course(String courseNo, String courseName, Integer date,
			String teacherNo, Integer studentId) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.date = date;
		this.teacherNo = teacherNo;
		this.studentId = studentId;
	}




    @Column(name="course_no",unique = true, nullable=false)
	public String getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}

	@Column(name="course_name", nullable=true)
	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	 @Column(name="date", nullable=true)
	public Integer getDate() {
		return date;
	}


	public void setDate(Integer date) {
		this.date = date;
	}

	 @Column(name="teacher_no", nullable=true)
	public String getTeacherNo() {
		return teacherNo;
	}


	public void setTeacherNo(String teacherNo) {
		this.teacherNo = teacherNo;
	}
	

	@Column(name = "teacher_name")
	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}	
    public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}
	
}
