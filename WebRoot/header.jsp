<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
    <script type="text/javascript">
    	function b1(){		
		var timeId = document.getElementById("timeId");
		var x  = new Array("������", "����һ", "���ڶ�","������","������", "������","������");
		var e = new Date();
		var day = e.getUTCDay();
		timeId.innerHTML = "�����ǣ�"+e.getYear()+"��"+(e.getMonth()+1)+"��"+e.getDate()+"��   " +x[day];
	}
	</script>
    <body onload="b1()">
     <div class="header">
       	<div class="logo"></div>            
        <div id="menu">
            <ul>                                                                       
            <li class="selected"><a href="getGoodsByTypeServlet">��ҳ</a></li>
            <li><a href="page?type=0">������Ʒ</a></li>
            <li><a href="page?type=2">������Ʒ</a></li>
            <li><a href="page?type=4">�Ƽ���Ʒ</a></li>
            <li><a href="page?type=1">������Ʒ</a></li>
            <li><a href="page?type=3">�ؼ���Ʒ</a></li>
            <li><a href="okLoggin">��������</a></li>
            <li><a href="pageNoteServlet">�û�����</a></li>
            <li><a href="cart.jsp">���ﳵ</a></li>
            <li><a href="userLoginOut">ע��</a></li>
            </ul>
        </div>                        
       </div> 
       <div id="serachDiv">
       	<div style="padding-left:50px">
       	 <form action="pageSearchServlet" method="post" id="searchForm">
       	 	<table>
       	 		<tr>
       				<td><input type="text" name="keywords" id="keywords" /></td>
       				<td><input type="image" src="images/search.gif" name="submit" /></td>
       				<td><img src="images/gjsearch.png" name="gjsearch" /></td>    
       				<td><a href="showSuperTypeServlet">�߼�����</a></td>
       				<td id="timeId" style="padding-left: 250px;"></td>   				
       			</tr>
       		</table>
       	 </form>
       	</div> 		
       </div>
       <!--end of leftTop content-->
      </body> 