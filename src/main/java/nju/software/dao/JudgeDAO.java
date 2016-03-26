package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Judge;

@Repository("nju.software.dao.JudgeDAO")
public interface JudgeDAO extends BaseDao<Judge>{

	public abstract Judge findById(java.lang.Integer id);

	public abstract List findByProperty(String propertyName, Object value);

	public abstract List<Judge> findByPaperId(Object paperId);

	public abstract List<Judge> findByTeacherId(Object teacherId);

	public abstract List<Judge> findByJudgeResult(Object judgeStatement);

	public abstract List<Judge> findByJudgeContentTeacher(Object judgeContentTeacher);

	public abstract List<Judge> findByJudgeContentStudent(Object judgeContentStudent);

	public abstract Judge findByPaperIdandTeacherId(int paperId, int teacherId);

}