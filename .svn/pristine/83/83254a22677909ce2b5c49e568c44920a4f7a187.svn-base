package nju.software.manager.student;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.StudentCourseInfo;
import nju.software.jsonmodel.JsonStudentCourseInfo;
import nju.software.service.ReportService;
import nju.software.service.StudentCourseInfoService;
import nju.software.util.Constants;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StudentCourseManager {
	@Autowired
	private StudentCourseInfoService studentCourseInfoService;
	@Autowired
	private ReportService reportService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(StudentCourseManager.class);
	
	/**
	 * 获取课程列表
	 * @param studentNo
	 * @return
	 */
	public JSONObject getCousreInfoList(String studentNo) {
		List<StudentCourseInfo> courseInfoList = studentCourseInfoService.getInfoByStudentNo(studentNo);
		String result_json = "";
		ArrayList<JsonStudentCourseInfo> JsonCourseInfoList = new ArrayList<JsonStudentCourseInfo>();
		try{
			if(courseInfoList != null){
				for(int i = 0; i < courseInfoList.size(); i++){
					StudentCourseInfo courseInfo = courseInfoList.get(i);
					if(courseInfo != null){
						//JsonStudentCourseInfo JsonStudentCourseInfo = JsonStudentCourseInfo.course2JsonStudentCourseInfo(courseInfo);
						JsonCourseInfoList.add(new JsonStudentCourseInfo(courseInfo));
					}
				}
			}
			result_json = Constants.SUCCESS;
		}catch(Exception e){
			LOGGER.error("get course list failed: ",e);
			result_json = Constants.FAIL;
		}
		JSONArray jsonlist = JSONArray.fromObject(JsonCourseInfoList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", jsonlist);
		jsonobj.put("result_json", result_json);
		return jsonobj;
	}
	
	/**
	 * 导出成绩单excel
	 * @param studentNo
	 * @param response
	 * @return
	 */
	public JSONObject exportStudentTranscriptExcel(String studentNo, HttpServletResponse response) {
		HSSFWorkbook wb = reportService.exportTranscriptByStudentNo(studentNo);
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
		response.setHeader("Content-disposition", "attachment;filename=" + studentNo + " transcript.xls");  
		String result = "";
		OutputStream outputStream;
		try {
			outputStream = response.getOutputStream();
			wb.write(outputStream);  
			outputStream.flush();  
			outputStream.close();  
			result = Constants.SUCCESS;
		}catch(IOException e){
			LOGGER.error("导出成绩单excel失败！", e);
			result = Constants.FAIL;
		}  
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		return jsonobj;
	}
}
