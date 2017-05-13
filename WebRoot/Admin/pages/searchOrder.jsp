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
    	<div class="title">������Ϣ</div>
    	
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
                            <td><a href="getOneOrderServlet?orderId=${orderList.orderId}">����</a></td>
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
                <input type="button" value="ɾ��" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
            </div>
        </div>
    </div>
	</div>
  </body>
</html>
