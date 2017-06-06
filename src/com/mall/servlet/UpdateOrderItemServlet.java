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
		
//		System.out.println("sOrderInformId:"+sOrderInformId);
//		System.out.println("sPrice:"+sPrice);
//		System.out.println("sGoodsNum:"+sGoodsNum+"\n");
		
		int nOrderItemId = Integer.parseInt(sOrderInformId);
		Float fPrice =  Float.parseFloat(sPrice);
		int nGoodsNum = Integer.parseInt(sGoodsNum);
		System.out.println("nOrderItemId:"+nOrderItemId);
		System.out.println("fPrice:"+fPrice);
		System.out.println("nGoodsNum:"+nGoodsNum+"\n");
				
		OrderItem orderItem = new OrderItem();
		orderItem.setOrderItemId(nOrderItemId);
		orderItem.setPrice(fPrice);
		orderItem.setGoodsNum(nGoodsNum);
		System.out.println("orderItemId:"+orderItem.getOrderItemId());
		System.out.println("price:"+orderItem.getPrice());
		System.out.println("goodsNum:"+orderItem.getGoodsNum()+"\n");
		
		Model model= new Model();
		PrintWriter out = response.getWriter();
		Boolean bo = model.UpdateOrderItem(orderItem);
//		out.print(bo);
		if(bo){//修改成功
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
