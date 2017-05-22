package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.UserPager;

public class GetUserPagerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int adminType = (Integer)request.getSession().getAttribute("adminType");
		if(adminType==3 || adminType==4 ){
			List userList = new ArrayList();
			Model model = new Model();
			userList = model.getAllUsers();
			PrintWriter out = response.getWriter();
			String jsonstr = JSON.toJSONString(userList);
			out.print(JSON.toJSON(jsonstr));

			out.flush();
			out.close();
			
		}else{
			request.getRequestDispatcher("Admin/pages/adminLoginError.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
