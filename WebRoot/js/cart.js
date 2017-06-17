$(document).ready(function(){
	$(".top").load("header.html",function(){
		topFun();
	});
	$(".footer").load("footer.html");
});
$.ajax({
	url:"http://localhost:8080/ipet/GetCartServlet",
	success:function(msg){
		var res = JSON.parse(msg);
		if(res===0){
			var oNologin = "<div style='text-align:center;line-height:100px;font-size:14px;'>您还未登录，请<a href='login.html'>登录</a></div>";
			$(".cart-area").append(oNologin);
		}else if(res.length!=0){
			var nSumPrice = 0;
			var aCartIdS = new Array();
			
			for(var i in res){
				aCartIdS.push(res[i].cartId);
				var oCartBar = "<div class='cart-bar'><div class='choose fl'><input class='select' value='"+res[i].cartId+"' type='checkbox' checked/></div>";
				var oImg = "<div class='img fl'><img width='100px' height='100px' src='img/"+res[i].goods.indexImg+"' alt='"+res[i].goods.indexImg+"'></div>";
				var oTitle = "<div class='goods-tit fl'><a href='goodsDetail.html?goodsId="+res[i].goodsId+"'><span class='brand-name'>"+res[i].goods.brandName+"</span><span class='gooods-title'>"+res[i].goods.goodsTitle+"</span><span class='spec'>"+res[i].goods.spec+"</span></a></div>";
				var oGoodsNum = "<div class='goods-num fl'><input type='number' min=1 value="+res[i].goodsNum+" /></div>";
				var oPrice = "<div class='goods-price fl'>"+res[i].goods.nowPrice+"</div>";
				var oFun = "<div class='func-area fl'><a href='javascript:deleteCart("+res[i].cartId+")'>[删除]</a></div><div class='clearfix'></div>";
				$(".cart-area").append(oCartBar);
				$(".cart-bar:last").append(oImg).append(oTitle).append(oGoodsNum).append(oPrice).append(oFun);
				nSumPrice = nSumPrice+res[i].goods.nowPrice;
				
			}
			var sCartIds = aCartIdS.toString();
			var oEmptyCart = "<a class='empty-cart'  href='javascript:deleteCart("+sCartIds+")'>[清空购物车]</a>";
			$(".cart-tit").append(oEmptyCart);
			
			//全选
			$("#allSelect").change(function(){
				var deletes =document.getElementsByClassName("select");
				var selectAll = document.getElementById("allSelect");
				for(var i = 0;i<deletes.length;i++) {
					if(selectAll.checked == true) {
					 	deletes[i].checked = true;
					}
					else {
						deletes[i].checked = false;
					}
				}
			});
			$(".sum-price").html(nSumPrice);
		}else{
			var oNologin = "<div style='text-align:center;line-height:100px;font-size:14px;'>这里空空如也，快去为宠物们<a href='index.html'>选购</a>商品吧~</div>";
			$(".cart-area").append(oNologin);
		}
		
	}
});

function getIds (){
	var deletes = document.getElementsByClassName("select");
	var count = 0;
	var carts = new Array();
	for(var i = 0;i<deletes.length;i++) {
		if(deletes[i].checked) {
			count++;
			carts.push(deletes[i].value);
		}
	}
	if(count == 0) {
		alert("请选择要删除的商品");
		return false;
	}else{
		deleteCart(carts);
	}
}
function deleteCart(cartIds) {
	var ids = cartIds.toString();
	$.ajax({
		url:"http://localhost:8080/ipet/DeleteCartsServlet",
		type:"POST",
		data:{
			cartIds:ids
		},
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功");
				window.location.reload(true);
			}else{
				alert("删除失败");
			}
		}
	});
}
