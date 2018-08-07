<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>book_main.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/main.css'/>">
  	<style>
  		.box {display: flex;padding-top: 20px;}
  		.tdLeft {padding: 20px;float: left;width: 300px;}
  		.tdRight {background: #F9F9F9; float: left;width: 100%;flex: 1;}
  		iframe{width: 100%;height: 100%;}
  	</style>
  </head>
  
  <body>
  <div class="box">
	<div class="tdLeft">
		<iframe frameborder="0" src="<c:url value='/admin/AdminBookServlet?method=findCategoryAll'/>" name="left"></iframe>
	</div>
	<div class="tdRight">
		<iframe frameborder="0" src="<c:url value='/adminjsps/admin/book/body.jsp'/>" name="booklist"></iframe>
	</div>
  </div>
  </body>
</html>
