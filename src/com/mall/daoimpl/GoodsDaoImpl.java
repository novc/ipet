package com.mall.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mall.common.DbUtil;
import com.mall.dao.GoodsDao;
import com.mall.po.Goods;

public class GoodsDaoImpl implements GoodsDao {
	
	public List getGoodsBySuperId(){
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		DbUtil dbUtil = null;
			List goodsList = new ArrayList();
			
			String sql = "select * from tb_supertype,tb_subtype,tb_goods where tb_supertype.superTypeId = tb_goods.superTypeId and tb_subtype.subTypeId=tb_goods.subTypeId order by tb_goods.subTypeId";
			try {
				dbUtil = new DbUtil();
				pstmt = dbUtil.getCon().prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					Goods goods = new Goods();
					goods.setSuperTypeName(rs.getString("superTypeName"));
					goods.setSubTypeName(rs.getString("subTypeName"));
					goods.setGoodsId(rs.getInt("goodsId"));
					goods.setSuperTypeId(rs.getInt("superTypeId"));
					goods.setSubTypeId(rs.getInt("subTypeId"));
					goods.setGoodsTitle(rs.getString("goodsTitle"));
					goods.setIntroduce(rs.getString("introduce"));
					goods.setPrice(rs.getFloat("price"));
					goods.setNowPrice(rs.getFloat("nowPrice"));
					goods.setIndexImg(rs.getString("indexImage"));
					goods.setCollectNum(rs.getInt("collectNum"));
					goods.setSuperTypeIcon(rs.getString("superTypeIcon"));
					goodsList.add(goods);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
					pstmt.close();
					dbUtil.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return goodsList;
	}

	public List getGoodsSpecial(int type){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		List goodsList = new ArrayList();
		String sql = "";
		int num = 0;
		if(type == 0){//获取特价商品
			sql = "select * from tb_goods where sale =1 order by click";
		}
		if(type == 1){//获取推荐商品
			sql = "select * from tb_goods where special = 1 order by collectNum";
		}
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()&&num<10){
				num++;
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSuperTypeId(rs.getInt("superTypeId"));
				goods.setSubTypeId(rs.getInt("subTypeId"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goods.setIntroduce(rs.getString("introduce"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNowPrice(rs.getFloat("nowPrice"));
				goods.setIndexImg(rs.getString("indexImage"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsList;
	}
	
	public List getNavTypeName(){
		PreparedStatement pstmt = null;
		
		List goodsNavList = new ArrayList();
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_supertype";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Goods goods = new Goods();
				goods.setSuperTypeName(rs.getString("superTypeName"));
				goods.setSuperTypeId(rs.getInt("superTypeId"));
				goodsNavList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsNavList;
	}
	
	public List searchGoodsByKey(String val){
		PreparedStatement pstmt = null;
		Goods goods = null;
		List goodsList = new ArrayList();
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods where `key` like '%"+val+"%'";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSuperTypeId(rs.getInt("superTypeId"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goods.setIntroduce(rs.getString("introduce"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNowPrice(rs.getFloat("nowPrice"));
				goods.setIndexImg(rs.getString("indexImage"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goods.setSellNum(rs.getInt("sellNum"));
				
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsList;
	}
	
	public List getGoodsList(int goodsId){
		PreparedStatement pstmt = null;
		Goods goods = null;
		List goodsList = new ArrayList();
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods natural join tb_supertype where tb_supertype.superTypeId = ?";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				goods = new Goods();
				goods.setGoodsId(goodsId);
				goods.setSuperTypeName(rs.getString("superTypeName"));
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSuperTypeId(rs.getInt("superTypeId"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goods.setIntroduce(rs.getString("introduce"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNowPrice(rs.getFloat("nowPrice"));
				goods.setIndexImg(rs.getString("indexImage"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goods.setSellNum(rs.getInt("sellNum"));
				
				goodsList.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsList;
	}
	
	
	public Goods getGoodsDetail(int goodsId){
		PreparedStatement pstmt = null;
		Goods goods = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods natural join tb_goodsImg where tb_goods.goodsId = ?";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, goodsId);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				goods = new Goods();
				goods.setGoodsId(goodsId);
				goods.setBrandName(rs.getString("brandName"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goods.setIntroduce(rs.getString("introduce"));
				goods.setMeasure(rs.getString("measure"));
				goods.setNowPrice(rs.getFloat("nowPrice"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setGoodsDetailImg(rs.getString("goodsDetailImg"));
				goods.setSpec(rs.getString("spec"));
				goods.setSmallImg(rs.getString("smallImg"));
				goods.setBigImg(rs.getString("bigImg"));
				goods.setGrantImg(rs.getString("grantImg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goods;
	}
	
	public List getHotGoodsName(){
		PreparedStatement pstmt = null;
		List goodsHotList = new ArrayList();
		ResultSet rs = null;
		DbUtil dbUtil = null;
		int num = 0;
		String sql = "select * from tb_goods order by click desc";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()&&num<3){
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goodsHotList.add(goods);
				num ++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goodsHotList;
	}
	
	public boolean updateGoodsNum(int num,int GoodsId) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		String sql = "update tb_goods set GoodsNum=? where goodsId=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, GoodsId);
			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	public boolean updateGoods(Goods Goods){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		System.out.println(Goods.getKey());
		String sql = "update tb_goods set goodsTitle='"+Goods.getGoodsTitle()+"'," +
				"introduce='"+Goods.getIntroduce()+"'," +
						"brandName='"+Goods.getBrandName()+"'," +
								"price="+Goods.getPrice()+",nowPrice="+Goods.getNowPrice()+"," +
				"sale="+Goods.getSale()+",special="+Goods.getSpecial()+",`key`='"+Goods.getKey()+"'," +
						"goodsNum="+Goods.getGoodsNum()+" where goodsId="+Goods.getGoodsId();
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
            System.out.println(sql);
			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	/**
	 *  根据商品的GoodsId号来展示该商品的详细信息
	 * @param GoodsId 商品号
	 * @return Goods
	 */
	public Goods showGoodsById(int GoodsId){
		PreparedStatement pstmt = null;
		Goods goods = new Goods();
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods where goodsId=?";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, GoodsId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setSuperTypeId(rs.getInt("superTypeId"));
				goods.setSubTypeId(rs.getInt("subTypeId"));
				goods.setGoodsTitle(rs.getString("goodsTitle"));
				goods.setIntroduce(rs.getString("introduce"));
				goods.setBrandName(rs.getString("brandName"));
				goods.setSpec(rs.getString("spec"));
				goods.setMeasure(rs.getString("measure"));
				goods.setPrice(rs.getFloat("price"));
				goods.setNowPrice(rs.getFloat("nowPrice"));
				goods.setIndexImg(rs.getString("indexImage"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setSellNum(rs.getInt("sellNum"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goods.setGoodsDetailImg(rs.getString("goodsDetailImg"));
				goods.setKey(rs.getString("key"));
				goods.setClick(rs.getInt("click"));
				goods.setSale(rs.getInt("sale"));
				goods.setSpecial(rs.getInt("special"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return goods;
	}
	
	/**
	 * 根据用户输入的关键字搜索相关商品
	 * @param keywords 用户输入的关键字 
	 */
	public List searchGoods(String keywords){
		List searchList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods where goodsName like '%"+keywords+"%'";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//有相关商品		
				while(rs.next()){
					Goods Goods = new Goods();
					Goods.setGoodsTitle(rs.getString("goodsTitle"));
					Goods.setIndexImg(rs.getString("indexImage"));
					searchList.add(Goods);
				}	
			}else{
				//没有找到相关商品
				throw new NoRelativeGoodsException("没有搜索到你想找的相关商品！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}


	public List searchGoodsByConditions(int superTypeId,int subTypeId,String searchMethod){
		List GoodsList = new ArrayList();
		String str[] = searchMethod.split("=");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = null;
		sql = "select * from tb_goods where superTypeId=? and subTypeId=? and "+str[0]+" =?";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, superTypeId);
			pstmt.setInt(2, subTypeId);
			pstmt.setString(3, str[1]);
			rs = pstmt.executeQuery();
			if(rs.next()){//有相关商品
				while(rs.next()){
					Goods Goods = new Goods();
					Goods.setGoodsTitle(rs.getString("goodsTitle"));
					Goods.setIndexImg(rs.getString("indexImage"));
					GoodsList.add(Goods);
				}	
			}else{//没有找到相关商品
				throw new NoRelativeGoodsException("没有搜索到你想找的相关商品！！");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return GoodsList;
	}
}

