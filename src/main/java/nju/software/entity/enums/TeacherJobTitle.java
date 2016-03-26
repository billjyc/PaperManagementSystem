package nju.software.entity.enums;

/**
 * 教师职位
 * @author billjyc
 *
 */
public enum TeacherJobTitle {
	INSTRUCTOR(0, "讲师"), SENIORENGINEER(1, "高级工程师"), 
	ASSOCIATEPROFESSOR(2, "副教授"), FULLPROFESSOR(3, "教授");
	
	private int index;
	private String title;
	
	public int getIndex() {
		return index;
	}
	
	public String getTitle() {
		return title;
	}

	private TeacherJobTitle(int index, String title) {
		this.index = index;
		this.title = title;
	}
	
	public static TeacherJobTitle getJobTitlebyTitle(String title) {
		for(TeacherJobTitle jobTitle : TeacherJobTitle.values()) {
			if(jobTitle.getTitle().equals(title)) {
				return jobTitle;
			}
		}
		return null;
	}
	
	public static TeacherJobTitle getTeacherJobTitleByIndex(int index) {
		for(TeacherJobTitle title : TeacherJobTitle.values()) {
			if(title.getIndex() == index) {
				return title;
			}
		}
		return null;
	}
}
