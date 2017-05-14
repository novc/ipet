package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.Goods;
import com.mall.po.Order;
import com.mall.po.OrderItem;

public class AdminSendOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       //获得当前页号
		String pageOffset_str = request.getParameter("pageOffset");
		//获得页面大小
		String pageSize_str = request.getParameter("pageSize");
		//获得要处理的订单号
		String orderId_str = request.getParameter("orderId");
		int pageOffset = 0;
		int pageSize = 5;
		int orderId = 0;
		if(pageOffset_str != null && pageSize_str != null && orderId_str!=null) {
			pageOffset = Integer.parseInt(pageOffset_str);
			pageSize = Integer.parseInt(pageSize_str);
			orderId = Integer.parseInt(orderId_str);
		}
		Model model = new Model();
		//根据订单号获得订单信息
		Order order=model.getOneOrder(orderId);
		//获得订单号对应的订单项List
		List orderItemList = (List) order.getOrderItem();
		int size = orderItemList.size();
		//逐条读取每条订单项
		if(size==0){
			response.setCharacterEncoding("utf-8");//要用XML这个也要设为UTF-8才能不错乱码
			String str1 = new String("订单数据错误，没有对应的订单项");
			PrintWriter out=response.getWriter();
			out.println(str1);
		}else{
			for(int i=0;i<size;i++){
				OrderItem orderItem=(OrderItem) orderItemList.get(i);
				Goods Goods=model.showGoodsById(orderItem.getGoodsId());
				if(orderItem.getGoodsNum()< Goods.getGoodsNum()){
					int newNum = Goods.getGoodsNum()-orderItem.getGoodsNum();
					model.updateGoodsNum(newNum, orderItem.getGoodsId());
					model.SendOrder(orderId);
				}else {
					String str = new String("库存不足");
					PrintWriter out=response.getWriter();
					out.println(str);
					out.flush();
					out.close();
				}
				RequestDispatcher dispatcher =  request.getRequestDispatcher("getOrderNotSendPagerServlet?pager.offset="+pageOffset+"&pageSize="+pageSize);
		    	dispatcher.forward(request, response);
				return;
			}
		}
		
				
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
