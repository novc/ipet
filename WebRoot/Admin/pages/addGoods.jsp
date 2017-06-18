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
    
    <title>添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	
	<script type="text/javascript">
		var req;
		function getSuperType() {
			var url = "getSuperType";
			sendSuperTypeRequest(url);
		}
		function sendSuperTypeRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = showSuper;
			req.open("get",url,true);
			req.send(null);
		}
		function showSuper() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var subTypeXml = req.responseXML;
					var superTypes = subTypeXml.getElementsByTagName("super");
					var superTypeId = document.getElementById("superTypeId");
					if(superTypes.length > 0) {
						for(var i=0;i<superTypes.length;i++) {
							var superId = superTypes[i].getElementsByTagName("superId").item(0).firstChild.data;
							var superName = superTypes[i].getElementsByTagName("superName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",superId);
							var txt = document.createTextNode(superName);
							op.appendChild(txt);
							superTypeId.appendChild(op);
							superTypeId.style.width = "auto";
						}
					} else {
						typeDiv.innerHTML = "还没有大类";
					}
				}
			}
		}
		function getSubType() {
			var id;
			var superType = document.getElementById("superTypeId");
			for(var i=0;i<superType.options.length;i++) {
				if(superType.options[i].selected) {
					id = superType.options[i].value;
				}
			}
			var url = "getSubTypeBySuperTypeId?superTypeId="+id;
			sendRequest(url);
		}
		function sendRequest(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = showSub;
			req.open("get",url,true);
			req.send(null);
		}
		function clearSubType() {
			 var subType = document.getElementById("subTypeId");
			 for(var i = subType.options.length - 1;i>=0;i--) {
			 	subType.options[i].parentNode.removeChild(subType.options[i]);
			 }
			 subType.style.width = "";
		}
		function showSub() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var subTypeXml = req.responseXML;
					clearSubType();
					var subTypes = subTypeXml.getElementsByTagName("subType");
					var subType = document.getElementById("subTypeId");
					var typeDiv = document.getElementById("typeDiv");
					if(subTypes.length > 0) {
						for(var i=0;i<subTypes.length;i++) {
							var subTypeId = subTypes[i].getElementsByTagName("subTypeId").item(0).firstChild.data;
							var subTypeName = subTypes[i].getElementsByTagName("subTypeName").item(0).firstChild.data;
							var op = document.createElement("option");
							op.setAttribute("value",subTypeId);
							var txt = document.createTextNode(subTypeName);
							op.appendChild(txt);
							subType.appendChild(op);
							subType.style.width = "auto";
							typeDiv.innerHTML = "√";
						}
					} else {
						typeDiv.innerHTML = "*";
					}
				}
			}
		}
		var GoodsName_IsExist;
		function checkGoodsNameIsExist() {
			var GoodsName = document.getElementById("goodsTitle");
			var url = "checkGoodsNameIsExist?GoodsName="+GoodsName.value;
			sendGoodsName(url);
		}
		function sendGoodsName(url) {
			if(window.XMLHttpRequest) {
				req = new XMLHttpRequest();
			} else if(window.ActiveXObject) {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
			req.onreadystatechange = GoodsNameIsExist;
			req.open("get",url,true);
			req.send(null);
		}
		function GoodsNameIsExist() {
			if(req.readyState == 4) {
				if(req.status == 200) {
					var returnXml = req.responseXML;
					var GoodsNameDiv = document.getElementById("GoodsNameDiv");
					var state = returnXml.getElementsByTagName("state")[0].firstChild.data;
					var content = returnXml.getElementsByTagName("content")[0].firstChild.data;
					if(state == "true") {
						GoodsName_IsExist = true;
					} else {
						GoodsName_IsExist = false;
					}
					GoodsNameDiv.innerHTML = content;
				}
			}
		}
		function checkGoodsName() {
			var GoodsName = document.getElementById("goodsTitle");
			var GoodsNameDiv = document.getElementById("GoodsNameDiv");
			if(GoodsName.value == "") {
				GoodsNameDiv.innerHTML = "商品名称不能为空";
			} else {
				GoodsNameDiv.innerHTML = "";
				checkGoodsNameIsExist();
			}
		}
		
		var checkAuthor_ ;
		function checkAuthor() {
			var author = document.getElementById("author");
			var authorDiv = document.getElementById("authorDiv");
			if(author.value == "") {
				authorDiv.innerHTML = "品牌不能为空";
				checkAuthor_ = false;
			} else {
				authorDiv.innerHTML = "√";
				checkAuthor_ = true;
			}
		}
		var checkPrice_;
		function checkPrice() {
			var price = document.getElementById("price");
			var priceDiv = document.getElementById("priceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(price.value == "") {
				priceDiv.innerHTML = "原价不能为空";
				checkPrice_ = false;
			} else if(pattern.test(price.value)) {
				priceDiv.innerHTML = "√";
				checkPrice_ = true;
			} else {
				priceDiv.innerHTML = "格式不对";
				checkPrice_ = false;
			}
		}
		var checkNowPrice_;
		function checkNowPrice() {
			var nowPrice = document.getElementById("nowPrice");
			var nowPriceDiv = document.getElementById("nowPriceDiv");
			var pattern = /^[1-9]\d*([.]\d+||\d*)$/;
			if(nowPrice.value == "") {
				nowPriceDiv.innerHTML = "现价不能为空";
				checkNowPrice_ = false;
			} else if(pattern.test(nowPrice.value)) {
				nowPriceDiv.innerHTML = "√";
				checkNowPrice_ = true;
			} else {
				nowPriceDiv.innerHTML = "格式不对";
				checkNowPrice_ = false;
			}
		}
		var checkGoodsNum_;
		function checkGoodsNum() {
			var GoodsNum = document.getElementById("GoodsNum");
			var GoodsNumDiv = document.getElementById("GoodsNumDiv");
			var pattern = /^[1-9]\d*$/;
			if(GoodsNum.value == "") {
				GoodsNumDiv.innerHTML = "数量不能为空";
				checkGoodsNum_ = false;
			} else if(pattern.test(GoodsNum.value)) {
				GoodsNumDiv.innerHTML = "√";
				checkGoodsNum_ = true;
			} else {
				GoodsNumDiv.innerHTML = "格式不对";
				checkGoodsNum_ = false;
			}
		}
		function add() {
			var s1 = document.getElementById("superTypeId");
			var s2 = document.getElementById("subTypeId");
			var typeDiv = document.getElementById("typeDiv");
			var oForm = document.getElementsByTagName("form")[0];
			oForm.submit();
		}
	</script>
	<link rel="stylesheet" type="text/css" href="Admin/css/basic.css" />
	<link rel="stylesheet" type="text/css" href="Admin/css/admin.css" />
	<style>
		select{
			line-height:25px;
			height:25px;
		}
		table{
			margin-left:50px;
			margin-top:20px;
			
		}
		tr{
			margin:5px 0px;
			line-height:25px;
			font-size:14px;
		}
		tr td:first-child{
			width:120px;
			text-align:right;
			padding-right:15px;
		}
	</style>
	
  </head>
  <body>
<div class="Content">
	<div class="title">添加商品</div>
	<form action="addGoodsServlet" method="POST">
    	<table>
    		<tr>
				<td>选择类别:</td>
				<td>主类&nbsp;&nbsp; <select id="superTypeId" name="superTypeId" onchange="getSubType()">
							<option value="0">选择主类</option>
							<option value="1">狗狗主粮</option>
							<option value="2">狗狗零食</option>
							<option value="3">狗狗日用&医疗</option>
							<option value="4">猫咪主粮</option>
							<option value="5">猫咪零食</option>
							<option value="6">猫咪日用&医疗</option>
						</select>
				</td>
				<td>
				副类&nbsp;&nbsp; <select id="subTypeId" name="subTypeId">
					<option value="0">选择副类</option>
					
					</select>
					</td>
				<td><div id="typeDiv"></div></td>
			</tr>
    		<tr>
				<td>商品名称:</td>
				<td><input type="text" id="goodsTitle" name="goodsTitle" onblur="checkGoodsName()"/></td>
				<td><div id="GoodsNameDiv" class="tip" >*</div></td>
			</tr>
			<tr>
    			<td class="introduce">商品介绍:</td>
				<td colspan="2"><textarea rows="3" cols="20" id="introduce" name="introduce"></textarea></td>		
			</tr>
			
  			<tr>
    			<td>品牌:</td>
				<td><input type="text" id="brand" name="brandName"/></td>
				<td><div id="brandDiv" class="tip" >*</div></td>
			</tr>
			
			<tr>
    			<td>规格:</td>
				<td><input type="text" id="spec" name="spec" /></td>
				<td><div id="pagesDiv" class="tip" >*</div></td>
			</tr>
			<tr>
    			<td>计量单位:</td>
				<td><input type="text" id="measure" name="measure"/></td>
				<td><div id="publisherDiv" class="tip" >*</div></td>
			</tr>
			
    		<tr>
				<td>原价:</td>
				<td><input type="text" id="price" name="price" onblur="checkPrice()"/></td>
				<td><div id="priceDiv" class="tip" ></div></td>
			</tr>
    		<tr>
				<td>现价:</td>
				<td><input type="text" id="nowPrice" name="nowPrice" onblur="checkNowPrice()"/></td>
				<td><div id="nowPriceDiv" class="tip" >*</div></td>
			</tr>
    		<tr>
				<td>图片:</td>
				<td colspan="2"><input type="file" id="picture" name="picture"/></td>
				<td><div id="pictureDiv" class="tip" >*</div></td>
			</tr>
    		<tr>
				<td>数量:</td>
				<td><input type="text" id="GoodsNum" name="GoodsNum" onblur="checkGoodsNum()"/></td>
				<td><div id="GoodsNumDiv" class="tip" >*</div></td>
			</tr>
			<tr>
				<td>类型:</td>
				<td colspan="2">
					<input type="checkbox" name="special" value="1"/>推荐
					<input type="checkbox" name="sale" value="1"/>特价
				</td>
			</tr>
			<tr>
				<td>关键字:</td>
				<td><input type="text" id="GoodsKey" name="GoodsKey"/></td>
				<td><div id="GoodsKeyDiv" class="tip" >*</div></td>
			</tr>
    		<tr>
				<td></td>
				<td><input type="button" onclick="add()" value="添加" /></td>
				<td><font color="red">${message }</font></td>
			</tr>
    	</table>
    	</form>
</div>
  </body>
</html>