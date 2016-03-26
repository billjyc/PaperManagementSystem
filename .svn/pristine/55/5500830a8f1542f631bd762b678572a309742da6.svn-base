package nju.software.entity.enums;

/**
 * 教师学历
 * @author billjyc
 *
 */
public enum TeacherEducation {
	BACHELOR(0, "学士"), MASTER(1, "硕士"), DORTOR(2, "博士"), POSTDOCTOR(3, "博士后");
	
	private int index;
	private String education;
	
	private TeacherEducation(int index, String education) {
		this.index = index;
		this.education = education;
	}

	public int getIndex() {
		return index;
	}

	public String getEducation() {
		return education;
	}
	
	public static TeacherEducation getTeacherEducationByStatus(String status) {
		for(TeacherEducation education : TeacherEducation.values()) {
			if(education.getEducation().equals(status)) {
				return education;
			}
		}
		return null;
	}
	
	public static TeacherEducation getTeacherEducationByIndex(int index) {
		for(TeacherEducation education : TeacherEducation.values()) {
			if(education.getIndex() == index) {
				return education;
			}
		}
		return null;
	}
}
