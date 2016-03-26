/*学生页面JS文件*/
$(document).ready(function(){
	/*页面编写过程中用于各部件显示与隐藏的调试部分*/
	/*未提交论文状态提交论文事件*/
	$(".unsubmit_content .submit_bt").click(function(){
		var paper = new Object();
		paper.title = $(".unsubmit_content .paper_title .title_input").val();
		paper.affix = $(".unsubmit_content .textarea_right_t").val();
		
		var paper_json = $.toJSON(paper);
		
		$.post("submitpaper.do",{"paperstr":paper_json},function(data){
			alert(data.result_json);
			window.location.href ="student_paper.html";
		},"json");
	});
	
	/*初次修改论文提交论文事件*/
	$(".firstmodify_content .submit_bt").click(function(){
		var paper = new Object();
		paper.affix1 = $(".firstmodify_content .textarea_right_t").val();
		paper.filename = $(".firstmodify_content .submit_file").val();
		alert(paper.affix1);
		var paper_json = $.toJSON(paper);
		$.post("updatepaper.do",{"paperstr":paper_json},function(data){
			alert(data.result_json);
			window.location.href ="student_paper.html";
		},"json");
		
	});
	
});
/*获得学生session中studentId的方法*/
function getSessionId(){
	var sessionId ="";
	$.post("getsessionid.do",{},function(data){
		sessionId = data.sessionid;
	},"json");
	return sessionId;
}
function show_firstmodify_content(){
	$.post("getpaper.do",{},function(data){
		var paper = data.paper;
		$(".firstmodify_content #papertitle").html(paper.paperTitle);
		$(".firstmodify_content .textarea_right_p").html(paper.paperAffix2);
	},"json");
}
