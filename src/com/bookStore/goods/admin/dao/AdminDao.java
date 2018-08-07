package com.bookStore.goods.admin.dao;

import com.bookStore.goods.Utils.MyQueryRunner;
import com.bookStore.goods.admin.domain.Admin;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDao {
	private QueryRunner qr = new MyQueryRunner();
	
	// 通过管理员登录名和登录密码查询
	public Admin find(String adminname, String adminpwd) throws SQLException {
		String sql = "select * from admin where adminname=? and adminpwd=?";
		return qr.query(sql, new BeanHandler<Admin>(Admin.class), adminname, adminpwd);
	}
}
