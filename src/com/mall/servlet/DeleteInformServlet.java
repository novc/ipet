package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;

public class DeleteInformServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String informIds = request.getParameter("informId");
		
		if(informIds != "") {
			String[] ids_str = informIds.split(",");
			int[] ids = new int[ids_str.length];
			for(int i=0;i<ids_str.length;i++) {
				ids[i] = Integer.parseInt(ids_str[i]);
			}
			Model model = new Model();
			if(model.deleteInform(ids)) {
				PrintWriter out = response.getWriter();
				out.print("删除成功");
				out.flush();
				out.close();
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
