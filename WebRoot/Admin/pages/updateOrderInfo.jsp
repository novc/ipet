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
    
    <title>������Ϣ�޸�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-update.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    
  </head>
  
  <body>
<div class="tablewrapper">
    <div class="tablecontent">
    	<div class="title">������Ϣ�޸�</div>
    	<form action="updateOrderInfoServlet" method="POST" name="updateform">
    		<table>
		    	<tr>
		    		<td>�����ţ�</td>
		    		<td><input name="orderId" type="text" value="" readonly /></td>
		    	</tr>
		    	<tr>
		    		<td>�û�����</td>
		    		<td><input name="user" type="text" value="" readonly /></td>
		    	</tr>
	    		<tr>
	    			<td>�ռ��ˣ�</td>
	    			<td><input type="text" name="recvName"></td>
	    			<td class="errorinfo"></td>
	    		</tr>
	    		<tr>
	    			<td>�ռ���ַ��</td>
	    			<td><input type="text" name="address"></td>
	    			<td class="errorinfo"></td>
	    		</tr>
	    		<tr>
	    			<td>�ʱࣺ</td>
	    			<td><input type="text" name="postcode"></td>
	    			<td class="errorinfo"></td>
	    		</tr>
	    		<tr>
	    			<td>�µ�ʱ�䣺</td>
	    			<td><input name="orderDate" type="text" value="" readonly /></td>
	    		</tr>
	    		

	    	</table>
    		<div class="btn-box">
	    		<button class="btn-default" type="submit">ȷ��</button>
	    		<button class="btn-default" type="reset">����</button>
	    		<button class="btn-default" type="button">ȡ��</button>
    		</div>
    	</form>
    	
    </div>
</div>
<script type="text/javascript">
		
    	$.ajax({
    		url:"GetOrderByOrderIDServlet",
    		type:"POST",
    		data:{
    			orderId:sessionStorage.getItem("updateOrderId")
    		},
    		success:function(msg){
    			var res =$.parseJSON(msg);
    			console.log(res);
    			$("input[name='orderId']").val(res.orderId);
    			$("input[name='user']").val(res.name);
    			$("input[name='recvName']").attr("placeholder",res.recvName);
    			$("input[name='address']").attr("placeholder",res.address);
    			$("input[name='postcode']").attr("placeholder",res.postcode);
    			$("input[name='orderDate']").val(res.orderDate);
    		}
    	})
    </script>
  </body>
</html>
