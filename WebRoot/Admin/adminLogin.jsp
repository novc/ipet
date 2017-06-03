<%@ page language="java" pageEncoding="GBK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>ipet后台登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="icon" href="Admin/images/icon.png">
	<link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
	<link rel="stylesheet" type="text/css" href="Admin/css/adminLogin.css">
	<script src="Admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function login() {
		var sName = document.getElementById("name").value;
		var sPassword = document.getElementById("password").value;
		if(sName != "") {
			if(sPassword != ""){
				$(".message").html("");
				$("form").submit();
			}else{
				$(".message").html("密码不能为空");
			}
		}else{
			$(".message").html("登录名不能为空");
		}
	}
</script>
  </head>
  
  <body>
    <div class="header w-max w">
		<h1 class="logo fl"><a href=""><img src="Admin/images/logo.png"></a></h1>
		<div class="shortcut">
			<a href="">首页</a>
			|
			<a href="">用户登录</a>
		</div>
	</div>
	<div class="main">
		<div class="login-wrap bgwhite">
			<div class="login-area">
				<form action="adminLoginServlet" method="post" name="form" id="form">
					<div class="login-title">管理员登录</div>
					<div class="input user mt20">
						<i class="icon user-ico"></i>
						<input type="text" id="name" name="name" />
					</div>
					<div class="input password mt20">
						<i class="icon psw-ico"></i>
						<input type="password" id="password" name="password">
					</div>
					
					<div class="message">${message}</div>
					<input class="submit mt15" type="button" onclick="login()" value="登录" />
				</form>
				
			</div>
		</div>
	</div>
	<div class="footer w w-max">
		宠物商城  At 2017/5/5
	</div>
  </body>
</html>
