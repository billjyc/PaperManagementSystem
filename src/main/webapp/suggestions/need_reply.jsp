<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String actorName = (String)request.getSession().getAttribute("actorName");
String actorId = (String)request.getSession().getAttribute("actorId");
%>
<script>
	$(document).ready(function(){
		$.post("../suggestions/needreply.do",{},function(data){
			show_suggestion(data.list);
			$(".record_theme").mCustomScrollbar({
				autoHideScrollbar:true,
				scrollButtons:{
					enable:true
				},
				theme:"dark-thick"
			});
		},"json");
		$(".record_detail").mCustomScrollbar({
		    autoHideScrollbar:true,
			scrollButtons:{
				enable:true
			},
			theme:"dark-thick"
		});
	});
	
	function show_suggestion(list){
		if(list.length!=0){
			var sugg = list[0];
			showSuggestionContent(sugg.suggestionId);
			for(i=0;i<list.length;i++){
				var suggestion_id = list[i].suggestionId;
				$(".record_theme").append(
				'<div id=suggestion_' + suggestion_id + ' class="record" onclick="showSuggestionContent('+list[i].suggestionId+');">'+
					'<div class="record_title">'+list[i].suggestTitle+'</div>'+
	        		'<div class="info">'+
	          			'<div class="sender">'+list[i].senderName+'</div>'+
	          			'<div class="time">'+list[i].suggestTime+'</div>'+
	        		'</div></div>');
				var hasRead = list[i].isRead;
				//console.log(suggestion_id + " " + hasRead);
				if(hasRead == true) {
					$("#suggestion_" + suggestion_id).find(".record_title").addClass("hasread");
				} else {
					$("#suggestion_" + suggestion_id).find(".record_title").addClass("notread");
				}
			}
		 } else{
		 	$(".record_theme").html("暂无待回复项");
		 	$(".record_detail").html("");
		 }
	}
		
	function reply(){
	//试图转到新开始会话页面并传入参数suggestion_id,在开始会话的页面判断是否有该参数，有参数的话，传到controller中，还是用新开始会话的方法，会根据有无参数
	//有的话，往回复的那个表里一条记录
	    var data = 'suggestion_id='+$("#suggestionId").val()+'&receiver_id='+ $("#receiverId").val()+'&receiver_name='+$("#receiverName").val()+'&subject='+$("#subject").val();
		$.ajax({
			type:"post",
			data:data,
			async:false,
			url:"../suggestions/new_suggestion.jsp",
			error:function(XMLHttpRequest, textStatus, errorThrown){     
                       alert(XMLHttpRequest.status);
                       alert(XMLHttpRequest.readyState);
                       alert(textStatus); 
                       alert("error:\n " + errorThrown);
               },
            success: function(data){$(".main_container").html(data);}
		});
	}
	
	function showSuggestionContent(id){
		//将该条消息标记为已读
		$.ajax({
			type: "POST",
			url: "../suggestions/setSuggestionHasRead/" + id,
			dataType: "json",
			success: function(data) {
				$("#suggestion_" + id).find(".record_title").removeClass("notread").addClass("hasread");
			}
		});
		$.post("../suggestions/getsuggestiondetail.do",{suggestion_id:id},function(data){
			var sugg = data.sugg;
			$("#suggestionId").attr("value",sugg.suggestionId);
			$("#receiverId").attr("value",sugg.userId);
			$("#receiverName").attr("value",sugg.senderName);
			$("#subject").attr("value",sugg.suggestTitle);
			$(".record_detail .title").html(sugg.suggestTitle);
			$(".record_detail .info .sender").html("发件人："+sugg.senderName);
			$(".record_detail .info .time").html("日期："+sugg.suggestTime);
			$(".record_detail .record_body .bodytxt").html(sugg.suggestContent);
			$(".record_detail .attachments").html("");
			if(sugg.affixList.length!=0){
				$(".record_detail .attachments").html("<span>附件：</span>");
				for(i=0;i<sugg.affixList.length;i++){
					var path = sugg.affixList[i];
					var name=path.split('\\');
		        	var affix=name[name.length-1]; 
					$(".record_detail .attachments").append(
						"<span class='attachment'><a href='javascript:void(0);' onclick='downloadpaper(this)'>"+affix+"<span style='display:none;'>"+path+"</span></a></span>");
				}
			}
		},"json");
	}
	
	function setSuggestionHasRead() {
		
	}
	
	function downloadpaper(e) {
		var path = $(e).children("span")[0].innerHTML;
		var url = "../suggestions/downloadaffix.do";
		var method='post';
		jQuery(
				'<form action="' + url + '" method="' + (method || 'post')
						+ '"><input name="path" type="hidden" value="'+path+'" /></form>')
		.appendTo('body').submit()
		.remove();
	}
	
</script>
<div class="record_container">
 <div class="record_content">
    <div class="record_theme" id="record_theme">
    </div>
    <div class="record_detail">
    	 <div class="record_header">
    	 	 <input type="hidden" id="suggestionId" />
			 <input type="hidden" id="receiverId" />
			 <input type="hidden" id="receiverName" />
			 <input type="hidden" id="subject" />
		     <a class="reply" href="javascript:void(0);" onclick="reply();">回&nbsp;&nbsp;复</a>
		     <div class="title">
		     </div>
	     </div>
	     <div class="info">
	       <div class="sender"></div>
	       <div class="time"></div>     
	     </div>
     	<div class="clear"></div>
	     <div class="attachments">
	     </div>
	     <div class="record_body">
	       <div class="bodytxt">
	       </div>
	     </div>
    </div>
    <div class="clear"></div>
 </div>
</div>