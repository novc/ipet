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
import com.mall.po.BuyRecord;
import com.mall.po.Goods;
import com.mall.po.Page;

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
			while(rs.next()&&num<5){
				goodsHotList.add(rs.getString("brandName"));
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
		String sql = "update tb_goods set goodsName=?,goodsNum=?,introduce=?,ISBN=?,author=?,superTypeId=?,subTypeId=?,publisher=?,price=?,nowPrice=?," +
				"produceDate=?,hostGoods=?,newGoods=?,saleGoods=?,specialGoods=? where goodsId=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
//			ps.setString(1, Goods.getGoodsName());
//			ps.setInt(2, Goods.getGoodsNum());
//            ps.setString(3, Goods.getIntroduce());
//            ps.setString(4, Goods.getISBN());
//            ps.setString(5, Goods.getAuthor());
//            ps.setInt(6, Goods.getSuperTypeId());
//            ps.setInt(7, Goods.getSubTypeId());
//            ps.setString(8, Goods.getPublisher());
//            ps.setFloat(9, Goods.getPrice());
//            ps.setFloat(10, Goods.getNowPrice());
//            ps.setString(11, Goods.getProduceDate());
//            ps.setInt(12, Goods.getHostGoods());
//            ps.setInt(13, Goods.getNewGoods());
//            ps.setInt(14, Goods.getSaleGoods());
//            ps.setInt(15, Goods.getSpecialGoods());
//            ps.setInt(16, Goods.getGoodsId());
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
	
	public List showBuyRecordsById(int GoodsId){
		List searchList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select B.name,A.goodsNum,B.orderDate from tb_orderitem A, tb_order B where A.orderId=B.orderId and A.goodsId="+GoodsId+"";
		try 
		{
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
				
				while(rs.next()){
					BuyRecord brc = new BuyRecord();
					brc.setName(rs.getString("name"));
					brc.setGoodsNum(rs.getInt("goodsNum"));
					brc.setOrderDate(rs.getString("orderDate"));
					
					searchList.add(brc);
				}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchList;
	}
	
	/**
	 *		将商品本信息录入数据库
	 */
	public boolean addGoods(Goods Goods){
		boolean flag = false;
		PreparedStatement pstmt = null;
		DbUtil dbUtil = null;
		String sql = "insert into tb_goods values(null,?,?,?,?,?,?,?,?,?,?,?,null,?,?,?,?)";
		try {
			dbUtil = new DbUtil();
//			pstmt = dbUtil.getCon().prepareStatement(sql);
//			pstmt.setInt(1, Goods.getSuperTypeId());
//			pstmt.setInt(2, Goods.getSubTypeId());
//			pstmt.setString(3, Goods.getGoodsName());
//			pstmt.setString(4, Goods.getISBN());
//			pstmt.setString(5, Goods.getIntroduce());
//			pstmt.setFloat(6, Goods.getPrice());
//			pstmt.setFloat(7, Goods.getNowPrice());
//			pstmt.setString(8, Goods.getPicture());
//			pstmt.setString(9, Goods.getProduceDate());
//			pstmt.setString(10, Goods.getPublisher());
//			pstmt.setString(11, Goods.getAuthor());
//			pstmt.setInt(12, Goods.getNewGoods());
//			pstmt.setInt(13, Goods.getSaleGoods());
//			pstmt.setInt(14, Goods.getHostGoods());
//			pstmt.setInt(15, Goods.getGoodsNum());
			int i = pstmt.executeUpdate();
			if(i != 0){
				//插入商品成功
				return flag;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
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
	/**
	 * 分页显示商品
	 * @param currentPage 显示出来的当前页码
	 * @param pageSize 每页显示数目
	 * @return Page
	 */
	public Page doPage(String keywords,int currentPage,int pageSize){
		Page page = new Page();
		int totalNum = searchGoods(keywords).size();
		System.out.println("totalNum="+totalNum);
		List pageList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql = "select * from tb_goods where goodsName like '%"+keywords+"%' limit "+currentPage+","+pageSize;
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Goods Goods = new Goods();
				Goods.setGoodsId(rs.getInt("goodsId"));
				Goods.setGoodsTitle(rs.getString("goodsTitle"));
				Goods.setIndexImg(rs.getString("indexImage"));
				Goods.setPrice(rs.getFloat("price"));
				Goods.setNowPrice(rs.getFloat("nowPrice"));
				pageList.add(Goods);
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
		page.setPageList(pageList);
		page.setTotalNum(totalNum);
		return page;
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
	/**
	 * 根据用户选择的搜索条件搜索相关商品
	 * @param superTypeId 所属大类的ID
	 * @param subTypeId 所属小类的ID
	 * @param searchMethod （可以是按品牌、商品名、产地、编码、价格中的一个）
	 * @param upLoadTime 商品上价时间
	 */
	public Page doPageByConditons(int superTypeId,int subTypeId,String searchMethod,int currentPage,int pageSize){
		Page page = new Page();
		String str[] = searchMethod.split("=");
		int totalNum = searchGoodsByConditions(superTypeId,subTypeId,searchMethod).size();
		List pageList = new ArrayList();
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
			while(rs.next()){
				Goods goods = new Goods();
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
				goods.setIndexImg(rs.getString("indexImg"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setSellNum(rs.getInt("sellNum"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goods.setGoodsDetailImg(rs.getString("goodsDetailImg"));
				goods.setKey(rs.getString("key"));
				goods.setClick(rs.getInt("click"));
				goods.setSale(rs.getInt("sale"));
				goods.setSpecial(rs.getInt("special"));
				pageList.add(goods);
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
		page.setPageList(pageList);
		page.setTotalNum(totalNum);
		return page;
	}
}

