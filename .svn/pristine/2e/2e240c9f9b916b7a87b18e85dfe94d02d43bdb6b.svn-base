package nju.software.entity.enums;

/**
 * 教师资质
 * @author soft
 *
 */
public enum TeacherQualification {
	ENGINEERING_MASTER_TUTOR(0, "工程硕士导师"), ACADEMIC_MASTER_TUTOR(1, "工学硕士导师"), 
	ACADEMIC_DOCTOR_TUTOR(2, "博导");
	
	private int index;
	private String qualification;
	
	public int getIndex() {
		return index;
	}
	
	public String getQualification() {
		return qualification;
	}

	private TeacherQualification(int index, String qualification) {
		this.index = index;
		this.qualification = qualification;
	}
	
	public static TeacherQualification getTeacherQualificationByIndex(int index) {
		for(TeacherQualification qualification : TeacherQualification.values()) {
			if(qualification.getIndex() == index) {
				return qualification;
			}
		}
		return null;
	}
	
	public static TeacherQualification getTeacherQualificationByString(String s) {
		for(TeacherQualification qualification : TeacherQualification.values()) {
			if(qualification.getQualification().equals(s)) {
				return qualification;
			}
		}
		return null;
	}
}
