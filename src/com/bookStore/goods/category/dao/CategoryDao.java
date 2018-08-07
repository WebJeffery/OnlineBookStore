package com.bookStore.goods.category.dao;

import com.bookStore.goods.Utils.CommonUtils;
import com.bookStore.goods.Utils.MyQueryRunner;
import com.bookStore.goods.category.domain.Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CategoryDao {
	private QueryRunner qr = new MyQueryRunner();
	
	// Map中的数据映射成Category
	private Category toCategory(Map<String,Object> map) {
		Category category = CommonUtils.toBean(map, Category.class);
		String pid = (String)map.get("pid");// 如果是一级分类，那么pid是null
		if(pid != null) {//如果父分类ID不为空，
			Category parent = new Category();
			parent.setCid(pid);
			category.setParent(parent);
		}
		return category;
	}
	
	// 可以把多个Map(List<Map>)映射成多个Category(List<Category>)
	private List<Category> toCategoryList(List<Map<String,Object>> mapList) {
		List<Category> categoryList = new ArrayList<Category>();
		for(Map<String,Object> map : mapList) {
			Category c = toCategory(map);//把一个Map转换成一个Category
			categoryList.add(c);
		}
		return categoryList;
	}
	
	// 返回所有分类
	public List<Category> findAll() throws SQLException {
		// 查询所有一级分类
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		List<Category> parents = toCategoryList(mapList);
		//为每个一级分类加载它的二级分类
		for(Category parent : parents) {
			// 查询出当前父分类的所有子分类
			List<Category> children = findByParent(parent.getCid());
			// 设置给父分类
			parent.setChildren(children);
		}
		return parents;
	}

	public List<Category> findByParent(String pid) throws SQLException {
		String sql = "select * from category where pid=? order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), pid);
		return toCategoryList(mapList);
	}

	public void add(Category category) throws SQLException {
		String sql = "insert into category(cid,cname,pid,`desc`) values(?,?,?,?)";
		String pid = null;//一级分类
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCid(), category.getCname(), pid, category.getDesc()};
		qr.update(sql, params);
	}
	
	//获取所有父分类，不包含子分类
	public List<Category> findParents() throws SQLException {
		String sql = "select * from category where pid is null order by orderBy";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler());
		return toCategoryList(mapList);
	}
	
	//加载所有层分类
	public Category load(String cid) throws SQLException {
		String sql = "select * from category where cid=?";
		return toCategory(qr.query(sql, new MapHandler(), cid));
	}

	public void edit(Category category) throws SQLException {
		String sql = "update category set cname=?, pid=?, `desc`=? where cid=?";
		String pid = null;
		if(category.getParent() != null) {
			pid = category.getParent().getCid();
		}
		Object[] params = {category.getCname(), pid, category.getDesc(), category.getCid()};
		qr.update(sql, params);
	}
	
	//查询指定父分类下子分类的个数
	public int findChildrenCountByParent(String pid) throws SQLException {
		String sql = "select count(*) from category where pid=?";
		Number cnt = (Number)qr.query(sql, new ScalarHandler(), pid);
		return cnt == null ? 0 : cnt.intValue();
	}

	public void delete(String cid) throws SQLException {
		String sql = "delete from category where cid=?";
		qr.update(sql, cid);
	}
}
