package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.User;


public class AdminUpdateUserServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user= new User(); 
		String id = request.getParameter("userID");
	    String name = request.getParameter("userName");
	    String password= request.getParameter("password");
	    String email= request.getParameter("email");
	    String trueName= request.getParameter("trueName");
	    String sex= request.getParameter("sex");
	    String  birthday=request.getParameter("birthday");
	    String address= request.getParameter("address");
	    String postcode =  request.getParameter("postcode");
	    String phone= request.getParameter("phone") ;
	    String mphone = request.getParameter("mphone");
	    String question= request.getParameter("question");
	    String answer= request.getParameter("answer");
	    String score= request.getParameter("score");
	    int nId = Integer.parseInt(id);
	    int nScore = Integer.parseInt(score);
	    
	    user.setId(nId);
	    user.setName(name);
	    user.setPassword(password);
	    user.setEmail(email);
	    user.setTrueName(trueName);
	    user.setSex(sex);
	    user.setBirthday(birthday);
		user.setAddress(address);
		user.setPostcode(postcode);
		user.setPhone(phone);
		user.setMphone(mphone);
		user.setQuestion(question);
		user.setAnswer(answer);
		user.setScore(nScore);
		Model model = new Model();
		Boolean bo = model.UpdateUserInfo(user);
		PrintWriter out = response.getWriter();
		if(bo){
			out.println("修改成功");
		}
		else{
			out.println("修改失败");
		}
		out.flush();
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
