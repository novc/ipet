package com.mall.po;

import java.io.Serializable;

/**
 *javabean
 */
public class Goods implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int goodsId;

	private int superTypeId;
	
	private String superTypeName;
	
	private String subTypeName;

	private int subTypeId;

	private String goodsTitle;

	private String introduce;

	private String brandName;
	
	private String spec;
	
	private String measure;

	private float price;

	private float nowPrice;

	private String indexImage;

	private int goodsNum;
	
	private int sellNum;

	private int collectNum;
	
	private String goodsDetailImg;
	
	private String key;
	
	private int click;

	private int sale;
	
	private int special;

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsTitle() {
		return goodsTitle;
	}

	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}
	
	public String getSuperTypeName() {
		return superTypeName;
	}

	public void setSuperTypeName(String superTypeName) {
		this.superTypeName = superTypeName;
	}

	public String getSubTypeName() {
		return subTypeName;
	}

	public void setSubTypeName(String subTypeName) {
		this.subTypeName = subTypeName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public float getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(float nowPrice) {
		this.nowPrice = nowPrice;
	}

	public String getIndexImg() {
		return indexImage;
	}

	public void setIndexImg(String indexImg) {
		this.indexImage = indexImg;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public int getSubTypeId() {
		return subTypeId;
	}

	public void setSubTypeId(int subTypeId) {
		this.subTypeId = subTypeId;
	}

	public int getSuperTypeId() {
		return superTypeId;
	}

	public void setSuperTypeId(int superTypeId) {
		this.superTypeId = superTypeId;
	}


	public int getSpecial() {
		return special;
	}

	public void setSpecial(int special) {
		this.special = special;
	}


	public int getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public String getMeasure() {
		return measure;
	}

	public void setMeasure(String measure) {
		this.measure = measure;
	}

	public int getSellNum() {
		return sellNum;
	}

	public void setSellNum(int sellNum) {
		this.sellNum = sellNum;
	}

	public int getCollectNum() {
		return collectNum;
	}

	public void setCollectNum(int collectNum) {
		this.collectNum = collectNum;
	}

	public String getGoodsDetailImg() {
		return goodsDetailImg;
	}

	public void setGoodsDetailImg(String goodsDetailImg) {
		this.goodsDetailImg = goodsDetailImg;
	}
	
	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
	
}
