package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.User;


public class RegisterServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取客户端发送过来的信息
		String name = request.getParameter("username");
		String password=request.getParameter("psw");
		String tel = request.getParameter("tel");
		
//		String email = request.getParameter("email");
//		String trueName=request.getParameter("trueName");
//		String sex = request.getParameter("sex");
//		String birthday=request.getParameter("birthday");
//		String address = request.getParameter("address");
//		String postcode = request.getParameter("postcode");
//		String phone = request.getParameter("phone");
//		String mphone = request.getParameter("mphone");
//		String question = request.getParameter("question");
//		String answer = request.getParameter("answer");
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			user.setMphone(tel);
//			user.setEmail(email);
//			user.setTrueName(trueName);
//			user.setSex(sex);
//			user.setBirthday(birthday);
//			user.setAddress(address);
//			user.setPostcode(postcode);
//			user.setPhone(phone);
//			user.setMphone(mphone);
//			user.setQuestion(question);
//			user.setAnswer(answer);	
			Model model = new Model();
			PrintWriter out = response.getWriter();

			
			if(model.addUser(user)){
				//注册成功
				out.print(1);
			}else {
				//注册失败
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
