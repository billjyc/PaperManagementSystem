package nju.software.manager.dean;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Account;
import nju.software.entity.Teacher;
import nju.software.entity.enums.TeacherEducation;
import nju.software.entity.enums.TeacherJobTitle;
import nju.software.entity.enums.TeacherQualification;
import nju.software.entity.enums.TeacherType;
import nju.software.jsonmodel.JsonTeacher;
import nju.software.service.AccountService;
import nju.software.service.ReportService;
import nju.software.service.TeacherService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanTeacherManager {
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DeanTeacherManager.class);
	
	/**
	 * 所有教师列表
	 * @param pageS
	 * @param rowsS
	 * @param sidx
	 * @param sord
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JSONObject getAllTeachers(String pageS, String rowsS, String sidx, String sord) {
		int page = (pageS == null) ? 0 : Integer.parseInt(pageS);
		int limit = (rowsS == null) ? 9999 : Integer.parseInt(rowsS);

		LOGGER.debug("page: {}, limit: {}", page, limit);
		LOGGER.debug("sidx: {}, sord: {}", sidx, sord);

		List<Teacher> teacherList = null;
		JSONObject jsonobj = new JSONObject();

		HashMap<String,Object> params = new HashMap<String,Object>();
		params.put("page", page);
		params.put("limit", limit);
		params.put("sidx", sidx);
		params.put("sord", sord);

		List<Object> result = teacherService.getAllLimit(params);
		teacherList = (List<Teacher>)result.get(0);
		HashMap<String,Object> limits = (HashMap<String,Object>)result.get(1);

		jsonobj.put("page", limits.get("page"));
		jsonobj.put("total_pages", limits.get("total_pages"));
		jsonobj.put("records", limits.get("count"));

		LOGGER.debug("page: {}", limits.get("page"));
		LOGGER.debug("total_pages: {}", limits.get("total_pages"));
		LOGGER.debug("records: {}", limits.get("count"));

		//List<Teacher> result = teacherService.getAllTeachers();

		List<JsonTeacher> teacherlist_j = jsonUtil.converToJsonTeacher(teacherList);
		JSONArray teacherlist_jsonobj = JSONArray.fromObject(teacherlist_j);
		jsonobj.put("list", teacherlist_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 导入教师excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor = Exception.class)
	public JSONObject importTeacherExcel(HttpServletRequest request,
			HttpServletResponse response) {
		String result="";
		ArrayList<String> innerLst;
		try{
			List<ArrayList<String>> dataLst=new ExcelUtil().importExcel(request, response,"file");
			Iterator<ArrayList<String>> it=dataLst.iterator();
			it.next();

			while(it.hasNext())
			{  
				innerLst=it.next();
				if(innerLst.get(0)!=null){
					Teacher teacher = new Teacher();
					teacher.setTeacherName(innerLst.get(1));
					teacher.setTeacherNumber(innerLst.get(0));
					teacher.setTeacherClasses(teacherService.formatClasses(innerLst.get(2)));
					teacher.setTeacherEducation(teacherService.formatEducation(innerLst.get(3)));
					teacher.setTeacherJobTitle(teacherService.formatJobTitle(innerLst.get(4)));
					teacher.setTeacherQualification(teacherService.formatQualification(innerLst.get(5)));
					teacher.setTeacherPhone(innerLst.get(6));
					teacher.setTeacherEmail(innerLst.get(7));

					try{
						teacherService.addTeacherInfo(teacher);
						teacher = teacherService.getTeacherByTeacherNumber(teacher.getTeacherNumber());
						Account teacherAccount = new Account();
						teacherAccount.setAccountLevel(Constants.TEACHER);
						teacherAccount.setAccountName(teacher.getTeacherNumber());
						teacherAccount.setAccountPassword(teacher.getTeacherNumber());
						teacherAccount.setTeacherId(teacher.getTeacherId());
						if (accountService.addAccount(teacherAccount))
							result = "导入成功";
					}catch(Exception e) {
						result = "用户名重复，已存在" + innerLst.get(1);
						e.printStackTrace();
					}
				}}

		}catch (Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页教师列表";
			e.printStackTrace();
		}

		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
	
	/**
	 * 导出教师excel
	 * @param request
	 * @param response
	 */
	@Transactional(rollbackFor = Exception.class)
	public void exportTeacherExcel(HttpServletRequest request, HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportTeacher();
		OutputStream ouputStream;
		try {
			ouputStream = response.getOutputStream();
			wb.write(ouputStream);  
			ouputStream.flush();  
			ouputStream.close();  

		}catch(IOException e){
			e.printStackTrace();
		}  
	}
	
	/**
	 * 编辑教师
	 * @param oper
	 * @param teacherIdS
	 * @param teacherName
	 * @param teacherClasses
	 * @param teacherEducation
	 * @param teacherEmail
	 * @param teacherJobTitle
	 * @param teacherNumber
	 * @param teacherPhone
	 * @param teacherQualification
	 */
	@Transactional(rollbackFor = Exception.class)
	public void editTeacher(String oper, String teacherIdS, String teacherName, 
			String teacherClasses, String teacherEducation, String teacherEmail, 
			String teacherJobTitle, String teacherNumber, String teacherPhone, 
			String teacherQualification) {
		LOGGER.debug("oper: {}", oper);
		if(oper != null && oper.equals("del")){
			//通过teacherId删除
			int teacherId = Integer.parseInt(teacherIdS);
			LOGGER.debug("teacherId: {}", teacherId);
			try{
				String teacherNum = teacherService.getTeacherById(teacherId).getTeacherNumber();
				int accountId = accountService.getAccountByAccountname(teacherNum).getAccountId();
				accountService.deleteAccount(accountId);
				teacherService.deleteTeacherInfo(teacherId);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper != null){
			Teacher teacher = new Teacher();
			teacher.setTeacherClasses(TeacherType.valueOf(teacherClasses));
			teacher.setTeacherEducation(TeacherEducation.valueOf(teacherEducation));
			teacher.setTeacherEmail(teacherEmail);
			teacher.setTeacherJobTitle(TeacherJobTitle.valueOf(teacherJobTitle));
			teacher.setTeacherName(teacherName);
			teacher.setTeacherNumber(teacherNumber);
			teacher.setTeacherPhone(teacherPhone);
			teacher.setTeacherQualification(TeacherQualification.valueOf(teacherQualification));

			try{
				if(oper.equals("edit")){
					//更新需要设置teacherId
					teacher.setTeacherId(Integer.parseInt(teacherIdS));
					teacherService.updateTeacherInfo(teacher);
				}else if(oper.equals("add")){
					teacherService.addTeacherInfo(teacher);
					teacher = teacherService.getTeacherByTeacherNumber(teacher.getTeacherNumber());

					Account teacherAccount = new Account();
					teacherAccount.setAccountLevel(Constants.TEACHER);
					teacherAccount.setAccountName(teacher.getTeacherNumber());
					teacherAccount.setAccountPassword(teacher.getTeacherNumber());
					teacherAccount.setTeacherId(teacher.getTeacherId());
					accountService.addAccount(teacherAccount);
				}
			}catch(Exception e){
				e.printStackTrace();
				Account teacherAccount = new Account();
				teacherAccount.setAccountLevel(Constants.TEACHER);
				teacherAccount.setAccountName(teacher.getTeacherNumber());
				teacherAccount.setAccountPassword(teacher.getTeacherNumber());
				teacherAccount.setTeacherId(teacher.getTeacherId());

				accountService.addAccount(teacherAccount) ;
			}
		} 
	}
}
