package common;

import java.sql.ResultSet;
import java.sql.SQLException;

import jbean.Goods;
import jbean.User;
import jbean.Stock;
import jbean.ZhuceUser;
import jbean.Manager;
import jbean.Addmanager;

public class LoginObject {

	public static User user2User(ResultSet rs)throws SQLException{
		User user=null;
		if(rs.getRow()!=0){
			user=new User();
			user.setUserId(rs.getString(1));
			user.setUserpassword(rs.getString(2));
			user.setUserType(rs.getString(3));
		}
		return user;
	}
	
	@SuppressWarnings("null")
	public static Goods goods2Goods(ResultSet rs)throws SQLException{
		Goods goods=null;
		goods.setGoodsid(rs.getString(1));
		goods.setGoodsname(rs.getString(2));
		goods.setGoodsprice(rs.getString(3));
		goods.setGoodsimg(rs.getString(4));
		goods.setGoodstime(rs.getString(5));
		goods.setGoodsplace(rs.getString(6));
		return goods;
	}
	
	@SuppressWarnings("null")
	public static Stock stock2Stock(ResultSet rs)throws SQLException{
		Stock stock=null;
		stock.setStockid(rs.getString(1));
		stock.setStockname(rs.getString(2));
		stock.setStockprice(rs.getString(3));
		stock.setStockimg(rs.getString(4));
		stock.setStocknumber(rs.getString(5));
		stock.setStockplace(rs.getString(6));
		return stock;
	}
	
	
	@SuppressWarnings("null")
	public static ZhuceUser zhuceuser2ZhuceUser(ResultSet rs)throws SQLException{
		ZhuceUser zhuceuser=null;
		zhuceuser.setZhuceid(rs.getString(1));
		zhuceuser.setZhucename(rs.getString(2));
		zhuceuser.setZhucepassword(rs.getString(3));
		zhuceuser.setZhucetouch(rs.getString(4));
		zhuceuser.setZhuceemail(rs.getString(5));
		return zhuceuser;
	}
	
	public static Manager manager2Manager(ResultSet rs)throws SQLException{
		Manager manager=null;
			manager=new Manager();
			manager.setManagerid(rs.getString(1));
			manager.setManagerpassword(rs.getString(2));
			manager.setManagertype(rs.getString(3));
		return manager;
	}
	
	
	@SuppressWarnings("null")
	public static Addmanager addmanager2Addmanager(ResultSet rs)throws SQLException{
		Addmanager addmanager=null;
		addmanager.setManagerid(rs.getString(1));
		addmanager.setManagername(rs.getString(2));
		addmanager.setManagerpassword(rs.getString(3));
		addmanager.setManagertouch(rs.getString(4));
		addmanager.setManageremail(rs.getString(5));
		return addmanager;
	}
	
	
}
