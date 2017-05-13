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
		request.setCharacterEncoding("gb2312");
		String informTitle = request.getParameter("informTitle");
		String informContent = request.getParameter("informContent");
		if(informTitle != null && informContent != null) {
			byte[] buf1 = informTitle.getBytes("iso8859-1");
			byte[] buf2 = informContent.getBytes("iso8859-1");
			Model model = new Model();
			Inform inform = new Inform();
			inform.setInformTitle(new String(buf1));
			inform.setInformContent(new String(buf2));
			if(model.addInform(inform)) {
				request.setAttribute("message","添加成功");
			} else {
				request.setAttribute("message","添加失败");
			}
			request.getRequestDispatcher("Admin/pages/addInform.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
