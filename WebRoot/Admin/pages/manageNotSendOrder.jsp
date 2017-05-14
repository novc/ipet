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
    
    <title>δ��������</title>
    
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
  <div class="title">δ��������</div>
    <div class="tablecontent">
    	<div class="option-area">
            <input class="search-input" type="text" id="OrderID" name="OrderID" placeholder="�����붩������">
            <div id="searchDiv" style="display: inline"></div>
            <button class="btn-default" onclick="searchOrder(0)">��ѯ</button>
            <button class="btn-default"><a href="getOrderNotSendPagerServlet">�鿴���ж���</a></button>
            <input class="btn-default" type="button" value="ɾ��" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
       	</div>
        <table cellspacing="0">
            <thead>
                <tr>
                	<td>ȫѡ<input type="checkbox" id="selectAll" onclick="selectAll()"></td>
                    <td>����ID</td>
                    <td>�û���</td>
                    <td>����</td>
                    <td>��ַ</td>
                    <td>�ʱ�</td>
                    <td width='180px'>ʱ��</td>
                    <td colspan="4">����</td>
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
				            <td><a href="getOneOrderServlet?orderId=${order.orderId}">����</a></td>
				            <td><a href="javascript:void(0);" onclick="setUpdateOrderInfo(${order.orderId },'getOrderNotSendPagerServlet')">�޸�</a></td>
				            <td><a href="javascript:void(0)" onclick="sendOrder(${order.orderId},${orderPager.pageOffset},${orderPager.pageSize})">����</a></td>
				            <td><a href="deleteOrder?orderIds=${order.orderId }">ɾ��</a></td>
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
				            <a class="btn" href="${pageUrl}">��ҳ</a>
				        </li>
				    </pg:first>
				    <pg:prev>
				        <li>
				            <a class="btn" href="${pageUrl}">��һҳ</a>
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
				            <a class="btn" href="${pageUrl}">��һҳ</a>
				        </li>
				    </pg:next>
				    <pg:last>
				        <li>
				            <a class="btn" href="${pageUrl}">βҳ</a>
				        </li>
				    </pg:last>
				</pg:pager>
            </ul>
        </div>
    </div>
  </div>
  </body>
</html>
