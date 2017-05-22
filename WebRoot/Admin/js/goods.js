$(document).ready(function(){
	$("#dg").datagrid({
		url:"http://nov:8080/ipet/getGoodsPagerServlet,
		fitColumns:true,
		striped:true,
		rownumbers:true,
		pagination:true,
		title:"商品管理",
		pageSize:10,
		loadFilter:pagerFilter,
		rownumbers:"true",
		columns:[[
			{field:'orderId',title:'订单ID',width:100,align:'center'},
			{field:'name',title:'用户名',width:100,align:'center'},
			{field:'recvName',title:'收货人',width:100,align:'center'},
			{field:'address',title:'收货地址',width:100,align:'center'},
			{field:'postcode',title:'邮编',width:100,align:'center'},
			{field:'orderDate',title:'下单时间',width:180,align:'center'},
			{field:'flagName',title:'订单状态',width:100,align:'center'},
			{field:'flag',width:100,align:'center',formatter: function(flag,res){
				if (flag==0){
					return ("<a href='javascript:sendOrder("+res.orderId+")'>发货</a>");
				} else {
					return ;
				} 
			}},
			{field:'flag1',width:100,align:'center',formatter: function(f,res){
					return "<a href='http://nov:8080/ipet/getOneOrderServlet?orderId="+res.orderId+"'>详情</a>";
			}},
			{field:'flag2',width:100,align:'center',formatter: function(f1,res){
				return "<a href='javascript:setUpdateOrderInfo("+res.orderId+",3)'>修改</a>";
			}},
			{field:'flag4',width:100,align:'center',formatter: function(f2,res){
					return "<a href='javascript:deleteOrder("+res.orderId+")' >删除</a>";
			}}
		]]
		
	})
})



function deleteOrder(orderId) {
	window.confirm("确认删除该订单？");
	$.ajax({
		url:"http://nov:8080/ipet/deleteOrderServlet",
		type:"POST",
		data:{
			"orderId":orderId
		},
		success:function(msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
};//end of 订单删除

function setUpdateOrderInfo(orderId){
	if(window.sessionStorage){
		window.sessionStorage.setItem("updateOrderId",orderId);
		window.location.href="updateOrderInfo.html";
	}else{
		console.log("session error");
	}
};//end of 订单修改准备信息

function sendOrder(orderId){
	$.ajax({
		url:"http://nov:8080/ipet/adminSendOrderServlet",
		type:"POST",
		data:{
			orderId:orderId
		},
		success:function(msg){
			window.alert(msg);
			window.location.reload(true);
		}
	})
}//end of 发货


