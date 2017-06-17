package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.daoimpl.UnLoginException;
import com.mall.po.User;

public class CheckLogin extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user");
		PrintWriter out = response.getWriter();
		if(user!= null){
			//已经登录，可以下订单了
			out.print(JSON.toJSONString(user));
		}else {
			out.print(0);
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
