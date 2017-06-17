package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.daoimpl.GoodsDaoImpl;
import com.mall.po.Goods;

/**
 * Servlet implementation class GetGoodsDetailServlet
 */
public class GetGoodsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGoodsDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str_goodsId = request.getParameter("goodsId");
		int goodsId = 0;
		if(str_goodsId!=null){
			goodsId = Integer.parseInt(str_goodsId);
		}
		GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
		Goods goods = goodsDaoImpl.getGoodsDetail(goodsId);
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(goods);
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
