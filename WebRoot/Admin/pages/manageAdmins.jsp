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
    
    <title>管理员管理</title>
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/table.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Admin/js/manageAdmin.js"></script>
    
	
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
		
		function removeAdmin(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var admins = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					admins.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("还没有选中删除项");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteAdmin?adminIds="+admins+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
	</script>
  </head>
  
  <body>
<div class="tablewrapper">
    <div class="tablecontent">
        <div class="title">管理员管理</div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <td>管理员ID</td>
                    <td>真实姓名</td>
                    <td>管理员级别<br></td>
                    <td>登录名<br></td>
                    <td>登录密码<br></td>
          
                    <td>全选<input type="checkbox" id="selectAll" onclick="selectAll()" /></td>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                <form method="post" name="deleteForm">
                <c:forEach var="admin" items="${adminList}">
                    <tr align="center">
                        <td>${admin.id }</td>
                        <td>${admin.adminName}</td>
                        <td>${admin.adminType }</td>
                        <td>${admin.loginName }</td>
                        <td>${admin.loginPwd }</td>
                        <td><input type="checkbox" name="delete" value="${admin.id }"></td>
                        <td><a href="getOneAdminServlet?id=${admin.id}">详情</a></td>
                    </tr>
                </c:forEach>
            </form>
            </tbody>
        </table>
        <div class="page">
            <ul>
                <pg:pager items="${adminPager.totalNum}" maxPageItems="${adminPager.pageSize}" export="currentPageNo = pageNumber" url="getAdminPagerServlet">
                     <pg:param name="pageSize" value="${adminPager.pageSize }"/>
                     <pg:param name="pageNo" value="${currentPageNo}"/> 
                     <pg:first>
                        <li><a href="${pageUrl}">首页</a></li>
                     </pg:first>
                     <pg:prev>
                        <li><a href="${pageUrl}">上一页</a></li>
                     </pg:prev>
                     <pg:pages>
                         <c:choose>
                            <c:when test="${adminPager.pagecurrentPageNo eq pageNumber}">
                              <li><font color="red">${pageNumber}</font></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="${pageUrl}">${pageNumber}</a></li>
                            </c:otherwise>
                         </c:choose>
                     </pg:pages>
                     <pg:next>
                        <li><a href="${pageUrl}">下一页</a></li>
                     </pg:next>
                     <pg:last>
                        <li><a href="${pageUrl}">尾页</a></li>
                     </pg:last>
                  </pg:pager>
            </ul>
            <div>
                <input type="button" value="删除" onclick="removeAdmin(${adminPager.pageOffset},${adminPager.pageSize})">
            </div>
        </div>
    </div>
</div>

  </body>
</html>


    	
    	
    	
    	