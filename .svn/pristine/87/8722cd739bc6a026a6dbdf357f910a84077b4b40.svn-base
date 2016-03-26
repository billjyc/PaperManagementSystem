package nju.software.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import nju.software.dao.common.BaseDao;
import nju.software.entity.Proposal;

@Repository("nju.software.dao.ProposalDAO")
public interface ProposalDAO extends BaseDao<Proposal>{

	public abstract Proposal findById(java.lang.Integer id);

	public abstract List<Proposal> findByStudentId(Object studentId);

	public abstract List<Proposal> findByProposalAddress(Object proposalAddress);
	
	public List<Proposal> findByStatus(Object status);
	
    public abstract int count(String propertyName, Object value);
    
    public abstract int countByTeacher(Object teacherId);
	
	public abstract int count();
	
	public abstract int countByTeacherAndStatus(Object teacherId, Object status);

	public abstract List<Proposal> findByStatus(int status, int teacherId);

}