package nju.software.manager.dean;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Account;
import nju.software.entity.HeadTeacher;
import nju.software.jsonmodel.JsonHeadTeacher;
import nju.software.service.AccountService;
import nju.software.service.HeadTeacherService;
import nju.software.service.ReportService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanHeadTeacherManager {
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private HeadTeacherService headTeacherService;
	
	/**
	 * 获得班主任列表
	 * @return
	 */
	public JSONObject getAllHeadTeacher() {
		List<HeadTeacher> result=null;
		result=headTeacherService.getAllHeadTeacher();
		List<JsonHeadTeacher> headlist_j=jsonUtil.converToJsonHeadTeacher(result);
		JSONArray headlist_jsonobj=JSONArray.fromObject(headlist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",headlist_jsonobj);
		return jsonobj;
	}
	
	/**
	 * 编辑班主任
	 * @param oper
	 * @param idS
	 * @param telS
	 * @param no
	 * @param name
	 * @param email
	 */
	public void editHeadTeacher(String oper, String idS, String telS, String no, String name, 
			String email) {
		if(oper != null && oper.equals("del")){
			int id=Integer.parseInt(idS);
			try{
				String noS = headTeacherService.getHeadTeacherById(id).getNo();
				int accountId=accountService.getAccountByAccountname(noS).getAccountId();
				accountService.deleteAccount(accountId);
				headTeacherService.deleteHeadTeacher(id);
			}catch (Exception e) {

			}
		}else if(oper != null){
			int tel=Integer.parseInt(telS);
			HeadTeacher headTeacher=new HeadTeacher();
			headTeacher.setNo(no);
			headTeacher.setName(name);
			headTeacher.setTel(tel);
			headTeacher.setEmail(email);
			try{
				if(oper.equals("edit")){
					headTeacher.setId(Integer.parseInt(idS));
					headTeacherService.updateHeadTeacher(headTeacher);
				}else if(oper.equals("add")){
					headTeacherService.addHeadTeacher(headTeacher);
					headTeacher=headTeacherService.getHeadTeacherById(headTeacher.getId());
					Account a=new Account();
					a.setAccountLevel(Constants.HEADTEACHER);
					a.setAccountName( headTeacher.getNo());
					a.setAccountPassword(headTeacher.getNo());
					accountService.addAccount(a);
				}
			}catch(Exception e){

			}
		}
	}
	
	/**
	 * 导入班主任excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importHeadTeacherExcel(HttpServletRequest request,
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
					HeadTeacher headTeacher = new HeadTeacher();
					headTeacher.setNo(innerLst.get(0));
					headTeacher.setName(innerLst.get(1));
					headTeacher.setTel(Integer.valueOf(innerLst.get(2)));
					headTeacher.setEmail(innerLst.get(3));
					try{
						headTeacherService.addHeadTeacher(headTeacher);
						headTeacher = headTeacherService.getHeadTeacherById(headTeacher.getId());
						Account headTeacherAccount = new Account();
						headTeacherAccount.setAccountLevel(Constants.HEADTEACHER);
						headTeacherAccount.setAccountName(headTeacher.getNo());
						headTeacherAccount.setAccountPassword(headTeacher.getNo());
						headTeacherAccount.setTeacherId(Integer.valueOf(headTeacher.getNo()));
						if (accountService.addAccount(headTeacherAccount))
							result = "导入成功";
					}catch(Exception e) {
						result = "用户名重复，已存在" + innerLst.get(1);
						e.printStackTrace();
					}
				}
			}
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
	 * 导出班主任excel
	 * @param response
	 */
	public void exportHeadTeacherExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportHeadTeacher();
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
}
