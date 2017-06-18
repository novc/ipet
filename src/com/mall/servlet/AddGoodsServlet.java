package com.mall.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mall.model.Model;
import com.mall.po.Goods;

public class AddGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str_superTypeId = request.getParameter("superTypeId");
		String str_subTypeId = request.getParameter("subTypeId");
		String GoodsTitle = request.getParameter("goodsTitle");
		String introduce = request.getParameter("introduce");
		String brandName = request.getParameter("brandName"); 
		String spec = request.getParameter("spec");
		String str_price = request.getParameter("price");
		String str_nowPrice = request.getParameter("nowPrice");
		String picture = request.getParameter("picture");
		String str_GoodsNum = request.getParameter("GoodsNum");
		String str_sale = request.getParameter("sale");
		String str_special = request.getParameter("special");
		String str_GoodsKey = request.getParameter("GoodsKey");
		byte[] introduce_buf = introduce.getBytes("utf-8");
		byte[] picture_buf = picture.getBytes("utf-8");
		int superTypeId = Integer.parseInt(str_superTypeId);
		int subTypeId = Integer.parseInt(str_subTypeId);
		float price = Float.parseFloat(str_price);
		float nowPrice = Float.parseFloat(str_nowPrice);
		int GoodsNum = Integer.parseInt(str_GoodsNum);
		int sale = 0;
		int special = 0;
		if(str_sale != null)
			sale = Integer.parseInt(str_sale);
		if(str_special != null)
			special = Integer.parseInt(str_special);
		
		Model model = new Model();
		Goods Goods = new Goods();
		Goods.setSuperTypeId(superTypeId);
		Goods.setSubTypeId(subTypeId);
		Goods.setGoodsTitle(GoodsTitle);
		Goods.setIntroduce(new String(introduce_buf));
		Goods.setBrandName(brandName);
		Goods.setSpec(spec);
		Goods.setPrice(price);
		Goods.setNowPrice(nowPrice);
		//取图片文件名
		String photo = new String(picture_buf);
		if(photo.lastIndexOf("\\") != -1) {
			photo = photo.substring(photo.lastIndexOf("\\")+1);
		}
		//END
		Goods.setIndexImg("images/" + photo);
		Goods.setGoodsNum(GoodsNum);
		Goods.setKey(str_GoodsKey);
		Goods.setSale(sale);
		Goods.setSpecial(special);
		if(model.addGoods(Goods)) {
			request.setAttribute("message", "添加成功");
		} else {
			request.setAttribute("message", "添加失败");
		}
		request.getRequestDispatcher("Admin/pages/addGoods.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
