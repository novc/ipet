package com.mall.dao;

import java.util.List;

import com.mall.po.Order;
import com.mall.po.OrderNotSendPager;
import com.mall.po.OrderPager;
import com.mall.po.OrderSendPager;

public interface AdminOrderDao {
	public List getAllOrder();
	public List getOneOrder(int id);
	public List getNotSendOrder(int flag);
	public List getSendOrder(int flag);
	public boolean SendOrders(int[] orderids);
	public boolean SendOrder(int orderid);
	public boolean deleteOrders(int[] ids);
	public boolean UpdateOrderInfo(Order order);
	public Order getOrderByOrderId(int orderId);
	public List getOrderByOrderFlag(int flag);
	public boolean deleteOrderItems(int[] ids);
}
