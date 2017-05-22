package com.mall.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.Admin;
import com.mall.daoimpl.AdminDaoImpl;;


public class GetOneAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id_str = request.getParameter("id");
		int id = 0;
		if(id_str != null) {
			id = Integer.parseInt(id_str);
		}

		AdminDaoImpl adminDaoImpl = new AdminDaoImpl();
		Admin admin = adminDaoImpl.SelectOneAdmin(id);
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(admin);
		out.print(JSON.toJSON(jsonstr));

		out.flush();
		out.close();

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
