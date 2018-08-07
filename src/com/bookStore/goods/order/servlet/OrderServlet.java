package com.bookStore.goods.order.servlet;


import com.bookStore.goods.Utils.MyServlet;
import com.bookStore.goods.Utils.CommonUtils;
import com.bookStore.goods.cart.domain.CartItem;
import com.bookStore.goods.cart.service.CartItemService;
import com.bookStore.goods.order.domain.Order;
import com.bookStore.goods.order.domain.OrderItem;
import com.bookStore.goods.order.service.OrderService;
import com.bookStore.goods.Utils.PageBean;
import com.bookStore.goods.user.dao.UserDao;
import com.bookStore.goods.user.domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderServlet extends MyServlet {

	private OrderService orderService = new OrderService();
	private CartItemService cartItemService = new CartItemService();
	private UserDao userDao=new UserDao();


	// 支付准备
	public String paymentPre(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("order", orderService.load(req.getParameter("oid")));
		return "f:/frontpages/order/pay.jsp";
	}

	//支付
	public String payment(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		String oid = req.getParameter("oid");
		int status = orderService.findStatus(oid);
		if(status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "订单转态不对，不能支付！");
			return "f:/frontpages/msg.jsp";
		}
		String password=req.getParameter("password");
		User user=(User)req.getSession().getAttribute("sessionUser");
		String ps=user.getLoginpass();
		if(password.equals(ps)) {
			orderService.updateStatus(oid, 2);
			req.setAttribute("code", "success");
			req.setAttribute("msg", "支付成功");
			return "f:/frontpages/msg1.jsp";
		}else{
			req.setAttribute("code", "error");
			req.setAttribute("msg", "支付错误，密码错误");
			return "f:/frontpages/msg1.jsp";
		}
	}
	
	//取消订单
	public String cancel(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		int status = orderService.findStatus(oid);
		//如果状态码不是1未付款，则转发到错误页面
		if(status != 1) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能取消！");
			return "f:/jsps/msg1.jsp";
		}
		orderService.updateStatus(oid, 5);//设置状态为取消！
		req.setAttribute("code", "success");
		req.setAttribute("msg", "您的订单已取消，您不后悔吗！");
		return "f:/frontpages/msg1.jsp";
	}
	
	// 确认收货
	public String confirm(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		int status = orderService.findStatus(oid);
		if(status != 3) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "状态不对，不能确认收货！");
			return "f:/frontpages/msg1.jsp";
		}
		orderService.updateStatus(oid, 4);//设置状态为交易成功
		req.setAttribute("code", "success");
		req.setAttribute("msg", "恭喜，交易成功！");
		return "f:/frontpages/msg1.jsp";
	}
	
	// 加载订单
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String oid = req.getParameter("oid");
		Order order = orderService.load(oid);
		req.setAttribute("order", order);
		String btn = req.getParameter("btn");//btn说明了用户点击哪个超链接来访问本方法的？？？？
		req.setAttribute("btn", btn);
		return "/frontpages/order/desc.jsp";
	}
	

	//我的订单
	public String myOrders(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pc = getPc(req);
		String url = getUrl(req);
		User user = (User)req.getSession().getAttribute("sessionUser");
		PageBean<Order> pb = orderService.myOrders(user.getUid(), pc);
		pb.setUrl(url);
		req.setAttribute("pb", pb);
		return "f:/frontpages/order/list.jsp";
	}

	/*生成订单*/
	public String createOrder(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String cartItemIds = req.getParameter("cartItemIds");
		List<CartItem> cartItemList = cartItemService.loadCartItems(cartItemIds);
		if(cartItemList.size() == 0) {
			req.setAttribute("code", "error");
			req.setAttribute("msg", "您没有选择要购买的图书，不能下单！");
			return "f:/frontpages/msg1.jsp";
		}

		Order order = new Order();
		order.setOid(CommonUtils.uuid());//设置主键
		order.setOrdertime(String.format("%tF %<tT", new Date()));//下单时间
		order.setStatus(1);//设置状态，1表示未付款
		order.setAddress(req.getParameter("address"));//设置收货地址
		User owner = (User)req.getSession().getAttribute("sessionUser");
		order.setOwner(owner);//设置订单所有者

		BigDecimal total = new BigDecimal("0");
		for(CartItem cartItem : cartItemList) {
			total = total.add(new BigDecimal(cartItem.getSubtotal() + ""));
		}
		order.setTotal(total.doubleValue());//设置总计

		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		for(CartItem cartItem : cartItemList) {
			OrderItem orderItem = new OrderItem();
			orderItem.setOrderItemId(CommonUtils.uuid());//设置主键
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setBook(cartItem.getBook());
			orderItem.setOrder(order);
			orderItemList.add(orderItem);
		}
		order.setOrderItemList(orderItemList);
		orderService.createOrder(order);
		cartItemService.batchDelete(cartItemIds);
		req.setAttribute("order", order);
		return "f:/frontpages/order/ordersucc.jsp";
	}
}

