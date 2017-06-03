package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Inform;
public class UpdateInformServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sInformId = request.getParameter("informId");
		String sInformTitle = request.getParameter("informTitle");
		String sInformContent = request.getParameter("informContent");
		String sInformTime = request.getParameter("informTime");
		int nInformId = 0;
		Inform inform = new Inform();
		if(sInformId!=null){
			nInformId = Integer.parseInt(sInformId);
			inform.setInformId(nInformId);
			inform.setInformTitle(sInformTitle);
			inform.setInformContent(sInformContent);
			inform.setInformTime(sInformTime);
			Model model = new Model();
			Boolean bo = model.UpdateInform(inform);
			PrintWriter out = response.getWriter();
					
			if(bo){//修改成功
				out.print("修改成功");
			}else{
				out.print("修改失败");
			}
			out.flush();
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
