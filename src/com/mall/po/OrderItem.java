package com.mall.po;

public class OrderItem {

	private int orderItemId;

	private int orderId;

	private int GoodsId;

	private int GoodsNum;

	public int getGoodsId() {
		return GoodsId;
	}

	public void setGoodsId(int GoodsId) {
		this.GoodsId = GoodsId;
	}

	public int getGoodsNum() {
		return GoodsNum;
	}

	public void setGoodsNum(int GoodsNum) {
		this.GoodsNum = GoodsNum;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	
}
