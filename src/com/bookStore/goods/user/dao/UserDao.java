package com.bookStore.goods.user.dao;

import com.bookStore.goods.Utils.MyQueryRunner;
import com.bookStore.goods.user.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;


public class UserDao {
	private QueryRunner qr = new MyQueryRunner();

	public boolean findByUidAndPassword(String uid, String password) throws SQLException {
		String sql = "select count(*) from user where uid=? and loginpass=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), uid, password);
		return number.intValue() > 0;
	}

	public void updatePassword(String uid, String password) throws SQLException {
		String sql = "update user set loginpass=? where uid=?";
		qr.update(sql, password, uid);
	}

	public User findByLoginnameAndLoginpass(String loginname, String loginpass) throws SQLException {
		String sql = "select * from user where loginname=? and loginpass=?";
		return qr.query(sql, new BeanHandler<User>(User.class), loginname, loginpass);
	}
	
	//通过激活码查询用户
	public User findByCode(String code) throws SQLException {
		String sql = "select * from user where activationCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class), code);
	}

	public void updateStatus(String uid, boolean status) throws SQLException {
		String sql = "update user set status=? where uid=?";
		qr.update(sql, status, uid);
	}
	
	//校验用户名是否存在
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {
		String sql = "select count(1) from user where loginname=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), loginname);
		return number.intValue() == 0;
	}
	
	// 校验Email是否存在
	public boolean ajaxValidateEmail(String email) throws SQLException {
		String sql = "select count(1) from user where email=?";
		Number number = (Number)qr.query(sql, new ScalarHandler(), email);
		return number.intValue() == 0;
	}

	public void add(User user) throws SQLException {
		String sql = "insert into user values(?,?,?,?,?,?)";
		Object[] params = {user.getUid(), user.getLoginname(), user.getLoginpass(),
				user.getEmail(), user.isStatus(), user.getActivationCode()};
		qr.update(sql, params);
	}
}
