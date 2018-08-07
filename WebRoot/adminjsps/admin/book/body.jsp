<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'body.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.box a {display: inline-block;width: 200px;height:200px;border-radius: 5px;margin: 40px 100px;}
		.box a:nth-child(2){
			margin:40px 0 40px 250px;
		}
		.box img {
			height: 200px;
		}
	</style>
  </head>
  
  <body>
  <div class="box">
	<h1 align="center">图书管理</h1>
	<p>
	<a href="<c:url value='/admin/AdminBookServlet?method=addPre'/>">
		<img src="<c:url value='/images/addBook.jpg'/>"/>
	</a>
	<a href="<c:url value='/adminjsps/admin/book/gj.jsp'/>" >
		<img src="<c:url value='/images/search.jpg'/>" class="img"/>
	</a>
	</p>
  </div>
  </body>
</html>
