<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<title>首页</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" href="css/global.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
<style>
body{background:#F3F8F1;}
.index_container{overflow:hidden;width:100%;min-height:460px;background:url("css/images/bg1.png") no-repeat -2px;}
.footer{margin-top:0;margin-bottom:0;}
.title { padding-left:10px;font-size:14px;font-weight:bold;background:#c8d7e3;height:29px;line-height:29px;border-bottom:1px solid #99AFC4;}
.title a{float:right;margin-right:10px;font-size:12px;font-weight:normal;}
li,li a{color:#414141;}
.index_main li .time{float:right;margin-right:20px;}
#notice li, #link li{line-height:30px;padding-left:10px;}
.index_main {margin-top:107px;margin-left:63px;width:450px;}
.index_main .index_nav a{background-color: #DDEDFB;-webkit-border-radius: 5px;padding: 5px 10px;display: inline-block;width: 80px;height: 25px;line-height: 25px;text-align: center;color: #09c;}
.index_main .index_nav a:hover,.index_main .index_nav .on{background:#09C;color:#DDEDFB;text-decoration:none;}
.index_main .bd{height:2px;background:#09c;margin-top:3px;width:450px;}
.more{float: right;height: 35px;line-height: 35px;margin-right: 10px;color:#09c;}
</style>
<script>
	function show(type){
	if(type==1){
		$("#notice").show();
		$("#link").hide();
		$("#nav1").addClass("on");
		$("#nav2").removeClass("on");
	}else{
		$("#notice").hide();
		$("#link").show();
		$("#nav2").addClass("on");
		$("#nav1").removeClass("on");
	}
}
</script>
</head>
<body>

<script>
	
	$.post("shownotice.do",{},function(data){
		var list = eval(JSON.stringify(data.list));
		for(var i = 0; i < list.length; i++){
			$("#notice ul").append('<li><a href="">' + list[i].noticeTheme+'</a><span class="time">' + list[i].noticeTime+ '</span></li>');
		}
	},"json");
	
	$(".attach").click(function() {
		var name = $(this).attr("href");
		console.log("name=" + name);
	});
	
	function downloadAttach() {
		var name = $(".attach").click;
		
  	  	var url = "./downloadAttach.do";
  		var method='post';
  		jQuery(
  				'<form action="' + url + '" method="' + (method || 'post')
  						+ '"><input name="path" type="hidden" value="'+path+'" /></form>')
  		.appendTo('body').submit()
  		.remove();
	}

</script>

<%@ include file="header.jsp" %>
<div class="index_container">
	<div class="index_main">
		<div class="index_nav">
			<a href="javascript:void(0);" onclick="show(1)" id="nav1" class="on">通知公告</a>
			<a href="javascript:void(0);" onclick="show(2)" id="nav2">相关链接</a>
			<span class="more">更多&gt;&gt;</span>
		</div>
		<div class="bd"></div>
		<div class="notice" id="notice">
			<ul>
			</ul>
		</div>
		<div class="link" id="link" style="display:none;">
			<ul>
				<li>
				<a href="/pms/file/TeacherAssign.xls" class="attach" target="_blank">导师分配表.含数据.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
				<li>
				<a href="<%=basePath%>file/导师论文指导费.xls" class="attach">导师论文指导费.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
				<li>
				<a href="<%=basePath%>file/开题报告模板.xls" class="attach">开题报告模板.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
				<li>
				<a href="<%=basePath%>file/附表一.导师评语.xls" class="attach">附表一.导师评语.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
				<li>
				<a href="<%=basePath%>file/论文答辩费.xls" class="attach">论文答辩费.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
				<li>
				<a href="<%=basePath%>file/论文评审费.xls" class="attach">论文评审费.xls</a>
				<span class="time">[2013-03-26]</span>
				</li>
			</ul>
		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
