package com.bookStore.goods.book.servlet;

import com.bookStore.goods.Utils.MyServlet;
import com.bookStore.goods.Utils.CommonUtils;
import com.bookStore.goods.book.domain.Book;
import com.bookStore.goods.book.service.BookService;
import com.bookStore.goods.Utils.PageBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends MyServlet {

	private BookService bookService = new BookService();

	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String bid = req.getParameter("bid");//获取链接的参数bid
		Book book = bookService.load(bid);//通过bid得到book对象
		req.setAttribute("book", book);//保存到req中
		return "f:/frontpages/book/desc.jsp";//转发到desc.jsp
	}

	public String findByCategory(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String cid = req.getParameter("cid");
		if(null == cid) {
			cid = "5F79D0D246AD4216AC04E9C5FAB3199E";
		}
		PageBean<Book> pb = bookService.findByCategory(cid, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/book/list.jsp";
	}
	
	// 按作者查
	public String findByAuthor(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String author = req.getParameter("author");
		PageBean<Book> pb = bookService.findByAuthor(author, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/book/list.jsp";
	}
	
	//按出版社查询
	public String findByPress(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		String press = req.getParameter("press");
		PageBean<Book> pb = bookService.findByPress(press, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/book/list.jsp";
	}
	
	//按书名查
	public String findByBname(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		req.setCharacterEncoding("utf-8");
		String bname = req.getParameter("bname");
		PageBean<Book> pb = bookService.findByBname(bname, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/book/list.jsp";
	}
	
	// 多条件组合查询
	public String findByCombination(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		Book criteria = CommonUtils.toBean(req.getParameterMap(), Book.class);
		PageBean<Book> pb = bookService.findByCombination(criteria, pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/book/list.jsp";
	}

	//图书排行
	public String findBookRanding(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Book> bookList = bookService.bookRankingList();
		req.setAttribute("bookList", bookList);
		return "f:/frontpages/bookRanking.jsp";
	}

	// 查询导航的书籍
	public String findBannerBook(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Book> bookList = bookService.bookRankingList();
		req.setAttribute("bookList", bookList);
		return "f:/frontpages/body.jsp";
	}
}
