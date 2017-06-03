package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Order;
import com.mall.po.OrderItem;

public class UpdateOrderItemServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sOrderInformId = request.getParameter("orderItemId");
		String sPrice = request.getParameter("price");
		String sGoodsNum = request.getParameter("goodsNum");
		int nOrderItemId = Integer.parseInt(sOrderInformId);
		Float fPrice =  Float.parseFloat(sPrice);
		int nGoodsNum = Integer.parseInt(sGoodsNum);
				
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderItemId(nOrderItemId);
		orderItem.setPrice(fPrice);
		orderItem.setGoodsNum(nGoodsNum);
		
		Model model= new Model();
		PrintWriter out = response.getWriter();
		if(model.UpdateOrderItem(orderItem)){//修改成功
			out.println("修改成功");
	    }else{//修改失败
	    	out.println("修改失败");
	    }
	    out.flush();
	    out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
