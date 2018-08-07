package com.bookStore.goods.cart.dao;

import com.bookStore.goods.Utils.CommonUtils;
import com.bookStore.goods.Utils.MyQueryRunner;
import com.bookStore.goods.book.domain.Book;
import com.bookStore.goods.cart.domain.CartItem;
import com.bookStore.goods.user.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CartItemDao {

	private QueryRunner qr = new MyQueryRunner();
	
	//用来生成where子句
	private String toWhereSql(int len) {
		StringBuilder sb = new StringBuilder("cartItemId in(");
		for(int i = 0; i < len; i++) {
			sb.append("?");
			if(i < len - 1) {
				sb.append(",");
			}
		}
		sb.append(")");
		return sb.toString();
	}
	
	//加载多个CartItem
	public List<CartItem> loadCartItems(String cartItemIds) throws SQLException {
		Object[] cartItemIdArray = cartItemIds.split(",");
		String whereSql = toWhereSql(cartItemIdArray.length);
		String sql = "select * from cartitem c, book b where c.bid=b.bid and " + whereSql;
		return toCartItemList(qr.query(sql, new MapListHandler(), cartItemIdArray));
	}
	
	//按id查询
	public CartItem findByCartItemId(String cartItemId) throws SQLException {
		String sql = "select * from cartItem c, book b where c.bid=b.bid and c.cartItemId=?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), cartItemId);
		return toCartItem(map);
	}
	
	//批量删除
	public void batchDelete(String cartItemIds) throws SQLException {
		Object[] cartItemIdArray = cartItemIds.split(",");
		String whereSql = toWhereSql(cartItemIdArray.length);
		String sql = "delete from cartitem where " + whereSql;
		qr.update(sql, cartItemIdArray);//其中cartItemIdArray必须是Object类型的数组！
	}
	
	//查询某个用户的某本图书的购物车条目是否存在
	public CartItem findByUidAndBid(String uid, String bid) throws SQLException {
		String sql = "select * from cartitem where uid=? and bid=?";
		Map<String,Object> map = qr.query(sql, new MapHandler(), uid, bid);
		CartItem cartItem = toCartItem(map);
		return cartItem;
	}
	
	//修改指定条目的数量
	public void updateQuantity(String cartItemId, int quantity) throws SQLException {
		String sql = "update cartitem set quantity=? where cartItemId=?";
		qr.update(sql, quantity, cartItemId);
	}
	
	//添加条目
	public void addCartItem(CartItem cartItem) throws SQLException {
		String sql = "insert into cartitem(cartItemId, quantity, bid, uid)" +
				" values(?,?,?,?)";
		Object[] params = {cartItem.getCartItemId(), cartItem.getQuantity(),
				cartItem.getBook().getBid(), cartItem.getUser().getUid()};
		qr.update(sql, params);
	}
	
	//把一个Map映射成一个Cartitem
	private CartItem toCartItem(Map<String,Object> map) {
		if(map == null || map.size() == 0) return null;
		CartItem cartItem = CommonUtils.toBean(map, CartItem.class);
		Book book = CommonUtils.toBean(map, Book.class);
		User user = CommonUtils.toBean(map, User.class);
		cartItem.setBook(book);
		cartItem.setUser(user);
		return cartItem;
	}
	
	//把多个Map(List<Map>)映射成多个CartItem(List<CartItem>)
	private List<CartItem> toCartItemList(List<Map<String,Object>> mapList) {
		List<CartItem> cartItemList = new ArrayList<CartItem>();
		for(Map<String,Object> map : mapList) {
			CartItem cartItem = toCartItem(map);
			cartItemList.add(cartItem);
		}
		return cartItemList;
	}
	
	// 通过用户查询购物车条目
	public List<CartItem> findByUser(String uid) throws SQLException {
		String sql = "select * from cartitem c, book b where c.bid=b.bid and uid=? order by c.orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), uid);
		return toCartItemList(mapList);
	}
}
