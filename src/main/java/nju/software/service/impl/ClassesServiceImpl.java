package nju.software.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.ClassesDAO;
import nju.software.entity.Classes;
import nju.software.entity.TeachingPoint;
import nju.software.service.ClassesService;
import nju.software.service.TeachingPointService;

@Service("classesServiceImpl")
public class ClassesServiceImpl implements ClassesService {

	@Autowired
	private ClassesDAO classesDAO;
	@Autowired
	private	TeachingPointService teachingPointService;
	
	public boolean addClass(Classes classes) {
		try{
			classesDAO.save(classes);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public boolean deleteClass(Integer id) {
		try{
			classesDAO.delete(classesDAO.findById(id));
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public boolean updateClass(Classes classes) {
		try{
			classesDAO.update(classes);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public List<Classes> getAllClasses() {
		List<Classes>list=null;
		try{
			list =classesDAO.findAll();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}

	public Classes getClassById(Integer id) {
		try{
			return classesDAO.findById(id);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public List<Classes> getAllClassesByTPNo(String tpno) {
		List<Classes>list=null;
		try{
			list =classesDAO.findByTeachingPointNo(tpno);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return list;
	}

	public List<Classes> getClassesByDirectorNo(String directorNo) {

		List<TeachingPoint> teachingPointList;
		teachingPointList=teachingPointService.getTeachingPointByDirectorNo(directorNo);
		
		List<Classes> result=new ArrayList();
		
		for(TeachingPoint tp:teachingPointList){
			
			
			List<Classes> tmptList =getAllClassesByTPNo(tp.getNo());
		
			for(Classes c:tmptList){
				result.add(c);
			}
			
		}
		
		
		
		return result;
	}

	public List<Classes> getClassByDirectoNo(String directorNo) {
		
		return null;
	}

}
