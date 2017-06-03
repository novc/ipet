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
import com.mall.dao.AdminInformDao;
import com.mall.po.Inform;
import com.mall.po.InformPager;
import com.mall.po.Order;

public class AdminInformDaoImpl implements AdminInformDao {

	public boolean addInform(Inform inform) {
		DbUtil dao = null;
		PreparedStatement ps = null;
		String sql = "";
		try {
			dao = new DbUtil();
			sql = "insert into tb_inform values(null,?,?,null)";
			ps = dao.getCon().prepareStatement(sql);
			ps.setString(1, inform.getInformTitle());
			ps.setString(2, inform.getInformContent());
			int i = ps.executeUpdate();
			if(i != 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				dao.close();
			} catch(SQLException s) {
				s.printStackTrace();
			}
		}
		return false;
	}

	public List getAllInform() {
		List informList = new ArrayList();
		DbUtil dao = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			dao = new DbUtil();
			String sql = "select * from tb_inform order by informId desc";
			ps = dao.getCon().prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				Inform inform = new Inform();
				inform.setInformId(rs.getInt("informId"));
				inform.setInformTitle(rs.getString("informTitle"));
				inform.setInformContent(rs.getString("informContent"));
				inform.setInformTime(rs.getString("informTime").substring(0,10));
				informList.add(inform);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return informList;
	}

	public boolean UpdateInform(Inform inform){
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		String sql = "update tb_inform set informTitle=?,informContent=?,informTime=? where informId=?";
		try {
			daoUtil = new DbUtil();
			ps = daoUtil.getCon().prepareStatement(sql);
			ps.setString(1, inform.getInformTitle());
			ps.setString(2, inform.getInformContent());
            ps.setString(3, inform.getInformTime());
            ps.setInt(4, inform.getInformId());
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
	
	public boolean deleteInform(int[] ids) {
		DbUtil daoUtil = null;
		PreparedStatement ps = null;
		Connection conn = null;
		String sql = "delete from tb_inform where informId=?";
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

	public Inform getOneInform(int id) {
		Inform inform = new Inform();
		PreparedStatement ps = null;
		ResultSet rs = null;
		DbUtil dao = new DbUtil();
		try {
			String sql = "select * from tb_inform where informId = ?";
			ps = dao.getCon().prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				inform.setInformId(rs.getInt("informId"));
				inform.setInformTitle(rs.getString("informTitle"));
				inform.setInformContent(rs.getString("informContent"));
				inform.setInformTime(rs.getString("informTime"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				dao.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return inform;
	}

	public InformPager getInformPager(int index, int pageSize) {
		Map informMap = new HashMap();
		DbUtil db = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			db = new DbUtil();
			String sql = "select * from tb_inform limit ?,?";
			ps = db.getCon().prepareStatement(sql);
			ps.setInt(1, index);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Inform inform = new Inform();
				inform.setInformId(rs.getInt("informId"));
				inform.setInformTitle(rs.getString("informTitle"));
				inform.setInformContent(rs.getString("informContent"));
				inform.setInformTime(rs.getString("informTime"));
				informMap.put(inform.getInformId(), inform);
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
		InformPager ip = new InformPager();
		ip.setImformMap(informMap);
		ip.setPageSize(pageSize);
		ip.setTotalNum(getAllInform().size());
		return ip;
	}
}
