package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.Order;

public class GetOneOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		String orderId_str = request.getParameter("orderId");
		if(orderId_str != "") {
			response.setHeader("pragma", "no-cache");
			response.setHeader("cache-control", "no-cache");
			response.setCharacterEncoding("utf-8");
			int orderId = 0;
			orderId = Integer.parseInt(orderId_str);
			Model model = new Model();
			Order order = model.getOneOrder(orderId);
			
			String jsonStr = JSON.toJSONString(order);
			PrintWriter out = response.getWriter();
			out.println(jsonStr);
			
//			request.setAttribute("order", order);
//			request.getRequestDispatcher("Admin/pages/manageDetailOrder.jsp").forward(request, response);
//			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
