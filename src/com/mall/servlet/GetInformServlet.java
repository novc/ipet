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
import com.mall.po.Inform;

public class GetInformServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sInformId = request.getParameter("informId");
		List informList = new ArrayList();
		Model model = new Model();
		int nInfromId = 0;
		if(sInformId!=null){
			nInfromId = Integer.parseInt(sInformId);
			System.out.println(nInfromId);
			Inform inform = model.getOneInform(nInfromId);
			informList.add(inform);
		}else{
			informList = model.getAllInform();
		}
		
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(informList);
		out.print(JSON.toJSON(jsonstr));
		
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
