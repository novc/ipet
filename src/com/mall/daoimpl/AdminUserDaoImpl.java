package com.mall.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mall.common.DbUtil;
import com.mall.dao.AdminUserDao;
import com.mall.po.Goods;
import com.mall.po.Order;
import com.mall.po.User;
import com.mall.po.UserPager;

public class AdminUserDaoImpl implements AdminUserDao{

	public boolean deleteUsers(int[] ids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_user where id=?";
		
		try {
			daoUtil = new DbUtil();
			conn = daoUtil.getCon();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);	
			for(int j=0;j<ids.length;j++) {
				ps.setInt(1, ids[j]);
				ps.addBatch();
			}
			int[] k = ps.executeBatch();
			conn.commit();			
			if(k.length == ids.length) {
				return true;
			}			
		} catch (Exception e) {			
			try {
				conn.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	

	public List getAllUsers() {
		List userList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from tb_user";
		try {
			dao = new DbUtil();
			ps = dao.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setTrueName(rs.getString("trueName"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setPhone(rs.getString("phone"));
				user.setMphone(rs.getString("mphone"));
				user.setQuestion(rs.getString("question"));
				user.setAnswer(rs.getString("answer"));
				user.setImg(rs.getString("img"));
				user.setScore(rs.getInt("score"));
				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userList;
	}

	public User getUserByUserId(int userid) {
		User user = new User();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from tb_user where id = ? ";
		try {
			dao = new DbUtil();
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, userid);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setTrueName(rs.getString("trueName"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setPhone(rs.getString("phone"));
				user.setMphone(rs.getString("mphone"));
				user.setQuestion(rs.getString("question"));
				user.setAnswer(rs.getString("answer"));
				user.setImg(rs.getString("img"));
				user.setScore(rs.getInt("score"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public User getUserByUserName(String username){
		User user = new User();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from tb_user where name = ? ";
		try {
			dao = new DbUtil();
			ps = dao.getCon().prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setTrueName(rs.getString("trueName"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setPhone(rs.getString("phone"));
				user.setMphone(rs.getString("mphone"));
				user.setQuestion(rs.getString("question"));
				user.setAnswer(rs.getString("answer"));
				user.setImg(rs.getString("img"));
				user.setScore(rs.getInt("score"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public boolean UpdateUserInfo(User user){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		String sql = "update tb_user set password=?,email=?,trueName=?,sex=?,birthday=?,address=?,postcode=?,phone=?,mphone=?,question=?,answer=?,score=? where id=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getEmail());
            ps.setString(3, user.getTrueName());
            ps.setString(4, user.getSex());
            ps.setString(5, user.getBirthday());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getPostcode());
            ps.setString(8, user.getPhone());
            ps.setString(9, user.getMphone());
            ps.setString(10, user.getQuestion());
            ps.setString(11, user.getAnswer());
            ps.setInt(12, user.getScore());
            ps.setInt(13, user.getId());
			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				daoUtil.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public UserPager getUserPager(int index, int pageSize) {
		Map userMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_user limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setTrueName(rs.getString("trueName"));
				user.setSex(rs.getString("sex"));
				user.setBirthday(rs.getString("birthday"));
				user.setAddress(rs.getString("address"));
				user.setPostcode(rs.getString("postcode"));
				user.setPhone(rs.getString("phone"));
				user.setMphone(rs.getString("mphone"));
				user.setQuestion(rs.getString("question"));
				user.setAnswer(rs.getString("answer"));
				user.setImg(rs.getString("img"));
				user.setScore(rs.getInt("score"));
				userMap.put(user.getId(), user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				db.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		UserPager up = new UserPager();
		up.setUserMap(userMap);
		up.setPageSize(pageSize);
		up.setTotalNum(getAllUsers().size());
		return up;
	}

}
