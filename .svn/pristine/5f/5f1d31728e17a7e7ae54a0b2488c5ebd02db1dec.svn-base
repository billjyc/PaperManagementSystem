package nju.software.jsonmodel;

import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.Teacher;

public class FinalizedDefenseTask {
	private int studentId;
	private int teacherId;
	private String studentName;
	private String studentNumber;
	private String teacherName;
	private Integer paperId;
    private String paperTitle;
    private long taskId;
    
    public int getStudentId(){
    	return studentId;
    }
    public void setStudentId(int s){
    	this.studentId = s;
    }
    public int getTeacherId(){
    	return teacherId;
    }
    public void setTeacherId(int t){
    	this.teacherId = t;
    }
    public String getStudentName(){
    	return studentName;
    }
    public void setStudentName(String n){
    	this.studentName = n;
    }
    public String getStudentNumber(){
    	return studentNumber;
    }
    public void setStudentNumber(String s){
    	this.studentNumber = s;
    }
    public String getTeacherName(){
    	return teacherName;
    }
    public void setTeacherName(String t){
    	this.teacherName = t;
    }
    public int getPaperId(){
    	return paperId;
    }
    public void setPaperId(int p){
    	this.paperId = p;
    }
    public String getPaperTitle(){
    	return paperTitle;
    }
    public void setPaperTitle(String p){
    	this.paperTitle = p;
    }
    public long getTaskId(){
    	return taskId;
    }
    public void setTaskId(long t){
    	this.taskId = t;
    }
    public static FinalizedDefenseTask toFinalizedDefenseTask(Student s,Paper p,Teacher t,long taskId){
    	FinalizedDefenseTask f = new FinalizedDefenseTask();
    	f.setPaperId(p.getPaperId());
    	f.setPaperTitle(p.getPaperTitle());
    	f.setStudentId(s.getStudentId());
    	f.setStudentName(s.getStudentName());
    	f.setStudentNumber(s.getStudentNumber());
    	f.setTaskId(taskId);
    	f.setTeacherId(t.getTeacherId());
    	f.setTeacherName(t.getTeacherName());
    	return f;
    }
}
