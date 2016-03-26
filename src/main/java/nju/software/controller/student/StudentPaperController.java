package nju.software.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import nju.software.manager.student.StudentPaperManager;
import nju.software.util.ActivitiAPIUtils;
import nju.software.util.JSONUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * 学生论文控制类
 * @author jiayicong
 * @date 2015-3-21
 *
 */
@Controller
public class StudentPaperController {
	private static Logger logger = LoggerFactory.getLogger(StudentPaperController.class);
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private ActivitiAPIUtils activitiAPIUtils;
	@Autowired
	private StudentPaperManager studentPaperManager;
	
	/**
	 * 获得学生论文状态
	 * 
	 * @author wsd
	 * @param studentId
	 *            学生存放在session中的主键
	 * @param paperstatus
	 *            学生论文状态
	 * @param result_json
	 *            执行方法体成功与否的判断信息，用于返回前台展示用户提示信息
	 */
	@RequestMapping(value = "/student/getpaperstatus.do")
	@ResponseBody
	public void getPaperStatus(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) {
		int studentId = (Integer) request.getSession()
				.getAttribute("studentId");
		
		JSONObject jsonobj = studentPaperManager.getPaperStatus(studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 获取论文提交后的进度
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/getpaperprocess.do")
	@ResponseBody
	public void getPaperProcess(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		int studentId = (Integer) request.getSession()
				.getAttribute("studentId");
		
		JSONObject jsonobj = studentPaperManager.getPaperProcess(studentId);
		logger.debug("json: {}", jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 提交论文，未提交状态下学生提交论文，包含papertitle
	 * 
	 * @author wsd
	 * @param papertitle
	 *            论文题目
	 * @param paperaffix
	 *            论文附言
	 */
	@RequestMapping(value = "/student/uploadpaper.do")
	@ResponseBody
	public void uploadPaper(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("upload_file");
		int studentId = (Integer) request.getSession()
				.getAttribute("studentId");
		
		JSONObject jsonobj = studentPaperManager.uploadPaper(file, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 提交论文
	 * @param request
	 * @param response
	 * @param model
	 * @param papertitle
	 * @param paperaffix
	 */
	@RequestMapping(value = "/student/submitpaper.do")
	@ResponseBody
	public void submitPaper(HttpServletRequest request,
			HttpServletResponse response, ModelMap model, 
			@RequestParam("title") String papertitle, @RequestParam("affix") String paperaffix) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");
		
		JSONObject jsonobj = studentPaperManager.submitPaper(request, papertitle, 
				actorId, studentId, paperaffix);
		jsonUtil.sendJson(response, jsonobj);	
	}
	
	/**
	 * 获取论文信息
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping(value = "/student/getpaper.do")
	@ResponseBody
	public void getPaper(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		int studentId = (Integer) request.getSession()
				.getAttribute("studentId");
		
		JSONObject jsonobj = studentPaperManager.getPaper(studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 更新论文
	 * @param request
	 * @param response
	 * @param model
	 * @param papertitle
	 * @param paperaffix1
	 */
	@RequestMapping(value = "/student/updatepaper.do")
	@ResponseBody
	public void updatePaper(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam("title") String papertitle, 
			@RequestParam("affix") String paperaffix1) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		String actorId = (String) session.getAttribute("actorId");
		
		JSONObject jsonobj = studentPaperManager.updatePaper(request, papertitle, 
				paperaffix1, actorId, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
	
	/**
	 * 更新论文标题
	 * @param request
	 * @param response
	 * @param model
	 * @param papertitle
	 */
	@RequestMapping(value = "/student/updatepapername.do")
	@ResponseBody
	public void updatePaperName(HttpServletRequest request,
			HttpServletResponse response, ModelMap model, 
			@RequestParam("title") String papertitle) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");
		
		JSONObject jsonobj = studentPaperManager.updatePaperName(papertitle, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 下载论文
	 * @param request
	 * @param response
	 * @param model
	 * @author zhanglei
	 */
	@RequestMapping(value = "/student/downloadpaper.do", method = RequestMethod.POST)
	public void downloadpaper(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) {
		HttpSession session = request.getSession();
		int studentId = (Integer) session.getAttribute("studentId");

		JSONObject jsonobj = studentPaperManager.downloadPaper(response, studentId);
		jsonUtil.sendJson(response, jsonobj);
	}
}
