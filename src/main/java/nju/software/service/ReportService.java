package nju.software.service;

import java.util.List;

import nju.software.entity.Classes;
import nju.software.entity.Fee;
import nju.software.entity.HeadTeacher;
import nju.software.entity.Student;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public interface ReportService {
	 public HSSFWorkbook exportStudent();
	 public HSSFWorkbook exportThreeAndOne(List<Student> list);
	 public HSSFWorkbook exportTeacher();
	 public HSSFWorkbook exportCourse();
	 public HSSFWorkbook exportTranscript();
	 public HSSFWorkbook exportTranscriptByStudentNo(String studentNo);
	 public HSSFWorkbook exportTranscriptByCourseNo(String courseNo);
	public HSSFWorkbook exportStudentCourseInfo();

	
	public HSSFWorkbook exportHeadTeacher();
	public HSSFWorkbook exportDirector();
   public HSSFWorkbook exportTeachingPoint();
   public HSSFWorkbook exportClasses();
   public HSSFWorkbook exportAssignedClasses();
   public HSSFWorkbook exportGrantFee(int index);
   public HSSFWorkbook exportChargeFee(int index);
   public HSSFWorkbook exportDefenceFeeDoc(int studentNum);
   
public HSSFWorkbook exportStudent(List<Student> list);
public HSSFWorkbook exportHeadTeacher(List<HeadTeacher> list);
public HSSFWorkbook exportClasses(List<Classes> classList);

}
