<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="common.jsp" %>
   	 <div class="right_content">
   	 			<div id="news">
   	 				<marquee direction="up" height="140px;" style="padding-top: 20px;" truespeed="truespeed" onmouseover="stop()" onmouseout="start()" >
   	 					<ul>
   	 						<c:choose>
   	 							<c:when test="${empty informList }">
   	 								<font color="red">��ʱ��û�й��</font>
   	 							</c:when>
   	 							<c:otherwise>
   	 								<c:forEach var="inform" items="${informList}">
   	 									<li><a href="#" title="${inform.informContent}">${inform.informTitle}</a>&nbsp;&nbsp;[${inform.informTime}]</li>
   	 								</c:forEach>
   	 							</c:otherwise>
   	 						</c:choose>	
   	 					</ul>
   	 				</marquee>
   	 			</div>
              <div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/border.gif" width="290px" />
              </div> 
                <div class="loginDiv">
                 <form name="login" action="login" method="post">          
					<fieldset>
						<legend id="loginTitle">�˺ŵ�¼</legend>
						<table>
							<tr>
								<td>�˺ţ�</td>
								<td><input type="text" name="name" /></td>
							</tr>
							<tr>
								<td>���룺</td>
								<td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td><input type="checkbox" name="cookie" />��ס����</td>
								<td><font color=red>${loginMessage}</font></td>
							</tr>
							<tr>
								<td><input type="submit" class="register" value="��¼" /></td>
								<td><a class="register" href="register.jsp">ע��</a></td>
							</tr>
							<tr>
								<td style="padding-left: 55px;"><img src="images/mail.png" name="mail" /></td>
								<td><a href="PwdIndex.jsp">��������?��������һ�����.</a></td>
							</tr>
						</table>
					</fieldset>    
                  </form>     
                </div> 
              <div>
              	 <img src="images/border.gif" />
              </div> 
             <div class="right_box">
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>�ؼ���Ʒ&nbsp;&nbsp;<a href="page?type=3" class="more">-����-</a></div> 
                   <table width="100%" border="0">
                   <c:forEach var="flag" items="${saleList}" varStatus="status">
	                   <c:if test="${status.index%2==0}">
		            	  <tr>
		               </c:if>
		               <td>
	                    <div class="new_prod_box">
	                        <a href="details.jsp">${flag.goodsName}</a>
	                        <div class="new_prod_bg">
	                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
	                        <a href="showGoodsByIdServlet?GoodsId=${flag.goodsId}"><img src="${flag.picture}" alt="" class="thumb" border="0" /></a>
	                        <p class="price">ԭ�ۣ���${flag.price}</p>
	                 		<p class="nowPrice">�ּۣ���${flag.nowPrice}</p>
	                        </div>           
	                    </div>
	                    </td>
		            	<c:if test="${status.index%2==1}">
			            	</tr>
			            </c:if>
                   </c:forEach>
                   </table>
             </div>
             
             <!-- ��Ʒ���� -->
             <div>
              	 <img src="images/border.gif" />
              </div> 
             <div class="right_box">
             	<div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>��Ʒ����&nbsp;&nbsp;</div> 
                   <table width="100%" border="0">
                   <c:forEach var="cls" items="${clsList}">
	                   <tr>
		               	<td align="left">
	                       &nbsp;&nbsp;<img src="images/navi.png" border="0" alt=""/>&nbsp;&nbsp;
	                       <a href="page?type=9&sid=${cls.superTypeId}">${cls.typeName}</a>
	                    </td>
			           </tr>
                   </c:forEach>
                   </table>
             </div>
            
            </div>  