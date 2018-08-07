package com.bookStore.goods.category.servlet;

import com.bookStore.goods.Utils.MyServlet;
import com.bookStore.goods.category.domain.Category;
import com.bookStore.goods.category.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CategoryServlet extends MyServlet {

	private CategoryService categoryService = new CategoryService();

	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> parents = categoryService.findAll();
		req.setAttribute("parents", parents);
		return "f:/frontpages/left.jsp";
	}
 }
