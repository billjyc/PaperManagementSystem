package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherFeeManager;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 教师费用管理控制类
 * @author Emmy
 *
 */
@Controller
public class TeacherFeeController {
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private TeacherFeeManager teacherFeeManager;
	
	private static Logger logger = LoggerFactory.getLogger(TeacherFeeController.class);
	
	/**
	 * 所有费用列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/tutor/getAllFees.do")
	@ResponseBody
	public void getAllFees(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		int teacherId = (Integer) request.getSession().getAttribute("teacherId");
		
		JSONObject jsonobj = teacherFeeManager.getAllFees(teacherId);
		jsonUtil.sendJson(response, jsonobj);
	}
}