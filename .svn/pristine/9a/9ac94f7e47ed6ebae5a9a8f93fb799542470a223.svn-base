package nju.software.controller.teacher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.teacher.TeacherReviewManager;
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
 * 教师评审控制类
 * @author Emmy
 * @date 2015-3-21
 */
@Controller
public class TeacherReviewController {
	@Autowired
	private JSONUtil jsonUtil;
	private static Logger logger = LoggerFactory.getLogger(TeacherReviewController.class);
	@Autowired
	private TeacherReviewManager teacherReviewManager;
	
	/**
	 * 获得教师需要评审的list
	 */
	@RequestMapping(value="/tutor/reviewlist.do")
	@ResponseBody
	public void getReviewList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		HttpSession session = request.getSession();
		String actorNo = (String)session.getAttribute("actorNo");
		int teacherId = (Integer) session.getAttribute("teacherId");
		
		JSONObject jsonobj = teacherReviewManager.getReviewList(teacherId, actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 评审老师提交评审意见
	 * */
	@RequestMapping(value="/tutor/submitreview.do")
	@ResponseBody
	public void submitReview(HttpServletRequest request, HttpServletResponse response, ModelMap model, 
			@RequestParam("paperid")String paperIdS, @RequestParam("taskid") String taskIdS, 
			@RequestParam("result")String resultS, 
			@RequestParam("judge_content_teacher") String toteacher, //评审老师给指导老师的意见
			@RequestParam("judge_content_student") String tostudent) { //评审老师给学生的意见
		String actorNo =  (String)request.getSession().getAttribute("actorNo");
		
		JSONObject jsonobj = teacherReviewManager.submitReview(paperIdS, resultS, 
				tostudent, toteacher, taskIdS, request, actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获取已处理的评审的列表
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value="/tutor/reviewedlist.do")
	@ResponseBody
	public void getReviewedList(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		String actorNo = (String)session.getAttribute("actorNo");
		int teacherId = (Integer) session.getAttribute("teacherId");
		
		JSONObject jsonobj = teacherReviewManager.getReviewedList(teacherId, actorNo);
		jsonUtil.sendJson(response, jsonobj);
	}
}
