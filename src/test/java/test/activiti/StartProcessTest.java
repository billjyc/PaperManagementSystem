package test.activiti;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import nju.software.util.ActivitiAPIUtils;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration({"classpath*:lei-dispatcher-servlet.xml",
	"classpath*:spring-activiti.xml",
	"classpath*:spring-hibernate.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class StartProcessTest{
	@Autowired
	private RuntimeService runtimeService;
	@Autowired
	private ActivitiAPIUtils activitiAPIUtils;
	@Autowired
	private IdentityService identityService;

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		String currentUserId = "jwy";
		activitiAPIUtils.setCurrentUser(currentUserId);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("student","b111250068");
		params.put("tutor", "1002");
		params.put("jwy", "jwy");
		params.put("review", false);
		params.put("detection", false);
		params.put("defense", "failed");
		params.put("reprieve1", "failed");
		params.put("reprieve2", "failed");
		params.put("reprieve3", "failed");
		
		ProcessInstance processInstance = activitiAPIUtils.startProcessInstanceByKey("paperManagement", params);
		assertNotNull(processInstance);
	}

}
