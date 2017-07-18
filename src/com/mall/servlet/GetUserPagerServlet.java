package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.mall.model.Model;
import com.mall.po.User;

public class GetUserPagerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int adminType = (Integer)request.getSession().getAttribute("adminType");
		PrintWriter out = response.getWriter();
		if(adminType==3 || adminType==4 ){
			List userList = new ArrayList();
			Model model = new Model();
			User user = new User();
			
			String sId = request.getParameter("id");
			String sName = request.getParameter("name");
			int nId = 0;
			if(sId!=null){
				nId = Integer.parseInt(sId);
				user = model.getUserByUserId(nId);
				if(user.getId()==0){
					return;
				}
				userList.add(user);
				out.print(JSON.toJSONString(userList));
			}
			if(sName!=null){
				user = model.getUserByUserName(sName);
				if(user.getId()==0){
					return;
				}
				userList.add(user);
				out.print(JSON.toJSONString(userList));
			}
			if(sId==null&&sName==null)
			{
				List uList = new ArrayList();
				uList = model.getAllUsers();
				out.print(JSON.toJSONString(uList));
			}
		}else{
			out.print(false);
		}
		out.flush();
		out.close();
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}