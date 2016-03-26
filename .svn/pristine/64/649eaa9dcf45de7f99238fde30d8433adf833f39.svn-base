package nju.software.jsonmodel;

import nju.software.entity.StudentCourseInfo;;

public class JsonStudentCourseInfo {
	private String courseNo;
	private String studentNo;
	private String courseName;
	private String studentName;
	private String state;	
	private Integer score;
	private Integer transcriptId;
	private Integer date;
	private final static String EXCELLENT="优";
	private final static String GOOD="良";
	private final static String MEDIUM="中";
	private final static String PASS="及格";
	private final static String NA="暂无";
	    
	private final static String APPROVED="已通过";
	private final static String UNAPPROVED="未审核";
	private final static String REJECT="驳回";
	  
	public Integer getTranscriptId() {
		return transcriptId;
	}
	
	public void setTranscriptId(Integer id) {
		this.transcriptId = id;
	}
		
	public String getCourseNo() {
		return courseNo;
	}
		
	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}
		
	public String getstudentNo() {
		return studentNo;
	}
		
	public void setstudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public Integer getScore() {
		return score;
	}
	
	public void setScore(Integer score) {
		this.score = score;
	}
				
	public String getStudentNo() {
		return studentNo;
	}
	
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	
	public String getCourseName() {
		return courseName;
	}
	
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
		
	public String getStudentName() {
		return studentName;
	}
		
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
		
	public JsonStudentCourseInfo(StudentCourseInfo sci) {
		super();
		this.setTranscriptId(sci.getId());
		this.setCourseNo(sci.getCourseNo());
		this.setCourseName(sci.getCourseName());
		this.setStudentName(sci.getStudentName());
		this.setstudentNo(sci.getStudentNo());
		this.setScore(sci.getScore());
		this.setDate(sci.getDate());
/*			switch (sci.getScore())
			{
			case Constants.EXCELLENT: {this.setScore(EXCELLENT);break;}
			case Constants.GOOD: {this.setScore(GOOD);break;}
			case Constants.MEDIUM: {this.setScore(MEDIUM);break;}
			case Constants.PASS: {this.setScore(PASS);}			
			case Constants.NA: {this.setScore(NA);}			
			}*/
		
		if(sci.getState()!=null){
			switch (sci.getState()){
				case 0: {this.setState(UNAPPROVED);break;}
				case 1: {this.setState(APPROVED);;break;}
				case 2: {this.setState(REJECT);;break;}
			}
		}
	}
	
	public Integer getDate() {
		return date;
	}
		
	public void setDate(Integer date) {
		this.date = date;
	}
	    
}
