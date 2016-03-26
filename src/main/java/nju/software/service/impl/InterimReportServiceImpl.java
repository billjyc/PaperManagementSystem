package nju.software.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import nju.software.dao.InterimReportDAO;
import nju.software.entity.InterimReport;
import nju.software.service.InterimReportService;

@Service("interimReportServiceImpl")
public class InterimReportServiceImpl implements InterimReportService{
	@Autowired
	private InterimReportDAO interimReportDao;
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void addInterimReport(InterimReport interimReport) {
		interimReportDao.save(interimReport);
	}
	
	public void updateInterimReport(InterimReport interimReport) {
		interimReportDao.merge(interimReport);
	}

	public InterimReport getInterimReportByStudentId(int studentId) {
		List<InterimReport> interimReports = interimReportDao.findByStudentId(studentId);
		if (!interimReports.isEmpty()&&interimReports.size()>=1) {
			return interimReports.get(interimReports.size()-1);
		} else {
			return null;
		}
	}

	public InterimReport getInterimReportById(int interimReportId) {
		return interimReportDao.findById(interimReportId);
	}

	public List<InterimReport> getInterimReportByStatus(int status) {
		return interimReportDao.findByStatus(status);
	}

	public List<InterimReport> getInterimReportByStatus(int status, int teacherId) {
		return interimReportDao.findByStatus(status,teacherId);
	}

	@Override
	public void saveOrUpdateInterimReport(InterimReport interimReport) {
		interimReportDao.create(interimReport);
	}
}
