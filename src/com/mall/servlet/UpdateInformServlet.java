package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Inform;

public class UpdateInformServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str_InformId = request.getParameter("informId");
		String str_InformTitle = request.getParameter("informTitle");
		String str_InformContent = request.getParameter("informContent");
		int informId = Integer.parseInt(str_InformId);
		
		Inform inform = new Inform();
		inform.setInformId(informId);
		inform.setInformTitle(str_InformTitle);
		inform.setInformContent(str_InformContent);
//		Model model= new Model();
//		/*指定跳转的servlet 回到发起请求的jsp相对应的servlet*/ 
//		if(model.UpdateInform(inform)){//修改成功
//	    	RequestDispatcher dispatcher =  request.getRequestDispatcher("getInformPagerServlet");
//	    	dispatcher.forward(request, response);
//	    }else{//修改失败
//	    	RequestDispatcher dispatcher =  request.getRequestDispatcher("getInformPagerServlet");
//	    	dispatcher.forward(request, response);
//	    }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
