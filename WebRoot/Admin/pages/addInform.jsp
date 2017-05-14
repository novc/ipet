<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>发布公告</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">

    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
  </head>
  
  <body>
  	<div class="tablewrapper">
  	<div class="title">公告信息</div>
    <div class="tablecontent">
        
        <form action="addInformServlet" method="get">
            <table id="t2">
                <tr>
                    <td>标题:</td>
                    <td>
                        <input type="text" name="informTitle" size="20">
                    </td>
                </tr>
                <tr>
                    <td class="content">内容:</td>
                    <td>
                        <textarea rows="10" cols="50" name="informContent"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="btn-default" type="submit" value="添加">
                    </td>
                    <td>${message }</td>
                </tr>
            </table>
        </form>
    </div>
</div>

  	
  </body>
</html>
