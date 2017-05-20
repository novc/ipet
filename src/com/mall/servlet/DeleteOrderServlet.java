package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;

public class DeleteOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         //获得用户 id集合
		String orders_str = request.getParameter("orderId");
//		//获得当前页号
//		String pageOffset_str = request.getParameter("pageOffset");
//		String pageSize_str = request.getParameter("pageSize");
//		int pageOffset = 0;
//		int pageSize = 5;
//		if(pageOffset_str != null && pageSize_str != null) {
//			pageOffset = Integer.parseInt(pageOffset_str);
//			pageSize = Integer.parseInt(pageSize_str);
//		}
		String[] ids_str = null;
		if(orders_str != "") {
			ids_str = orders_str.split(",");
		}
		int[] ids = new int[ids_str.length];
		for(int i=0;i<ids_str.length;i++) {
			ids[i] = Integer.parseInt(ids_str[i]);
			System.out.println(ids[i]);
		}	
		Model model = new Model();
		PrintWriter out = response.getWriter();
		
		if(model.deleteOrder(ids)) {
			out.print("删除成功");
		}else{
			out.print("删除失败");
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
