package nju.software.entity.enums;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 教师类型
 * @author soft
 *
 */
public enum TeacherType {
	INNERTEACHER(0, "本校"), OUTERTEACHER(1, "外校");
	
	private int index;
	private String type;
	private static Logger logger = LoggerFactory.getLogger(TeacherType.class);
	
	public int getIndex() {
		return index;
	}
	
	public String getType() {
		return type;
	}

	private TeacherType(int index, String type) {
		this.index = index;
		this.type = type;
	}
	
	public static TeacherType getTeacherTypeByIndex(int index) {
		for(TeacherType type: TeacherType.values()) {
			if(type.getIndex() == index) {
				return type;
			}
		}
		return null;
	}
	
	public static TeacherType getTeacherTypeByType(String typeS) {
		for(TeacherType type: TeacherType.values()) {
			if(type.getType().equals(typeS)) {
				return type;
			}
		}
		return null;
	}
}
