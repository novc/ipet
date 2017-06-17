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
import com.mall.po.Goods;

/**
 * Servlet implementation class GetGoodsList
 */
public class GetGoodsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGoodsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str_typeId = request.getParameter("typeId");
		int typeId = 0;
		if(str_typeId!=null){
			typeId = Integer.parseInt(str_typeId);
		}
		GoodsDaoImpl goodsDaoImpl = new GoodsDaoImpl();
		List goodsList = goodsDaoImpl.getGoodsList(typeId);
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
