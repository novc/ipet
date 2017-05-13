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
    
    <title>公告管理</title>
    
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
		function removeInform(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var informs = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					informs.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("请选择要删除的项目");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteInform?informIds="+informs+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
	</script>
  </head>
	<body>
  <div class="tablewrapper">
    <div class="tablecontent">
        <div class="title">公告信息</div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <td>公告ID</td>
                    <td>标题</td>
                    <td>时间</td>
                    <td>内容</td>
                    <td>全选<input type="checkbox" id="selectAll" onclick="selectAll()"></td>
                </tr>
            </thead>
            <tbody>
                <form method="post" name="deleteForm">
                    <c:forEach var="inform" items="${informList}">
                        <tr>
                            <td>${inform.informId }</td>
                            <td>${inform.informTitle }</td>
                            <td width="100px">${inform.informTime }</td>
                            <td>
                                ${inform.informContent }
                            </td>
                            <td>
                                <input type="checkbox" name="delete" value="${inform.informId }">
                            </td>
                        </tr>
                    </c:forEach>
                </form>
            </tbody>
        </table>
        <div class="page">
            <ul>
                <pg:pager items="${informPager.totalNum }" maxPageItems="${informPager.pageSize}" export="currentPageNo = pageNumber" url="getInformPagerServlet">
                    <pg:param name="pageSize" value="${informPager.pageSize }" />
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
                            <c:when test="${informPager.pagecurrentPageNo eq pageNumber}">
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
                        <li><a href="${pageUrl}">下一页</a></li>
                    </pg:next>
                    <pg:last>
                        <li>
                            <a href="${pageUrl}">尾页</a></li>
                    </pg:last>
                </pg:pager>5r
            </ul>
            <div>
                <input type="button" value="删除" onclick="removeInform(${informPager.pageOffset},${informPager.pageSize})">
            </div>
        </div>
    </div>
</div>
	  		
	</body>
</html>
