<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��Ʒ����ϸ����</title>

<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="stylesheet" href="lightbox.css" type="text/css" media="screen" />
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
</head>
<body>
<div id="wrap">
		<%@include file="header.jsp" %>
		<!-- begin of center_content -->
       <div class="center_content">
       
       <!-- begin of left_content -->
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="index.jsp">��ҳ</a> &gt;&gt; ��ϸ����
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>��Ʒ����</div>
        	<div class="feat_prod_box_details">
            	<div class="prod_img"><a href="details.jsp"><img src="${Goods.picture }" alt="" width="50%" height="50%" border="0" /></a>
                <br /><br />
                </div>
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">������Ϣ</div>
						<table>
							<tr>
								<td>��Ʒ����</td>
								<td>${Goods.goodsName}</td>
							</tr>
							<tr>
								<td>����</td>
								<td>${Goods.ISBN}</td>
							</tr>
							<tr>
								<td>��������</td>
								<td>${Goods.produceDate}</td>
							</tr>
							<tr>
								<td>Ʒ��</td>
								<td>${Goods.author}</td>
							</tr>
							<tr>
								<td>����</td>
								<td>${Goods.publisher}</td>
							</tr>
							<tr>
								<td>ԭ��</td>
								<td>${Goods.price}</td>
							</tr>
							<tr>
								<td>�ּ�</td>
								<td>${Goods.nowPrice}</td>
							</tr>	
							<tr>
								<td>�������</td>
								<td>${Goods.goodsNum}</td>
							</tr>	
						</table>
                    </div>
                    <a href="buyGoodsServlet?GoodsId=${Goods.goodsId}" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    <div class="box_bottom"></div>                 
                </div>    
            <div class="clear"></div>
            </div>	                    
            <div id="demo" class="demolayout">
                <ul id="demo-nav" class="demolayout">
                <li><a class="active" onmouseover="showDesc()">-�˽����-</a></li>
                <li><a class="" onmouseover="showrecords()">-�����¼-</a></li>
                </ul>
             </div>   
            <div class="tabs-container">
                    <div style="display: block;" class="tab" id="tab1">
                         <p class="more_details"></p>
                            <ul class="list">
                            <li><a href="#">${Goods.introduce}</li>                                
                            </ul>
                        <p class="more_details"></p>                           
                   </div>	
                   <div style="display: none;" class="tab" id="tab2">
                    <div class="clear">
                    	<table width="90%" border="0">
                    		<tr>
                    			<td>���</td>
                    			<td>����</td>
                    			<td>����ʱ��</td>
                    		</tr>
                    		<c:forEach var="buyrec" items="${records}">
                    		<tr>
                    			<td>${buyrec.name }</td>
                    			<td>${buyrec.goodsNum }</td>
                    			<td>${buyrec.orderDate }</td>
                    		</tr>
                    		</c:forEach>
                    	</table>
                    </div>          
                   <div class="clear"></div>
               </div>	
            </div>
        <div class="clear"></div>
       
        </div><!--end of left content-->
      	<%@include file="right.jsp" %>
     	 <!--end of center content-->
     	 </div>
   	    <%@include file="footer.jsp" %>    
	</div>
</body>
<script type="text/javascript">
 var tabber1 = new Yetii({
 id: 'demo'
 });
 
 function showDesc() {
 	//alert('go');
 	document.getElementById("tab1").style.display="block";
 	document.getElementById("tab2").style.display="none";
 }
 
 function showrecords() {
 	//alert('go');
 	document.getElementById("tab1").style.display="none";
 	document.getElementById("tab2").style.display="block";
 }
 </script>
</html>