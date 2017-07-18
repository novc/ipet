package com.mall.dao;

import java.util.List;

import com.mall.po.Inform;

public interface AdminInformDao {

	public boolean addInform(Inform inform);
	public List getAllInform();
	public boolean deleteInform(int[] ids);
	public Inform getOneInform(int id);
	public boolean UpdateInform(Inform inform);
}
