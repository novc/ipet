package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Admin;

public class AddAdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminName=request.getParameter("adminName");
		int adminTypeId=Integer.parseInt(request.getParameter("adminTypeId"));
		String loginName=request.getParameter("loginName");
		String loginPwd=request.getParameter("loginPwd1");	
		Admin admin=new Admin();
		admin.setAdminName(adminName);
		admin.setAdminType(adminTypeId);
		admin.setLoginName(loginName);
		admin.setLoginPwd(loginPwd);
		Model model= new Model();
		PrintWriter out = response.getWriter();
	   if(model.addAdmin(admin)) {
			out.print("添加成功");
		} else {
			out.print("添加失败");
		}
	   out.flush();
	   out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
