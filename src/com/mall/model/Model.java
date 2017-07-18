package com.mall.model;

import java.util.List;

import java.util.Map;

import com.mall.dao.AdminAdminDao;
import com.mall.dao.AdminGoodsDao;
import com.mall.dao.AdminDao;
import com.mall.dao.AdminInformDao;
import com.mall.dao.AdminLoginDao;
import com.mall.dao.AdminNoteDao;
import com.mall.dao.AdminOrderDao;
import com.mall.dao.AdminSubTypeDao;
import com.mall.dao.AdminSuperTypeDao;
import com.mall.dao.AdminTypeDao;
import com.mall.dao.AdminUserDao;
import com.mall.dao.GoodsDao;
import com.mall.dao.OrderDao;
import com.mall.dao.SubTypeDao;
import com.mall.dao.SuperTypeDao;
import com.mall.dao.UserDao;
import com.mall.daoimpl.AdminAdminDaoImpl;
import com.mall.daoimpl.AdminGoodsDaoImpl;
import com.mall.daoimpl.AdminDaoImpl;
import com.mall.daoimpl.AdminInformDaoImpl;
import com.mall.daoimpl.AdminLoginDaoImpl;
import com.mall.daoimpl.AdminNoteDaoImpl;
import com.mall.daoimpl.AdminOrderDaoImpl;
import com.mall.daoimpl.AdminSubTypeDaoImpl;
import com.mall.daoimpl.AdminSuperTypeDaoImpl;
import com.mall.daoimpl.AdminTypeDaoImpl;
import com.mall.daoimpl.AdminUserDaoImpl;
import com.mall.daoimpl.GoodsDaoImpl;
import com.mall.daoimpl.OrderDaoImpl;
import com.mall.daoimpl.SubTypeDaoImpl;
import com.mall.daoimpl.SuperTypeDaoImpl;
import com.mall.daoimpl.UserDaoImpl;
import com.mall.po.Admin;
import com.mall.po.Goods;
import com.mall.po.Inform;
import com.mall.po.Note;
import com.mall.po.Order;
import com.mall.po.SubType;
import com.mall.po.SuperType;
import com.mall.po.User;

public class Model {
	private UserDao ud = new UserDaoImpl();
	private GoodsDao gd = new GoodsDaoImpl();
	private OrderDao od = new OrderDaoImpl();
	private SuperTypeDao superDao = new SuperTypeDaoImpl();

	private SubTypeDao sugdao = new SubTypeDaoImpl();
    //获取大类
	public List showAllSuperType() {
		return superDao.showAllSuperType();
	}
    //根据大类Id获取对应所有的小类
	public List showAllSubTypeBySuperId(int superId) {
		return sugdao.showAllSubTypeBySuperId(superId);
	}
	//用户注册
	public boolean addUser(User user) {
		return ud.addUser(user);
	}
	//用户登录
	public User userLogin(String name,String password) {
		return ud.userLogin(name,password);
	}
	//检查用户名是否存在
	public boolean checkNameExist(String name){
		return ud.checkNameExist(name);
	}
	//用户管理页面
	public List listUser() {
		return ud.listUser();
	}
	//根据ID删除用户
	public boolean delete(int id,String powerType){
		return ud.delete(id,powerType);
	}
	//根据ID更改用户权限
	public boolean changePower(int id,String powerType){
		return ud.changePower(id,powerType);
	}
	//根据用户名，获取其权限
	public String getPower(String name){
		return ud.getPower(name);
	}
	//根据用户名，找到该用户
	public User getUser(String name){
		return ud.getUser(name);
	}
	
	//添加订单，并返回订单号
	public int addOrder(Order order){
		return od.addOrder(order);
	}

	
	//根据用户输入的关键字搜索相关商品
	public List searchGoods(String keywords){
		return gd.searchGoods(keywords);
	}
	
	
	//用户添加留言
	public boolean addNote(Note note){
		return ud.addNote(note);
	}
	/**
	 * 后台*/
	private AdminUserDao userDao = new AdminUserDaoImpl();
	private AdminAdminDao adminDao = new AdminAdminDaoImpl();
	private AdminDao adminDao1=new AdminDaoImpl();
	private AdminSubTypeDao subTypeDao = new AdminSubTypeDaoImpl();
	private AdminSuperTypeDao superTypeDao = new AdminSuperTypeDaoImpl();
	private AdminTypeDao adminTypeDao = new AdminTypeDaoImpl();
	private AdminGoodsDao GoodsDao = new AdminGoodsDaoImpl();
	private AdminNoteDao noteDao = new AdminNoteDaoImpl();
	private AdminLoginDao adminLoginDao = new AdminLoginDaoImpl();
	private AdminInformDao adminInformDao = new AdminInformDaoImpl();
	private AdminOrderDao adminOrderDao = new AdminOrderDaoImpl();
	
	public List getAllUsers() {
		return userDao.getAllUsers();
	}
	
	public boolean deleteUsers(int[] ids) {
		return userDao.deleteUsers(ids);
	}
	
	public User getUserByUserId(int userid){
		return userDao.getUserByUserId(userid);
	}
	
	public User getUserByUserName(String username){
		return userDao.getUserByUserName(username);
	}
	
	public boolean UpdateUserInfo(User user){
		return userDao.UpdateUserInfo(user);
	}
	
	public List getSubTypeBySuperTypeId(int superTypeId) {
		return subTypeDao.getSubTypeBySuperTypeId(superTypeId);
	}
	
	public boolean addSubType(SubType type) {
		return subTypeDao.addSubType(type);
	}
	
	public boolean checkSubTypeIsExist(String subTypeName) {
		return subTypeDao.checkSubTypeIsExist(subTypeName);
	}
	
	public boolean checkLoginNameIsExist(String loginName) {
		return adminDao1.checkNameExist(loginName);
	}
	
	public List getAllAdmins(){
		return adminDao.getAllAdmins();
	}
	
	public boolean addAdmin(Admin admin){
		return adminDao1.addAdmin(admin);
	}
	
	public boolean updateAdmin(Admin admin){
		return adminDao1.updateAdmin(admin);
	}
	
	public List getAdminByType(int type){
		return adminDao.getAdminByType(type);
	}
	public List getAdminByAdminName(String adminName){
		return adminDao.getAdminByAdminName(adminName);
	}
	
    public boolean deleteAdmin(int[] ids){
		return adminDao1.deleteAdmin(ids);
	}
    
	public List getSuperType() {
		return superTypeDao.getSuperType();
	}
	
	public List getAdminType() {
		return adminTypeDao.getAdminType();
	}
	
	public boolean addSuperType(SuperType type) {
		return superTypeDao.addSuperType(type);
	}
	
	public boolean checkSuperTypeIsExist(String superTypeName) {
		return superTypeDao.checkSuperTypeIsExist(superTypeName);
	}
	
	public List getAllGoods() {
		return GoodsDao.getAllGoods();
	}
	
	public boolean addGoods(Goods Goods) {
		return GoodsDao.addGoods(Goods);
	}
	
	public boolean checkGoodsNameIsExist(String GoodsName) {
		return GoodsDao.checkGoodsNameIsExist(GoodsName);
	}

	public boolean checkISBNIsExist(String ISBN) {
		return GoodsDao.checkISBNIsExist(ISBN);
	}

	public List getAllGoodsName() {
		return GoodsDao.getAllGoodsName();
	}
	
	public boolean deleteGoods(int[] GoodsIds) {
		return GoodsDao.deleteGoods(GoodsIds);
	}
	
	public boolean setGoodsSpecial(int goodId){
		return GoodsDao.setGoodsSpecial(goodId);
	}
	
	public boolean setGoodsHost(int goodId){
		return GoodsDao.setGoodsHost(goodId);
	}
	
	public boolean setGoodsSale(int goodId){
		return GoodsDao.setGoodsSale(goodId);
	}
	
	public boolean setGoodsNew(int goodId){
		return GoodsDao.setGoodsNew(goodId);
	}
	
	public List getAllNotes() {
		return noteDao.getAllNotes();
	}
	
	public boolean deleteNote(int[] ids) {
		return noteDao.deleteNote(ids);
	}

	public int login(Admin admin) {
		return adminLoginDao.login(admin);
	}
	
	public boolean updatePassword(Admin admin) {
		return adminLoginDao.updatePassword(admin);
	}
	
	public boolean addInform(Inform inform) {
		return adminInformDao.addInform(inform);
	}
	
	public List getAllInform() {
		return adminInformDao.getAllInform();
	}
	
	public boolean deleteInform(int[] ids) {
		return adminInformDao.deleteInform(ids);
	}
	
	public Inform getOneInform(int id) {
		return adminInformDao.getOneInform(id);
	}
	
	public boolean UpdateInform(Inform inform){
		return adminInformDao.UpdateInform(inform);
	}
	
	public List getAllOrder() {
		return adminOrderDao.getAllOrder();
	}
	
	public List getOneOrder(int id) {
		return adminOrderDao.getOneOrder(id);
	}
	
	public List getNotSendOrder(int flag) {
		return adminOrderDao.getNotSendOrder(flag);
	}

	public List getSendOrder(int flag) {
		return adminOrderDao.getSendOrder(flag);
	}

	public boolean SendOrders(int[] orderids) {
		return adminOrderDao.SendOrders(orderids);
	}
	
	public boolean SendOrder(int orderid) {
		return adminOrderDao.SendOrder(orderid);
	}
	public boolean UpdateOrderInfo(Order order) {
		return adminOrderDao.UpdateOrderInfo(order);
	}
	public boolean deleteOrder(int[] ids) {
		return adminOrderDao.deleteOrders(ids);
	}

	public boolean deleteOrderItems(int[] ids) {
		return adminOrderDao.deleteOrderItems(ids);
	}
	
	public Order getOrderByOrderId(int orderId){
		return adminOrderDao.getOrderByOrderId(orderId);
	}
	
	public List getOrderByOrderFlag(int flag){
		return adminOrderDao.getOrderByOrderFlag(flag);
	}
	
	//根据当前用户的用户名查订单
	public List selectOrder(String name){
		return od.selectOrder(name);
	}
	//根据订单号查订单项
	public List selectOrderItem(int id ){
		return od.selectOrderItem(id);
	}
	
	public Boolean loggin(String name, String password){
		return ud.loggin(name, password);
	}
	
    public User SelectOneUser(String name){
		return ud.SelectOneUser(name);
	}
	 //用于修改用户的个人密码
	public Boolean updatePassword(String name, String password){
		return ud.updatePassword(name, password);
	}

	public Boolean updateUser(User user) {
		return ud.updateUser(user);
	}
}
