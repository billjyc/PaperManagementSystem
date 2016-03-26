/*教师页面的javascript文件*/


function stopBubble(e) { 
//如果提供了事件对象，则这是一个非IE浏览器 
if ( e && e.stopPropagation ) 
    //因此它支持W3C的stopPropagation()方法 
    e.stopPropagation(); 
else
    //否则，我们需要使用IE的方式来取消事件冒泡 
    window.event.cancelBubble = true; 
}

$(document).ready(function(){
	/*处理论文初审的标签切换功能*/
	/*tab_bt1是用户点击待修改标签，显示待修改标签，并将这个标签的图片position位置设为0 0px；字体为白色
		将批准通过标签图片位置定位 126px 0px，字体为黑色，并显示待修改部件bemodify_area,隐藏通过部件pass_area
	*/
	$(".firstedit_area .tab_bt1").click(function(){
		$(".firstedit_area .tab_bt1").css({"background-position":"0 0px","color":"#ffffff"});
		$(".firstedit_area .tab_bt2").css({"background-position":"126px 0px","color":"#000000"});
		$(".pass_area").hide();
		$(".bemodify_area").show();
	});
	/*这个事件是点击"批准通过"标签，操作与上面相反*/
	$(".firstedit_area .tab_bt2").click(function(){
		$(".firstedit_area .tab_bt2").css({"background-position":"0 0px","color":"#ffffff"});
		$(".firstedit_area .tab_bt1").css({"background-position":"126px 0px","color":"#000000"});
		$(".bemodify_area").hide();
		$(".pass_area").show();
	});
	/*这个事件响应点击"查看附言"和"收起附言"按钮，根据标签的内容判断当前状态。并执行逻辑显示或隐藏附言组件fuyan_area
		附言获得应该有个ajax事件，待补充
	*/
	$(".firstedit_area #chakan_fuyan").click(function(){
		/*chakan_str是按钮的文字*/
		var chakan_str=$(this).html();
		
		if(chakan_str=="查看附言"){
			/*执行ajax操作或其他操作，获得附言内容*/
			/*显示附言组件*/
			$(".firstedit_area .fuyan_area").css({"display":"inline-block"});
			/*更改按钮文字提示*/
			$(this).html("收起附言");
			
		}else if(chakan_str=="收起附言"){
			/*隐藏附言组件*/
			$(".firstedit_area .fuyan_area").hide();
			/*更改按钮文字*/
			$(this).html("查看附言");
		}else{}
	});
	
	/*初审任务，待修改组件提交事件*/
	$(".firstedit_area .submit_area .bemodify_area .submit_bt1").click(function(){
		var paper_id = $(".firstedit_area .paperinfo_area #paper_id").attr("value");
		//alert(paper_id);
		var paper = new Object();
		paper.id = paper_id;
		paper.affix2 = $(".firstedit_area .submit_area .bemodify_area .addtion_area").val();
		//alert(paper.affix2);
		paper.filename = $(".firstedit_area .submit_area .bemodify_area .import_file").val();
		//alert(paper.filename);
		paper.taskId = $(".firstedit_area .paperinfo_area #task_id").attr("value");
		var paperstr = $.toJSON(paper);
		$.post("bemodify.do",{"paperstr":paperstr},function(data){
			alert(data.result_json);
			window.location.href ="teacher_firstcheck.html";
		
		},"json");
		
	});
	/*初审任务，初稿通过组件提交事件*/
	$(".firstedit_area .submit_area .pass_area .submit_bt1").click(function(){
		var yjb = new Object();
		yjb.filename  = $(".firstedit_area .submit_area .pass_area .import_file").val();
		yjb.paper_id = $(".firstedit_area .paperinfo_area #paper_id").attr("value");
		yjb.task_id = $(".firstedit_area .paperinfo_area #task_id").attr("value");
		
		var yjbstr = $.toJSON(yjb);
		$.post("verifyfirstcheck.do",{"yjbstr":yjbstr},function(data){
			alert(data.result_json);
			window.location.href ="teacher_firstcheck.html";
		},"json");
	});
	
	//所有学生信息
	$(".sidebar dd:eq(0)").click(function(){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "student_info.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
      //    error: function(XMLResponse){alert(XMLResponse.responseText);}  
        });  
	});
	//论文列表
	$(".sidebar dd:eq(1)").click(function(){
		$.ajax({  
			type: "post",
            dataType: "text",
            url: "proposal_unchecked.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
      //    error: function(XMLResponse){alert(XMLResponse.responseText);}  
        });  
	});
	
	//待审开题报告
	$(".sidebar dd:eq(1) ul li:eq(0)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "proposal_unchecked.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);
	});
	//已通过开题报告
	$(".sidebar dd:eq(1) ul li:eq(1)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "proposal_passed.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);
	});
	//待审中期检查
	$(".sidebar dd:eq(1) ul li:eq(2)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "interim_report_unchecked.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);
	});
	//已通过中期检查
	$(".sidebar dd:eq(1) ul li:eq(3)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "interim_report_passed.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);
	});
	//所有论文列表
	$(".sidebar dd:eq(1) ul li:eq(4)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "all_thesis.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);    //  阻止事件冒泡
	});
	//完成初稿列表
	$(".sidebar dd:eq(1) ul li:eq(5)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "firstcheck.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);   //  阻止事件冒泡
	});
	/*
	//通过重复率列表
	$(".sidebar dd:eq(1) ul li:eq(6)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "detection_passed.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        });
		stopBubble(e);    //  阻止事件冒泡
		});
		*/
	//通过评审列表
	$(".sidebar dd:eq(1) ul li:eq(6)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "before_defense.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        }); 
		stopBubble(e);    //  阻止事件冒泡
	});
	//暂缓通过列表
	$(".sidebar dd:eq(1) ul li:eq(7)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "reprieve_list.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        });  
		stopBubble(e);    //  阻止事件冒泡
	});
	
	//通过答辩列表
	$(".sidebar dd:eq(1) ul li:eq(8)").click(function(e){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "defense_finalize.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
        });  
		stopBubble(e);   //  阻止事件冒泡
	});
	//已归档列表
    $(".sidebar dd:eq(1) ul li:eq(9)").click(function(e){
		
        
    	stopBubble(e);    //  阻止事件冒泡
	});
	//消息处理
	$(".sidebar dd:eq(2)").click(function(){
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../suggestions/new_suggestion.jsp",
			beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}
		});
		
	});
	//发起会话
	$(".sidebar dd:eq(2) ul li:eq(0)").click(function(e){
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../suggestions/new_suggestion.jsp",
			beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}
		});
		stopBubble(e);  //  阻止事件冒泡
	});
	//待回复列表
	$(".sidebar dd:eq(2) ul li:eq(1)").click(function(e){
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../suggestions/need_reply.jsp",
			beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}
		});
		stopBubble(e);    //  阻止事件冒泡
	});
	//已发送列表
	$(".sidebar dd:eq(2) ul li:eq(2)").click(function(e){
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../suggestions/send_list.jsp",
			beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}
		});
		stopBubble(e);   //  阻止事件冒泡
	});
	//交互日志
	$(".sidebar dd:eq(3)").click(function(){
		$.ajax({
			type:"post",
			dataType:"text",
			url:"../suggestions/record.jsp",
			beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}
		});
	});
});
