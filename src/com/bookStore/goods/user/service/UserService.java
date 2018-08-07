package com.bookStore.goods.user.service;

import com.bookStore.goods.Utils.CommonUtils;
import com.bookStore.goods.user.dao.UserDao;
import com.bookStore.goods.user.domain.User;
import com.bookStore.goods.user.service.exception.UserException;

import java.sql.SQLException;

public class UserService {
	private UserDao userDao = new UserDao();
	
	//修改密码
	public void updatePassword(String uid, String newPass, String oldPass) throws UserException {

		try {
			boolean bool = userDao.findByUidAndPassword(uid, oldPass);//是否存在
			if(!bool) {
				throw new UserException("老密码错误！");
			}
			userDao.updatePassword(uid, newPass);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	// 登录功能
	public User login(User user) {
		try {
			return userDao.findByLoginnameAndLoginpass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	

	
	//用户名注册校验
	public boolean ajaxValidateLoginname(String loginname) {
		try {
			return userDao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Email注册校验
	public boolean ajaxValidateEmail(String email) {
		try {
			return userDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//注册功能
	public void regist(User user) {
		user.setUid(CommonUtils.uuid());
		user.setStatus(true);
		user.setActivationCode(CommonUtils.uuid() + CommonUtils.uuid());
		try {
			userDao.add(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
