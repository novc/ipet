<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="com.mall.vo.Cart"/>
<%@include file="common.jsp" %>
<jsp:directive.page import="com.mall.vo.CartItem"/>
<jsp:directive.page import="com.mall.po.User"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ҵĹ��ﳵ</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">

        <%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>
        
        	<div class="feat_prod_box_details">
            <table class="cart_table">
               	<tr class="cart_title">
                	<td>ͼƬ</td>
                	<td>��Ʒ��</td>
                    <td>����</td>
                    <td>����</td>
                    <td>�ܼ�</td>
                    <td>ɾ��<br /></td>  
                    <td>�޸�<br /></td>             
                </tr>
				<%
					Collection ci = (Collection)request.getSession().getAttribute("ci");
					User user=(User)request.getSession().getAttribute("user");
					if(user==null){
					 out.println("���ȵ�¼!!");
					}else{
					if(ci==null || ci.size()<=0){
						out.print("���ﳵ��û����Ʒ����");
					}else {
						Iterator<CartItem> it= ci.iterator();
						while(it.hasNext()){
							CartItem cartItem = it.next();
							%>
								<form action="updateGoodsCount?GoodsId=<%=cartItem.getGoods().getGoodsId()%>" method="post" name="cartForm">
								<tr>
									<td><img src="<%=cartItem.getGoods().getPicture()%>" width="100" height="90"/></td>
									<td><%=cartItem.getGoods().getGoodsName() %></td>
									<td><%=cartItem.getGoods().getNowPrice()%></td>
									<td><input type="text" name="count" value="<%=cartItem.getCount()%>" size="4" /></td>
									<td><%=cartItem.getItemPrice() %></td>
									<td><a href="deleteItemServlet?GoodsId=<%=cartItem.getGoods().getGoodsId() %>"><img src="Image/sc.jpg" border="0" /></a></td>
									<td><input type="image" value="submit" src="Image/xiugai.jpg" border="0"></td>
								</tr>
								</form>
							<%
						}
					}
					}
				 %>  
                <tr>
                <td colspan="4" class="cart_total"><span class="red">�ܼ�:</span></td>
                	<%
					Cart c = (Cart)session.getAttribute("cart");
					if(ci != null){
    	 	   			%>
    	 	   			  <td><%=c.getTotalPrice()%></td>
    	 	   			<%
    	 	  	   }
					%>              
                </tr>             
            </table>
            <a href="index.jsp" class="continue">&lt; ��������</a>
            <a href="checkLogin" class="checkout">���� &gt;</a>
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