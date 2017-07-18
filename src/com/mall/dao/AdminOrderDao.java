package com.mall.dao;

import java.util.List;

import com.mall.po.Order;

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
