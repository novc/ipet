package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mall.model.Model;
import com.mall.po.Admin;

public class UpdateAdminServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Admin admin= new Admin(); 
		int adminId= Integer.parseInt(request.getParameter("adminId"));
		String adminName=request.getParameter("adminName");
		int adminTypeId=Integer.parseInt(request.getParameter("adminTypeId"));
		String loginName=request.getParameter("loginName");
		String loginPwd=request.getParameter("loginPwd");
	    
		admin.setId(adminId);
		admin.setAdminName(adminName);
		admin.setAdminType(adminTypeId);
		admin.setLoginName(loginName);
		admin.setLoginPwd(loginPwd);
		Model model= new Model();
		PrintWriter out = response.getWriter();
	    if(model.updateAdmin(admin)){//修改成功
	    	 out.print("修改成功");
	    }else{//修改失败
	    	 out.print("修改失败");
	    }
		out.flush();
		out.close();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		this.doGet(request, response);
		}
	}
