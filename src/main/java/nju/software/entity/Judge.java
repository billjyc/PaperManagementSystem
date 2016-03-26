package nju.software.entity;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Judge entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "judge")
public class Judge implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6265136723341014311L;
	
	// Fields
	private Integer judgeId;
	private Integer paperId;
	private Integer teacherId;
	private Timestamp judgeDeadline;
	private String judgeResult;
	private String judgeContentTeacher;
	private String judgeContentStudent;
	private String judgeAffix;

	// Constructors

	/** default constructor */
	public Judge() {
	}

	/** full constructor */
	public Judge(Integer paperId, Integer teacherId, Timestamp judgeDeadline,
			String judgeResult, String judgeContentTeacher,
			String judgeContentStudent, String judgeAffix) {
		this.paperId = paperId;
		this.teacherId = teacherId;
		this.judgeDeadline = judgeDeadline;
		this.judgeResult = judgeResult;
		this.judgeContentTeacher = judgeContentTeacher;
		this.judgeContentStudent = judgeContentStudent;
		this.judgeAffix = judgeAffix;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "judge_id", unique = true, nullable = false)
	public Integer getJudgeId() {
		return this.judgeId;
	}

	public void setJudgeId(Integer judgeId) {
		this.judgeId = judgeId;
	}

	@Column(name = "paper_id")
	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	@Column(name = "teacher_id")
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "judge_deadline", length = 19)
	public Timestamp getJudgeDeadline() {
		return this.judgeDeadline;
	}

	public void setJudgeDeadline(Timestamp judgeDeadline) {
		this.judgeDeadline = judgeDeadline;
	}

	@Column(name = "judge_result")
	public String getJudgeResult() {
		return this.judgeResult;
	}

	public void setJudgeResult(String judgeResult) {
		this.judgeResult = judgeResult;
	}

	@Column(name = "judge_content_teacher")
	public String getJudgeContentTeacher() {
		return this.judgeContentTeacher;
	}

	public void setJudgeContentTeacher(String judgeContentTeacher) {
		this.judgeContentTeacher = judgeContentTeacher;
	}

	@Column(name = "judge_content_student", length = 225)
	public String getJudgeContentStudent() {
		return this.judgeContentStudent;
	}

	public void setJudgeContentStudent(String judgeContentStudent) {
		this.judgeContentStudent = judgeContentStudent;
	}

	@Column(name = "judge_affix", length = 225)
	public String getJudgeAffix() {
		return this.judgeAffix;
	}

	public void setJudgeAffix(String judgeAffix) {
		this.judgeAffix = judgeAffix;
	}

}