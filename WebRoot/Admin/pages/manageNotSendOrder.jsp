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
    
    <title>未发货订单</title>
    
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
  <div class="title">未发货订单</div>
    <div class="tablecontent">
    	<div class="option-area">
            <input class="search-input" type="text" id="OrderID" name="OrderID" placeholder="请输入订单号码">
            <div id="searchDiv" style="display: inline"></div>
            <button class="btn-default" onclick="searchOrder(0)">查询</button>
            <button class="btn-default"><a href="getOrderNotSendPagerServlet">查看所有订单</a></button>
            <input class="btn-default" type="button" value="删除" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
       	</div>
        <table cellspacing="0">
            <thead>
                <tr>
                	<td>全选<input type="checkbox" id="selectAll" onclick="selectAll()"></td>
                    <td>订单ID</td>
                    <td>用户名</td>
                    <td>姓名</td>
                    <td>地址</td>
                    <td>邮编</td>
                    <td width='180px'>时间</td>
                    <td colspan="4">操作</td>
                </tr>
            </thead>
            <tbody>
                <form method="post" name="sendForm">
				    <c:forEach var="order" items="${ orderList}">
				        <tr>
				        	<td>
				            	<input type="checkbox" name="delete" value="${order.orderId }">
				            </td>
				            <td>${order.orderId }</td>
				            <td>${order.user.name }</td>
				            <td>${order.recvName }</td>
				            <td>${order.user.address }</td>
				            <td>${order.user.postcode}</td>
				            <td width="180px">${order.orderDate }</td>
				            <td><a href="getOneOrderServlet?orderId=${order.orderId}">详情</a></td>
				            <td><a href="javascript:void(0);" onclick="setUpdateOrderInfo(${order.orderId },'getOrderNotSendPagerServlet')">修改</a></td>
				            <td><a href="javascript:void(0)" onclick="sendOrder(${order.orderId},${orderPager.pageOffset},${orderPager.pageSize})">发货</a></td>
				            <td><a href="deleteOrder?orderIds=${order.orderId }">删除</a></td>
				    </c:forEach>
				    	</tr>
				</form>
            </tbody>
        </table>
        <div class="page">
            <ul>
                <pg:pager items="${orderPager.totalNum }" maxPageItems="${orderPager.pageSize}" export="currentPageNo = pageNumber" url="getOrderNotSendPagerServlet">
				    <pg:param name="pageSize" value="${orderPager.pageSize }" />
				    <pg:param name="pageNo" value="${currentPageNo}" />
				    <pg:first>
				        <li>
				            <a class="btn" href="${pageUrl}">首页</a>
				        </li>
				    </pg:first>
				    <pg:prev>
				        <li>
				            <a class="btn" href="${pageUrl}">上一页</a>
				        </li>
				    </pg:prev>
				    <pg:pages>
				        <c:choose>
				            <c:when test="${orderPager.pagecurrentPageNo eq pageNumber}">
				                <li>
				                    <font color="#F16522">${pageNumber}</font>
				                </li>
				            </c:when>
				            <c:otherwise>
				                <li><a href="${pageUrl}">${pageNumber}</a></li>
				            </c:otherwise>
				        </c:choose>
				    </pg:pages>
				    <pg:next>
				        <li>
				            <a class="btn" href="${pageUrl}">下一页</a>
				        </li>
				    </pg:next>
				    <pg:last>
				        <li>
				            <a class="btn" href="${pageUrl}">尾页</a>
				        </li>
				    </pg:last>
				</pg:pager>
            </ul>
        </div>
    </div>
  </div>
  </body>
</html>
