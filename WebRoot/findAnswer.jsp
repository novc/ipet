<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>My JSP 'findAnswer.jsp' starting page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function checkAnswer(){
			var answer = document.getElementById("answer");
			if(answer.value==""){
				alert("�𰸲���Ϊ�գ�");
			}else{
				document.f1.submit();
			}
		}
	</script>
  </head>
  
  <body>
  	  	<div id="wrap">&nbsp;
		<%@include file="header.jsp" %>
       <div class="center_content">
       	<div class="left_content">
       		
       		<form action="findAnswer" method="post" name="f1">
       			<table>
       				<tr>
       					<td class="form_row"><strong>��İ�ȫ�����ǣ�</strong></td>
       					<td></td>
       				</tr>
       				<td >${user.question}</td>
       				<tr>
       					<td class="form_row">��������Ĵ𰸣�</td>
       					<td class="form_row"><input type="text" id="answer" name="answer" class="contact_input" /></td>
       				</tr>
       				<tr>
       					<td>&nbsp;</td>
       					<td id="checkName">&nbsp;</td>
       				</tr>
       				<tr>
       					<td>&nbsp;</td>
       					<td class="form_row"><input type="button" class="register" value="�ύ" onclick="checkAnswer()" /></td> 
       				</tr>
       			</table>  
		    </form>
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
