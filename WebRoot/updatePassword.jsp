<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��������1</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">&nbsp; 
 
	   <!-- header -->
	   <%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>������Ϣ����</div>     
        	<div class="feat_prod_box_details">
               <p class="details">
               <div class="form_row">
                    <a href="updateUsere.jsp" class="contact">�޸�����</a>
                    <a href="updatePassword.jsp" class="contact">�޸�����</a> 
                    <a href="selectOrder" class="contact">�鿴����</a>    
                    <a href="index.jsp" class="contact">��ҳ</a> 
               </div>  
               </p>
               <form action="newPassword" method="post">
                   <p></p>
			       <P> <font color="red" size="2" align="center"> ${passwordOK} </font></P>
              	   <div class="contact_form">
                       <div class="form_subtitle">�����޸�</div> 
                       <p>${passwordenrol}  ${passwordexception}</p>       
                       <div class="form_row">
                       <label class="contact"><strong>��ʵ����:</strong></label>
                       <input type="text" name="name" class="contact" value="${user.name}" readonly="readonly"/>                      
                       </div>  

                       <div class="form_row">
                       <label class="contact"><strong>�ɵ�����:</strong></label>
                       <input type="password" name="password" class="contact" />           
                       </div>          
                       
                       <div class="form_row">
                       <label class="contact"><strong>�µ�����:</strong></label>
                       <input input type="password" name="newPassword1" class="contact" />
                       </div>
   
                       <div class="form_row">
                       <label class="contact"><strong>ȷ������:</strong></label>
                       <input input type="password" name="newPassword2" class="contact" />                     
                       </div>
                       

                    
                       <div class="form_row">    
                       <input type="submit"  value="ȷ��" />
			           <input type="reset" value="ȡ��" />              
                       </div> 
                     </div>  
                 </form>
          </div>	
     
        <div class="clear"></div>
        </div><!--end of left content-->
        <%@include file="right.jsp" %> 
        <div class="clear"></div>
        </div><!--end of center content-->
       <%@include file="footer.jsp"%>  

</div>

</body>
</html>