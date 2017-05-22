package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;

public class GetAllInformServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Model model = new Model();
		List informList = model.getAllInform();
		
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(informList);
		out.print(JSON.toJSON(jsonstr));
		
		out.flush();
		out.close();
		
		request.setAttribute("informList", informList);
//		request.getRequestDispatcher("Admin/pages/manageInform.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
