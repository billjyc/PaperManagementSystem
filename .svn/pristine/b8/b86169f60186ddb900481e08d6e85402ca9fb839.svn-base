package test.controller;

import nju.software.controller.LoginController;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import test.bean.UserLoginBean;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.*;  
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;  
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*; 
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;  

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration  //测试环境使用，用来表示测试环境使用的ApplicationContext将是WebApplicationContext类型的；value指定web应用的根
@ContextConfiguration({"classpath*:/spring-hibernate.xml"
	, "classpath*:/spring-activiti.xml"
	, "classpath*:/lei-dispatcher-servlet.xml"
})
public class LoginControllerTest extends AbstractTransactionalJUnit4SpringContextTests{
	@Autowired
	private LoginController LoginController;
	
	private final MockHttpServletRequest request = new MockHttpServletRequest();  
    private final MockHttpServletResponse response = new MockHttpServletResponse();  
    
    @Autowired
    private WebApplicationContext wac;
    
    private MockMvc mockMvc;
    
    private UserLoginBean userLoginBean;

	@Before
	public void setUp() throws Exception {
		//集成Web环境方式
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		//独立测试方式
		//mockMvc = MockMvcBuilders.standaloneSetup(LoginController).build();  
		
		userLoginBean = new UserLoginBean("jwy", "jwy");
	}
	
	/*
	 * 1、mockMvc.perform执行一个请求；
	2、MockMvcRequestBuilders.post构造一个请求
	3、ResultActions.andExpect添加执行完成后的断言
	4、ResultActions.andDo添加一个结果处理器，表示要对结果做点什么事情，
		比如此处使用MockMvcResultHandlers.print()输出整个响应结果信息。
	5、ResultActions.andReturn表示执行完成后返回相应的结果。
	 */

	/**
	 * case1, 正常情况
	 * @throws Exception
	 */
	@Test
	public void testLoginNormal() throws Exception {	
		MvcResult result = mockMvc.perform(post("/login.do")
				.param("username", userLoginBean.getUsername()).param("passwordFake", userLoginBean.getPasswordFake()))
				.andExpect(redirectedUrl("/dean/index.jsp"))
				.andExpect(status().is3xxRedirection())
				.andDo(print())
				.andReturn();
	}
	
	/**
	 * case2, 用户名为空
	 * @throws Exception
	 */
	@Test
	public void testLoginNoUsername() throws Exception {
		userLoginBean.setUsername(null);
		MvcResult result = mockMvc.perform(post("/login.do")
				.param("username", userLoginBean.getUsername())
				.param("passwordFake", userLoginBean.getPasswordFake()))
				.andExpect(status().is4xxClientError())
				.andDo(print())
				.andReturn();
		Assert.assertTrue(result.getResponse().getErrorMessage()
				.equals("Required String parameter 'username' is not present"));
	}
	
	/**
	 * case3，密码为空
	 * @throws Exception
	 */
	@Test
	public void testLoginNoPassword() throws Exception {
		userLoginBean.setPasswordFake(null);
		MvcResult result = mockMvc.perform(post("/login.do")
				.param("username", userLoginBean.getUsername())
				.param("passwordFake", userLoginBean.getPasswordFake()))
				.andExpect(status().is4xxClientError())
				.andDo(print())
				.andReturn();
		Assert.assertTrue(result.getResponse().getErrorMessage()
				.equals("Required String parameter 'passwordFake' is not present"));
	}
	
	@Test
	public void testLogout() throws Exception {
		mockMvc.perform(post("/login.do").param("username", "gjd").param("passwordFake", "gjd"))
		.andDo(print());
		mockMvc.perform(get("/logout.do"))
			.andExpect(status().is3xxRedirection())
			.andDo(print());
	}
	
	@Test
	public void testGetNotice() throws Exception {
		mockMvc.perform(post("/login.do").param("username", "jyc").param("passwordFake", "jyc"))
		.andDo(print());
		MvcResult result = mockMvc.perform(post("/shownotice.do"))
		.andExpect(status().isOk())
		.andDo(print())
		.andReturn();
		System.out.println(result.getResponse());
	}

}
