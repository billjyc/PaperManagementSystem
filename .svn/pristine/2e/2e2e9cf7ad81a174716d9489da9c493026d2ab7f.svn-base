package nju.software.controller.dean;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Fee;
import nju.software.entity.Student;
import nju.software.entity.Teacher;
import nju.software.jsonmodel.JsonFee;
import nju.software.service.AccountService;
import nju.software.service.FeeService;
import nju.software.service.ReportService;
import nju.software.service.StudentService;
import nju.software.service.TeacherService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 费用管理控制类
 * @author billjyc
 * @date 2015-3-21
 */
@Controller
public class DeanFeeController {
	private static Logger logger = LoggerFactory.getLogger(DeanFeeController.class);
	
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private FeeService feeService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private StudentService studentService;
	
	/**
	 * 所有费用列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getAllFees.do")
	@ResponseBody
	public void getAllFees(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		List<Fee> fees=feeService.getAllFees();
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 指导费列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getInstructionFees.do")
	@ResponseBody
	public void getInstructionFees(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("指导费发放"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 答辩费列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getDefenceFees.do")
	@ResponseBody
	public void getDefenceFees(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("答辩费发放"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 评审费列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getJudgeFees.do")
	@ResponseBody
	public void getJugdeFees(HttpServletRequest request, HttpServletResponse response, ModelMap model){

		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("评审费发放"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 二次评审费收取列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getSecondJudgeFeesCharge.do")
	@ResponseBody
	public void getSecondJudgeFeesCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model){

		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("二次评审费收取"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 二次答辩费收取列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getSecondDefenceFeesCharge.do")
	@ResponseBody
	public void getSecondDefenceFeesCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model){

		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("二次答辩费收取"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 二次评审费发放列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getSecondJudgeFeesGrant.do")
	@ResponseBody
	public void getSecondJudgeFeesGrant(HttpServletRequest request, HttpServletResponse response, ModelMap model){

		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("二次评审费发放"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 二次答辩费发放列表
	 * @author Jerry.Lu
	 */
	@RequestMapping(value="/dean/getSecondDefenceFeesGrant.do")
	@ResponseBody
	public void getSecondDefenceFeesGrant(HttpServletRequest request, HttpServletResponse response, ModelMap model){

		List<Fee> fees=feeService.getFeesByFeeType(Constants.FEE_TYPE.indexOf("二次答辩费发放"));
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 * 编辑指导费用
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editInstructionFees.do")
	@ResponseBody
	@Transactional(rollbackFor = Exception.class)
	public void editInstructionFees(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("指导费发放"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * 编辑评审费用
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editJudgeFees.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editJudgeFees(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("评审费发放"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * 编辑答辩费用
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editDefenceFees.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editDefenceFees(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("答辩费发放"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * 编辑二次评审费用收取
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editSecondJudgeFeesCharge.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editSecondJudgeFeesCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			//Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			//fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("二次评审费收取"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * 编辑二次评审费用发放
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editSecondJudgeFeesGrant.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editSecondgJudgeFeesGrant(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("二次评审费发放"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}


	/**
	 * 编辑二次答辩费用收取
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editSecondDefenceFeesCharge.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editSecondDefenceFeesCharge(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			//Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			//fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("二次答辩费收取"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	/**
	 * 编辑二次答辩费用收取
	 * @author Jerry.Lu
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/dean/editSecondDefenceFeesGrant.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void editSecondgDefenceFeesGrant(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws ParseException{
		String oper=request.getParameter("oper");//获取操作类型
		if(oper != null&&oper.equals("del")){
			String idString=request.getParameter("id");
			int id=Integer.parseInt(idString);
			try{
				feeService.delete(id);			
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			String StudentName=request.getParameter("studentName");
			String StudnetNum=request.getParameter("studentNum");
			String teacherName=request.getParameter("teacherName");
			String teacherNum=request.getParameter("teacherNum");
			String grantType=request.getParameter("grantType");
			String feeType=request.getParameter("feeType");
			String amount=request.getParameter("amount");
			String time=request.getParameter("grantTime");

			Student student=studentService.getStudentByStudentNumber(StudnetNum);
			Teacher teacher=teacherService.getTeacherByTeacherNumber(teacherNum);		
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			format.setLenient(false);
			Timestamp ts = new Timestamp(format.parse(time).getTime());

			Fee fee=new Fee();

			fee.setStudentId(student.getStudentId());
			fee.setTeacherId(teacher.getTeacherId());
			fee.setGrantType(Constants.GRANT_TYPE.indexOf(grantType));
			fee.setGrantTime(ts);
			fee.setFeeType(Constants.FEE_TYPE.indexOf("二次答辩费发放"));
			fee.setAmount(Float.valueOf(amount));

			try{
				if(oper.equals("edit")){
					fee.setId(Integer.parseInt(request.getParameter("id")));			
					feeService.update(fee);				
				}else if(oper.equals("add")){
					feeService.addFee(fee);
				}

			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}


	/**
	 * 导入指导费用excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importInstructionFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importInstructionFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
					Teacher teacher=teacherService.getTeacherByTeacherNumber(innerLst.get(2));//教师编号	
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(6)).getTime());
					int grant_type=Constants.GRANT_TYPE.indexOf(innerLst.get(5));

					fee.setAmount(Float.valueOf(innerLst.get(4)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("指导费发放"));
					fee.setStudentId(student.getStudentId());
					fee.setTeacherId(teacher.getTeacherId());
					fee.setGrantTime(ts);
					fee.setGrantType(grant_type);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出指导费用excel
	 *@author Jerry.Lu
	 */

	@RequestMapping(value = "/dean/exportInstructionFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporInstructionFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("指导费发放")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文指导费.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}

	/**
	 * 导入评审费用excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importJudgeFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importJudgeFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
					Teacher teacher=teacherService.getTeacherByTeacherNumber(innerLst.get(2));//教师编号	
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(6)).getTime());
					int grant_type=Constants.GRANT_TYPE.indexOf(innerLst.get(5));

					fee.setAmount(Float.valueOf(innerLst.get(4)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("评审费发放"));
					fee.setStudentId(student.getStudentId());
					fee.setTeacherId(teacher.getTeacherId());
					fee.setGrantTime(ts);
					fee.setGrantType(grant_type);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出评审费用excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportJudgeFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporJudgeFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("评审费发放")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文评审费.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}


	/**
	 * 导入答辩费用excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importDefenceFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importDefenceFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
					Teacher teacher=teacherService.getTeacherByTeacherNumber(innerLst.get(2));//教师编号	
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(6)).getTime());
					int grant_type=Constants.GRANT_TYPE.indexOf(innerLst.get(5));

					fee.setAmount(Float.valueOf(innerLst.get(4)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("答辩费发放"));
					fee.setStudentId(student.getStudentId());
					fee.setTeacherId(teacher.getTeacherId());
					fee.setGrantTime(ts);
					fee.setGrantType(grant_type);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出答辩费用excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportDefenceFeeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporDefenceFeeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("答辩费发放")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文答辩费.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}


	/**
	 * 导入二次评审费用发放excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importSecondeJudgeFeeGrantExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importSecondJudgeFeeGrantExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   ExcelUtil excel=new ExcelUtil();
		List<ArrayList<String>> dataLst=excel.
				importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
		Iterator<ArrayList<String>> it = dataLst.iterator();
		it.next();
		while (it.hasNext()) {
			ArrayList<String> innerLst = it.next();
			Fee fee=new Fee();
			if(!innerLst.get(0).equals("")){
				Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
				Teacher teacher=teacherService.getTeacherByTeacherNumber(innerLst.get(2));//教师编号	
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				format.setLenient(false);
				Timestamp ts = new Timestamp(format.parse(innerLst.get(6)).getTime());
				int grant_type=Constants.GRANT_TYPE.indexOf(innerLst.get(5));

				fee.setAmount(Float.valueOf(innerLst.get(4)));	
				fee.setFeeType(Constants.FEE_TYPE.indexOf("二次评审费发放"));
				fee.setStudentId(student.getStudentId());
				fee.setTeacherId(teacher.getTeacherId());
				fee.setGrantTime(ts);
				fee.setGrantType(grant_type);
				feeService.addFee(fee);
			}
		}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出二次评审费用发放excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportSecondJudgeFeeGrantExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporSecondJudgeFeeGrantExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("二次评审费发放")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文二次评审费发放.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}

	/**
	 * 导入二次答辩费用发放excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importSecondDefenceFeeGrantExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importSecondDefenceFeeGrantExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
					Teacher teacher=teacherService.getTeacherByTeacherNumber(innerLst.get(2));//教师编号	
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(6)).getTime());
					int grant_type=Constants.GRANT_TYPE.indexOf(innerLst.get(5));

					fee.setAmount(Float.valueOf(innerLst.get(4)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("二次答辩费发放"));
					fee.setStudentId(student.getStudentId());
					fee.setTeacherId(teacher.getTeacherId());
					fee.setGrantTime(ts);
					fee.setGrantType(grant_type);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出二次答辩费用发放excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportSecondDefenceFeeGrantExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporSecondDefenceFeeGrantExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HSSFWorkbook wb =reportService.exportChargeFee(Constants.FEE_TYPE.indexOf("二次答辩费发放")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文二次答辩费发放.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}

	/**
	 * 导入二次评审费用收取excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importSecondeJudgeFeeChargeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importSecondJudgeFeeChargeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(3)).getTime());

					fee.setAmount(Float.valueOf(innerLst.get(2)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("二次评审费收取"));
					fee.setStudentId(student.getStudentId());
					fee.setGrantTime(ts);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出二次评审费用收取excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportSecondJudgeFeeChargeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporSecondJudgeFeeChargeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("二次评审费收取")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文二次评审费收取.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  
		}catch(IOException e) {
			e.printStackTrace();
		}  
	}

	/**
	 * 导入二次答辩费用收取excel
	 * @author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/importSecondDefenceFeeChargeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void importSecondDefenceFeeChargeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		response.setContentType("text/html;charset=UTF-8");
		String result = "";
		JSONObject jsonobj = new JSONObject();
		try {   
			ExcelUtil excel=new ExcelUtil();
			List<ArrayList<String>> dataLst=excel.
					importExcel(request, response,"file");//调用静态类ExcelUitl导入EXCEL	
			Iterator<ArrayList<String>> it = dataLst.iterator();
			it.next();
			while (it.hasNext()) {

				ArrayList<String> innerLst = it.next();
				Fee fee=new Fee();
				if(!innerLst.get(0).equals("")){
					Student student=studentService.getStudentByStudentNumber(innerLst.get(0));//学生学号	
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					format.setLenient(false);
					Timestamp ts = new Timestamp(format.parse(innerLst.get(3)).getTime());

					fee.setAmount(Float.valueOf(innerLst.get(2)));	
					fee.setFeeType(Constants.FEE_TYPE.indexOf("二次答辩费收取"));
					fee.setStudentId(student.getStudentId());
					fee.setGrantTime(ts);
					feeService.addFee(fee);
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace(); 
		}
		result = "导入成功";
		jsonobj.put("result", result);
		jsonUtil.sendJson(response, jsonobj);
	}

	/**
	 *导出二次答辩费用收取excel
	 *@author Jerry.Lu
	 */
	@RequestMapping(value = "/dean/exportSecondDefenceFeeChargeExcel.do")
	@ResponseBody
	@Transactional(rollbackFor=Exception.class)
	public void exporSecondDefenceFeeChargeExcel(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		HSSFWorkbook wb =reportService.exportGrantFee(Constants.FEE_TYPE.indexOf("二次答辩费收取")); 

		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=论文二次答辩费收取.xls");  
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  

		}catch(IOException e) {
			e.printStackTrace();
		}  
	}
}
