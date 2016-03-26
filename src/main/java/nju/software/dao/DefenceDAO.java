package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Defence;

@Repository("nju.software.DefenceDAO")
public interface DefenceDAO extends BaseDao<Defence>{

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List<Defence> findByStudentId(Object studentId);

	public abstract List<Defence> findByTeacherId(Object teacherId);

	public abstract List<Defence> findByPaperId(Object paperId);

	public abstract List<Defence> findByDenfenceAddress(Object denfenceAddress);

	public abstract List<Defence> findByDefenceResult(Object defenceJudgement);

	public abstract List<Defence> findByDefenceContent(Object defenceContent);
	
	public abstract List<Defence> findByDefenceCount(Object defenceCount);
	
	public abstract List<Defence> findByTeacherType(Object teacherType);

	public abstract Defence findByPaperIdandTeacherId(Integer paperId, Integer teacherId);
	public abstract Defence findHasThree_one(Integer studentId);
	
	public Defence findById(Integer defence_id);

}