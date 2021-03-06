<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String actorName = (String)request.getSession().getAttribute("actorName");
String actorLabel = (String)request.getSession().getAttribute("actorLabel");
Integer accountId = (Integer)request.getSession().getAttribute("accountId");
%>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript">
	var receiver_list=new Array();
	var affix_list = new Array();
	var ret_path_list = new Array();
    $(document).ready(function(){
        CKEDITOR.replace('editor1');
        receiver_list = new Array();
        affix_list = new Array();
        ret_path_list = new Array();
        if(<%=actorLabel=="teacher" %>){
        //获得教师的学生列表
	        var studentlist = new Object();
			$.post("studentlist.do",{},function(data){
				console.log(data);
				studentlist = data.list;
				show_studentlist(studentlist);
			},"json");
		}else{
			//获得指导老师信息
			$.post("student_teacher_info.do", null, function(data) {
				var tutor = data.teacher;
				$("#student_list").append(
					'<li class="item" onclick="addAddr('+tutor.accountId+',\''+tutor.teacherName+'\')"><input id="check'+tutor.accountId+'" type="checkbox" />'+tutor.teacherName+'</li>');	
			}, "json");
		}
		if(<%=request.getParameter("suggestion_id")!=null%>){
          addAddr(<%=request.getParameter("receiver_id")%>,"<%=request.getParameter("receiver_name") %>");
          $('#subject_compose_1').val("RE: <%=request.getParameter("subject")%>");
        }
    });
    function showReceiver(){
		$("#receiver").show();
    }
    function hideReceiver(){
    	$("#receiver").hide();
    }
    function show_studentlist(studentlist){
    	if(studentlist.length==0){
			$("#student_list").append('<li>暂无学生列表</li>');
		}else{
			for(i=0;i<studentlist.length;i++){
				$("#student_list").append(
				'<li class="item" onclick="addAddr('+studentlist[i].accountId+',\''+studentlist[i].studentName+'\')"><input id="check'+studentlist[i].accountId+'" type="checkbox" />'+studentlist[i].studentName+'</li>');		
			}
		}
    }
   function addAddr(id,name){
   		if(!$("#check"+id).attr('checked')){
	    	$("#check"+id).attr('checked',true);
	    	$("#rec1p_compose_1").append(
	    	'<div class="apadd_suc" id="receiver'+id+'">'+
	    	'<span>'+name+'</span>'+
	    	'<b class="apaddshan" onclick="delAddr('+id+');" title="删除"></b></div>');
	    	receiver_list.push(id);
	    }else{
	    	delAddr(id);
	    }
    };
    function delAddr(id){
    	$("#receiver"+id).remove();
    	$("#check"+id).attr('checked',false);
    	receiver_list.splice($.inArray(id,receiver_list),1);
    }
    function sendEmail(){
    	var editor_data = CKEDITOR.instances.editor1.getData();
    	 var emailObj = {
			 "receiver_list" : receiver_list,
			 "affix_list" :ret_path_list,
			 "user_id" : $("#user_id").val(),
			 "suggestion_content":editor_data,
			 "suggest_title":$("#subject_compose_1").val(),
			 "cor_suggestion_id":(<%=request.getParameter("suggestion_id")!=null%>)?<%=request.getParameter("suggestion_id")%>:-1
		 };
		 var jsonStr = "jsonStr=" + JSON.stringify(emailObj);
		 $.post("../suggestions/addsuggestion.do", jsonStr ,function(msg) {
			 if(msg.result_json == "success")
				alert("发送成功！");
				$.ajax({
					type:"post",
					async:false,
					url:"../suggestions/send_list.jsp",
					error:function(XMLHttpRequest, textStatus, errorThrown){     
		                       alert(XMLHttpRequest.status);
		                       alert(XMLHttpRequest.readyState);
		                       alert(textStatus); 
		                       alert("error:\n " + errorThrown);
		               },
		            success: function(data){$(".main_container").html(data);}
				});
				$(".sidebar dd:eq(2) ul li:eq(0)").removeClass("on");
				$(".sidebar dd:eq(2) ul li:eq(1)").removeClass("on");
				$(".sidebar dd:eq(2) ul li:eq(2)").addClass("on");
		},"json");
    }
    function FileUpload_onselect(obj){
        var path=$("#affix").val();
        var ret_path = '';
        if(path==''){
        	alert("请选择文件！");
        }
        else{if($.inArray(path,affix_list)!=-1){
	        	alert("文件已经上传过！");
	        }else{
	        	var name=path.split('\\');
		        var affix=name[name.length-1];
		        $.ajaxFileUpload({
					url : "../suggestions/submitaffix.do",
					secureuri : false,
					fileElementId : "affix",
					dataType : "json",
					success : function(data, status)
					{
						ret_path = data.ret_path;
						$("#affix_list").append("<div class='attsep' id=''>"+
						"<span>"+affix+"</span>"+
						"<a href='javascript:void(0);' onclick='deleteAffix(this,\""+path+"\",\""+ret_path+"\")'>删除</a></div>");
			        	affix_list.push(path);//添加到附件数组
				        ret_path_list.push(ret_path);
					},
					error : function(data, status, e)
					{
						alert("上传失败");
					}
				});
				var copy = obj.cloneNode(true);
		        copy.value="";
		        obj.parentNode.replaceChild(copy, obj);//清空input file中值
		    }
        }
    }
    function deleteAffix(e,path,ret_path){
    	$(e).parent().remove();
    	affix_list.splice($.inArray(path,affix_list),1);
    	ret_path_list.splice($.inArray(ret_path,ret_path_list),1);
    }
</script>
<div class="new_suggestion">
	<div class="col">
		<span class="label">发件人：</span>
		<div><input type="hidden" id="user_id" value="<%=accountId %>" /><span class="sender"><%=actorName %></span></div>
	</div>
	<div class="col">
		<%if(request.getParameter("suggestion_id")!=null){ %>
		<span class="label">收件人</span>
		<%}else{ %>
		<a class="label" href="javascript:void(0);" onclick="showReceiver();">收件人：</a>
		<%} %>
		<div class="apadd" id="rec1p_compose_1" <%if(request.getParameter("suggestion_id")==null){ %>title="点击&quot;收件人&quot;打开通讯录面板"<%} %>>
			<textarea id="rec1t_compose_1" style="width:50px;"></textarea>
        </div>
        <div class="student_list" id="receiver" style="display:none;">
    		<ul id="student_list">
    			<li class="top"><span>所有联系人</span><a id="close" href="javascript:void(0);" onclick="hideReceiver();">关闭</a></li>
    		</ul>
		</div>
	</div>
	<div class="col">
		<span class="label">主题：</span>
		<div class="apadd">
			<input type="text" name="subject" id="subject_compose_1" value="">						
        </div>
	</div>
	<div class="col" id="affix_list">
		<div>
			<a id="upload_affix" href="javascript:void(0)" onclick="addFile(this)" style="position:relative;">上传附件</a>
			<input id="affix" name="affix" type="file" value="" onchange="FileUpload_onselect(this)" />
		</div>
	</div>
	<div class=col><textarea id="editor1" name="editor1"></textarea></div>
	<div class=col><a href="javascript:void(0);" onclick="sendEmail();" style='background:url("../image/3-btn.png") no-repeat 0 0;width:94px;height:31px;display:inline-block;text-align:center;line-height:31px;font-family:"微软雅黑";font-size:16px;color:#fff;font-weight:bold;'>发送</a></div>
</div>