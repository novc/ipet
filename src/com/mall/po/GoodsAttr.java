package com.mall.po;

public class GoodsAttr {
	
	private int goodsAttrId;
	
	private int goodsId;
	
	private String attrName;
	
	private String attrValue;
	
	private float price;
	
	private float nowPrice;
	
	public int getGoodsAttrId(){
		return goodsAttrId;
	}
	public void setGoodsAttrId(int goodsAttrId){
		this.goodsAttrId = goodsAttrId;
	}
	
	public int getGoodsId(){
		return goodsId;
	}
	public void setGoodsId(int goodsId){
		this.goodsId = goodsId;
	}
	
	public String getAttrName(){
		return attrName;
	}
	public void setAttrName(String attrName){
		this.attrName = attrName;
	}
	
	public String getAttrValue(){
		return attrValue;
	}
	public void setAttrValue(String attrValue){
		this.attrValue = attrValue;
	}
	
	public float getPrice(){
		return price;
	}
	public void setPrice(float price){
		this.price = price;
	}
	
	public float getNowPrice(){
		return nowPrice;
	}
	public void setNowPrice(float nowPrice){
		this.nowPrice = nowPrice;
	}
	
	
	
	
}
