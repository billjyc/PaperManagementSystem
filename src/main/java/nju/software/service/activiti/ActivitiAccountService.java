package nju.software.service.activiti;

import nju.software.entity.Student;
import nju.software.entity.Teacher;

/**
 * 维护用户、角色、权限接口
 * @author billjyc
 *
 */
public interface ActivitiAccountService {
	public void addStudent(Student student);
	
	public void addTeacher(Teacher teacher);
	
	public void updateStudent(Student student);
	
	public void updateTeacher(Teacher teacher);
     
    /**
     * 删除用户
     * @param userId   用户ID
     * @param groupId  组ID
     * @throws Exception
     */
    public void deleteUser(String userId, String groupId) throws Exception;
}
