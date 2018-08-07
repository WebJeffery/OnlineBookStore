package com.bookStore.goods.admin.service;

import com.bookStore.goods.admin.dao.AdminDao;
import com.bookStore.goods.admin.domain.Admin;

import java.sql.SQLException;

public class AdminService {
	private AdminDao adminDao = new AdminDao();

	public Admin login(Admin admin) {
		try {
			return adminDao.find(admin.getAdminname(), admin.getAdminpwd());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
