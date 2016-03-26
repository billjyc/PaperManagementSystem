package nju.software.service;


import java.util.HashMap;
import java.util.List;

import nju.software.entity.Classes;
import nju.software.entity.Student;

public interface StudentService {
	
	/**
	 * 增加一个学生的信息
	 * @param student
	 * 要增加的学生的信息对象
	 * @return
	 * 成功返回增加的学生信息对象，失败返回null
	 * @throws Exception 
	 */
	public Student addStudentInfo(Student student) throws Exception;
	
	/**
	 * 更新一个学生的信息
	 * @param student
	 * 要更新的学生信息对象
	 * @return
	 * 更形成功返回更新后的学生对象，失败返回null
	 */
	public Student updateStudentInfo(Student student);
	
	/**
	 * 删除一个学生信息
	 * @param studentId
	 * 要删除的学生信息主键
	 * @return
	 * 删除成功返回true,失败返回false
	 */
	public boolean deleteStudentInfo(int studentId);
	
	/**
	 * 找到某个老师指导的所有学生
	 * @param teacherId
	 * 老师的主键
	 * @return
	 * 该老师指导的学生列表
	 */
	public List<Student> getStudentsByTeacherId(int teacherId);

	/**
	 * 获取某段记录学生，分页
	 * @param params
	 * 页面的参数
	 * @return
	 * 该段学生列表
	 */
	public List<Object> getAllLimit(HashMap<String,Object> params);
	
	/**
	 * 找到某个老师指导的某段记录学生，分页
	 * @param teacherId
	 * 老师的主键
	 * @param params
	 * 页面的参数
	 * @return
	 * 该老师指导的学生列表
	 */
	public List<Object> getStudentsByTeacherIdLimit(int teacherId,HashMap<String,Object> params);
	
	/**
	 * 获取某段已分配导师的学生信息，分页
	 * @return
	 * 所有学生列表
	 */
	public List<Object> getAllStudentsWithTeacherLimit(HashMap<String,Object> params);

	/**
	 * 获取所有未分配导师的学生信息
	 * @return
	 * 所有学生列表
	 */
	public List<Student> getAllStudentsWithOutTeacher();
	
	/**
	 * 根据学生id获取学生信息
	 * @param studentId
	 * @return
	 */
	public Student getStudentById(int studentId);
	
	public List<Student> findSearch(String searchCondition) ;
	/**
	 * 根据学生学号查找学生
	 * @param studentNumber
	 * @return
	 */
	public Student getStudentByStudentNumber(String studentNumber);
	public List<Student> getAllStudent();
	/**
	 * 导出学生列表
	 * @param studentNumber
	 * @return
	 */
   
	/**
	 * 通过学生所在班级编号得到学生列表
	 * @param classNo
	 * @return
	 */
	public List<Student> getStudentsByClassNo(String classNo);
	public List<Student> getStudentWithoutClass();
	
	public List<Student> getStudentWithClass();
	public String formatStudyTime(int studyTime);
	public String formatDegreeType(int degreeType);
	public String formatGrade(int grade);
    public int  formatStudyTime(String studytime);
    public int formatDegreeType(String type);
    public int formatGrade(String grade);
    public boolean validAssign(String stusdentNum);
    public List<Classes> getAllClasses();
    
    public Classes getClassById(Integer id);
    
    //通过教学点编号得到学生列表
	public List<Student> getStudentsByTPNo(String TPNo);

	public List<Student> getStudentByDirectorNo(String directorNo);
    
    
    
}
