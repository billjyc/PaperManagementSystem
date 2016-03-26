package nju.software.manager.teacher;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Defence;
import nju.software.entity.Judge;
import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.Suggestion;
import nju.software.entity.Teacher;
import nju.software.entity.enums.PaperState;
import nju.software.jsonmodel.DefenseTask;
import nju.software.jsonmodel.TeacherJudgeTask;
import nju.software.service.AccountService;
import nju.software.service.DefenceService;
import nju.software.service.PaperService;
import nju.software.service.StudentService;
import nju.software.service.SuggestionService;
import nju.software.service.TeacherService;
import nju.software.util.ActivitiAPIUtils;
import nju.software.util.Constants;
import nju.software.util.EmailUtil;
import nju.software.util.FileOperateUtil;

import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TeacherDefenseManager {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private SuggestionService suggestionService;
	@Autowired
	private DefenceService defenceService;
	@Autowired
	private PaperService paperService;
	@Autowired
	private ActivitiAPIUtils activitiAPIUtils;
	@Autowired
	private EmailUtil emailUtil;
	
	private static Logger logger = LoggerFactory.getLogger(TeacherDefenseManager.class);
	
	/**
	 * 答辩秘书发送答辩结果会话
	 * @param secretTeacherNumber
	 * @param paper
	 * @param file
	 * @throws MessagingException 
	 */
	public void sendDefenseSuggestion(String secretTeacherNumber, Paper paper, File file) throws MessagingException {
		Student s = studentService.getStudentById(paper.getStudentId());
		Teacher tutor = teacherService.getTeacherById(s.getTeacherId());
		Teacher secretary = teacherService.getTeacherByTeacherNumber(secretTeacherNumber);
		
		String title_s = "";
		String title_t = "";
		String content_s = "";
		String content_t = "";
		
		if(paper.getPaperState() == PaperState.DEFENSE_PASSED) {
			title_s = "论文已通过答辩";
			title_t = "您指导的学生" + s.getStudentName() + "的论文已通过答辩";
			content_s = "你的论文已经通过答辩，已经交由导师进行答辩后的定稿工作";
			content_t = "您指导的学生" + s.getStudentName() + "的论文已经通过答辩，"
					+ "请进行答辩后的定稿工作";
		} else if (paper.getPaperState() == PaperState.DEFENSE_REPRIEVED) {
			title_s = "论文答辩暂缓通过";
			title_t = "您指导的学生" + s.getStudentName() + "的论文被暂缓通过";
			content_s = "你的论文答辩被暂缓通过，请准备再次进行答辩";
			content_t = "您指导的学生" + s.getStudentName() + "的论文答辩暂缓通过，"
					+ "需要再次进行答辩";
		} else if (paper.getPaperState() == PaperState.UNCOMMITED) {
			title_s = "论文答辩未通过";
			title_t = "您指导的学生" + s.getStudentName() + "的论文答辩未通过";
			content_s = "你的论文答辩未通过，请重新提交论文";
			content_t = "您指导的学生" + s.getStudentName() + "的论文答辩未通过，"
					+ "需要重新提交论文";
		} else {
			return;
		}
		
		emailUtil.sendMail(s.getStudentEmail(), title_s, content_s);
		emailUtil.sendMail(tutor.getTeacherEmail(), title_t, content_t);
		
		sendSuggestion(s.getStudentNumber(), secretTeacherNumber, "答辩秘书-" + secretary.getTeacherName(),
				title_s, content_s, paper.getPaperId(), file);
		sendSuggestion(tutor.getTeacherNumber(), secretTeacherNumber, "答辩秘书-" + secretary.getTeacherName(),
				title_t, content_t, paper.getPaperId(), file);
	}
	
	public void sendReprieveDecisionSuggestion(boolean result, Integer paperId, 
			String currentTeacherNumber, File file) throws MessagingException {
		Paper paper = paperService.getPaperByPaperId(paperId);
		Student s = studentService.getStudentById(paper.getStudentId());
		Teacher defenseTeacher = teacherService.getTeacherByTeacherNumber(currentTeacherNumber);
		Teacher tutor = teacherService.getTeacherById(s.getTeacherId());
		
		String title_s = "";
		String title_t = "";
		String content_s = "";
		String content_t = "";
		
		if(result) {
			title_s = "论文暂缓答辩在教师" + tutor.getTeacherName() + "处通过";
			content_s = "你的论文暂缓答辩在教师" + tutor.getTeacherName() + "处通过" + 
					", 请等待其他教师的结果";
			title_t = "您指导的学生" + s.getStudentName() + "的论文暂缓答辩在教师"
					+ tutor.getTeacherName() + "处通过";
			content_t = "您指导的学生" + s.getStudentName() + "的论文暂缓答辩在教师"
					+ tutor.getTeacherName() + "处通过，正在等待其他老师的结果";
		} else {
			title_s = "论文暂缓答辩在教师" + tutor.getTeacherName() + "处未通过";
			content_s = "你的论文暂缓答辩在教师" + tutor.getTeacherName() + "处未通过" + 
					", 请重新提交论文";
			title_t = "您指导的学生" + s.getStudentName() + "的论文暂缓答辩在教师"
					+ tutor.getTeacherName() + "处未通过";
			content_t = "您指导的学生" + s.getStudentName() + "的论文暂缓答辩在教师"
					+ tutor.getTeacherName() + "处通过，需要重新提交论文";
		}
		
		emailUtil.sendMail(s.getStudentEmail(), title_s, content_s);
		emailUtil.sendMail(tutor.getTeacherEmail(), title_t, content_t);
		sendSuggestion(s.getStudentNumber(), currentTeacherNumber, "答辩老师-" + defenseTeacher.getTeacherName(),
				title_s, content_s, paperId, file);
		sendSuggestion(tutor.getTeacherNumber(), currentTeacherNumber, "答辩老师-" + defenseTeacher.getTeacherName(),
				title_t, content_t, paperId, file);
		
	}
	
	private void sendSuggestion(String receiverNumber, String senderNumber, String senderName, String title, 
			String content, Integer paperId, File reviewFile) {
		Integer senderId = accountService.getAccountByAccountname(senderNumber).getAccountId();
		Integer receiverId = accountService.getAccountByAccountname(receiverNumber).getAccountId();
		Suggestion suggestion = suggestionService.createSuggestion(title, content, senderId, senderName, receiverId, paperId);
		try {
			suggestionService.sendSuggestion(suggestion, reviewFile);
		} catch (Exception e) {
			logger.error("发送会话失败！", e);
		}
	}
	
	/**
	 * 答辩待决议列表（答辩秘书）
	 * @param actorNo
	 * @return
	 */
	public JSONObject getDefenseList(String actorNo) {
		String result_json = "";
		List<DefenseTask> list = new ArrayList<DefenseTask>();

		try{
			List<Task> taskList = activitiAPIUtils.getAssignedTaskByNameAndUserId(actorNo, "Defense Decision");
			for(Task task : taskList) {
				ProcessInstance processInstance = activitiAPIUtils.getProcessInstance(task.getId());

				if(processInstance != null) {
					int studentId = (Integer) activitiAPIUtils.getVariable(processInstance.getId(), "studentId");
					Paper paper = paperService.getPaperByStudentId(studentId);
					Student student = studentService.getStudentById(paper.getStudentId());
					list.add(DefenseTask.toDefenseTask(student, paper, Long.parseLong(task.getId())));
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("获取待答辩决议列表失败", e);
			result_json = Constants.FAIL;
		}
		JSONArray list_json = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		jsonobj.put("list", list_json);
		return jsonobj;
	}
	
	/**
	 * 答辩决议（答辩秘书）
	 * @param paperId
	 * @param defenseContent
	 * @param result
	 * @param threeOne
	 * @param request
	 * @param taskIdS
	 * @param actorNo
	 * @return
	 */
	public JSONObject makeDefenseDecision(Integer paperId, String defenseContent, String result, 
			String threeOne, HttpServletRequest request, String taskIdS, String actorNo) {
		String result_json = "";
		try {
			Defence defence = defenceService.findDefenceByPaperIdandTeacherId(paperId, (Integer)request.getSession().getAttribute("teacherId"));
			if(defence != null){
				defence.setDefenceContent(defenseContent);
				defence.setDefenceResult(result);
				defence.setThreeOne(threeOne);
				defence.setDefenceCount(defence.getDefenceCount()+1);
				// 上传文件
				int studentId = paperService.getPaperByPaperId(paperId).getStudentId();
				String studentNumber = studentService.getStudentById(studentId).getStudentNumber();
				
				File save = FileOperateUtil.Upload(request,
						FileOperateUtil.getAbsoluteFileDir(studentNumber), "defense_affix"+actorNo, "submit_file");
				Validate.notNull(save);
				
				defence.setDefenceAffix(FileOperateUtil.getRelativeFilePath(save.getAbsolutePath()));
				defenceService.updateDefence(defence);
				
				Paper paper = paperService.getPaperByPaperId(paperId);
				if(paper != null){
					if(result.equals("passed")){
						paper.setPaperState(PaperState.DEFENSE_PASSED);
					}else if(result.equals("reprieved")){
						paper.setPaperState(PaperState.DEFENSE_REPRIEVED);
					}else{
						paper.setPaperState(PaperState.UNCOMMITED);	
					}

					Map<String, Object> data = new HashMap<String, Object>();
					data.put("defense", result);

					paperService.updatePaper(paper);
					activitiAPIUtils.completeTask(taskIdS, data);
					sendDefenseSuggestion(actorNo, paper, save);
				}
			}
			result_json = Constants.SUCCESS;
		}catch(NullPointerException ne) {
			logger.error("上传文件为空！", ne);
			result_json = Constants.FAIL;
		}catch(Exception e){
			logger.error("exception", e);
			result_json = Constants.FAIL;
		}

		JSONObject jsonobj =  new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 暂缓评审待决议列表（答辩评委）
	 * @param actorNo
	 * @return
	 */
	public JSONObject getReprieveDecisionList(String actorNo) {
		String result_json = "";
		List<DefenseTask> list = new ArrayList<DefenseTask>();
		try{
			List<Task> taskList = activitiAPIUtils.getAssignedTaskByNameAndUserId(actorNo, "Reprieve Decision");
			for(Task task : taskList) {
				ProcessInstance processInstance = activitiAPIUtils.getProcessInstance(task.getId());

				if(processInstance != null) {
					int studentId = (Integer) activitiAPIUtils.getVariable(processInstance.getId(), "studentId");
					Paper paper = paperService.getPaperByStudentId(studentId);
					Student student = studentService.getStudentById(paper.getStudentId());
					list.add(DefenseTask.toDefenseTask(student, paper, Long.parseLong(task.getId())));
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("获取暂缓答辩列表失败！", e);
			result_json = Constants.FAIL;
		}
		JSONArray list_json = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		jsonobj.put("list", list_json);
		return jsonobj;
	}
	
	//提交暂缓决议
	public JSONObject reprieveDecision(String paperidS, String resultS, String reprieveContent, 
			HttpServletRequest request, String actorNo, String taskIdS) {
		Integer paperId = Integer.parseInt(paperidS);
		boolean result = (resultS.equals("pass")) ? true: false;
		
		String result_json = "";
		try {
			Defence defence = defenceService.findDefenceByPaperIdandTeacherId(paperId, (Integer)request.getSession().getAttribute("teacherId"));
			if(defence != null){
				defence.setDefenceContent(reprieveContent);
				defence.setDefenceResult(request.getParameter("result"));
				defence.getTeacherType();
				Map<String, Object> data = new HashMap<String, Object>();
				logger.debug("reprieve", result);
				data.put("reprieve", result);
				// 上传文件
				int studentId = paperService.getPaperByPaperId(paperId).getStudentId();
				String studentNumber = studentService.getStudentById(studentId).getStudentNumber();
				File save = FileOperateUtil.Upload(request,
						FileOperateUtil.getAbsoluteFileDir(studentNumber), "reprieve_affix"+actorNo, "submit_file");
				Validate.notNull(save);
				
				defence.setDefenceAffix(FileOperateUtil.getRelativeFilePath(save.getAbsolutePath()));
				defenceService.updateDefence(defence);
				
				ProcessInstance processInstance = activitiAPIUtils.getProcessInstance(taskIdS);
				activitiAPIUtils.completeTask(taskIdS, data);
				
				Long reprieveApproved = (Long) activitiAPIUtils.getVariable(processInstance.getId(), "reprieveApproved");
				List<String> teachers = (List<String>) activitiAPIUtils.getVariable(processInstance.getId(),"teachers");
				logger.debug("student id: {}", studentId);
				Paper paper = paperService.getPaperByStudentId(studentId);
				if(reprieveApproved == teachers.size()) {
					paper.setPaperState(PaperState.DEFENSE_PASSED);
					paperService.updatePaper(paper);
				}
				sendReprieveDecisionSuggestion(result, paperId, actorNo, save);
			}
			result_json = Constants.SUCCESS;
		}catch(NullPointerException ne) {
			logger.error("上传文件为空！", ne);
			result_json = Constants.FAIL;
		}catch(Exception e){
			logger.error("exception", e);
			result_json = Constants.FAIL;
		}

		JSONObject jsonobj =  new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 已答辩列表
	 * @param actorNo
	 * @return
	 */
	public JSONObject getDefensedList(int teacherId,String actorNo) {
		String result_json = "";
		List<Defence> alllist = new ArrayList<Defence>();
		List<DefenseTask> list = new ArrayList<DefenseTask>();
		
		try{
			Teacher teacher = teacherService.getTeacherById(teacherId);
			//得到这个老师的答辩论文
			alllist = defenceService.findDefenceByTeacherId(teacherId);
			
			//遍历所有论文
			for(int i=0;i<alllist.size();i++) {
				//如果没有答辩就删除
				if(!((alllist.get(i).getDefenceResult().equals("passed"))||(alllist.get(i).getDefenceResult().equals("reject"))||(alllist.get(i).getDefenceResult().equals("reprieved")))) {
					alllist.remove(i);
				}
			}
			
			//得到所有界面需要的信息
			for(int i=0;i<alllist.size();i++){
				Paper paper = paperService.getPaperByPaperId(alllist.get(i).getPaperId());
				Student student = studentService.getStudentById(paper.getStudentId());
				logger.debug("paper_id: {}", paper.getPaperId());
				logger.debug("student_id: {}", student.getStudentId());
				list.add(DefenseTask.toDefenseTask(student, paper, alllist.get(i).getDefenceId()));
			}
					
		
			
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("获取已答辩列表失败！", e);
			result_json = Constants.FAIL;
		}
		JSONArray list_json = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		jsonobj.put("list", list_json);
		return jsonobj;
	}
}
