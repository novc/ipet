<%-- <%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ҳ</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
<div id="wrap">		
		<%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
        	<marquee>
        	<font color="red">${name} ${loginMessage} ${LoginOutMessage} ${pleseLoggin}&nbsp;</font> ��ӭ�㣡
        	</marquee>
            <div class="title">
            
            <!-- �Ƽ���Ʒ -->
            <span class="title_icon"><img src="images/tbtj.gif" width="490" alt="" title="" /></span></div>
            
            <div class="feat_prod_box">
           <table width="100%" border="0">
           <c:forEach var="flag" items="${specialList}" varStatus="status1">
            	<c:if test="${status1.index%3==0}">
	            	<tr>
	            </c:if>
	            <td>
	            	<div class="prod_img"><a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="${flag.picture}" alt="" width="100" height="100" border="0" /></a>
	            	 <p class="price">ԭ�ۣ���${flag.price}</p>
	                 <p class="nowPrice">�ּۣ���${flag.nowPrice}</p>
	            	</div>
                </td>
            	<c:if test="${status1.index%3==2}">
	            	</tr>
	            </c:if>
	            
            </c:forEach>
            </table>
            </div>
            
            <!-- ��Ʒ -->
            <div class="title"><span class="title_icon"><img src="images/new.gif" width="490" alt="" title="" /></span></div>
            <div class="feat_prod_box">
            <table width="100%" border="0">
            <c:forEach var="flag" items="${newList}" varStatus="status">
	            <c:if test="${status.index%3==0}">
	            	<tr>
	            </c:if>
	            <td>
            	<div class="prod_img"><a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="${flag.picture}" alt="" width="100" height="100" border="0" /></a>
            		<p class="price">ԭ�ۣ���${flag.price}</p>
                	<p class="nowPrice">�ּۣ���${flag.nowPrice}</p>
            	</div>
            	</td>
            	<c:if test="${status.index%3==2}">
	            	</tr>
	            </c:if>
            </c:forEach>
            </table>
            </div>
            
			<!-- ������Ʒ -->
            <div class="title"><span class="title_icon"><img src="images/host.gif" width="490" alt="" title="" /></span></div>
        	<div class="feat_prod_box">
        	<table width="100%" border="0">
        	<c:forEach var="flag" items="${hostList}" varStatus="status3">
	        	<c:if test="${status3.index%3==0}">
	            	<tr>
	            </c:if>
	            <td>
            	<div class="prod_img"><a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="${flag.picture }" alt="" width="100" height="100" border="0" /></a>
            		<p class="price">ԭ�ۣ���${flag.price}</p>
                 	<p class="nowPrice">�ּۣ���${flag.nowPrice}</p>
            	</div>
            	</td>
            	<c:if test="${status3.index%3==2}">
	            	</tr>
	            </c:if>
        
	        </c:forEach>
	        </table>
	        </div>
 		</div>
 		<!--end of left content-->
        <%@include file="right.jsp" %> 
       <!--end of right content-->
   
       <div class="clear"></div>
       </div><!--end of center content-->
       
       <%@include file="footer.jsp"%>
</div>

</body>
</html> --%>