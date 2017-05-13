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
    <title>留言管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
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
		function removeNote(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var notes = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					notes.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("请选择要删除的项目");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteNote?noteIds="+notes+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
	</script>
  </head>
<body>
	<div class="tablewrapper">
		<div class="tablecontent">
	        <div class="title">留言管理</div>
	        <table cellspacing="0">
	            <thead>
	                <tr>
	                    <td>留言ID</td>
	                    <td>标题</td>
	                    <td>用户名</td>
	                    <td width="180px">时间</td>
	                    <td>内容</td>
	                    <td>全选
	                        <input type="checkbox" id="selectAll" onclick="selectAll()" />
	                    </td>
	                </tr>
	            </thead>
	            <tbody>
	                <form method="post" name="deleteForm">
	                    <c:forEach var="note" items="${noteList}">
	                        <tr>
	                            <td>${note.id }</td>
	                            <td>${note.title }</td>
	                            <td>${note.author }</td>
	                            <td width="100px">${note.ly_time }</td>
	                            <td>${note.content }</td>
	                            <td>
	                                <input type="checkbox" name="delete" value="${note.id }">
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </form>
	            </tbody>
	        </table>
	        <div class="page">
	            <ul>
	                <pg:pager items="${notePager.totalNum }" maxPageItems="${notePager.pageSize}" export="currentPageNo = pageNumber" url="getNotePagerServlet">
	                    <pg:param name="pageSize" value="${notePager.pageSize }" />
	                    <pg:param name="pageNo" value="${currentPageNo}" />
	                    <pg:first>
	                        <li><a href="${pageUrl}">首页</a></li>
	                    </pg:first>
	                    <pg:prev>
	                        <li><a href="${pageUrl}">上一页</a></li>
	                    </pg:prev>
	                    <pg:pages>
	                        <c:choose>
	                            <c:when test="${notePager.pagecurrentPageNo eq pageNumber}">
	                                <li><font color="#F16522">${pageNumber}</font></li>
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
	                <input type="button" value="删除" onclick="removeNote(${notePager.pageOffset},${notePager.pageSize})">
	            </div>
	        </div>
	    </div>
	</div>
	
</body>
</html>
