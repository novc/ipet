package com.mall.servlet;

import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.daoimpl.ErrPwdException;
import com.mall.daoimpl.NameNotFoundException;
import com.mall.model.Model;
import com.mall.po.User;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String password=request.getParameter("password");
		Model model = new Model();
		PrintWriter out = response.getWriter();
		try {
			User user = model.userLogin(name, password);
			user.setName(name);
			ServletContext context = this.getServletContext();
			List nameList = (List) context.getAttribute("nameList");
			
			if(!nameList.contains(name)) {
				request.getSession().setAttribute("name", name);
				request.getSession().setAttribute("user", user);
				out.print(1);
				
			} else {
				request.getSession().setAttribute("name", name);
				request.getSession().setAttribute("user", user);
				out.print(0);
			}
			
		}catch (NameNotFoundException e) {
			out.print(2);
		}catch(ErrPwdException e){
			out.print(3);
		}
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
