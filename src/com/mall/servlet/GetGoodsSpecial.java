package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.daoimpl.GoodsDaoImpl;

/**
 * Servlet implementation class GetGoodsSpecial
 */
public class GetGoodsSpecial extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str_type = request.getParameter("type");
		GoodsDaoImpl goodsImpl = new GoodsDaoImpl();
		int type = Integer.parseInt(str_type);
		
		List goodsList = goodsImpl.getGoodsSpecial(type);
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(goodsList);
		out.print(JSON.toJSON(jsonstr));

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
