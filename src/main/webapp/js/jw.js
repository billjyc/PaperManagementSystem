$(document).ready(function(){
	//负责导入学生页面和导入导师页面的“导入信息”和"导入文件"标签切换
	//.sdtab点击事件，导入信息标签变亮，导入文件标签变暗。导入信息部件显示，导入信息部件隐藏。
	 $(".sdtab").click(function(){
		$(this).css({"background-position":"0 0px","color":"#ffffff"});
		$(".wjtab").css({"background-position":"126px 0px","color":"#000000"});
		$(".import_info").show();
		$(".import_wj").hide();
	 });
	 //.wjtab点击事件，导入文件标签变亮，导入信息标签变暗。导入文件部件显示，导入信息信息隐藏。
	 $(".wjtab").click(function(){
		$(this).css({"background-position":"0 0px","color":"#ffffff"});
		$(".sdtab").css({"background-position":"126px 0px","color":"#000000"});
		$(".import_info").hide();
		$(".import_wj").show();
	 });
	 //处理分配导师页面的选择待分配学生的复选框只能选3个的逻辑
	 //checkbox_num记录以选中的学生个数
	 //var checkbox_num=0;
	 //$(".student_checkbox").click(function(){
		
	 //});
	

	

	/*导入学生按钮事件*/
	$(".import_student_area .import_bt").click(function(){
		//alert("提交学生信息");
		var dispalystr = $(".import_student_area").find(".import_info").eq(0).css("display");
		//alert(dispalystr);
		if(dispalystr=="block"){
		//表单提交学生信息
			var student = new Object();
			student.name=$(".import_student_area #student_name").val();
			student.num = $(".import_student_area #student_num").val();
			student.email = $(".import_student_area #student_email").val();
			student.grade = $(".import_student_area #student_grade").val();
			student.phone = $(".import_student_area #student_phone").val();
			var jsonobj = $.toJSON(student);
			$.post("importstudent.do",{"studentstr":jsonobj},function(data){
				alert(data.result_json);
			},"json");
		}else{
		//excel提交学生信息
		}
	});
	
	/*导入教师按钮事件*/
	$(".import_teacher_area .import_bt").click(function(){
		var dispalystr = $(".import_teacher_area").find(".import_info").eq(0).css("display");
		
		if(dispalystr=="block"){
			//表单导入教师信息
			var teacher = new Object();
			teacher.name = $(".import_teacher_area #teacher_name").val();
			teacher.num = $(".import_teacher_area #teacher_num").val();
			teacher.classes = $(".import_teacher_area #teacher_classes").val();
			teacher.zc = $(".import_teacher_area #teacher_zc").val();
			teacher.education = $(".import_teacher_area #teacher_education").val();
			teacher.email = $(".import_teacher_area #teacher_email").val();
			teacher.phone = $(".import_teacher_area #teacher_phone").val();
			var jsonobj = $.toJSON(teacher);
			//alert(jsonobj);
			$.post("importteacher.do",{"teacherstr":jsonobj},function(data){
				alert(data.result_json);
			},"json");	
		}else{
			//excel文件导入教师信息
		}
	});
	
	//学生分配导师信息提交事件
	$(".assign_area .import_bt").click(function(){
		var student_assign_list = $(".assign_area .student_list input:checked");
		
		var teacher_assign_list = $(".assign_area .teacher_list input:checked");
		var student_list_tmp = new Array();
		var teacher_list_tmp = new Array();
		
		for(i=0;i<student_assign_list.length;i++){
			
			student_list_tmp[i] = student_assign_list.eq(i).val();
		}
		for(i=0;i<teacher_assign_list.length;i++){
			teacher_list_tmp[i] = teacher_assign_list.eq(i).val();
		}
		var student_list_str = $.toJSON(student_list_tmp);
		var teacher_list_str = $.toJSON(teacher_list_tmp);
		//alert(student_list);alert(teacher_list);
		//异步提交操作
		$.post("assignteacher.do",{"student_list_str":student_list_str,"teacher_list_str":teacher_list_str},function(data){
			alert(data.result_json);
			window.location.href ="jw_assign.html";
		},"json");
		
	});
	$(".ps_area .bt2").click(function(){
		var studentlist = $(".ps_area .student_area p[select='yes']");
		var nslist = $(".ps_area .ns_area p[select='yes']");
		var wslist = $(".ps_area .ws_area p[select='yes']");
		var nsdate = $(".ps_area #example_2").val();
		var wsdate = $(".ps_area #example_1").val();
		var bool = true;
		if(studentlist.length<=0){
			alert("选择学生");
			bool = false;
			return;
		}
		if(nslist.length<=0){
			alert("选择内审");
			bool = false;
			return;
		}
		if(wslist.length<=0){
			alert("选择外审");
			bool = false;
			return;
		}
		if(nsdate ==""){
			alert("选择内审截止日期");
			bool = false;
			return;
		}
		if(wsdate ==""){
			alert("选外审审截止日期");
			bool = false;
			return;
		}
		if(bool){
			//alert("提交评审分配");
			var list1 = new Array();
			for(i=0;i<studentlist.length;i++){
				list1[i]=studentlist.find("input[id='studentId']").val();
			}
			var liststr = $.toJSON(list1);
			var nsid = nslist.find("input[id='teacherId']").val();
			var wsid = wslist.find("input[id='teacherId']").val();

			$.post("assignjudge.do",{"liststr":liststr,"nsid":nsid,"wsid":wsid,"nsdate":nsdate,"wsdate":wsdate},function(data){

				alert(data.result_json);
				if(data.result_json=="success"){
					studentlist.remove();
					
				}
			},"json");
		}
		
	});
	
	//end
});
/*重复率检测通过*/
function accept_check(data){
	var paper = new Object();
	
	paper.paperId = $(".check_area .table_area").find("p[data-index='"+data+"']").find("#paperId").val();
	paper.taskId = $(".check_area .table_area").find("p[data-index='"+data+"']").find("#taskId").val();
	paper.detection = "true";
	var num =data;
	var paperstr = $.toJSON(paper);
	$.post("deciderepetition.do",{"paperstr":paperstr},function(data){
		if(data.result_json=="success"){
			alert(data.result_json);
			$(".check_area .table_area").find("p[data-index='"+num+"']").remove();
		}else if(data.result_json=="fail"){
			alert(data.result_json);
			$(".check_area .table_area").find("p[data-index='"+num+"']").remove();
		}else{
		
		}
	},"json");
	
};
/*重复率检测失败*/
function reject_check(data){
	var paper = new Object();
	
	paper.paperId = $(".check_area .table_area p[data-index='"+data+"']").find("#paperId").val();
	
	paper.taskId = $(".check_area .table_area").find("p[data-index='"+data+"']").find("#taskId").val();
	paper.detection = "false";
	var num=data;
	var paperstr = $.toJSON(paper);
	$.post("deciderepetition.do",{"paperstr":paperstr},function(data){
		if(data.result_json=="success"){
			alert(data.result_json);
			$(".check_area .table_area").find("p[data-index='"+num+"']").remove();
		}else if(data.result_json=="fail"){
			alert(data.result_json);
			$(".check_area .table_area").find("p[data-index='"+num+"']").remove();
		}else{
		
		}
	},"json");	
};
/*分配评审页面，提交评审信息*/

