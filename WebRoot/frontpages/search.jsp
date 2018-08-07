<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>按图名查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	input {
		width: 420px;
		height: 40px;
		margin:0px;
		padding: 4px 4px 4px 7px;
		border: 2px solid #E4393C;
		color: #989898;
		outline: none;
	}
	a {
		text-transform:none;
		text-decoration:none;
		border-width: 0px;
		width: 100%;
		height: 100%;
	} 
	.btn-bg {
		display: inline-block;
		height: 40px;
		width: 80px;
		background: #E4393C;
		margin: 0px;
		position: relative;
		top: 2px; 
    	left: -6px;
    	text-align: center;
	}
	.btn {
		line-height: 40px;
	    font-size: 18px;
	    color: #fff;
	    text-align: center;
	    display: inline-block;
	    font-weight: bold;
	}
	.btn:hover {
		text-decoration:underline;
		border-width: 0px;
	}
</style>
  </head>
  
  <body>
    <form action="<c:url value='/BookServlet'/>" method="get" target="body" id="form1">
    	<input type="hidden" name="method" value="findByBname"/>
    	<input type="text" name="bname" class="search" placeholder="解忧杂货店"/>
    	<span class="btn-bg" >
    		<a href="javascript:document.getElementById('form1').submit();" class="btn">搜索</a>
    	</span>
    </form>
    
  </body>
</html>
