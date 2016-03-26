package nju.software.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.DefenceDAO;
import nju.software.entity.Defence;
import nju.software.service.DefenceService;

@Service("defenceServiceImpl")
public class DefenceServiceImpl implements DefenceService{
	
	@Autowired
	private DefenceDAO defenceDao;
	
	public List<Defence> findDefenceByPaperId(int paperId) {
		return defenceDao.findByPaperId(paperId);
	}

	public Defence findDefenceByPaperIdandTeacherId(int paperId, int teacherId) {
		return defenceDao.findByPaperIdandTeacherId(paperId,teacherId);
	}

	public void updateDefence(Defence defence) {
		defenceDao.merge(defence);
	}

	public Defence findHasThree_one(int studentId) {
		return defenceDao.findHasThree_one(studentId);
	}


	public List<Defence>findDefenceByStudentId(int studentId) {
		return defenceDao.findByStudentId(studentId);
	}
	
	public List<Defence>findDefenceByTeacherId(int teacherId){
		return defenceDao.findByTeacherId(teacherId);
	}

}
