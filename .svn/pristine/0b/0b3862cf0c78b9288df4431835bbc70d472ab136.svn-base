package nju.software.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.CourseDAO;
import nju.software.dao.TeachingPointDAO;
import nju.software.entity.Course;
import nju.software.entity.TeachingPoint;
@Service("teachingPointServiceImpl")
public class TeachingPointServiceImpl implements
		nju.software.service.TeachingPointService {

	@Autowired
	private TeachingPointDAO teachinPointDao;
	
	public boolean addTeachingPoint(TeachingPoint teachingPoint) {
		try{
			teachinPointDao.save(teachingPoint);
			return true;
		}catch(Exception e){
			return false;
		}
		
		
	
	}

	public List<TeachingPoint> getAllTeachingPoint() {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findAll();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public List<TeachingPoint> getTeachingPointByName(String name) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findByName(name);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public List<TeachingPoint> getTeachingPointByNo(String no) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findByNo(no);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public List<TeachingPoint> getTeachingPointByLocation(String location) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findByLocation(location);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public List<TeachingPoint> getTeachingPointByDirectorNo(String directorNo) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findByDirectorNo(directorNo);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public List<TeachingPoint> getTeachingPointByDirectorName(
			String directorName) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findByDirectorName(directorName);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

	public TeachingPoint getTeachingPointById(Integer id) {

		return teachinPointDao.findById(id);
	}

	public boolean deleteTeachingPointInfo(Integer id) {
		try {
		TeachingPoint tp=teachinPointDao.findById(id);
		teachinPointDao.delete(tp);
		return true;
		}
		catch(Exception e){
			return false;
		}
	
	}

	public boolean updateTeachingPoint(TeachingPoint teachingPoint) {
		try {

			teachinPointDao.update(teachingPoint);
			return true;
			}
			catch(Exception e){
				return false;
			}
	}

	public List<TeachingPoint> findSearchTeachingPoint(String searchCondition) {
		List<TeachingPoint> teachingPointList=null;
		try{
			teachingPointList = teachinPointDao.findAll();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return teachingPointList;
	}

}
