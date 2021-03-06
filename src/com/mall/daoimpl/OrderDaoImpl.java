package com.mall.daoimpl;

import com.mall.common.DbUtil;
import com.mall.dao.OrderDao;
import com.mall.po.Goods;
import com.mall.po.Order;
import com.mall.po.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {

	/**
	 * 添加订单，并返回订一个单号
	 * @param order 一个订单
	 * @return int  返回一个整型的订单号
	 */
	public int addOrder(Order order) {
		int orderId = 0;
		PreparedStatement pstmt_order = null; //用于对订单进行操作的预定义语句
		PreparedStatement pstmt_cart = null; //用于对购物车进行操作的预定义语句
		ResultSet rs = null;
		DbUtil dbUtil = null;
		String sql_order = "insert into tb_order values(null,?,?,?,?,?,?,NULL,?)";
		try {
			//事物处理
			dbUtil = new DbUtil();
			//将订单中的数据录入数据库
			pstmt_order = dbUtil.getCon().prepareStatement(sql_order);
			pstmt_order.setInt(1, order.getGoodsId());
			pstmt_order.setInt(2, order.getBuyNum());
			pstmt_order.setString(3, order.getName());
			pstmt_order.setString(4, order.getRecvName());
			pstmt_order.setString(5, order.getAddress());
			pstmt_order.setString(6, order.getPostcode());
			pstmt_order.setInt(7,order.getFlag());
			pstmt_order.executeUpdate();
			rs = pstmt_order.getGeneratedKeys();//取得主键
			rs.next();
			orderId = rs.getInt(1); //返回一个订单号
			//将订单项中的数据录入数据库
			String sql_cart = "delete from tb_cart where cartId="+order.getCartId();
			pstmt_cart = dbUtil.getCon().prepareStatement(sql_cart);
			int i = pstmt_cart.executeUpdate();
			if(i!=0){
				return orderId;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				dbUtil.getCon().rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				rs.close();
				pstmt_order.close();
				pstmt_cart.close();
				dbUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return 0;
	}
	//根据当前用户的用户名查订单
	public List selectOrder(String name) {
		List list = new ArrayList();
		Order or = null ;
		DbUtil dao = new DbUtil();
		PreparedStatement pre = null;
		ResultSet re = null;
		String sql = "select * from tb_order where name=?";	
		 try {
			pre = dao.getCon().prepareStatement(sql);
			pre.setString(1, name);
			  re =pre.executeQuery();
			  while(re.next()){
				  or = new Order ();
				  User user = new User();
				  or.setOrderId(re.getInt("orderId"));
				  user.setName(re.getString("name"));
				  or.setRecvName(re.getString("recvName"));
				  user.setAddress(re.getString("address"));
				  user.setPostcode(re.getString("postcode"));
				  user.setEmail(re.getString("email"));
				  or.setUser(user);
				  or.setOrderDate(re.getString("orderDate"));
				  or.setFlag(re.getInt("flag"));
				  if(re.getInt("Flag")==0){
					  or.setFlagName("等待发货");
				  }else if(re.getInt("Flag")==1){
					  or.setFlagName("已发货");
				  }else{
					  or.setFlagName("已确认收货");
				  }
				  list.add(or);
			  }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List selectOrderItem(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	// 根据订单号查订单项
//	public List selectOrderItem(int id ) {
//		List list = new ArrayList();
//		OrderItem ordetrItem = null ;
//		DbUtil dao = new DbUtil();
//		PreparedStatement pre = null;
//		ResultSet re = null;
//		String sql = "select * from tb_orderItem where orderId = ? ";
//		try{
//		pre = dao.getCon().prepareStatement(sql);
//		pre.setInt(1, id);
//		  re =pre.executeQuery();
//		  while(re.next()){
//			  ordetrItem = new OrderItem();
//			  ordetrItem.setGoodsId(re.getInt("bookId"));
////			  ordetrItem.setGoodsTitle(re.getString("goodsTitle"));
//			  ordetrItem.setGoodsNum(re.getInt("goodsNum"));
//			  ordetrItem.setOrderId(re.getInt("orderId"));
//			  ordetrItem.setOrderItemId(re.getInt("orderItemId"));
////			  ordetrItem.setPrice(re.getFloat("price"));
//			  list.add(ordetrItem);
//		  }
//		}catch (Exception e) {
//		}
//		return list;
//	}
	
	
	
}





