package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.daoimpl.CartDaoImpl;
import com.mall.po.Cart;
import com.mall.po.User;

/**
 * Servlet implementation class Addcart
 */
public class Addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User)request.getSession().getAttribute("user");
		PrintWriter out = response.getWriter();
		if(user!=null){
			String str_GoodsId = request.getParameter("GoodsId");
			String str_GoodsNum = request.getParameter("GoodsNum");
			int n_goodsId = 0;
			int n_goodsNum = 0;
			
			if(str_GoodsId!=null){
				n_goodsId = Integer.parseInt(str_GoodsId);
			}
			if(str_GoodsNum!=null){
				n_goodsNum = Integer.parseInt(str_GoodsNum);
			}
			Cart cart = new Cart();
			cart.setGoodsId(n_goodsId);
			cart.setGoodsNum(n_goodsNum);
			cart.setUserId(user.getId());
			
			CartDaoImpl cartImpl = new CartDaoImpl();
			
			Boolean bo = cartImpl.addCart(cart);
			
			out.print(bo);
			
		}else{
			out.print("nologin");
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
