package com.mall.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.AdminPager;

public class GetAdminServlet extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
	    int adminType = (Integer)request.getSession().getAttribute("adminType");
	    if(adminType==4 ){
	    	String sAdminName = request.getParameter("adminName");
	    	String sType = request.getParameter("adminType");
	    	int nID = 0;
	    	int nType = 0;
	    	Model model = new Model();
	    	List adminList = new ArrayList();
	    	if(sAdminName!=null){
	    		adminList = model.getAdminByAdminName(sAdminName);
	    	}else if(sType!=null){
	    		nType = Integer.parseInt(sType);
	    		adminList = model.getAdminByType(nType);
	    	}else{
	    		adminList = model.getAllAdmins();
	    	}
			

			String str = JSON.toJSONString(adminList);
			PrintWriter out = response.getWriter();
			out.print(JSON.toJSON(str));

			out.flush();
			out.close();
			
	    }else{
		request.getRequestDispatcher("Admin/pages/adminLoginError.jsp").forward(request, response);
	   }

		}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		this.doGet(request, response);
		}
	}
