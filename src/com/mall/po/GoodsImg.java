package com.mall.po;

public class GoodsImg {
	
	private int goodsImgId;
	
	private int goodsId;
	
	private String smallImg;
	
	private String bigImg;

	private String grantImg;

	public int getGoodsImgId(){
		return goodsImgId;
	}
	public void setGoodsImgId(int goodsImgId){
		this.goodsImgId = goodsImgId;
	}
	
	public int getGoodsId(){
		return goodsId;
	}
	public void setGoodsId(int goodsId){
		this.goodsId = goodsId;
	}
	
	public String getSmallImg(){
		return smallImg;
	}
	public void setSmallImg(String smallImg){
		this.smallImg = smallImg;
	}
	
	public String getBigImg(){
		return bigImg;
	}
	public void setBigImg(String bigImg){
		this.bigImg = bigImg;
	}

	public String getGrantImg(){
		return grantImg;
	}
	public void setGrantImg(String grantImg){
		this.grantImg = grantImg;
	}
	
}
