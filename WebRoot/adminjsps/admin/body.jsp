<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>body.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		*{margin: 0;padding: 0;}
		body{background: #FCFCFC;}
		h1 {margin: 100px;font-size: 40px;text-align: center;}
		h1 img {margin: -16px 0;width: 90px;}
	</style>
  </head>
  
  <body style="margin: 0px;">
    <h1>点击<img src="<c:url value='/images/xiaoshou.png'/>"/>上面按钮管理后台</h1>
  </body>
</html>
