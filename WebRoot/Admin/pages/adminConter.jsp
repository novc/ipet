<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��̨����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/demo.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/admin.css">
    
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Admin/js/admin.js"></script>
    
  </head>
  
  <body class="easyui-layout">
  	
    <div class="header" data-options="region:'north',border:false">
        <h1 class="fl">�����̳�</h1>
        <div class="logininfo">
            <div class="admin">��ӭ����<span>${admin.adminName}</span>&nbsp;!</div>
            <div class="time">�����ǣ�<span></span></div>
        </div>
        <ul>
            <li><a href="Admin/pages/updatePassword.jsp" target="contentIframe">�޸�����</a></li>|
            <li><a href="adminLogout">ע��</a></li>
        </ul>
    </div>
    <div class="left" data-options="region:'west',title:'�˵���'">
        <div class="easyui-accordion">
            <div title="�û�����">
                <ul>
                	<li><a href="Admin/pages/userManage.html" target="contentIframe">�û���Ϣ</a></li>
                </ul>
            </div>
            <div title="��������">
                <ul>
				    <li><a href="Admin/pages/orderManage.html" target="contentIframe">���ж���</a></li>
				</ul>
            </div>
            <div title="�������">
            	<ul>
            		<li><a href="Admin/pages/informManage.html" target="contentIframe">������Ϣ</a></li>
            		<li><a href="Admin/pages/informAdd.html" target="contentIframe">��������</a></li>
            	</ul>
            </div>
            <div title="���Բ鿴">
            	<ul>
            		<li><a href="Admin/pages/NoteManage.html" target="contentIframe">������Ϣ</a></li>
            	</ul>
            </div>
            <div title="��Ʒ����">
            	<ul>
            		<li><a href="allowAddSuperServlet" target="contentIframe">�����Ʒ����</a></li>
            		<li><a href="allowAddSubServlet" target="contentIframe">�����Ʒ���</a></li>
            		<li><a href="allowAddGoodsServlet" target="contentIframe">�����Ʒ</a></li>
            		<li><a href="Admin/pages/goodsManage.html" target="contentIframe">�鿴������Ʒ</a></li>
            	</ul>
            </div>
            <div title="Admin����">
            	<ul>
            		<li><a href="Admin/pages/adminManage.html" target="contentIframe" >����Ա</a></li>
            		<li><a href="Admin/pages/adminAdd.html" target="contentIframe">��ӹ���Ա</a></li>
            	</ul>
            </div>
        </div>
    </div>
    <div class="bottom" data-options="region:'south',border:false">
    	�����̳� At 2017/5/5
    </div>
    <div data-options="region:'center'">
    	<div id="content">
			<iframe name="contentIframe" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
		</div>
    </div>
    <script type="text/javascript">
    	var date = new Date();
    	var year = date.getFullYear();
    	var month = date.getMonth();
    	var day = date.getDate();
  		$(".time span").html(year+"�� "+month+"�� "+day+"�� ");
  	</script>
  </body>
</html>
