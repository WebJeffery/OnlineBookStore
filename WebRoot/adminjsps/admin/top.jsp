<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    <base target="body">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {background: #18BC9C;color: #fff;}
	.box {padding-bottom: 10px;}
	h1 {padding-top:　10px}
	.manager {font-weight: bold; font-size: 18px;}
	a {color: #666666;display: inline-block; text-decoration: none;font-size:16px;
	margin-right: 10px;font-weight:bold;width:80px; height: 40px;line-height: 40px;
	text-align: center;}
	span {margin-right: 5px;}
	.back {background:url("<c:url value='/images/iconBack.png' />") no-repeat;}
	.classify {background:url("<c:url value='/images/iconClassfity.png' />") no-repeat;}
	.book {background:url("<c:url value='/images/iconBook.png' />") no-repeat;}
	.cart {background:url("<c:url value='/images/iconCart.png' />") no-repeat;}
	.classify, .book, .cart, .back {padding-left: 30px;background-color: #FCFCFC;background-size: 34px;
	background-position: 4px 4px;border-radius: 5px;}
	.classify {background-position: 4px 9px;}
	.book {background-position: 4px 5px;}
</style>
  </head>
  
  <body >
<h1 style="text-align: center; line-height: 30px;">图书商城后台管理系统</h1>
<div style="line-height: 10px;" class="box">
	<span class="manager">管理员：${sessionScope.admin.adminname }</span>
	<span style="padding-left:50px;" class="ahover">
		<a target="_top" href="<c:url value='/adminjsps/login.jsp'/>" class="back">退出后台</a>
		<a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>" class="classify">分类管理</a>
		<a href="<c:url value='/adminjsps/admin/book/main.jsp'/>" class="book">图书管理</a>
		<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>" class="cart">订单管理</a>
	</span>
</div>
  </body>
</html>
