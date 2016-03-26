package nju.software.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Defence entity. 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "defence")
public class Defence implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3046082279396672406L;
	
	// Fields
	private Integer defenceId;
	private Integer studentId;
	private Integer teacherId;
	private Integer paperId;
	private String denfenceAddress;
	private Date defenceTime;
	private String defenceResult;
	private String defenceContent;
	private String defenceAffix;
	private String threeOne;
	private Integer defenceCount;
	private Integer teacherType;

	// Constructors

	/** default constructor */
	public Defence() {
	}

	/** full constructor */
	public Defence(Integer studentId, Integer teacherId, Integer paperId,
			String denfenceAddress, Date defenceTime, String defenceResult,
			String defenceContent, String defenceAffix, String threeOne,
			Integer defenceCount, Integer teacherType) {
		this.studentId = studentId;
		this.teacherId = teacherId;
		this.paperId = paperId;
		this.denfenceAddress = denfenceAddress;
		this.defenceTime = defenceTime;
		this.defenceResult = defenceResult;
		this.defenceContent = defenceContent;
		this.defenceAffix = defenceAffix;
		this.threeOne = threeOne;
		this.defenceCount = defenceCount;
		this.teacherType = teacherType;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "defence_id", unique = true, nullable = false)
	public Integer getDefenceId() {
		return this.defenceId;
	}

	public void setDefenceId(Integer defenceId) {
		this.defenceId = defenceId;
	}

	@Column(name = "student_id")
	public Integer getStudentId() {
		return this.studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	@Column(name = "teacher_id")
	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "paper_id")
	public Integer getPaperId() {
		return this.paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	@Column(name = "defence_address")
	public String getDenfenceAddress() {
		return this.denfenceAddress;
	}

	public void setDenfenceAddress(String denfenceAddress) {
		this.denfenceAddress = denfenceAddress;
	}

	@Column(name = "defence_time", length = 19)
	public Date getDefenceTime() {
		return this.defenceTime;
	}

	public void setDefenceTime(Date defenceTime) {
		this.defenceTime = defenceTime;
	}

	@Column(name = "defence_result")
	public String getDefenceResult() {
		return this.defenceResult;
	}

	public void setDefenceResult(String defenceResult) {
		this.defenceResult = defenceResult;
	}

	@Column(name = "defence_content")
	public String getDefenceContent() {
		return this.defenceContent;
	}

	public void setDefenceContent(String defenceContent) {
		this.defenceContent = defenceContent;
	}

	@Column(name = "defence_affix", length = 225)
	public String getDefenceAffix() {
		return this.defenceAffix;
	}

	public void setDefenceAffix(String defenceAffix) {
		this.defenceAffix = defenceAffix;
	}

	@Column(name = "three_one", length = 225)
	public String getThreeOne() {
		return this.threeOne;
	}

	public void setThreeOne(String threeOne) {
		this.threeOne = threeOne;
	}

	@Column(name = "defence_count")
	public Integer getDefenceCount() {
		return this.defenceCount;
	}

	public void setDefenceCount(Integer defenceCount) {
		this.defenceCount = defenceCount;
	}

	@Column(name = "teacher_type")
	public Integer getTeacherType() {
		return this.teacherType;
	}

	public void setTeacherType(Integer teacherType) {
		this.teacherType = teacherType;
	}

}