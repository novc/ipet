package com.mall.servlet;

import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.exception.NameNotFound;
import com.mall.exception.PasswordError;
import com.mall.model.Model;
import com.mall.po.Admin;

public class AdminLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = new Admin();
		admin.setLoginName(name);
		admin.setLoginPwd(password);
		Model model = new Model();	
		try {
			int type= (Integer)model.login(admin);
			if(type!=0) {//登陆成功
				ServletContext context = this.getServletContext();
				request.getSession().setAttribute("adminType",type);
				List adminList = (List) context.getAttribute("adminList");
				if(!adminList.contains("admin")) {
					request.getSession().setAttribute("admin", admin);
					response.sendRedirect("Admin/pages/adminConter.jsp");
				} else {
					request.setAttribute("message","您已登录");
					request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
				}
			}
		} catch(NameNotFound nnf) {
			request.setAttribute("message", nnf.getMessage());
			request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
		} catch(PasswordError pe) {
			request.setAttribute("message", pe.getMessage());
			request.getRequestDispatcher("Admin/login/adminLogin.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
