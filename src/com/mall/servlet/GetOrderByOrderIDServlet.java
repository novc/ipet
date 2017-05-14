package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.daoimpl.OrderDaoImpl;
import com.mall.model.Model;
import com.mall.po.Order;
import com.mall.po.OrderPager;

public class GetOrderByOrderIDServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String orderId_str = request.getParameter("orderId");
		String flag_str = request.getParameter("flag");
		
		
		if(orderId_str != " ") {
			int orderId = Integer.parseInt(orderId_str);
			int status = 2;
			if(flag_str!=" "){
				status = Integer.parseInt(flag_str);
			}
			Model model = new Model();
			Order order = model.searchOrderByOrderId(orderId,status);
			response.setHeader("pragma", "no-cache");
			response.setHeader("cache-control", "no-cache");
			String jsonStr = JSON.toJSONString(order);
			PrintWriter out = response.getWriter();
			out.println(jsonStr);
		}else{
			return;
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}
}










