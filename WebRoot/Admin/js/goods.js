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

			{field:'goodsId',title:'商品ID',width:100,align:'center'},
			{field:'goodsName',title:'商品名称',width:100,align:'center'},
			{field:'introduce',title:'商品介绍',width:100,align:'center'},
			{field:'price',title:'价格',width:100,align:'center'},
			{field:'nowPrice',title:'现价',width:100,align:'center'},
			{field:'newGoods',title:'新品',width:180,align:'center'},
			{field:'saleGoods',title:'特价商品',width:100,align:'center'},
			{field:'hostGoods',title:'热卖商品',width:100,align:'center'},
			{field:'goodsNum',title:'数量',width:100,align:'center'},
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


