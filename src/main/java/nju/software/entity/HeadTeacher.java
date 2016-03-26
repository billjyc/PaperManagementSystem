package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Teacher entity. 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "head_teacher")
public class HeadTeacher implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2336941747019859815L;
	// Fields
	private Integer id;
	private String no;
	private String name;

	private Integer tel;
	private String email;


	// Constructors

	/** default constructor */
	public HeadTeacher() {
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
	
	@Column(name = "no")
	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "tel")
	public Integer getTel() {
		return tel;
	}

	public void setTel(Integer tel) {
		this.tel = tel;
	}
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public HeadTeacher( String no, String name, Integer tel,
			String email) {
		super();
	
		this.no = no;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}

	
	
	
}