package com.mall.po;

public class Cart {
	private int cartId;

	private int userId;

	private int goodsId;

	private int goodsNum;
	
	private Goods goods;
	
	public Goods getGoods(){
		return goods;
	}
	
	public void setGoods(Goods goods){
		this.goods = goods;
	}
	


	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}


	public int getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	
}
