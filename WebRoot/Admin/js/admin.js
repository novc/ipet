
/* 根据订单号查询订单 并且重新渲染数据表格 */
function searchOrder(flag) {
	var orderId = document.getElementById("OrderID").value;
	var searchDiv = document.getElementById("searchDiv");
	console.log(orderId);
	if(orderId != ""&&(!isNaN(orderId))) {
		$.ajax({
			type: "GET",
		    url: "GetOrderByOrderIDServlet",
		    data: {
		    	"orderId":orderId,
		    	"flag":flag
		    },
		    success: function(msg){
		    	console.log(msg);
		    	var res = $.parseJSON(msg);
		    	if(res.orderId==0){
		    		alert("没有该订单！");
		    		return;
		    	}
		      	$("table").empty();
		      	$("table").append("<thead><tr><td>全选<input type='checkbox' id='selectAll' onclick='selectAll()'></td><td>订单ID</td><td>用户名</td><td>姓名</td><td>地址</td><td>邮编</td><td>时间</td><td>状态</td><td colspan='2'>操作</td></tr></thead>");
		      	$("table").append("<tbody><tr><td><input type='checkbox' name='delete' value="+res.orderId+" /></td><td>"+res.orderId+"</td><td>"+res.name+"</td><td>"+res.recvName+"</td><td>"+res.address+"</td><td>"+res.postcode+"</td><td>"+res.orderDate+"</td><td>"+res.flagName+"</td><td><a href='getOneOrderServlet?orderId='"+res.orderId+">详情</a></td><td><a href='deleteOrder?orderIds="+res.orderId+"'>删除</a></td></tr></tbody>");
		    },
		    error:function(){
		    	return;
		    }
		})
	} else {
		searchDiv.innerHTML = "请输入2位数字的订单号";
		searchDiv.style.color="red";
	}
};//end of 订单查询


/*---------实现全选----------*/
function selectAll() {
	var deletes =document.getElementsByName("delete");
	var selectAll = document.getElementById("selectAll");
	for(var i = 0;i<deletes.length;i++) {
		if(selectAll.checked == true) {
		 	deletes[i].checked = true;
		}
		else {
			deletes[i].checked = false;
		}
	}
}; //end of 全选

/*订单删除，非空判断，实现向servlet(deleteOrder)的跳转*/
function removeOrder(pageOffset,pageSize) {
	var deletes = document.getElementsByName("delete");
	var count = 0;
	var orders = new Array();
	for(var i = 0;i<deletes.length;i++) {
		if(deletes[i].checked) {
			count++;
			orders.push(deletes[i].value);
		}
	}
	if(count == 0) {
		alert("请选择要删除的项目");
		return false;
	}
	var oform = document.getElementsByTagName("form")[0];
	oform.action = "deleteOrder?orderIds="+orders+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
	oform.submit();
};//end of 订单删除

function removeInform(pageOffset,pageSize) {
	var deletes = document.getElementsByName("delete");
	var count = 0;
	var informs = new Array();
	for(var i = 0;i<deletes.length;i++) {
		if(deletes[i].checked) {
			count++;
			informs.push(deletes[i].value);
		}
	}
	if(count == 0) {
		alert("请选择要删除的项目");
		return false;
	}
	var oform = document.getElementsByTagName("form")[0];
	oform.action = "deleteInform?informIds="+informs+"&pageOffset="+pageOffset+"&pageSize="+pageSize;
	oform.submit();
}
/*设置信息 将订单Id写入sessionStorage，然后跳转到订单修改页面*/
function setUpdateOrderInfo(orderId,servlet){
	if(window.sessionStorage){
		window.sessionStorage.setItem("updateOrderId",orderId);
		window.sessionStorage.setItem("updateOrderServlet",servlet);
		window.location.href="Admin/pages/updateOrderInfo.jsp";
	}else{
		console.log("session error");
	}
};//end of 订单修改准备信息

/*设置信息 将公告Id写入sessionStorage，然后跳转到公告修改页面*/
function setUpdateInform(informId){
	if(window.sessionStorage){
		window.sessionStorage.setItem("updateInformId",informId);
		window.location.href="Admin/pages/updateInform.jsp";
	}else{
		console.log("session error");
	}
} //end of setUpdateInform

/*发货请求*/
function sendOrder(orderId,pageOffset,pageSize){
	$.ajax({
  		url:"adminSendOrderServlet",
  		type:"POST",
  		data:{
  			"orderId":orderId,
  			"pageOffset":pageOffset,
  			"pageSize":pageSize 
  		},
  		success:function(msg){
  			alert(msg);
  		}
	})
}//end of 发货

function updateOrder(){
	$("form").attr("action","updateOrderInfoServlet?orderId="+sessionStorage.getItem('updateOrderId')+"&updateOrderServlet="+sessionStorage.getItem('updateOrderServlet'));
	$("form").submit();
}

function updateInform(){
	$("form").attr("action","updateInformServlet?informId="+sessionStorage.getItem('updateInformId'));
	$("form").submit();
}

function cancle(){
	window.location.href=window.sessionStorage.getItem("updateOrderServlet");
}



