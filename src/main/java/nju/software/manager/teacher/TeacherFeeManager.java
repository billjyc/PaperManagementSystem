package nju.software.manager.teacher;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import nju.software.entity.Fee;
import nju.software.jsonmodel.JsonFee;
import nju.software.service.FeeService;
import nju.software.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TeacherFeeManager {
	@Autowired
	private FeeService feeService;
	@Autowired
	private StudentService studentService;
	
	/**
	 * 所有费用列表
	 * @param teacherId
	 * @return
	 */
	public JSONObject getAllFees(Integer teacherId) {
		List<Fee> fees = feeService.getFeesByTeacherId(teacherId);
		List<JsonFee> jsonFees=new ArrayList<JsonFee>();
		for (int i=0;i<fees.size();i++){
			JsonFee jFee=new JsonFee(fees.get(i));
			jFee.setStudentName(studentService.getStudentById(jFee.getStudentId()).getStudentName());
			jFee.setStudentNum(studentService.getStudentById(jFee.getStudentId()).getStudentNumber());
			//jFee.setTeacherName(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherName());
			//jFee.setTeacherNum(teacherService.getTeacherById(jFee.getTeacherId()).getTeacherNumber());
			jsonFees.add(jFee);
		}

		JSONArray feelist_jsonobj = JSONArray.fromObject(jsonFees);	
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("list", feelist_jsonobj);
		return jsonobj;
	}
}
