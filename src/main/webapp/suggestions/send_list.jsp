<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String actorName = (String)request.getSession().getAttribute("actorName");
String actorId = (String)request.getSession().getAttribute("actorId");
%>
<script>
	$(document).ready(function(){
		$.post("../suggestions/sendlist.do",{},function(data){
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
				$(".record_theme").append(
				'<div class="record" onclick="showSuggestionContent('+list[i].suggestionId+')">'+
					'<div class="record_title">'+list[i].suggestTitle+'</div>'+
	        		'<div class="info">'+
	          			'<div class="sender">'+list[i].senderName+'</div>'+
	          			'<div class="time">'+list[i].suggestTime+'</div>'+
	        		'</div>'+
	        		'<div class="clear"></div></div>');
	        	}
		 }else{
		 	$(".record_theme").html("暂无已发送项");
		 	$(".record_detail").html("");
		 }
		}
		function showSuggestionContent(id){
			$.post("../suggestions/getsuggestiondetail.do",{suggestion_id:id},function(data){
				var sugg = data.sugg;
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
	     <div class="title">
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