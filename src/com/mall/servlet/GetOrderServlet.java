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
		int nOrderId = 0;
		int nFlag = 0;
		
		if (str_OrderId==null&&str_flag==null){
			orderList = model.getAllOrder();
		}else if(str_OrderId!=null){
			nOrderId = Integer.parseInt(str_OrderId);
			orderList.add(model.getOrderByOrderId(nOrderId));
		}else if(str_flag!=null){
			nFlag = Integer.parseInt(str_flag);
			orderList=model.getOrderByOrderFlag(nFlag);
		}

		String str_OrderList = JSON.toJSONString(orderList);
		PrintWriter out = response.getWriter();
		out.println(JSON.toJSON(str_OrderList));
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
