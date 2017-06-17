package com.mall.po;

import java.util.List;

/**
 *一个订单JavaBean
 */
public class Order {
	private int orderId;
	
	private int userId;
	
	private int goodsId;
	
	private String recvName;//收货人
	
	private User user;

	private String name;
	
	private String address; 

	private String postcode; 

	private String orderDate;

	private int flag;//0表示货没发出，1表示货已发出，2表示货冻结
	
	private String flagName;
	
	private String goodsTitle; 
	
	private float nowPrice; 
	
	private int buyNum; 
	
	private int goodsNum; 
	
	
	
	public int getGoodsId() {
		return goodsId; 
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	public float getNowPrice() {
		return nowPrice; 
	}

	public void setNowPrice(float nowPrice) {
		this.nowPrice = nowPrice;
	}
	
	public int getgoodsNum() {
		return goodsNum; 
	}

	public void setgoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	
	public int getBuyNum() {
		return buyNum; 
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	
	
	
	public String getGoodsTitle() {
		return goodsTitle; 
	}

	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getRecvName() {
		return recvName;
	}

	public void setRecvName(String recvName) {
		this.recvName = recvName;
	}
	
	public String getFlagName() {
		return flagName;
	}

	public void setFlagName(String flagName) {
		this.flagName = flagName;
	}
	
}