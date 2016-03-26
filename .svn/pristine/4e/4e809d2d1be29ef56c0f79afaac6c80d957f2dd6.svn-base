package nju.software.jsonmodel;

import nju.software.entity.Course;

public class JsonCourse {
	private Integer courseId;
	   private String courseNo;
	    private String courseName;
	    private Integer date;	
	    private String teacherNo;
	    private String teacherName;
	
	    private String studentName;
	    
		public String getCourseNo() {
			return courseNo;
		}
		public void setCourseNo(String courseNo) {
			this.courseNo = courseNo;
		}
		public String getCourseName() {
			return courseName;
		}
		public void setCourseName(String courseName) {
			this.courseName = courseName;
		}
		public Integer getDate() {
			return date;
		}
		public void setDate(Integer date) {
			this.date = date;
		}
		public String getTeacherNo() {
			return teacherNo;
		}
		public void setTeacherNo(String teacherNo) {
			this.teacherNo = teacherNo;
		}



		public String getStudentName() {
			return studentName;
		}
		public void setStudentName(String studentName) {
			this.studentName = studentName;
		}
				
		public String getTeacherName() {
			return teacherName;
		}
		public void setTeacherName(String teacherName) {
			this.teacherName = teacherName;
		}
		public JsonCourse() {
			super();
		}
		public JsonCourse(Course c) {
			super();
			this.setCourseId(c.getId());
			this.setCourseNo(c.getCourseNo());
			this.setCourseName(c.getCourseName());
			this.setDate(c.getDate());
			this.setTeacherNo(c.getTeacherNo());
			this.setTeacherName(c.getTeacherName());
		}
		
	    public static JsonCourse course2JsonCourse(Course course){
	    	JsonCourse j = new JsonCourse();
            j.setCourseName(course.getCourseName());
            j.setCourseNo(course.getCourseNo());
            j.setDate(course.getDate());
            j.setTeacherNo(course.getTeacherNo());
            j.setTeacherName(course.getTeacherName());
	    	return j;
	    }
		public Integer getCourseId() {
			return courseId;
		}
		public void setCourseId(Integer id){
			this.courseId=id;
		}
	   	    
}
