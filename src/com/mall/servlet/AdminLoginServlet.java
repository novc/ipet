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
		PrintWriter out = response.getWriter();
		
		try {
			int type= (Integer)model.login(admin);//验证，登录成功则返回管理员类型，否则返回0  登录名密码错误抛出异常，返回0
			if(type>0) {//登录成功
				ServletContext context = this.getServletContext();
				request.getSession().setAttribute("adminType",type);
				List adminList = (List) context.getAttribute("adminList");
				if(!adminList.contains("admin")) {
					admin.setAdminType(type);
					request.getSession().setAttribute("admin", admin);
					out.print(1);//登录成功
				} else {
					out.print(2);//已经登录
				}
			}
			else if(type==-2){
				out.print(-2);//账号不存在
			}else if(type==-1){
				out.print(-1);//密码错误
			}else{
				out.print(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
