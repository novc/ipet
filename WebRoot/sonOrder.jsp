<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.mall.vo.Cart"/>
<%@include file="common.jsp" %>
<jsp:directive.page import="com.mall.vo.CartItem"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��������</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">

        <%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My order</div>
            <a href="updateUsere.jsp" class="register">��������</a>
            <a href="updatePassword.jsp" class="register"> �޸�����</a>
			<a href="selectOrder" class="register">���ض���</a>
			<a href="index.jsp" class="register">������ҳ</a>   
        	<div class="feat_prod_box_details">
            <table class="cart_table">
               	<tr class="cart_title">
                	<td>������</td>
                	<td>����Id</td>
                	<td>��ƷId</td>
                    <td>��Ʒ��</td>
                    <td>�۸�</td>  
                    <td>����</td>             
                </tr>
                <c:forEach var="sonOr" items="${list}">
				<tr>
					<td>${sonOr.orderItemId}</td>
					<td>${sonOr.orderId}</td>
					<td>${sonOr.goodsId}</td>
					<td>${sonOr.goodsName}</td>
					<td>${sonOr.price}</td>
					<td>${sonOr.goodsNum}</td>
				</tr>
				</c:forEach>
                <tr>
                <td colspan="4" class="cart_total"><span class="red">�ܼ�:</span></td>
                <td>${totalPrice}</td>              
                </tr>             
            </table>
            </div>	   
        <div class="clear"></div>
        </div><!--end of left content-->
        <%@include file="right.jsp" %>
       <!--end of right content-->
 
       <div class="clear"></div>
       </div><!--end of center content-->
        <%@include file="footer.jsp" %>                  
</div>

</body>
</html>