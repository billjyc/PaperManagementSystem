package nju.software.service;
import java.sql.Timestamp;
import java.util.List;

import nju.software.entity.Course;
import nju.software.entity.Paper;
import nju.software.entity.Student;

public interface AssignService {

	/**
	 * 为一个学生分配一位导师
	 * @param studentId，teacherId 
	 * 要分配的学生和选中的导师的id
	 * @return
	 * 返回分配后学生的信息
	 */
	public Student addAssignByOne(int studentId,int teacherId,String userId);
	/**
	 * 为一门课程分配一个学生
	 * @param courseId，studentId 
	 * 要分配的课程和选中的学生的id
	 * @return
	 * 返回分配后课程的信息
	 */
	public Course addCourseByOne(int courseId,int studentId,String userId);	
	/**
	 * 为一批课程分配一名学生
	 * @param courseIdList，studentId
	 * 要分配的课程和选中的学生的id
	 */
	
	public void addCourse(List<Integer> courseIdList,int studentId,String userId);
	/**
	 * 为一批学生分配一位导师
	 * @param studentIdList，teacherId
	 * 要分配的学生和选中的导师的id
	 */
	
	public void addAssign(List<Integer> studentIdList,int teacherId,String userId);
	/**
	 * 为一位学生分配评审老师
	 * @param studentId，inTeacherId，outTeacherId
	 * 要分配的学生和选中的导师的id
	 * @param judgeDeadline
	 * 评审截止日期
	 * @param taskId
	 * 任务Id
	 * @param userId
	 * 执行者Id，即教务员id
	 */
	public void addJudgeByOne(int studentId, int inTeacherId,
			int outTeacherId,Timestamp judgeDeadline);
	/**
	 * 为一批学生分配评审老师
	 * @param studentIdList，inTeacherId,outTeacherId
	 * 要分配的学生和选中的导师的id
	 * @param judgeDeadline
	 * 评审截止日期
	 * @param taskId
	 * 任务Id
	 * @param userId
	 * 执行者Id，即教务员id
	 */
	public void addJudge(List<Integer> studentIdList, int inTeacherId,int outTeacherId,Timestamp judgeDeadline);
	/**
	 * 为一位学生安排答辩
	 * @param studentId，teacher1Id,teacher2Id,teacher3Id
	 * 要分配的学生和选中的评委老师的id
	 * @param secretaryId
	 * 答辩秘书
	 * @param defenceAddress
	 * 答辩地点
	 * @param defenceTime
	 * 答辩时间
	 * @param taskId
	 * 任务Id
	 * @param userId
	 * 执行者Id，即教务员id
	 */
	public Student addAssignByOne(int studentId,int teacherId,int nominalTeacherId ,String userId);
	public void addDefenceByOne(Integer studentId, Integer teacher1Id, Integer teacher2Id, Integer teacher3Id, Integer secretaryId, String defenceAddress, Timestamp defenceTime);
	/**
	 * 为一批学生安排答辩
	 * @param student，teacher1,teacher2,teacher3
	 * 要分配的学生和选中的评委老师
	 * @param secretary
	 * 答辩秘书
	 * @param defenceAddress
	 * 答辩地点
	 * @param defenceTime
	 * 答辩时间
	 * @param taskId
	 * 任务Id
	 * @param userId
	 * 执行者Id，即教务员id
	 */
	public void addDefence(List<Integer> studentIdList, Integer teacher1Id,Integer teacher2Id,Integer teacher3Id,Integer secretaryId ,String defenceAddress,Timestamp defenceTime);
	/**
	 * 查看已经答辩前定稿的学生
	 * @return
	 * 返回答辩前定稿的学生信息
	 */
	public List<Student> getReadyDefenceStudent();
		
	/**
	 * 查看已经通过答辩的学生
	 * @return
	 * 返回通过答辩的学生信息
	 */
	public List<Student> getSuccessStudent();
	/**
	 * 查看已经通过答辩的论文
	 * @return
	 * 返回通过答辩的论文信息
	 */
	public List<Paper> getSuccessPaper();
}
