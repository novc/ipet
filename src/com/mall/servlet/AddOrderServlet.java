package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Order;
import com.mall.po.User;

public class AddOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user");//得到session中的user
		Order order = new Order();
		//得到用户提交过来的详细的订单信息
		String sCart = request.getParameter("aCart");
		String recvName = request.getParameter("recvName");//收货人姓名
		String address = request.getParameter("address");
		String sPostcode = request.getParameter("postcode");
		String sFlag = request.getParameter("flag");
		int flag = Integer.parseInt(sFlag);
		order.setName(user.getName());
		order.setRecvName(recvName);
		order.setAddress(address);
		order.setPostcode(sPostcode);
		order.setFlag(flag);
		String[] carts_str = null;
		if(sCart !=null) {
			carts_str = sCart.split(",");
		}
		int[] result = new int[carts_str.length];
		String[][] cart_str = new String[carts_str.length][3];
		
		for(int j = 0;j<carts_str.length;j++){
			cart_str[j] = carts_str[j].split("-");
		}
		int[][] cart = new int[carts_str.length][3];//得到的最终的购物车信息的二维数组
		for(int i=0;i<cart_str.length;i++) {
			for(int k =0;k<3;k++){
				cart[i][k] = Integer.parseInt(cart_str[i][k]);
			}
			order.setBuyNum(cart[i][2]);
			order.setGoodsId(cart[i][1]);
			order.setCartId(cart[i][0]);
			Model model = new Model();
			result[i] = model.addOrder(order);
		}	
		Boolean bo = true;
		PrintWriter out = response.getWriter();
		

		
		for (int q =0; q<cart_str.length;q++){
			if(result[q]==0){
				bo = false;
			}
		}
		out.print(bo);
		out.flush();
		out.close();
		
		
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
