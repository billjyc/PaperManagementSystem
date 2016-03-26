package nju.software.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Account entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "account")

public class Account implements java.io.Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 7754934032172141147L;
	
	 // Fields    
     private Integer accountId;
     private String accountName;
     private String accountPassword;
     private Integer accountLevel;	//1代表教务员，2代表老师，3代表学生，
     private Integer studentId;
     private Integer teacherId;


    // Constructors

    /** default constructor */
    public Account() {
    }
    
    /** full constructor */
    public Account(String accountName, String accountPassword, Integer accountLevel, Integer studentId ,Integer teacherId) {
        this.accountName = accountName;
        this.accountPassword = accountPassword;
        this.accountLevel = accountLevel;
        this.studentId = studentId;
        this.teacherId = teacherId;
    }
   
    // Property accessors
    @Id @GeneratedValue(strategy=IDENTITY)
    @Column(name="account_id", unique=true, nullable=false)
    public Integer getAccountId() {
        return this.accountId;
    }
    
    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }
    
    @Column(name="account_name", nullable=true)
    public String getAccountName() {
        return this.accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
    
    @Column(name="account_password", nullable=true)
    public String getAccountPassword() {
        return this.accountPassword;
    }
    
    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }
    

	@Column(name = "account_level", nullable = true)
    public Integer getAccountLevel() {
        return this.accountLevel;
    }
    
    public void setAccountLevel(Integer accountLevel) {
        this.accountLevel = accountLevel;
    }
    
    @Column(name = "student_id",unique=true, nullable = true)
    public Integer getStudentId(){
    	return this.studentId;
    }
    
    public void setStudentId(Integer studentId){	
    	this.studentId = studentId;
    }
   
    @Column(name = "teacher_id" ,unique=true, nullable=true)
    public Integer getTeacherId(){
    	return this.teacherId;
    }
    
    public void setTeacherId(Integer teacherId){
    	this.teacherId = teacherId;
    }
}