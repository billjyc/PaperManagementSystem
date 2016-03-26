package nju.software.service;


import java.util.List;

import nju.software.entity.Director;

public interface DirectorService {
	public boolean addDirector(Director director);
	public boolean deleteDirector(Director director);
	 public List<Director> getAllDirector() ;
	
	

	 public List<Director> getDirectorByName(String name);

	public List<Director> getDirectorByNo(String no);
	public Director getDirectorById(Integer id);
	
	public abstract boolean deleteDirectorById(Integer id);
	public boolean updateDirector(Director director);
	public List<Director> findSearchDirector(String searchCondition);
	
	
	
	
}
