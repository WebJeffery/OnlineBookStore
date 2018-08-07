<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <title>用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/base.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/user/login.css'/>">
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/frontpages/js/user/login.js'/>"></script>
	<script type="text/javascript">
		$(function(){
			let loginname = window.decodeURI("${cookie.loginname.value}");
			if("${requestScope.user.loginname}"){
		    	loginname = "${requestScope.user.loginname}";
		    }
			$("#usr").val(loginname); 
			$("#vCode").click(function(){
				$(this).attr('src',"<c:url value='/VerifyCodeServlet?'/>" + new Date().getTime());
			});
		}); 
	</script>
	<style>
		body {
			box-sizing: border-box;
      		background: url("<c:url value='/images/loginbg.jpg'/>") no-repeat;
      		background-size: cover;
    	}
	</style>
  </head>
  <body>
  <div class="box">
      <h3>快捷登录</h3>
    <form action="<c:url value='/UserServlet'/>" method="post">
      <input type="hidden" name="method" value="login" />
    	<span class="col">${msg }</span><br/>
      <input type="text" name="loginname" placeholder="请输入用户名" value="${user.loginname }" id="usr" />
      <input type="password" name="loginpass" placeholder="请输入密码" value="${user.loginpass}"/>
      <input type="text" name="verifyCode" class="verify" autocomplete="off" placeholder="请输入验证码" value="${user.verifyCode}"/>
      <img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" class="vCode" />
      <input type="submit" value="登录" class="login">
    </form>
    <p align="right"><a href="<c:url value = '/index.jsp'/>">返回主页</a></p>
  </div>
</body>
</html>
