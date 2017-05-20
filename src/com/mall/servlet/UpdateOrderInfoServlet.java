package com.mall.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mall.model.Model;
import com.mall.po.Order;
import com.mall.po.User;

public class UpdateOrderInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str_OrderId = request.getParameter("orderId");
		String str_RecvName = request.getParameter("recvName");
		String str_Address = request.getParameter("address");
		String str_Postcode = request.getParameter("postcode");
//		String str_Page = request.getParameter("returnPage");
		int orderId = Integer.parseInt(str_OrderId);
		String returnPage = "";
//		if(str_Page=="1"){
//			returnPage
//		}
				
		Order order = new Order();
		order.setOrderId(orderId);
		order.setRecvName(str_RecvName);
		order.setAddress(str_Address);
		order.setPostcode(str_Postcode);
		Model model= new Model();
		PrintWriter out = response.getWriter();
				
		/*指定跳转的页面 回到发起请求的jsp相对应的servlet*/ 
//		if(str_Page==null){
			if(model.UpdateOrderInfo(order)){//修改成功
				out.println("修改成功");
//		    	RequestDispatcher dispatcher =  request.getRequestDispatcher("Admin/pages/manageOrder.html");
//		    	dispatcher.forward(request, response);
		    }else{//修改失败
		    	out.println("修改失败");
//		    	RequestDispatcher dispatcher =  request.getRequestDispatcher("Admin/pages/manageOrder.html");
//		    	dispatcher.forward(request, response);
		    }
//		}else{
//			
//			if(model.UpdateOrderInfo(order)){//修改成功
//		    	RequestDispatcher dispatcher =  request.getRequestDispatcher(str_Page+".html");
//		    	dispatcher.forward(request, response);
//		    }else{//修改失败
//		    	RequestDispatcher dispatcher =  request.getRequestDispatcher(str_Page+".html");
//		    	dispatcher.forward(request, response);
//		    }
//		}
	    out.flush();
	    out.close();
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
