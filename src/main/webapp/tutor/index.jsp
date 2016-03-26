<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%	
	Integer accountId = (Integer)session.getAttribute("accountId"); 
	Integer teacherId = (Integer)session.getAttribute("teacherId");
%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<head>	
<title>导师工作</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />

<link rel="stylesheet" type="text/css" media="screen" href="../css/jquery-ui-custom.css" /> 
<link rel="stylesheet" type="text/css" media="screen" href="../css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="../css/jquery.growl.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/EasyUI/messager.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../css/EasyUI/icon.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../css/EasyUI/easyui.css" />

<link rel="stylesheet" href="../css/global.css" type="text/css" />
<link rel="stylesheet" href="../css/jquery.mCustomScrollbar.css" type="text/css" />
<link rel="stylesheet" href="../css/record.css" type="text/css" />
<link rel="stylesheet" href="../css/tutor.css" type="text/css" />
<link rel="stylesheet" href="../css/suggestion.css" type="text/css" />

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>  
<script src="../js/jquery-1.11.2.min.js" type="text/javascript" ></script> 
<script src="../js/teacher.js" type="text/javascript" ></script>
<script src="../js/contants.js" type="text/javascript" ></script>
<script src="../js/jquery.json-2.4.min.js" type="text/javascript" ></script>
<script src="../js/jquery-ui-custom.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<!-- custom scrollbars plugin -->
<script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript" src="../js/grid.locale-cn.js"></script> 
<script type="text/javascript" src="../js/jquery.jqGrid.min.js"></script> 
<script type="text/javascript" src="../js/sockjs-0.3.4.js"></script> 
<script type="text/javascript" src="../js/stomp.js"></script> 
<script src="../js/jquery.growl.js" type="text/javascript" ></script>
<script type="text/javascript" src="../js/teacherMessage.js"></script> 

<script type="text/javascript" >
	$(document).ready(function(){
		$.ajax({  
            type: "post",
            dataType: "text",
            url: "student_info.jsp",
            beforeSend: function(){$(".main_container").html("<div style='font-size:18px;margin:100px auto;width:200px'>表格加载中···</div>");},  
            success: function(data){$(".main_container").html(data);}  
      //    error: function(XMLResponse){alert(XMLResponse.responseText);}  
        });		
	});
	
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="body_container">
	<%@ include file="sidebar.jsp" %>
	<!-- Main Content Begin -->
	<div class="main_container" id="main_container">
	</div>
</div>
<%@ include file="../footer.jsp" %>
<script type="text/javascript">
	var accountId = <%=accountId%>;
	var teacherId = <%=teacherId%>;
	$(function() {
		connect(accountId, teacherId);
		window.setInterval(function(){
			getMsg(accountId, teacherId);
		}, 120*1000);
	});
</script>
</body>
</html>