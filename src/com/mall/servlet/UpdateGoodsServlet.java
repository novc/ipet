package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mall.model.Model;
import com.mall.po.Admin;
import com.mall.po.Goods;

public class UpdateGoodsServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String str_GoodsId = request.getParameter("goodsId");
		String str_goodsTitle = request.getParameter("goodsTitle");
		String str_introduce = request.getParameter("introduce");
		String str_brandName = request.getParameter("brandName");
		String str_price = request.getParameter("price"); 
		String str_nowPrice = request.getParameter("nowPrice"); 
		String str_GoodsNum = request.getParameter("goodsNum"); 
		String str_key = request.getParameter("key");
		String str_sale = request.getParameter("sale");   
		String str_special = request.getParameter("special");
		int goodsId = Integer.parseInt(str_GoodsId);
		float price = Float.parseFloat(str_price);
		float nowPrice = Float.parseFloat(str_nowPrice);
		int GoodsNum = Integer.parseInt(str_GoodsNum);
		int sale = Integer.parseInt(str_sale);
		int special = Integer.parseInt(str_special);
		
		Goods Goods = new Goods();
		Goods.setGoodsId(goodsId);
		Goods.setGoodsTitle(str_goodsTitle);
		Goods.setIntroduce(str_introduce);
		Goods.setBrandName(str_brandName);
		Goods.setPrice(price);
		Goods.setNowPrice(nowPrice);
		Goods.setSpecial(special);
		Goods.setSale(sale);
		Goods.setKey(str_key);
		Goods.setGoodsNum(GoodsNum);
		Model model= new Model();
		PrintWriter out = response.getWriter();
	    if(model.updateGoods(Goods)){//修改成功
	    	out.print("修改成功");
	    }else{//修改失败
	    	out.print("修改失败");
	    }
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		this.doGet(request, response);
		}
	}
