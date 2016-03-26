package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Accessory;

@Repository("nju.software.AccessoryDAO")
public interface AccessoryDAO extends BaseDao<Accessory>{
	public List<Accessory> findBySuggestionId(Integer suggestionId);
	
	public List<Accessory> findByPath(String path);
	
	public Accessory findById(Integer id);
}
