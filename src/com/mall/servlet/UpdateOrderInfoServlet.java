package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.Model;
import com.mall.po.Order;
import com.mall.po.User;

public class UpdateOrderInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");	
		HttpSession session = request.getSession();
		String str_OrderId = request.getParameter("orderId");
		String str_RecvName = request.getParameter("recvName");
		String str_Address = request.getParameter("address");
		String str_Postcode = request.getParameter("postcode");
		
		int orderId = Integer.parseInt(str_OrderId);
		 
		Order order = new Order();
//		User user = new User();
		order.setOrderId(orderId);
		order.setRecvName(str_RecvName);
		order.setAddress(str_Address);
		order.setPostcode(str_Postcode);
		Model model= new Model();
	    if(model.UpdateOrderInfo(order)){//修改成功
	    	session.setAttribute("order", order);
	    	session.setAttribute("updateMessage","订单信息修改成功");
	    	RequestDispatcher dispatcher =  request.getRequestDispatcher("getOrderPagerServlet");
	    	dispatcher.forward(request, response);
	    }else{//修改失败
	    	session.setAttribute("updateMessage","订单信息修改失败");
	    	request.getRequestDispatcher("Admin/pages/manageOrder.jsp");
	    	
	    }
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
