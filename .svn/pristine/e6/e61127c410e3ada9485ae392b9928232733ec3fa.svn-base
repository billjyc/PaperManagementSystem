package test.activiti;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import nju.software.util.ActivitiAPIUtils;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:lei-dispatcher-servlet.xml",
	"classpath*:spring-hibernate.xml",
"classpath*:spring-activiti.xml"})
public class AssignTutorTest {
	@Autowired
	ActivitiAPIUtils activitiUtils;
	@Autowired
	RuntimeService runtimeService;

	@Test
	public void test() {
		String studentNumber = "MF1132001";
		String teacherNumber = "1004";
		//初始化流程所需参数
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("student",studentNumber);
		params.put("tutor", teacherNumber);
		params.put("jwy", "jwy");
		params.put("review", false);
		params.put("detection", false);
		params.put("defense", "failed");
		params.put("reprieve1", "failed");
		params.put("reprieve2", "failed");
		params.put("reprieve3", "failed");
		activitiUtils.setCurrentUser(studentNumber);
		//启动流程
		ProcessInstance processInstance = activitiUtils.startProcessInstanceByKey("paperManagement", params);
		
		Task task = activitiUtils.getAssignedTaskByNameAndUserId(studentNumber, "submit proposal").get(0);
		assertNotNull(task);
		activitiUtils.completeTask(task.getId());
		runtimeService.deleteProcessInstance(processInstance.getId(), "测试结束");
		//activitiUtils.claimTask(task.getId(), studentId);
	}

}
