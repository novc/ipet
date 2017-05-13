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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  
  <body>
<div class="tablewrapper">
    <div class="tablecontent">
    	<div class="title">订单信息</div>
    	
        <table cellspacing="0">
            <thead>
                <tr>
                    <td>订单ID</td>
                    <td>用户名</td>
                    <td>姓名</td>
                    <td>地址</td>
                    <td>邮编</td>
                    <td>Email</td>
                    <td>时间</td>
                    <td>状态</td>
                    <td>操作</td>
                    <td><input type="checkbox" id="selectAll" onclick="selectAll()">全选</td>
                </tr>
            </thead>
            <tbody>
                <form method="post" name="deleteForm">
                    <c:forEach var="order" items="${ orderList}">
                        <tr>
                            <td>${orderList.orderId }</td>
                            <td>${orderList.name }</td>
                            <td>${orderList.recvName }</td>
                            <td>${orderList.address }</td>
                            <td>${orderList.postcode}</td>
                            <td>${orderList.email}</td>
                            <td>${orderList.orderDate }</td>
                            <td>${orderList.flag }</td>
                            <td><a href="getOneOrderServlet?orderId=${orderList.orderId}">详情</a></td>
                            <td>
                                <input type="checkbox" name="delete" value="${orderList.orderId }">
                            </td>
                        </tr>
                    </c:forEach>
                </form>
            </tbody>
            <tfoot></tfoot>
        </table>
        <div class="page">
            <div>
                <input type="button" value="删除" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
            </div>
        </div>
    </div>
	</div>
  </body>
</html>
