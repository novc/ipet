package com.mall.dao;

import java.util.List;

import com.mall.po.Goods;

public interface GoodsDao {
	public List searchGoods(String keywords);
}
