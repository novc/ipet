<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="tools.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Admin/js/admin.js"></script>
  </head>
  
  <body>
  <div id="dg"></div>
  <div id="tb" style="padding:3px">
		<span>Order ID:</span>
		<input id="orderid" style="line-height:26px;border:1px solid #ccc">
		<a href="javascript:doSearch()" class="easyui-linkbutton" plain="true">Search</a>
	</div>
  <script type="text/javascript">
	$("#dg").datagrid({
		url:"getOrderServlet?orderId=0&flag=3",
		toolbar:'#tb',
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		title:"订单管理",
		pageSize:10,
		loadFilter:pagerFilter,
		iconCls:"icon-save",
		rownumbers:"true",
		
		columns:[[
					{field:'check',checkbox:true},
					{field:'orderId',title:'订单ID',width:100,align:'center'},
					{field:'name',title:'用户名',width:100,align:'center'},
					{field:'recvName',title:'收货人',width:100,align:'center'},
					{field:'address',title:'收货地址',width:100,align:'center'},
					{field:'postcode',title:'邮编',width:100,align:'center'},
					{field:'orderDate',title:'下单时间',width:180,align:'center'},
					{field:'flagName',title:'订单状态',width:100,align:'center'},
					{field:'flag',width:100,align:'center',formatter: function(flag,res){
						if (flag==0){
							return ("<a href='adminSendOrderServlet?orderId="+res.orderId+"'>发货</a>");
						} else {
							return res.orderId;
						} 
					}},
					{field:'flag1',width:100,align:'center',formatter: function(f,res){
							return "<a href='getOneOrderServlet?orderId="+res.orderId+"'>详情</a>";
					}},
					{field:'flag2',width:100,align:'center',formatter: function(f1,res){
							return "<a href='javascript:setUpdateOrderInfo("+res.orderId+")'>修改</a>";
					}},
					{field:'flag4',width:100,align:'center',formatter: function(f2,res){
							return "<a href='adminSendOrderServlet?orderId='"+res.orderId+" >删除</a>";
					}}
				]]
				
	})

	/* 分页功能的实现 */
	function pagerFilter(data){
		if (typeof data.length == 'number' && typeof data.splice == 'function'){	// is array
			data = {
				total: data.length,
				rows: data
			}
		}
		var dg = $(this);
		var opts = dg.datagrid('options');
		var pager = dg.datagrid('getPager');
		pager.pagination({
			onSelectPage:function(pageNum, pageSize){
				opts.pageNumber = pageNum;
				opts.pageSize = pageSize;
				pager.pagination('refresh',{
					pageNumber:pageNum,
					pageSize:pageSize
				});
				dg.datagrid('loadData',data);
			}
		});
		if (!data.originalRows){
			data.originalRows = (data.rows);
		}
		var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
		var end = start + parseInt(opts.pageSize);
		data.rows = (data.originalRows.slice(start, end));
		return data;
	}
	function doSearch(){
	alert($('#orderid').val()),
		$("#dg").datagrid("load",{
			orderId:$('#orderid').val(),
			flag:3
		});
		$('#dg').datagrid('reload');
	}
</script>
  </body>
</html>
