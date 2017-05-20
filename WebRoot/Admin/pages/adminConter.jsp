<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    
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
        <h1 class="fl">宠物商城</h1>
        <div class="logininfo">
            <div class="admin">欢迎您，<span>${admin.adminName}</span>&nbsp;!</div>
            <div class="time">现在是：<span>20158</span></div>
        </div>
        <ul>
            <li><a href="Admin/pages/updatePassword.jsp" target="contentIframe">修改密码</a></li>|
            <li><a href="adminLogout">注销</a></li>
        </ul>
    </div>
    <div class="left" data-options="region:'west',title:'菜单栏'">
        <div class="easyui-accordion">
            <div title="用户管理">
                <ul>
                	<li><a href="getUserPagerServlet" target="contentIframe">用户信息</a></li>
                </ul>
            </div>
            <div title="订单管理">
                <ul>
				    <li><a href="Admin/pages/manageOrder.html?flag=3" target="contentIframe">所有订单</a></li>
				    <li><a href="Admin/pages/manageOrder.html?flag=0" target="contentIframe">未发货订单</a></li>
				    <li><a href="Admin/pages/manageOrder.html?flag=1" target="contentIframe">已发货订单</a></li>
				</ul>
            </div>
            <div title="公告管理">
            	<ul>
            		<li><a href="getInformPagerServlet" target="contentIframe">公告信息</a></li>
            		<li><a href="Admin/pages/addInform.jsp" target="contentIframe">发布公告</a></li>
            	</ul>
            </div>
            <div title="留言查看">
            	<ul>
            		<li><a href="getNotePagerServlet" target="contentIframe">留言信息</a></li>
            	</ul>
            </div>
            <div title="商品管理">
            	<ul>
            		<li><a href="allowAddSuperServlet" target="contentIframe">添加商品物种</a></li>
            		<li><a href="allowAddSubServlet" target="contentIframe">添加商品类别</a></li>
            		<li><a href="allowAddGoodsServlet" target="contentIframe">添加商品</a></li>
            		<li><a href="getGoodsPagerServlet" target="contentIframe">查看所有商品</a></li>
            	</ul>
            </div>
            <div title="Admin管理">
            	<ul>
            		<li><a href="getAdminPagerServlet" target="contentIframe" >管理员</a></li>
            		<li><a href="allowAddAdminServlet" target="contentIframe">添加管理员</a></li>
            	</ul>
            </div>
        </div>
    </div>
    <div class="bottom" data-options="region:'south',border:false">
    	宠物商城 At 2017/5/5
    </div>
    <div data-options="region:'center'">
    	<div id="content">
			<iframe name="contentIframe" scrolling="auto" frameborder="0" width="100%" height="100%"></iframe>
		</div>
    </div>
  </body>
</html>
