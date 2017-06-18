package com.mall.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mall.common.DbUtil;
import com.mall.dao.AdminGoodsDao;
import com.mall.po.Goods;
import com.mall.po.GoodsPager;

public class AdminGoodsDaoImpl implements AdminGoodsDao{

	public List getAllGoods() {
		List goodslist = new ArrayList();
		DbUtil daoUtil = new DbUtil();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			sql = "select * from tb_goods order by goodsId desc";
			ps = daoUtil.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
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
				goods.setIndexImg(rs.getString("indexImage"));
				goods.setGoodsNum(rs.getInt("goodsNum"));
				goods.setSellNum(rs.getInt("sellNum"));
				goods.setCollectNum(rs.getInt("collectNum"));
				goods.setGoodsDetailImg(rs.getString("goodsDetailImg"));
				goods.setKey(rs.getString("key"));
				goods.setClick(rs.getInt("click"));
				goods.setSale(rs.getInt("sale"));
				goods.setSpecial(rs.getInt("special"));
				goodslist.add(goods);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return goodslist;
	}

	public boolean addGoods(Goods Goods) {
		DbUtil dao = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			dao = new DbUtil();
			sql = "INSERT INTO `tb_goods` VALUES (NULL, ?,?,?,?,?,?,?,?,?,?,?, NULL, NULL, NULL, ?, 0, ?, ?);";
			ps = dao.getCon().prepareStatement(sql);

			ps.setInt(1, Goods.getSuperTypeId());
			ps.setInt(2, Goods.getSubTypeId());
			ps.setString(3, Goods.getGoodsTitle());
			ps.setString(4, Goods.getIntroduce());
			ps.setString(5, Goods.getBrandName());
			ps.setString(6, Goods.getSpec());
			ps.setString(7, Goods.getMeasure());
			ps.setFloat(8, Goods.getPrice());
			ps.setFloat(9, Goods.getNowPrice());
			ps.setString(10, Goods.getIndexImg());
			ps.setInt(11, Goods.getGoodsNum());
			ps.setString(12, Goods.getKey());
			ps.setInt(13, Goods.getSale());
			ps.setInt(14, Goods.getSpecial());

			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				dao.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public boolean checkGoodsNameIsExist(String GoodsName) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_goods where goodsTitle = ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, GoodsName);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public boolean checkISBNIsExist(String ISBN) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_goods where ISBN = ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, ISBN);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public GoodsPager searchGoods(String GoodsName) {
		Map GoodsMap = new HashMap();
		List goodslist = new ArrayList();
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select * from tb_goods where goodsName like ?";
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, GoodsName+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
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
				goodslist.add(goods);
				GoodsMap.put(goods.getGoodsId(),goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		GoodsPager bp = new GoodsPager();
		bp.setGoodsMap(GoodsMap);
		bp.setTotalNum(GoodsMap.size());
		return bp;
	}
	
	public boolean setGoodsSpecial(int goodId){
		DbUtil dbUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_goods set specialgoods=1 where goodsId=?";
		try {
			dbUtil = new DbUtil();
			ps = dbUtil.getCon().prepareStatement(sql);
			ps.setInt(1, goodId);
			int i = ps.executeUpdate();
			if(i != 0) {// 修改成功
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean setGoodsHost(int goodId){
		DbUtil dbUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_goods set hostgoods=1 where goodsId=?";
		try {
			dbUtil = new DbUtil();
			ps = dbUtil.getCon().prepareStatement(sql);
			ps.setInt(1, goodId);
			int i = ps.executeUpdate();
			if(i != 0) {// 修改成功
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean setGoodsSale(int goodId){
		DbUtil dbUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_goods set salegoods=1 where goodsId=?";
		try {
			dbUtil = new DbUtil();
			ps = dbUtil.getCon().prepareStatement(sql);
			ps.setInt(1, goodId);
			int i = ps.executeUpdate();
			if(i != 0) {// 修改成功
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean setGoodsNew(int goodId){
		DbUtil dbUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_goods set newgoods=1 where goodsId=?";
		try {
			dbUtil = new DbUtil();
			ps = dbUtil.getCon().prepareStatement(sql);
			ps.setInt(1, goodId);
			int i = ps.executeUpdate();
			if(i != 0) {// 修改成功
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public List getAllGoodsName() {
		List GoodsNameList = new ArrayList();
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		try {
			daoUtil = new DbUtil();
			sql = "select goodsName from tb_goods";
			ps = daoUtil.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				GoodsNameList.add(rs.getString("goodsName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				daoUtil.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return GoodsNameList;
	}
	
	public GoodsPager getGoodsPager(int index,int pageSize) {
		Map GoodsMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_goods limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
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
				GoodsMap.put(goods.getGoodsId(), goods);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				db.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		GoodsPager bp = new GoodsPager();
		bp.setGoodsMap(GoodsMap);
		bp.setPageSize(pageSize);
		bp.setTotalNum(getAllGoods().size());
		return bp;
	}
	
	public boolean deleteGoods(int[] GoodsIds) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_goods where goodsId=?";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<GoodsIds.length;j++) {
				ps.setInt(1, GoodsIds[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == GoodsIds.length) {
				return true;
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
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
}
