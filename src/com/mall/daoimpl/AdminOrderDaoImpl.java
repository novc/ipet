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
import com.mall.dao.AdminOrderDao;
import com.mall.po.Order;
import com.mall.po.OrderFreezePager;
import com.mall.po.OrderItem;
import com.mall.po.OrderNotSendPager;
import com.mall.po.OrderPager;
import com.mall.po.OrderSendPager;
import com.mall.po.User;

public class AdminOrderDaoImpl implements AdminOrderDao {

	public List getAllOrder() {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order order by orderId";
			ps = dao.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
//				User user = new User();
				String flagName = (rs.getInt("flag")==1)?"已发货":"未发货";
				order.setOrderId(rs.getInt("orderId"));
				order.setName(rs.getString("name"));
				order.setRecvName(rs.getString("recvName"));
				order.setAddress(rs.getString("address"));
				order.setPostcode(rs.getString("postcode"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				order.setFlagName(flagName);
				
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public Order getOneOrder(int id) {
		Order order = new Order();
		List orderItemList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_orderItem where orderId = ? order by orderId";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderItem orderItem = new OrderItem();
				orderItem.setOrderItemId(rs.getInt("orderItemId"));
				orderItem.setGoodsId(rs.getInt("bookId"));
				orderItem.setGoodsName(rs.getString("goodsName"));
				orderItem.setPrice(rs.getFloat("price"));
				orderItem.setGoodsNum(rs.getInt("goodsNum"));
				orderItemList.add(orderItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		order.setOrderItem(orderItemList);
		return order;
	}

	public List getNotSendOrder(int flag) {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order where flag = ? order by orderId";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
//				User user = new User();
				String flagName = (rs.getInt("flag")==1)?"已发货":"未发货";
				order.setOrderId(rs.getInt("orderId"));
				order.setName(rs.getString("name"));
				order.setRecvName(rs.getString("recvName"));
				order.setAddress(rs.getString("address"));
				order.setPostcode(rs.getString("postcode"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				order.setFlagName(flagName);
				
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}
	
	public Order searchOrderByOrderId(int orderId,int flag) {
		Order order = new Order();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order where orderId = ? and flag = ? order by orderId";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, orderId);
			ps.setInt(2, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				String flagName = (rs.getInt("flag")==1)?"已发货":"未发货";
				order.setOrderId(rs.getInt("orderId"));
				order.setName(rs.getString("name"));
				order.setRecvName(rs.getString("recvName"));
				order.setAddress(rs.getString("address"));
				order.setPostcode(rs.getString("postcode"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				order.setFlagName(flagName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return order;
	}

	public List getSendOrder(int flag) {
		List orderList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_order where flag = ? order by orderId";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, flag);
			rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
//				User user = new User();
				String flagName = (rs.getInt("flag")==1)?"已发货":"未发货";
				order.setOrderId(rs.getInt("orderId"));
				order.setName(rs.getString("name"));
				order.setRecvName(rs.getString("recvName"));
				order.setAddress(rs.getString("address"));
				order.setPostcode(rs.getString("postcode"));
				order.setEmail(rs.getString("email"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setFlag(rs.getInt("flag"));
				order.setFlagName(flagName);
				
				orderList.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return orderList;
	}

	public boolean SendOrders(int[] orderids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "update tb_order set flag=1 where orderId=? order by orderId";
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for(int j=0;j<orderids.length;j++) {
				ps.setInt(1, orderids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();
			if(k.length == orderids.length) {
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
	
	public boolean SendOrder(int orderid) {
		DbUtil dbUtil = null;
		PreparedStatement pre = null;
		String sql = "update tb_order set flag=1 where orderId=? order by orderId";
		try {
			dbUtil = new DbUtil();
			pre = dbUtil.getCon().prepareStatement(sql);
			pre.setInt(1, orderid);
			int i = pre.executeUpdate();
			if(i != 0) {// 添加成功
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pre.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean deleteOrder(int[] ids) {		
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		Connection conn = null;
		String sql = "delete from tb_order where orderId=?";
		String sql2 = "delete from tb_orderitem where orderId=?";
		
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);	
			ps2 = conn.prepareStatement(sql2);
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps2.setInt(1, ids[j]);
				ps.addBatch();
				ps2.addBatch();
			}
			int[] m = ps2.executeBatch();
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

	public boolean UpdateOrderInfo(Order order){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		String sql = "update tb_order set recvName=?,address=?,postcode=? where orderId=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, order.getRecvName());
			ps.setString(2, order.getAddress());
            ps.setString(3, order.getPostcode());
            ps.setInt(4, order.getOrderId());
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

	
}
