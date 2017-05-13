<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="common.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>��Ʒ�߼�����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="style.css" />
  <script type="text/javascript">
  	var req;
		function selectedSuper(){
			if(window.XMLHttpRequest){//Mozillia
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){//IE
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			//���ûص�����
			req.onreadystatechange = callback;
			var superTypeId = document.getElementById("superType").value;
			var url = "showSubTypeServlet?superTypeId="+superTypeId;
			req.open("get",url,true);
  			var content = document.getElementById("content");
  			content.style.visibility = "hidden";
			req.send(null);
		}
		function clearSubType(){
			var subT = document.getElementById("subT");
			subT.length=0;
		}
		function callback(){
			var state = req.readyState;
			var subT = document.getElementById("subT");
			if(state==4 && req.status==200){
			clearSubType();
			var dom = req.responseXML;
			var subType = dom.getElementsByTagName("subType");
			for(i=0;i<subType.length;i++){
				var subTypeId = subType[i].getElementsByTagName("subTypeId")[0];
				var subTypeName = subType[i].getElementsByTagName("subTypeName")[0];
				var subValue = subTypeId.firstChild.data;
				var subText = subTypeName.firstChild.data;
				subT[i] = new Option(subText,subValue);
			}
			}
		}
  	function getSM(){
  		var searchMethod = document.getElementById("searchMethod").value;
  		if(searchMethod=="noChoice"){
  			alert("��ѡ���ѯ��ʽ");
  		}else {
  			var content = document.getElementById("content");
  			content.style.visibility = "visible";
  		}
  	}

	function checkDetails(){
		var superType = document.getElementById("superType");
		var subT = document.getElementById("subT");
		var searchMethod = document.getElementById("searchMethod");
		var scontent= document.getElementById("content").value;
		if(superType.value != "noChoice" && subT.value != "noChoice" && searchMethod.value != "noChoice" && scontent!=null && scontent!=""){
		    var content = document.getElementById("content");
			if(content.value != "noChoice"){
				document.detailSearch.submit();
			}
		}else {
			alert("��ѡ�����Ĳ�ѯ�������ѯ�������Ϊ�գ�");
		}
	}
  </script>
  </head>
  
  <body>
    		<div id="wrap"> 
		 
			<!-- the begin of header -->
			<%@include file="header.jsp"%>
			<!-- the end of header -->
			
			<!-- the begin of content -->
			<div class="center_content">
				<!-- the begin of left -->
					<div>
						<div>�߼�����</div>
						<div>
						<form action="detailSearch" method="post" name="detailSearch">
                        <div class="feat_prod_box_details">
                         <p class="details"></p>
              	         <div class="contact_form">
                         <div class="form_subtitle">�߼�����</div>       
                          <table>
								<tr>
									<td>�������ࣺ</td>
									<td>
										<select id="superType" name="superType" onchange="selectedSuper()">
											<option value="noChoice">--��ѡ�����--</option>
											<c:forEach var="flag" items="${superList}">
						  					<option value="${flag.superTypeId}">${flag.typeName}</option>
						  					</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>����С�ࣺ</td>
									<td>
										<select id="subT" name="subT">
											<option value="noChoice">--��ѡ��С��--</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>��ѯ��ʽ��</td>
									<td>
										<select name="searchMethod" id="searchMethod" onchange="getSM()">
											<option value="noChoice">--��ѡ���ѯ��ʽ--</option>
											<option value="GoodsName">����Ʒ����ѯ</option>
											<option value="author">��Ʒ�Ʋ�ѯ</option>
											<option value="publisher">�����ز�ѯ</option>
											<option value="ISBN">�������ѯ</option>
										</select>
									</td>
									<td><input id="content" type="text" name="content"  style="visibility: hidden;"/></td>
								</tr>
								
								<tr>
								<td>&nbsp;</td>	
									<td><input type="button" value="�ύ" onclick="checkDetails()" /></td>
								</tr>
							</table>
                  </form>     
                </div>           
          </div>	       
        <div class="clear"></div>
						</form>
						</div>
					</div>
				<div class="clear"></div>
			</div>
			
			
			<!--end of center content-->
			<%@include file="footer.jsp"%>
		</div>
  </body>
</html>
