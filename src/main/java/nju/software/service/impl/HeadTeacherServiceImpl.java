package nju.software.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.HeadTeacherDAO;
import nju.software.entity.Classes;
import nju.software.entity.HeadTeacher;
import nju.software.service.ClassesService;

@Service("headTeacherServiceImpl")
public class HeadTeacherServiceImpl implements
		nju.software.service.HeadTeacherService {

	
	@Autowired
	private HeadTeacherDAO headTeacherDao;
	
	@Autowired
	private ClassesService classesService;
	
	public boolean addHeadTeacher(HeadTeacher headTeacher) {
		try{headTeacherDao.save(headTeacher);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public List<HeadTeacher> getAllHeadTeacher() {
		List<HeadTeacher> HeadTeacherList=null;
		try{
			HeadTeacherList = headTeacherDao.findAll();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return HeadTeacherList;
	}

	public List<HeadTeacher> getHeadTeacherByName(String name) {
		List<HeadTeacher> HeadTeacherList=null;
		try{
			HeadTeacherList = headTeacherDao.findByName(name);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return HeadTeacherList;
	}

	public HeadTeacher getHeadTeacherByNo(String no) {
		HeadTeacher headTeacher=null;
		try{
			headTeacher = headTeacherDao.findByNo(no).get(0);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return headTeacher;
	}

	public HeadTeacher getHeadTeacherById(Integer id) {
		List<HeadTeacher> HeadTeacherList=null;
		try{
			return headTeacherDao.findById(id);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}

	}

	public boolean deleteHeadTeacher(Integer id) {
		try{
			headTeacherDao.delete(headTeacherDao.findById(id));
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public boolean updateHeadTeacher(HeadTeacher HeadTeacher) {
		try{
			headTeacherDao.update(HeadTeacher);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public List<HeadTeacher> findSearchHeadTeacher(String searchCondition) {
		List<HeadTeacher> HeadTeacherList=null;
		try{
			HeadTeacherList = headTeacherDao.findSearchHeadTeacher(searchCondition);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return HeadTeacherList;
	}

	public List<HeadTeacher> getHeadTeacherByDirectoNo(String directorNo) {
	List<HeadTeacher> headTeacherList= new ArrayList();
	
		
		List<Classes> classList=classesService.getClassesByDirectorNo(directorNo);
		
		for(Classes c:classList){
			HeadTeacher t =getHeadTeacherByNo(c.getHeadTeacherNo());
			headTeacherList.add(t);
		}
		
		
		return headTeacherList;
	}

}
