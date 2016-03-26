package nju.software.service;


import java.util.List;

import nju.software.entity.HeadTeacher;

public interface HeadTeacherService {
	public boolean addHeadTeacher(HeadTeacher headTeacher);
	public  boolean deleteHeadTeacher(Integer id);
	public boolean updateHeadTeacher(HeadTeacher HeadTeacher);
	
	
	 public List<HeadTeacher> getAllHeadTeacher() ;
	
	

	 public List<HeadTeacher> getHeadTeacherByName(String name);

	public HeadTeacher getHeadTeacherByNo(String no);
	public HeadTeacher getHeadTeacherById(Integer id);
	

	public List<HeadTeacher> findSearchHeadTeacher(String searchCondition);
	
	public List<HeadTeacher> getHeadTeacherByDirectoNo(String directorNo);
	
	
	
	
}
