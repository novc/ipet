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
    
    <title>订单详情</title>
    
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
  </head>
  
  <body>
  	<div class="tablewrapper">
  	<div class="title">订单详情</div>
		<div class="tablecontent">
		
			<table cellspacing="0">
				<thead>
					<tr>
						<td>订单ID</td>
						<td>订单项ID</td>
						<td>商品号</td>
						<td>商品名</td>
						<td>金额</td>
						<td>数量</td> 
					</tr>
				</thead>
				<tbody>
				<c:forEach var="orderItem" items="${order.orderItem}">
					<tr>
						<td>${order.orderId}</td>
						<td>${orderItem.orderItemId }</td>
						<td>${orderItem.goodsId }</td>
						<td>${orderItem.goodsName }</td>
						<td>${orderItem.price}</td>
						<td>${orderItem.goodsNum}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  </body>
</html>
