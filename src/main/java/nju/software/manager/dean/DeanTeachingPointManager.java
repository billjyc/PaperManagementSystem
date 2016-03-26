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
import nju.software.entity.Director;
import nju.software.entity.TeachingPoint;
import nju.software.jsonmodel.JsonDirector;
import nju.software.jsonmodel.JsonTeachingPoint;
import nju.software.service.AccountService;
import nju.software.service.DirectorService;
import nju.software.service.ReportService;
import nju.software.service.TeachingPointService;
import nju.software.util.Constants;
import nju.software.util.ExcelUtil;
import nju.software.util.JSONUtil;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class DeanTeachingPointManager {
	@Autowired
	private JSONUtil jsonUtil;
	@Autowired
	private AccountService accountService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private TeachingPointService teachingPointService;
	@Autowired
	private DirectorService directorService;
	
	/**
	 * 获得教学点列表
	 * @return
	 */
	public JSONObject getAllTeachingPoint() {
		List<TeachingPoint> result = null;
		result=teachingPointService.getAllTeachingPoint();
		List<JsonTeachingPoint> teachinglist_j=jsonUtil.converToJsonTeachingPoint(result);
		JSONArray teachinglist_jsonobj=JSONArray.fromObject(teachinglist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",teachinglist_jsonobj );
		return jsonobj;
	}
	
	/**
	 * 获得教学点负责人列表
	 * @return
	 */
	public JSONObject getAllDirector() {
		List<Director> result=directorService.getAllDirector();
		List<JsonDirector> directorlist_j=jsonUtil.converToJsonDirector(result);
		JSONArray directorlist_jsonobj=JSONArray.fromObject(directorlist_j);
		JSONObject jsonobj=new JSONObject();
		jsonobj.put("list",directorlist_jsonobj );
		return jsonobj;
	}
	
	/**
	 * 编辑教学点列表
	 * @param oper
	 * @param idS
	 * @param no
	 * @param name
	 * @param location
	 * @param directorName
	 * @param directorNo
	 */
	@Transactional(rollbackFor=Exception.class)
	public void editTeachingPoint(String oper, String idS, String no, String name, 
			String location, String directorName, String directorNo) {
		if(oper != null && oper.equals("del")){
			int id=Integer.parseInt(idS);
			try{
				teachingPointService.deleteTeachingPointInfo(id);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(oper!=null){
			TeachingPoint tp=new TeachingPoint();
			tp.setNo(no);
			tp.setName(name);
			tp.setLocation(location);
			tp.setDirectorNo(directorNo);
			tp.setDirectorName(directorName);

			try{
				if(oper.equals("edit")){
					tp.setId(Integer.parseInt(idS));
					teachingPointService.updateTeachingPoint(tp);
				}else if(oper.equals("add")){
					teachingPointService.addTeachingPoint(tp);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 编辑教学点负责人
	 * @param oper
	 * @param idS
	 * @param telS
	 * @param no
	 * @param email
	 * @param name
	 */
	@Transactional(rollbackFor=Exception.class)
	public void editDirector(String oper, String idS, String telS, String no, String email, 
			String name) {
		if(oper != null && oper.equals("del")){
			int id=Integer.parseInt(idS);
			try{
				String noS=directorService.getDirectorById(id).getNo();
				int accountId=accountService.getAccountByAccountname(noS).getAccountId();
				accountService.deleteAccount(accountId);
				directorService.deleteDirectorById(id);
			}catch (Exception e) {

			}
		}else if(oper != null){
			int tel=Integer.parseInt(telS);
			Director director=new Director();
			director.setNo(no);
			director.setEmail(email);
			director.setName(name);
			director.setTel(tel);
			try{
				if(oper.equals("edit")){
					director.setId(Integer.parseInt(idS));
					directorService.updateDirector(director);
				}else if(oper.equals("add")){
					directorService.addDirector(director);
					director=directorService.getDirectorById(director.getId());
					Account a=new Account();
					a.setAccountLevel(Constants.DIRECTOR);
					a.setAccountName( director.getNo());
					a.setAccountPassword(director.getNo());
					accountService.addAccount(a);
				}
			}catch(Exception e){

			}
		}	
	}
	
	/**
	 * 导入教学点Excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importTeachingPointExcel(HttpServletRequest request, HttpServletResponse response) {
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
				TeachingPoint teachingPoint=new TeachingPoint();
				if(!innerLst.get(0).equals("")){
					teachingPoint.setNo(innerLst.get(0));
					teachingPoint.setName(innerLst.get(1));
					teachingPoint.setLocation(innerLst.get(2));
					teachingPoint.setDirectorNo(innerLst.get(3));
					teachingPoint.setDirectorName(innerLst.get(4));

					try{
						// Add course
						teachingPointService.addTeachingPoint(teachingPoint);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
				result = "导入成功";
			}
		}catch(Exception e){
			if (result != null)
				result = "请输入正确的文件,格式依照本页课程列表";
			e.printStackTrace();
		}
		jsonobj.put("result", result);
		return jsonobj;
	}

	/**
	 * 导出教学点excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportTeachingPointExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportTeachingPoint();
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
	 * 导入教学点负责人excel
	 * @param request
	 * @param response
	 * @return
	 */
	@Transactional(rollbackFor=Exception.class)
	public JSONObject importDirectorExcel(HttpServletRequest request, HttpServletResponse response) {
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
					Director director = new Director();
					director.setNo(innerLst.get(0));
					director.setName(innerLst.get(1));
					director.setTel(Integer.valueOf(innerLst.get(2)));
					director.setEmail(innerLst.get(3));
					try{
						directorService.addDirector(director);
						director = directorService.getDirectorById(director.getId());
						Account directorAccount = new Account();
						directorAccount.setAccountLevel(Constants.DIRECTOR);
						directorAccount.setAccountName(director.getName());
						directorAccount.setAccountPassword(director.getNo());
						directorAccount.setTeacherId(director.getId());
						if (accountService.addAccount(directorAccount))
							result = "导入成功";
					}catch(Exception e) {
						result = "信息重复，已存在" + innerLst.get(0);
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
	 * 导出教学点负责人excel
	 * @param response
	 */
	@Transactional(rollbackFor=Exception.class)
	public void exportDirectorExcel(HttpServletResponse response) {
		HSSFWorkbook wb =reportService.exportDirector();
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
