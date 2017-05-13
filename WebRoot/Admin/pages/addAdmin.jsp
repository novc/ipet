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
    
    <title>添加管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
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
					}else {
						typeDiv.innerHTML = "还未设置管理级别";
					}
				}
			}
		}
		var checkAdminName;
		function checkAdminName() {
			var adminName = document.getElementById("adminName");
			var adminNameDiv = document.getElementById("AdminNameDiv");
			if(adminName.value == "") {
				adminNameDiv.innerHTML = "真实姓名不能为空";
				checkAdminName = false;
			} else {
				adminNameDiv.innerHTML = "√";
				checkAdminName = true;
			}
		}
		var loginName_IsExist;
        function checkLoginNameIsExist() {
			var loginName = document.getElementById("loginName");
			var url = "checkLoginNameIsExist?loginName="+loginName.value;
			sendLoginName(url);
		}
        function sendLoginName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = loginNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function loginNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var loginNameDiv = document.getElementById("loginNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						loginName_IsExist = true;
					} else {
						loginName_IsExist = false;
					}
					loginNameDiv.innerHTML = content;
				}
			}
		}
		function checkLoginName() {
			var loginName = document.getElementById("loginName");
			var loginNameDiv = document.getElementById("loginNameDiv");
			if(loginName.value == "") {
				loginNameDiv.innerHTML = "登录名不能为空";
			} else {
				checkLoginNameIsExist();
			}
		}
		var checkPwd1;
		function checkPwd1() {
			pwd1 = document.getElementById("loginPwd1");
			var pwd1Div = document.getElementById("pwd1Div");
			if(pwd1.value == "") {
				pwd1Div.innerHTML = "密码不能为空";
				checkPwd1 = false;
			} else {
				pwd1Div.innerHTML = "√";
				checkPwd1 = true;
			}
		}
		var checkPwd2;
		function checkPwd2() {
			var pwd2 = document.getElementById("loginPwd2").value;
			var pwd1 = document.getElementById("loginPwd1").value;
			var pwd2Div = document.getElementById("pwd2Div");
			if(pwd2 == "") {
				pwd2Div.innerHTML = "密码不能为空";
				checkPwd2 = false;
			} else {
			    if(pwd2!=pwd1)
			    {
			      pwd2Div.innerHTML = "两次密码不一致";
				  checkPwd2 = false;
			    }else{
			       pwd2Div.innerHTML = "√";
				   checkPwd2 = true;
			    }
				
			}
		}

	//清除错误提示
	function clearAN(){
	    var adminNameDiv = document.getElementById("adminNameDiv");
		adminNameDiv.innerHTML="*";
	}
	function clearP1D(){
	    var pwd1Div = document.getElementById("pwd1Div");
		pwd1Div.innerHTML="*";
	}
	function clearP2D(){
	    var pwd2Div = document.getElementById("pwd2Div");
		pwd2Div.innerHTML="*";
	}
	//必须所有信息填写正确才能成功提交信息
	function checkAll(){
		document.addAdmin_form.submit();
	}
  </script>
  </head>
  
  <body  onload="getAdminType()">
<div class="tablewrapper">
    <div class="tablecontent">
        <div class="title">添加管理员</div>
        <form name="addAdmin_form" method="post" action="addAdminServlet">
            <table>
                <tr>
                    <td>管理级别&nbsp; &nbsp;</td>
                    <td>
                        <select name="adminTypeId">
                            <c:forEach var="adminType" items="${adminTypes }">
                                <option value="${adminType.adminTypeId}">${adminType.typeName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <font color="red">
                            <div id="TypeDiv">*</div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>真实姓名&nbsp; &nbsp;</td>
                    <td>
                        <input type="text" name="adminName" onfocus="clearAN()" onblur="checkAdminName()" size=16/>
                    </td>
                    <td>
                        <font color="red">
                            <div id="adminNameDiv">*</div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>登录账号&nbsp; &nbsp;</td>
                    <td>
                        <input type="text" name="loginName" onblur="checkLoginName()" size=16/>
                    </td>
                    <td>
                        <font color="red">
                            <div id="loginNameDiv">*</div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>登录密码&nbsp; &nbsp;</td>
                    <td>
                        <input type="password" name="loginPwd1" onfocus="clearP1D()" onblur="checkPwd1()" size=16/>
                    </td>
                    <td>
                        <font color="red">
                            <div id="pwd1Div">*</div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td>确认密码&nbsp; &nbsp;</td>
                    <td>
                        <input type="password" name="loginPwd2" onfocus="clearP2D()" onblur="checkPwd2()" size=16/>
                    </td>
                    <td>
                        <font color="red">
                            <div id="pwd2Div">*</div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="button" value="添加" size=4 onclick="checkAll()">
                    </td>
                    <td>
                        <font color="red">${addMessage}</font>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
  	
  </body>
</html>
