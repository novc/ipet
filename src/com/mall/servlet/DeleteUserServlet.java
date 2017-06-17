package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.daoimpl.CartDaoImpl;
import com.mall.model.Model;

public class DeleteUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得用户 id集合
		String userIds_str = request.getParameter("ids");
		String [] ids_str = null;
		CartDaoImpl cartImpl = new CartDaoImpl();
		if(userIds_str != null) {
			ids_str = userIds_str.split(",");
		}
		int[] ids = new int[ids_str.length];
		for(int i=0;i<ids_str.length;i++) {
			ids[i] = Integer.parseInt(ids_str[i]);
		}
		Model model = new Model();
		Boolean bo = false;
		Boolean bo1 = cartImpl.deleteCartsByUserId(ids);
		System.out.println(bo1);
		if(bo1){
			bo = model.deleteUsers(ids);
		}else{
			System.out.print(333333);
		}
		System.out.println("bo:"+bo);
		
		PrintWriter out = response.getWriter();
		if(bo){
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
