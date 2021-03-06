package nju.software.service;

import java.util.List;
import java.util.Map;

import nju.software.entity.InterimReport;

public interface InterimReportService {
	
	/**
	 * 添加中期报告
	 */
	public void addInterimReport(InterimReport interimReport);

	/**
	 * 更新中期报告
	 * @param interimReport
	 */
	public void updateInterimReport(InterimReport interimReport);

	/**
	 * 通过student_id取中期报告
	 */
	public InterimReport getInterimReportByStudentId(int studentId);
	
	/**
	 * 通过id取中期报告
	 */
	public InterimReport getInterimReportById(int interimReportId);
	
	/**
	 * 通过status取中期报告
	 */
	public List<InterimReport> getInterimReportByStatus(int status);

	public List<InterimReport> getInterimReportByStatus(int status, int teacherId);

	public void saveOrUpdateInterimReport(InterimReport interimReport);
	
}
