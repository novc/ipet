<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����޸�</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/table.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Admin/js/admin.js"></script>
  </head>
  
  <body>
  
  <div class="tablewrapper">
	<div class="title">������Ϣ�޸�</div>
    <div class="tablecontent">
    	<form action="updateInformServlet" method="POST" name="updateform">
    		<table>
		    	<tr>
		    		<td>���⣺</td>
		    		<td><input name="informTitle" type="text" /></td>
		    	</tr>
		    	<tr>
		    		<td>���ݣ�</td>
		    		<td><input name="informContent" type="text" /></td>
		    	</tr>
	    	</table>
    		<div class="btn-box">
	    		<button class="btn-default" onclick="updateInform()" type="button">ȷ��</button>
	    		<button class="btn-default cancle" type="button" onclick="cancle()"><a href="javascript:void(0)">ȡ��</a></button>
    		</div>
    	</form>
    	
    </div>
</div>
  </body>
</html>
