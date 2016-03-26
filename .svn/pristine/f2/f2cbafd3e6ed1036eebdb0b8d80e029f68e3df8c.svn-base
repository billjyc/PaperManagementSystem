package nju.software.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import nju.software.dao.CourseDAO;
import nju.software.dao.DirectorDAO;
import nju.software.entity.Director;


@Service("directorServiceImpl")
public class DirectorServiceImpl implements nju.software.service.DirectorService {

	@Autowired
	private DirectorDAO directorDao;
	
	
	public boolean addDirector(Director director) {
		try{directorDao.save(director);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}

	public List<Director> getAllDirector() {
		List<Director> directorList=null;
		try{
			directorList = directorDao.findAll();
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return directorList;
	}

	public List<Director> getDirectorByName(String name) {
		List<Director> directorList=null;
		try{
			directorList = directorDao.findByName(name);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return directorList;
	}

	public List<Director> getDirectorByNo(String no) {
		List<Director> directorList=null;
		try{
			directorList = directorDao.findByNo(no);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return directorList;
	}

	public Director getDirectorById(Integer id) {
		try{
		return directorDao.findById(id);
		}
		catch(Exception e){
		
			return null;
		}

	}


	public boolean updateDirector(Director director) {
		try{directorDao.update(director);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}
	
	public boolean deleteDirector(Director director) {
		try{directorDao.delete(director);
		return true;
		}
		catch(Exception e){
		return false;
		}
	}


	public List<Director> findSearchDirector(String searchCondition) {
		List<Director> directorList=null;
		try{
			directorList = directorDao.findSearchDirector(searchCondition);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return directorList;
	}

	public boolean deleteDirectorById(Integer id) {
		
		return deleteDirector(directorDao.findById(id));
	}


}
