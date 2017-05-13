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
    
    <title>管理员详情</title>
    
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
	
	function getAdminType() {
			var url = "getAdminType";		
			sendRequest(url);
		}
		var req;
		function sendRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			req.onreadystatechange = showAdminType;
			req.open("get",url,true);
			req.send(null);
		}
		function showAdminType() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var TypeXml = req.responseXML;
					var adminTypes =TypeXml.getElementsByTagName("adminType");
					var adminTypeId = document.getElementById("adminTypeId");				
					if(adminTypes.length > 0) {
						for(var i=0;i<adminTypes.length;i++) {
							var TypeId = adminTypes[i].getElementsByTagName("adminTypeId").item(0).firstChild.data;
							var adminTypeName = adminTypes[i].getElementsByTagName("adminTypeName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",TypeId);
							var txt = document.createTextNode(adminTypeName);
							op.appendChild(txt);			
							adminTypeId.appendChild(op);
							adminTypeId.style.width = "auto";
						}
						var nowType = document.getElementById("typeId").value;
                        for(var i=0;i<adminTypeId.options.length;i++ ){
                             if(adminTypeId.options[i].value==nowType){
                                  adminTypeId.options.selectedIndex = i;
                                    reuturn;
                             }
                         }
					} else {
						typeDiv.innerHTML = "还未设置管理级别";
					}
				}
			}
		}

  </script>
  </head>
  
  <body  onload="getAdminType()">
<div class="tablewrapper">
    <div class="tablecontent">
        <div class="title">添加管理员</div>
        <form method="post" action="updateAdminServlet">
            <table>
                <tr>
                    <td>管理员ID&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" id="adminId" name="adminId" contentEditable=false value="${admin.id}" />
                    </td>
                </tr>
                <tr>
                    <td>管理员姓名&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="adminName" value="${admin.adminName}" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="hidden" id="typeId" name="typeId" value="${admin.adminType}" />
                    </td>
                </tr>
                <tr>
                    <td>管理级别&nbsp;&nbsp;</td>
                    <td>
                        <select name="adminTypeId">
                            <c:forEach var="adminType" items="${adminTypes }">
                                <option value="${adminType.adminTypeId}">${adminType.typeName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>登录名&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="loginName" value="${admin.loginName}" />
                    </td>
                </tr>
                <tr>
                    <td>登录密码&nbsp;&nbsp;</td>
                    <td>
                        <input type="text" name="loginPwd" value="${admin.loginPwd}" />
                    </td>
                </tr>
                <tr>
                    <td><a href="getAdminPagerServlet">返回</a></td>
                    <td>
                        <input type="submit" name="update" value="修改" size=4>${updateMessage}</td>
                </tr>
            </table>
        </form>
    </div>
</div>

  </body>
</html>
