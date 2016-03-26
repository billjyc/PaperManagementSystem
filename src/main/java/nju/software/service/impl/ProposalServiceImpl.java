package nju.software.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import nju.software.dao.ProposalDAO;
import nju.software.entity.Proposal;
import nju.software.service.ProposalService;

@Service("proposalServiceImpl")
public class ProposalServiceImpl implements ProposalService{
	@Autowired
	private ProposalDAO proposalDao;

	@Transactional(propagation = Propagation.REQUIRED)
	public void addProposal(Proposal proposal) {
		proposalDao.save(proposal);
	}

	public void updateProposal(Proposal proposal) {
		proposalDao.merge(proposal);
	}

	public Proposal getProposalByStudentId(int studentId) {
		List<Proposal> proposals = proposalDao.findByStudentId(studentId);
		if (!proposals.isEmpty() && proposals.size() >= 1) {
			return proposals.get(proposals.size()-1);
		} else {
			return null;
		}
	}

	public Proposal getProposalById(int proposalId) {
		return proposalDao.findById(proposalId);
	}

	public List<Proposal> getProposalByStatus(int status) {
		return proposalDao.findByStatus(status);
	}

	public List<Proposal> getProposalByStatus(int status, int teacherId) {
		return proposalDao.findByStatus(status,teacherId);
	}

	@Override
	public void saveOrUpdateProposal(Proposal proposal) {
		proposalDao.create(proposal);
	}

}
