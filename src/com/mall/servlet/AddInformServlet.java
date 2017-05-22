package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Inform;

public class AddInformServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String informTitle = request.getParameter("informTitle");
		String informContent = request.getParameter("informContent");
		String result = "";
		if(informTitle != null && informContent != null) {
			Model model = new Model();
			Inform inform = new Inform();
			inform.setInformTitle(informTitle);
			inform.setInformContent(informContent);
			if(model.addInform(inform)) {
				result="发布成功";
				PrintWriter out = response.getWriter();
				out.print(result);
		
				out.flush();
				out.close();
			} else {
				result = "发布失败";
				PrintWriter out = response.getWriter();
				out.print(result);
		
				out.flush();
				out.close();
			}
			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
