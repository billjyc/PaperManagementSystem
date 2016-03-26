package nju.software.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Teacher entity. 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "teaching_point")
public class TeachingPoint implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5560458706926025567L;
	// Fields
	private Integer id;
	private String no;
	private String name;

	private String directorNo;
	private String directorName;
	private String location;


	// Constructors

	/** default constructor */
	public TeachingPoint() {
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
	

	@Column(name = "director_no")
	public String getDirectorNo() {
		return directorNo;
	}

	public void setDirectorNo(String directorNo) {
		this.directorNo = directorNo;
	}
	@Column(name = "director_name")
	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}
	
	@Column(name = "location")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public TeachingPoint(String no, String name, String directorNo,
			String directorName, String location) {
		super();
		
		this.no = no;
		this.name = name;
		this.directorNo = directorNo;
		this.directorName = directorName;
		this.location = location;
	}
	
}