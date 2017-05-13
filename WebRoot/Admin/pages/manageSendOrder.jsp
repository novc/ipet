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
    
    <title>订单管理</title>
    
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
	<script type="text/javascript">
		function selectAll() {
			var deletes =document.getElementsByName("delete");
			var selectAll = document.getElementById("selectAll");
			for(var i = 0;i<deletes.length;i++) {
				if(selectAll.checked == true) {
				 	deletes[i].checked = true;
				}
				else {
					deletes[i].checked = false;
				}
			}
		}
		
		function removeOrder(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var orders = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					orders.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("请选择要删除的项目");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteOrder?orderIds="+orders+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}

		function freezeOrder(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var orders = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					orders.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("还没有选中订单项");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "freezeOrderServlet?orderIds="+orders+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
	</script>
  </head>
  
  <body>
  <div class="tablewrapper">
    <div class="tablecontent">
    <div class="title">已发货订单</div>
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
                <form method="post" name="sendForm">
                    <c:forEach var="order" items="${ orderList}">
                        <tr>
                            <td>${order.orderId }</td>
                            <td>${order.user.name }</td>
                            <td>${order.recvName }</td>
                            <td>${order.user.address }</td>
                            <td>${order.user.postcode}</td>
                            <td>${order.user.email}</td>
                            <td>${order.orderDate }</td>
                            <td>${order.flag }</td>
                            <td><a href="getOneOrderServlet?orderId=${order.orderId}">详情</a></td>
                            <td>
                                <input type="checkbox" name="delete" value="${order.orderId }">
                            </td>
                            
                        </tr>
                    </c:forEach>
                </form>
            </tbody>
            <tfoot></tfoot>
        </table>
        <div class="page">
            <ul>
                <pg:pager items="${orderPager.totalNum }" maxPageItems="${orderPager.pageSize}" export="currentPageNo = pageNumber" url="getOrderSendPagerServlet">
                    <pg:param name="pageSize" value="${orderPager.pageSize }" />
                    <pg:param name="pageNo" value="${currentPageNo}" />
                    <pg:first>
                        <li>
                            <a href="${pageUrl}">首页</a>
                        </li>
                    </pg:first>
                    <pg:prev>
                        <li>
                            <a href="${pageUrl}">上一页</a>
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
                            <a href="${pageUrl}">下一页</a>
                        </li>
                    </pg:next>
                    <pg:last>
                        <li>
                            <a href="${pageUrl}">尾页</a>
                        </li>
                    </pg:last>
                </pg:pager>
            </ul>
            <div>
                <input type="button" value="冻结" onclick="freezeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
                <input type="button" value="删除" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
            </div>
        </div>
    </div>
</div>

  </body>
</html>
