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
import com.mall.po.InformPager;

public class GetNoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List noteList = new ArrayList();
		Model model = new Model();
		noteList = model.getAllNotes();
		PrintWriter out = response.getWriter();
		String jsonstr = JSON.toJSONString(noteList);
		out.print(JSON.toJSON(jsonstr));

		out.flush();
		out.close();
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
