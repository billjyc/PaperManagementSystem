package nju.software.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.print.attribute.standard.MediaSize.Other;



@Entity
@Table(name = "student_course_info")
public class StudentCourseInfo  implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3455083832226035961L;
	private Integer id;
	private String studentNo;
	private String studentName;
	private String courseName;
	private String courseNo;
	private Integer score = 0;
	private Integer date;	
	private Integer state;  
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "student_no",  nullable = false)

	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	
	
	@Column(name = "course_no",  nullable = false)
	public String getCourseNo() {
		return courseNo;
	}
	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}
	
	@Column(name = "score")
	public Integer getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score=score;
	}
	
	@Column(name = "state")
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	
	
	@Column(name = "student_name")
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	 @Column(name="date", nullable=true)
		public Integer getDate() {
			return date;
		}


		public void setDate(Integer date) {
			this.date = date;
		}
	
	
	@Column(name = "course_name")
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public StudentCourseInfo(String studentNo, String courseNo,
			Integer score, Integer state) {
		super();
		this.studentNo = studentNo;
		this.courseNo = courseNo;
		this.score = score;
		this.state = state;
	}
	
	
	public StudentCourseInfo(String studentNo, String studentName,
			String courseNo,String courseName,  Integer date) {
		super();
		this.studentNo = studentNo;
		this.studentName = studentName;
		this.courseName = courseName;
		this.courseNo = courseNo;
		this.date = date;
	}
	public StudentCourseInfo() {
		super();
	}
	
	
	
	
}
