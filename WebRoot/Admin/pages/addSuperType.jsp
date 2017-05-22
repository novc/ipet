<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加大类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	    var superTypeName_IsValid;
		function checkSuperTypeName() {
			var superTypeName = document.getElementById("superTypeName");
			var superTypeNameDiv = document.getElementById("superTypeNameDiv");
			if(superTypeName.value == "") {
				superTypeNameDiv.innerHTML = "大类名不能为空";
				superTypeName_IsValid=false;
			} else {
				checkSuperTypeNameIsExist();
			}
		}
		var req;
		function checkSuperTypeNameIsExist() {
			var superTypeName = document.getElementById("superTypeName");
			var url = "checkSuperTypeIsExist?superTypeName="+superTypeName.value;
			sendSuperTypeName(url);
		}
		function sendSuperTypeName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = superTypeNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		var superTypeName_IsExist;
		function superTypeNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var superTypeNameDiv = document.getElementById("superTypeNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						superTypeName_IsExist = true;
					} else {
						superTypeName_IsExist = false;
						superTypeName_IsValid=true;
					}
					superTypeNameDiv.innerHTML = content;
				}
			}
		}
		function addSuperType() {
			var oForm = document.getElementsByTagName("form")[0];
			var superTypeName = document.getElementById("superTypeName");
			if(superTypeName_IsValid) {
				oForm.action = "addSuperTypeServlet?sueprTypeName="+superTypeName.value;
				oForm.submit();
			}
		}
	</script>
  </head>
 <body>
	<form action="addSuperTypeServlet" method="POST">
	    <table id="t2">
			<tr>
				<td> 
					大类名称:<input type="text" id="superTypeName" name="superTypeName" onblur="checkSuperTypeName()" />
					<input type="button"  value="添加" onclick="addSuperType()" onblur="checkSuperTypeName()"/><font  color="red">${message }</font>
					<div id="superTypeNameDiv"></div>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>