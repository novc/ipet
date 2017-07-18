package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.daoimpl.GoodsDaoImpl;
import com.mall.model.Model;
import com.mall.po.Goods;
import com.mall.po.Order;

public class AdminSendOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderId_str = request.getParameter("orderId");
		int orderId = 0;
		if(orderId_str!=null) {
			orderId = Integer.parseInt(orderId_str);
		}
		Model model = new Model();
		
		//根据订单号获得订单信息
		List orderList = model.getOneOrder(orderId);

		int size = orderList.size();
		PrintWriter out=response.getWriter();
		
		//逐条读取每条订单项
		if(size==0){
			String str1 = new String("数据库数据出错");
			out.println(str1);
		}else{
			for(int i=0;i<size;i++){
				
				Order order=(Order) orderList.get(i);
				GoodsDaoImpl goodsImpl = new GoodsDaoImpl();
				Goods Goods=goodsImpl.showGoodsById(order.getGoodsId());
				
				if(order.getBuyNum()< Goods.getGoodsNum()){
					int newNum = Goods.getGoodsNum()-order.getBuyNum();
					goodsImpl.updateGoodsNum(newNum, order.getGoodsId());
					model.SendOrder(orderId);
					out.print("发货成功");
				}else {
					String str = new String("库存不足");
					out.println(str);
				}
				return;
			}
		}
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}
