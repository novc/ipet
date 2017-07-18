package com.mall.dao;

import java.util.List;
import java.util.Map;

import com.mall.po.User;

public interface AdminUserDao {

	public List getAllUsers();//显示用户
	public boolean deleteUsers(int[] ids);
	public User getUserByUserId(int userid);
	public User getUserByUserName(String username);
	public boolean UpdateUserInfo(User user);
	
}
