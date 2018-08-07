<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    
    <title>首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/base.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/top.css'/>">
  </head>
  
  <body>
    <h1>网上图书商城</h1>
    <div class="content">
    	<c:choose>
    		<c:when test="${empty sessionScope.sessionUser}">
    			<a href="<c:url value='/frontpages/user/login.jsp'/>" target="_parent">会员登录</a> &nbsp;
		  		<a href="<c:url value='/frontpages/user/register.jsp'/>" target="body">注册会员</a>	
    		</c:when>
    		<c:otherwise>
    			<span>会员：${sessionScope.sessionUser.loginname }</span>&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="<c:url value='/frontpages/user/pwd.jsp'/>" target="body">修改密码</a>
    			<a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出登录</a>
    		</c:otherwise>
    	</c:choose>
    </div>
  </body>
</html>
