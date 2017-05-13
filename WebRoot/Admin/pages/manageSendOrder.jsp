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
    
    <title>��������</title>
    
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
				alert("��ѡ��Ҫɾ������Ŀ");
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
				alert("��û��ѡ�ж�����");
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
    <div class="title">�ѷ�������</div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <td>����ID</td>
                    <td>�û���</td>
                    <td>����</td>
                    <td>��ַ</td>
                    <td>�ʱ�</td>
                    <td>Email</td>
                    <td>ʱ��</td>
                    <td>״̬</td>
                    <td>����</td>
                    <td><input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ</td>
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
                            <td><a href="getOneOrderServlet?orderId=${order.orderId}">����</a></td>
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
                            <a href="${pageUrl}">��ҳ</a>
                        </li>
                    </pg:first>
                    <pg:prev>
                        <li>
                            <a href="${pageUrl}">��һҳ</a>
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
                            <a href="${pageUrl}">��һҳ</a>
                        </li>
                    </pg:next>
                    <pg:last>
                        <li>
                            <a href="${pageUrl}">βҳ</a>
                        </li>
                    </pg:last>
                </pg:pager>
            </ul>
            <div>
                <input type="button" value="����" onclick="freezeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
                <input type="button" value="ɾ��" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
            </div>
        </div>
    </div>
</div>

  </body>
</html>
