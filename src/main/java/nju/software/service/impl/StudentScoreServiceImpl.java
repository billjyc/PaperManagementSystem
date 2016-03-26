package nju.software.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.software.dao.StudentScoreDAO;
import nju.software.entity.StudentScore;
import nju.software.service.StudentScoreService;
@Service("studentScoreServiceImpl")
public class StudentScoreServiceImpl implements StudentScoreService {
	@Autowired
    private StudentScoreDAO studentScoreDAO;
	
	public void addScore(StudentScore score) {
		studentScoreDAO.save(score);
	}
}
