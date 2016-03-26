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
import nju.software.entity.Judge;
import nju.software.entity.Paper;
import nju.software.entity.Student;
import nju.software.entity.Suggestion;
import nju.software.entity.Teacher;
import nju.software.entity.enums.PaperState;
import nju.software.entity.enums.TeacherType;
import nju.software.jsonmodel.TeacherJudgeTask;
import nju.software.service.AccountService;
import nju.software.service.JudgeService;
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
public class TeacherReviewManager {
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private SuggestionService suggestionService;
	@Autowired
	private JudgeService judgeService;
	@Autowired
	private PaperService paperService;
	@Autowired
	private ActivitiAPIUtils activitiAPIUtils;
	@Autowired
	private EmailUtil emailUtil;
	
	private static Logger logger = LoggerFactory.getLogger(TeacherReviewManager.class);

	/**
	 * 
	 * @param paperId
	 * @param currentTeacherNumber
	 * @param studentNumber
	 * @param reviewFile
	 * @param toStudent 给学生的附言
	 * @param toTeacher 给另外一位评审老师的附言
	 * @throws MessagingException 
	 */
	private void submitReviewSuggestion(Integer paperId, String currentTeacherNumber, 
			String studentNumber, File reviewFile, String toStudent, String toTeacher) throws MessagingException {
		List<Judge> judgeList = judgeService.findJudgeByPaperId(paperId);

		Teacher judge1 = teacherService.getTeacherById(judgeList.get(0).getTeacherId());
		Teacher judge2 = teacherService.getTeacherById(judgeList.get(1).getTeacherId());
		Teacher currentTeacher = teacherService.getTeacherByTeacherNumber(currentTeacherNumber);
		Student student = studentService.getStudentByStudentNumber(studentNumber);

		if(currentTeacher.getTeacherId() == judge1.getTeacherId()) {
			//do nothing
		} else if (currentTeacher.getTeacherId() == judge2.getTeacherId()) {
			//由于要给judge2发消息，需要保证judge1为当前老师
			judge2 = judge1;
			judge1 = currentTeacher;
		}

		logger.debug("judge1: {}", judge1.getTeacherName());
		logger.debug("judge2: {}", judge2.getTeacherName());
		
		String title = "评审老师" + judge1.getTeacherName() + "提交评审结果";
		String content_s = toStudent;
		String content_t = "给学生的附言" + toStudent + 
				"\n" + "给老师的附言" + toTeacher + "\n";
		
		//给学生发送会话
		sendSuggestion(studentNumber, currentTeacherNumber, "评审老师-" + judge1.getTeacherName(), 
				title, content_s, paperId, reviewFile);
		//给另外一个评审老师发送会话
		sendSuggestion(judge2.getTeacherNumber(), currentTeacherNumber, "评审老师-" + judge1.getTeacherName(), 
				title, content_t, paperId, reviewFile);
		List<File> list = new ArrayList<>();
		emailUtil.sendMailAttach(student.getStudentEmail(), title, content_s, list);
		emailUtil.sendMailAttach(judge2.getTeacherEmail(), title, content_t, list);
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
	 * 获得教师需要评审的list
	 * @param teacherId
	 * @param actorNo
	 * @return
	 */
	public JSONObject getReviewList(Integer teacherId, String actorNo) {
		String result_json = "";
		List<TeacherJudgeTask> list = new ArrayList<TeacherJudgeTask>();
		List<Task> taskList = null;
		
		try{
			Teacher teacher = teacherService.getTeacherById(teacherId);
			//判断该老师是内部还是外部教师，找到老师对应的taskList
			if(teacher.getTeacherClasses() == TeacherType.INNERTEACHER) {
				taskList = activitiAPIUtils.getAssignedTaskByNameAndUserId(actorNo, "Internal Review");
			}else if(teacher.getTeacherClasses() == TeacherType.OUTERTEACHER) {
				taskList = activitiAPIUtils.getAssignedTaskByNameAndUserId(actorNo, "External Review");
			}
			//遍历所有Task
			for(Task task : taskList) {
				//得到Task对应的流程ID
				ProcessInstance instance = activitiAPIUtils.getProcessInstance(task.getId());
				//遍历所有流程
				if(instance != null) {
					int studentId = (Integer) activitiAPIUtils.getVariable(instance.getId(), "studentId");
					//根据Studentid得到界面要的其他信息
					Paper paper = paperService.getPaperByStudentId(studentId);
					Student student = studentService.getStudentById(paper.getStudentId());
					logger.debug("paper_id: {}", paper.getPaperId());
					Judge judge = judgeService.findJudgeByPaperIdandTeacherId(paper.getPaperId(), teacherId);
					list.add(TeacherJudgeTask.toTeacherJudgeTask(student, paper,judge.getJudgeDeadline(), Long.parseLong(task.getId())));
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("获取待评审列表失败！", e);
			result_json = Constants.FAIL;
		}
		JSONArray list_json = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		jsonobj.put("list", list_json);
		return jsonobj;
	}
	
	/**
	 * 提交评审结果
	 * @param paperIdS
	 * @param resultS
	 * @param tostudent
	 * @param toteacher
	 * @param taskIdS
	 * @param request
	 * @param actorNo
	 * @return
	 */
	public JSONObject submitReview(String paperIdS, String resultS, String tostudent, 
			String toteacher, String taskIdS, HttpServletRequest request, String actorNo) {
		Integer paperId = Integer.parseInt(paperIdS);
		Long.parseLong(taskIdS);
		boolean result = resultS.equals("passed") ? true : false ; 
		String result_json = "";
		try{
			Judge judge = judgeService.findJudgeByPaperIdandTeacherId(paperId, (Integer)request.getSession().getAttribute("teacherId"));
			judge.setJudgeContentStudent(tostudent);
			judge.setJudgeContentTeacher(toteacher);
			judge.setJudgeResult(request.getParameter("result"));
			// 上传文件
			int studentId = paperService.getPaperByPaperId(paperId).getStudentId();
			String studentNumber = studentService.getStudentById(studentId).getStudentNumber();
			File save = FileOperateUtil.Upload(request,
					FileOperateUtil.getAbsoluteFileDir(studentNumber), "review_affix_" + actorNo, "submit_file");
			Validate.notNull(save);
			judge.setJudgeAffix(FileOperateUtil.getRelativeFilePath(save.getAbsolutePath()));

			Teacher teacher = teacherService.getTeacherByTeacherNumber(actorNo);
			Validate.notNull(teacher);
			Map<String, Object> data = new HashMap<String, Object>();
			
			if(teacher.getTeacherClasses() == TeacherType.INNERTEACHER) {
				data.put("internalReview", result);
			} else if(teacher.getTeacherClasses() == TeacherType.OUTERTEACHER) {
				data.put("externalReview", result);
			}
			//data.put("review", result);
			judgeService.updateJudge(judge);
			Paper paper = paperService.getPaperByPaperId(paperId);
			ProcessInstance instance = activitiAPIUtils.getProcessInstance(taskIdS);
			
			//完成任务，activiti自动完成判断任务
			activitiAPIUtils.completeTask(taskIdS, data);
			
			//改变Paper的数据库
			Boolean internalReview = (Boolean)activitiAPIUtils.getVariable(instance.getId(), "internalReview");
			Boolean externalReview = (Boolean)activitiAPIUtils.getVariable(instance.getId(), "externalReview");
			
			//只有当2个评审老师全部给出评审意见的时候，状态才会改变
			if(internalReview != null && externalReview != null) {
				if(internalReview && externalReview) {
					paper.setPaperState(PaperState.JUDGE_PASSED);
					logger.debug("judge passed");
				} else {
					paper.setPaperState(PaperState.UNCOMMITED);
				}
				paperService.updatePaper(paper);
			}
			
			result_json = Constants.SUCCESS;

			//系统向学生发起会话
			submitReviewSuggestion(paperId, actorNo, studentNumber, save, tostudent, toteacher);
		}catch(NullPointerException ne){
			logger.error("上传文件为空！", ne);
			result_json = Constants.FAIL;
		}
		catch(Exception e){
			logger.error("提交评审结果失败！", e);
			result_json = Constants.FAIL;
		}

		JSONObject jsonobj =  new JSONObject();
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/*
	 * 显示已经评审过的论文
	 */
	public JSONObject getReviewedList(Integer teacherId, String actorNo){
		String result_json = "";
		List<Judge> alllist = new ArrayList<Judge>();
		List<TeacherJudgeTask> list = new ArrayList<TeacherJudgeTask>();
		
		try{
			Teacher teacher = teacherService.getTeacherById(teacherId);
			//得到这个老师的所有通过评审论文
			alllist = judgeService.findJudgeByTeacherId(teacherId);
			
			//遍历所有论文
			for(int i=0;i<alllist.size();i++) {
				//如果没有评审就删除
				if(!((alllist.get(i).getJudgeResult().equals("passed"))||(alllist.get(i).getJudgeResult().equals("reject")))) {
					alllist.remove(i);
				}
			}
			
			//得到所有界面需要的信息
			for(int i=0;i<alllist.size();i++){
				Paper paper = paperService.getPaperByPaperId(alllist.get(i).getPaperId());
				Student student = studentService.getStudentById(paper.getStudentId());
				logger.debug("paper_id: {}", paper.getPaperId());
				logger.debug("student_id: {}", student.getStudentId());
				list.add(TeacherJudgeTask.toTeacherJudgeTask(student, paper,alllist.get(i).getJudgeDeadline(), 0));
			}
					
		
			
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			logger.error("获取已评审列表失败！", e);
			result_json = Constants.FAIL;
		}
		JSONArray list_json = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result_json", result_json);
		jsonobj.put("list", list_json);
		return jsonobj;

	}
}
