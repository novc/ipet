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
    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Admin/js/admin.js"></script>
  </head>
  
  <body class="easyui-layout">
    <div class="header" data-options="region:'north',border:false">
        <h1 class="fl">�����̳�</h1>
        <div class="logininfo">
            <div class="admin">��ӭ����<span>${admin.adminName}</span>&nbsp;!</div>
            <div class="time">�����ǣ�<span>20158</span></div>
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
                	<li><a href="getUserPagerServlet" target="contentIframe">�û���Ϣ</a></li>
                </ul>
            </div>
            <div title="��������">
                <ul>
				    <li><a href="Admin/pages/manageOrder.html?flag=3" target="contentIframe">���ж���</a></li>
				    <li><a href="Admin/pages/manageOrder.html?flag=0" target="contentIframe">δ��������</a></li>
				    <li><a href="Admin/pages/manageOrder.html?flag=1" target="contentIframe">�ѷ�������</a></li>
				</ul>
            </div>
            <div title="�������">
            	<ul>
            		<li><a href="getInformPagerServlet" target="contentIframe">������Ϣ</a></li>
            		<li><a href="Admin/pages/addInform.jsp" target="contentIframe">��������</a></li>
            	</ul>
            </div>
            <div title="���Բ鿴">
            	<ul>
            		<li><a href="getNotePagerServlet" target="contentIframe">������Ϣ</a></li>
            	</ul>
            </div>
            <div title="��Ʒ����">
            	<ul>
            		<li><a href="allowAddSuperServlet" target="contentIframe">�����Ʒ����</a></li>
            		<li><a href="allowAddSubServlet" target="contentIframe">�����Ʒ���</a></li>
            		<li><a href="allowAddGoodsServlet" target="contentIframe">�����Ʒ</a></li>
            		<li><a href="getGoodsPagerServlet" target="contentIframe">�鿴������Ʒ</a></li>
            	</ul>
            </div>
            <div title="Admin����">
            	<ul>
            		<li><a href="getAdminPagerServlet" target="contentIframe" >����Ա</a></li>
            		<li><a href="allowAddAdminServlet" target="contentIframe">��ӹ���Ա</a></li>
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
  </body>
</html>
