<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>������Ϣ����</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div id="wrap">&nbsp; 
 
	   <!-- header -->
	   <%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>������Ϣ��������</div>
        
        	<div class="feat_prod_box_details">
			        <div class="form_row">
                    <a href="updateUsere.jsp" class="contact">�޸�����</a>
                    <a href="updatePassword.jsp" class="contact">�޸�����</a> 
                    <a href="selectOrder" class="contact">�鿴����</a>    
                    <a href="index.jsp" class="contact">��ҳ</a> 
                     </div>        
            </p>
            
              	<div class="contact_form">
                <div class="form_subtitle">���ĸ�������</div>          
                    <div class="form_row">
                    <label class="contact"><strong>����:</strong></label>
					<label class="contact"><strong>${user.score}</strong></label>
                    </div>  

                    <div class="form_row">
                    <label class="contact"><strong>�û���:</strong></label>
                    <label class="contact"><strong>${user.name}</strong></label>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>E��mail:</strong></label>
                    <label class="contact"><strong>${user.email}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>����:</strong></label>
                    <label class="contact"><strong>${user.trueName}</strong></label>
                    </div>


                    <div class="form_row">
                    <label class="contact"><strong>�Ա�:</strong></label>
                    <label class="contact"><strong>${user.sex}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>����:</strong></label>
                    <label class="contact"><strong>${user.birthday}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>��ַ:</strong></label>
                    <label class="contact"><strong>${user.address}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>�ʱ�:</strong></label>
                    <label class="contact"><strong>${user.postcode}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>����:</strong></label>
                    <label class="contact"><strong>${user.phone}</strong></label>
                    </div>

                    <div class="form_row">
                    <label class="contact"><strong>�ֻ�:</strong></label>
                    <label class="contact"><strong>${user.mphone}</strong></label>
                    </div>
                    
                    <div class="form_row">
                    <label class="contact"><strong>��ȫ����:</strong></label>
                    <label class="contact"><strong>${user.question}</strong></label>
                    </div>     
                </div>  
            
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