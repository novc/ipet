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
    
    <title>�������</title>
    
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
	<div class="title">������Ϣ</div>
    <div class="tablecontent">
    <div class="option-area">
    <input class="btn-default" type="button" value="ɾ��" onclick="removeInform(${informPager.pageOffset},${informPager.pageSize})">
    </div>
        <table cellspacing="0">
            <thead>
                <tr>
                	<td>ȫѡ<input type="checkbox" id="selectAll" onclick="selectAll()"></td>
                    <td>����ID</td>
                    <td>����</td>
                    <td>ʱ��</td>
                    <td>����</td>
                    <td colspan = "2">����</td>
                </tr>
            </thead>
            <tbody>
                <form method="post" name="deleteForm">
                    <c:forEach var="inform" items="${informList}">
                        <tr>
                        	<td>
                                <input type="checkbox" name="delete" value="${inform.informId }">
                            </td>
                            <td>${inform.informId }</td>
                            <td>${inform.informTitle }</td>
                            <td width="180px">${inform.informTime }</td>
                            <td>
                                ${inform.informContent }
                            </td>
                            <td><a href="javascript:void(0)" onclick="setUpdateInform(${inform.informId })">�޸�</a></td>
                            <td><a href="deleteInform?informIds=${inform.informId }">ɾ��</a></td>
                            
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
                        <li><a class="btn" href="${pageUrl}">��һҳ</a></li>
                    </pg:next>
                    <pg:last>
                        <li>
                            <a class="btn" href="${pageUrl}">βҳ</a></li>
                    </pg:last>
                </pg:pager>
            </ul>
            <div>
                
            </div>
        </div>
    </div>
</div>
	  		
	</body>
</html>
