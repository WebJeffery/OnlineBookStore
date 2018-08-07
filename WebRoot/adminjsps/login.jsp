<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/base.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/user/login.css'/>">
	<style>
		body {
			box-sizing: border-box;
      		background: url("<c:url value='/images/loginbg.jpg'/>") no-repeat;
      		background-size: cover;
    	}
    </style>
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
	 
  </head>
  <body>
  <div class="box">
	  <h3>管理员登录</h3>
	  <form action="<c:url value='/AdminServlet'/>" method="post">
		  <input type="hidden" name="method" value="login" />
		  <span class="col">${msg }</span><br/>
		  <input type="text" name="adminname" placeholder="请输入用户名" value="${user.loginname }" id="usr" />
		  <input type="password" name="adminpwd" placeholder="请输入密码" value="${user.loginpass}"/>
		  <input type="submit" value="进入后台" class="login">
	  </form>
  </div>
  </body>
</html>
