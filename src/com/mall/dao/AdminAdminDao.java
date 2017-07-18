package com.mall.dao;

import java.util.List;
import java.util.Map;

import com.mall.po.Admin;

public interface AdminAdminDao {
	public List getAllAdmins();   //显示管理员
	public boolean deleteAdminById(int id);   //删除管理员
	public boolean deleteAdmins(int[] ids);
	public List getAdminByType(int type);
	public List getAdminByAdminName(String adminName);
}
