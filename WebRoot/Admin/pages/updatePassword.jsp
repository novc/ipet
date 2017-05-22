<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>�޸�����</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
	<script type="text/javascript">
		var checkPassword_ = false;
		function checkPassword() {
			var password = document.getElementById("password");
			var passwordDiv = document.getElementById("passwordDiv");
			if(password.value == "") {
				passwordDiv.innerHTML = "���벻��Ϊ��";
				checkPassword_ = false;
			} else {
				passwordDiv.innerHTML = "";
				checkPassword_ = true;
			}
		}
		var checkRpassword_ = false;
		function checkRpassword() {
			var rpassword = document.getElementById("rpassword");
			var password = document.getElementById("password");
			var rpasswordDiv = document.getElementById("rpasswordDiv");
			if(rpassword.value == "") {
				rpasswordDiv.innerHTML = "ȷ�����벻��Ϊ��";
				checkRpassword_ = false;
			} else if(password.value != rpassword.value){
				rpasswordDiv.innerHTML = "����ȷ���д�";
				checkRpassword_ = false;
			} else {
				rpasswordDiv.innerHTML = "";
				checkRpassword_ = true;
			}
		}
		function update() {
			var oForm = document.getElementsByTagName("form")[0];
			var messageDiv = document.getElementById("messageDiv");
			if(checkRpassword_ && checkPassword_) {
				var name = oForm.name.value;
				var password = oForm.password.value;
				var rpassword = oForm.rpassword.value;
				oForm.action = "adminUpdatePassword?name="+name+"&password="+password+"&rpassword="+rpassword;
				oForm.submit();
			} else {
				messageDiv.innerHTML = "��������ȷ������";
			}
		}
	</script>
  </head>
   <body>
<div class="tablewrapper">
  	<div class="title">�޸�����</div>
	<div class="tablecontent">
		<form action="" method="post">
	    	<table>
	    		<tr>
					<td>�˺�:</td>
					<td><input type="text" id="name" name="name" value="${admin.loginName}" readonly="readonly"></td>
	    		<tr>
					<td>������:</td>
					<td><input type="password" id="password" name="password" onblur="checkPassword()"/></td>
					<td><div id="passwordDiv"></div></td>
				</tr>
				<tr>
					<td>ȷ��������:</td>
					<td><input type="password" id="rpassword" name="rpassword" onblur="checkRpassword()"/></td>
					<td><div id="rpasswordDiv"></div></td>
				</tr>
				<tr>
					<td><input type="button" value="�޸�" onclick="update()"></td>
					<td><div id="messageDiv">${message }</div></td>
				</tr>
	    	</table>
	    	</form>
	</div>
</div>
  </body>
</html>