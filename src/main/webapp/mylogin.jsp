<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/global.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.form.js"></script>
	<script type="text/javascript">
		function checkNull() {
			var username = $("#username").val();
			console.log(username);
			if(username == "") {
				alert("用户名为空！");
				return false;
			}
			var password = $("#passwordFake").val();
			if(password == "") {
				alert("密码为空！");
				return false;
			}
			return true;
		}
		//获取后台传回的数据判断用户名和密码是否匹配
		$(document).ready(function(){
			var options = {
				success: function(data) {
					console.log(data);
				}
			};
			
			$("#loginBox").submit(function(){
				$(this).ajaxSubmit(options);
				//console.log(checkNull());
			});
			
		});
	</script>
  </head>
  
  <body>
    <div class="login_head"></div>
    <div class="login_content">
	    <div class="side">
			<div class="side-login">
				<div class="side-login-title">
					学位论文系统
				</div>
				<form id="loginBox" method="post" action="<%=basePath%>login.do">
					<p>
						<label class="side-login-lbl" for="email">
							账号
						</label>
						<input type="text" id="username" name="username" class="s_txt"
							maxlength="40" tabindex="1" />
					</p>
					<p>
						<label class="side-login-lbl" for="passwordFake">
							密码
						</label>
						<input type="password" id="passwordFake" name="passwordFake"
							class="s_txt" maxlength="100" tabindex="2" />
					</p>
					<input type="hidden" id="password" name="password" />
					<p>
						<label class="side-login-rem" for="remLogin">
							<input type="checkbox" name="remLogin" id="remLogin" tabindex="3" />
							记住我
						</label>
						<a href="#" class="side-login-pwd">忘记密码？</a>
						<a class="side-login-bt"><input type="submit" value="登 录"
								tabindex="4" onclick="return checkNull()"/> </a>
					</p>
				</form>
				<p class="side-connect">
					<a href="http://software.nju.edu.cn/" class="njusoftware">南京大学软件学院</a>
				</p>
			</div>
		</div>
    </div>
    <div class="login_footer">
      <div>Copyright© 2015 南京大学软件学院版权所有</div>
	  <div>南京市汉口路22号，南京大学软件学院(费彝民楼B座4-9层) 210093</div>
	  <div>025-83621002, 025-83621369</div>
    </div>
  </body>
</html>
