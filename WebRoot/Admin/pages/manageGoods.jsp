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
    <title>商品管理</title>
    
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
		
		function removeGoods(pageOffset,pageSize) {
			var deletes = document.getElementsByName("delete");
			var count = 0;
			var Goods = new Array();
			for(var i = 0;i<deletes.length;i++) {
				if(deletes[i].checked) {
					count++;
					Goods.push(deletes[i].value);
				}
			}
			if(count == 0) {
				alert("请选择要删除的项目");
				return false;
			}
			var oform = document.getElementsByTagName("form")[0];
			oform.action = "deleteGoodsServlet?GoodsIds="+Goods+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
			oform.submit();
		}
		function searchGoods(pageOffset,pageSize) {
			var GoodsName = document.getElementById("GoodsName");
			var searchDiv = document.getElementById("searchDiv");
			var oform = document.getElementsByTagName("form")[0];
			if(GoodsName.value != "") {
				oform.action = "getGoodsByGoodsNameServlet?GoodsName="+GoodsName.value;
				oform.submit();
			} else {
				searchDiv.innerHTML = "请输入搜索关键字";
				searchDiv.style.color="red";
				searchDiv.style.marginBottom="10px";
				
			}	
		}
	</script>
  </head>
  <body>
  	<div class="tablewrapper">
  	<div class="title">公告信息</div>
	    <div class="tablecontent">
	        
	        <div>
	        	<div class="searchwrapper">
	        		<span>按商品名查询:</span>
		            <input type="text" id="GoodsName" name="GoodsName">
		            <input type="button" value="查询" onclick="searchGoods(${GoodsPager.pageOffset},${GoodsPager.pageSize})">
		            <div id="searchDiv" style="display: inline"></div>
	        	</div>
	        </div>
	        <table cellspacing="0">
	            <thead>
	                <tr>
	                    <td>商品ID</td>
	                    <td>商品名</td>
	                    <td>介绍</td>
	                    <td>原价</td>
	                    <td>现价</td>
	                    <td>新商品</td>
	                    <td>打折商品</td>
	                    <td>热卖商品</td>
	                    <td>数量</td>
	                    <td>
	                        <input type="checkbox" id="selectAll" onclick="selectAll()">全选</td>
	                    <td></td>
	                </tr>
	            </thead>
	            <tbody>
	                <form method="post" name="deleteForm">
	                    <c:forEach var="Goods" items="${ GoodsList}">
	                        <tr>
	                            <td>${Goods.goodsId}</td>
	                            <td>${Goods.goodsName}</td>
	                            <td>
	                                ${Goods.introduce}
	                            </td>
	                            <td>${Goods.price}</td>
	                            <td>${Goods.nowPrice}</td>
	                            <td>${Goods.newGoods}</td>
	                            <td>${Goods.saleGoods}</td>
	                            <td>${Goods.hostGoods}</td>
	                            <td>${Goods.goodsNum}</td>
	                            <td>
	                                <input type="checkbox" name="delete" value="${Goods.goodsId }">
	                            </td>
	                            <td><a href="updateGoodServlet?GoodsId=${Goods.goodsId}">详情</a></td>
	                        </tr>
	                    </c:forEach>
	                </form>
	            </tbody>
	        </table>
	        <div class="page">
	            <ul>
	                <pg:pager items="${GoodsPager.totalNum }" maxPageItems="${GoodsPager.pageSize}" export="currentPageNo = pageNumber" url="getGoodsPagerServlet">
	                    <pg:param name="pageSize" value="${GoodsPager.pageSize }" />
	                    <pg:param name="pageNo" value="${currentPageNo}" />
	                    <pg:first>
	                        <li><a href="${pageUrl}">首页</a></li>
	                    </pg:first>
	                    <pg:prev>
	                        <li><a href="${pageUrl}">上一页</a></li>
	                    </pg:prev>
	                    <pg:pages>
	                        <c:choose>
	                            <c:when test="${GoodsPager.pagecurrentPageNo eq pageNumber}">
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
	                        <li><a href="${pageUrl}">尾页</a></li>
	                    </pg:last>
	                </pg:pager>
	            </ul>
	            <div>
	                <input type="button" value="删除" onclick="removeGoods(${GoodsPager.pageOffset},${GoodsPager.pageSize})">
	            </div>
	        </div>
	    </div>
	</div>
  	
  </body>
 
</html>
