package nju.software.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.JudgeDAO;
import nju.software.entity.Judge;
import nju.software.service.JudgeService;

@Service("judgeServiceImpl")
public class JudgeServiceImpl implements JudgeService{
	@Autowired
	private JudgeDAO judgeDao;
	
	public Judge addJudge(Judge judge) {
		return null;
	}

	public void updateJudge(Judge judge) {
		judgeDao.merge(judge);
	}

	public List<Judge> findJudgeByPaperId(int paperId) {
		return judgeDao.findByPaperId(paperId);
	}
	
	public List<Judge> findJudgeByTeacherId(int teacherId){
		return judgeDao.findByTeacherId(teacherId);
	}
	
	public Judge findJudgeByPaperIdandTeacherId(int paperId,int teacherId){
		return judgeDao.findByPaperIdandTeacherId(paperId,teacherId);
	}
}
