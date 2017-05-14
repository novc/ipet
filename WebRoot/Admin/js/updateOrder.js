$.ajax({
	url:"GetOrderByOrderIDServlet",
	type:"POST",
	data:{
		"orderId":sessionStorage.getItem("updateOrderId")
	},
	success:function(msg){
		var res =$.parseJSON(msg);
		console.log(res);
		$("input[name='orderId']").val(res.orderId);
		$("input[name='user']").val(res.name);
		$("input[name='recvName']").attr("placeholder",res.recvName);
		$("input[name='address']").attr("placeholder",res.address);
		$("input[name='postcode']").attr("placeholder",res.postcode);
		$("input[name='orderDate']").val(res.orderDate);
	}
});
