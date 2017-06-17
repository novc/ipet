package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
		String orderId_str = request.getParameter("orderId");
		if(orderId_str != null) {
			int orderId = Integer.parseInt(orderId_str);
			Model model = new Model();
			List orderList = model.getOneOrder(orderId);
			
			PrintWriter out = response.getWriter();
			out.print(JSON.toJSON(orderList));
			out.flush();
			out.close();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
