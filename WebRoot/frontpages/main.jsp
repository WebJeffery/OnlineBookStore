<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>网上图书商城</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="网上图书商城">
	<meta http-equiv="description" content="网上图书商城越来方便大家购书">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/base.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/main.css'/>" />
  	<style>
  		.footer{width: 100%;height: 300px; background: url("<c:url value='/images/footbg.png'/>") no-repeat;background-size: cover;}
		
  	</style>
  </head>
  <body>
   <div class="head">
      <ul>
        <li><a href="<c:url value='/index.jsp'/>">首页</a></li>
        <li>
        <a href="<c:url value='/CartItemServlet?method=myCart'/>" target="body">我的购物车</a>
        </li>
        <li>
        <a href="<c:url value = '/OrderServlet?method=myOrders'/>" target="body">我的订单</a>
        </li>
        <li><a href="javascript:;" target="_top">联系我们</a></li>
      </ul>
  </div>
  <div class="header">
  	<iframe frameborder="0" src="<c:url value='/frontpages/top.jsp'/>" name="top" scrolling = "no"></iframe>
  </div>
  <div class="navigator">
  	<div class="img">
  	  <img alt="" src="">
  	</div>
  	<div class="search">
  		<iframe frameborder="0" src="<c:url value='/frontpages/search.jsp'/>" name="search" scrolling = "no"></iframe>
  	</div>
  	<div class="cart">
  	</div>
  </div>
  <div class="banner">
	  <div class="left">
	  	<iframe frameborder="0" src="<c:url value='/CategoryServlet?method=findAll'/>" name="left" scrolling = "auto"></iframe>
	  </div>
	  <div class="center">
	  	<iframe frameborder="0" src="<c:url value='/BookServlet?method=findBannerBook'/>" name="body" scrolling = "auto"></iframe>
	  </div>
  </div>
  
  <div class="">
  	<div class="footer"></div>
  </div>
  </body>
</html>