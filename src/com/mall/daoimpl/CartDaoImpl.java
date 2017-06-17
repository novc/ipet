package com.mall.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mall.common.DbUtil;
import com.mall.po.Admin;
import com.mall.po.Cart;
import com.mall.po.Goods;

public class CartDaoImpl {
	public boolean addCart(Cart cart){
		boolean flag = false;
		PreparedStatement pstmt = null;
		DbUtil dbUtil = null;
		String sql = "insert into tb_cart values(null,?,?,?)";
		try {
			dbUtil = new DbUtil();
			pstmt = dbUtil.getCon().prepareStatement(sql);
			pstmt.setInt(1, cart.getUserId());
			pstmt.setInt(2, cart.getGoodsId());
			pstmt.setInt(3, cart.getGoodsNum());
			int i = pstmt.executeUpdate();
			if(i != 0){
				//插入商品成功
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean updateCart(Cart cart){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		String sql = "update tb_cart set goodsNum=? where cartId=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setInt(1, cart.getGoodsNum());
			ps.setInt(2, cart.getCartId());
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
	
	public boolean deleteCartsByUserId(int[] ids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_cart where userId=?";
		
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);	
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();			
			if(k.length == ids.length) {
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
	
	public List getCart(int userId) {
		List cartList  = new ArrayList();
		DbUtil dao = new DbUtil();
		
		PreparedStatement pre = null;
		ResultSet re = null;
		String sql = "select * from tb_cart,tb_goods where tb_cart.goodsId = tb_goods.goodsId and tb_cart.userId = ? ";
		try {
			pre = dao.getCon().prepareStatement(sql);
			pre.setInt(1, userId);
			re = pre.executeQuery();
			while (re.next()) {
				Cart cart = new Cart();
				cart.setCartId(re.getInt("cartId"));
				cart.setUserId(re.getInt("userId"));
				cart.setGoodsId(re.getInt("goodsId"));
                cart.setGoodsNum(re.getInt("goodsNum"));
                Goods goods = new Goods();
                goods.setBrandName(re.getString("brandName"));
				goods.setGoodsTitle(re.getString("goodsTitle"));
				goods.setNowPrice(re.getFloat("nowPrice"));
				goods.setGoodsNum(re.getInt("goodsNum"));
				goods.setSpec(re.getString("spec"));
				goods.setIndexImg(re.getString("indexImage"));
				goods.setGoodsId(re.getInt("goodsId"));
				cart.setGoods(goods);
				cartList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				re.close();
				pre.close();
				dao.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cartList;
	}
	
	public boolean deleteCarts(int[] ids) {		
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_cart where cartId=?";
		
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);	
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();			
			if(k.length == ids.length) {
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
