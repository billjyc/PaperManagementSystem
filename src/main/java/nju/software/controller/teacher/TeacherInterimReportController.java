package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherInterimReportManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教师中期报告控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class TeacherInterimReportController {
	@Autowired
	private JSONUtil jsonUtil;
	private static Logger logger = LoggerFactory.getLogger(TeacherInterimReportController.class);
	@Autowired
	private TeacherInterimReportManager teacherInterimReportManager;
	
	/**
	 * 获得待审中期报告
	 */
	@RequestMapping(value = "/tutor/getuncheckedinterim.do")
	@ResponseBody
	public void getUncheckedInterim(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		String actorNo = (String) request.getSession().getAttribute("actorNo");
		
		JSONObject jsonobj = teacherInterimReportManager.getUncheckedInterim(actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 获得已通过中期报告
	 */
	@RequestMapping(value = "/tutor/getpassedinterim.do")
	@ResponseBody
	public void getPassedInterim(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		int teacherId = (Integer) request.getSession().getAttribute("teacherId");
		
		JSONObject jsonobj = teacherInterimReportManager.getPassedInterimReport(teacherId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 判定中期报告是否通过
	 */
	@RequestMapping(value="/tutor/judgeinterim.do")
	@ResponseBody
	public void judgeInterim(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("jsonstr") String judgestr){
		int teacherId = (Integer) request.getSession().getAttribute("teacherId");

		JSONObject jsonobj = teacherInterimReportManager.judgeInterim(judgestr, teacherId);
		jsonUtil.sendJson(response, jsonobj);
	}
}
