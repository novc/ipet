package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.Order;

public class GetOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String str_flag = request.getParameter("flag");
		String str_OrderId = request.getParameter("orderId");
		Model model = new Model();
		Order order = new Order();
		List orderList = new ArrayList();
		int orderId = Integer.parseInt(str_OrderId);
		int flag = Integer.parseInt(str_flag);
//		所有要求订单
		if(orderId==0){
			if(flag==1){
				orderList = model.getSendOrder(1);
			}else if(flag==0){
				orderList = model.getNotSendOrder(0);
			}else{
				orderList = model.getAllOrder();
			}
			String str_OrderList = JSON.toJSONString(orderList);
			PrintWriter out = response.getWriter();
			out.println(JSON.toJSON(str_OrderList));
			out.flush();
			out.close();
			
		}else{
//			按条件查询
			if(flag==1){
				order = model.searchOrderByOrderId(orderId,1);
			}else if(flag==0){
				order = model.searchOrderByOrderId(orderId,0);
			}else{
				order = model.searchOrderByOrderId(orderId,2);
			}
			String str_Order = JSON.toJSONString(order);
			PrintWriter out = response.getWriter();
			out.println(JSON.toJSON(str_Order));
			out.flush();
			out.close();
		}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
