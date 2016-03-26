package nju.software.manager.dean;

import nju.software.service.AccountService;
import nju.software.service.FeeService;
import nju.software.service.ReportService;
import nju.software.service.StudentService;
import nju.software.service.TeacherService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DeanFeeManager {
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private FeeService feeService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DeanFeeManager.class);
}
