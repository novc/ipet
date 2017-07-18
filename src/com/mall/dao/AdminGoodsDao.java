package com.mall.dao;

import java.util.List;

import com.mall.po.Goods;

public interface AdminGoodsDao {

	public List getAllGoods();
	public boolean addGoods(Goods Goods);
	public boolean checkGoodsNameIsExist(String GoodsName);
	public boolean checkISBNIsExist(String ISBN);
	public List getAllGoodsName();
	public boolean deleteGoods(int[] GoodsIds);
	public boolean setGoodsSpecial(int goodId);
	public boolean setGoodsHost(int goodId);
	public boolean setGoodsSale(int goodId);
	public boolean setGoodsNew(int goodId);
}
