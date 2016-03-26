package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Paper;
import nju.software.entity.enums.PaperState;

@Repository("nju.software.dao.PaperDAO")
public interface PaperDAO extends BaseDao<Paper>{
	public abstract Paper findById(java.lang.Integer id);

	public abstract List<Paper> findByStudentId(Object studentId);

	public abstract List<Paper> findByPaperTitle(Object paperTitle);

	public abstract List<Paper> findByPaperState(PaperState paperState);

	public abstract List<Paper> findByPaperVersion(Object paperVersion);

	public abstract List<Paper> findByPaperAddress(Object paperAddress);
	
	public abstract List<Paper> findByPaperGuideAddress(Object paperGuideAddress);

	public abstract List<Paper> findByPaperAffix1(Object paperAffix1);

	public abstract List<Paper> findByPaperAffix2(Object paperAffix2);
	
	public abstract List<Paper> findByPaperRepetitionRate(Object paperRepetitionRate);
	
    public abstract int count(String propertyName, Object value);
    
    public abstract int countByTeacher(Object teacherId);
    
    public abstract int countByTeacherAndStatus(Object value,Object status);
	
	public abstract int count();
}