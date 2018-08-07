<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/left.css'/>">
<style>
* {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }
    a {text-decoration: none;}
    a:hover{
        text-decoration: none;}
    .right {
      float: right;
      margin-right: 20px;
      font-size: 16px;
    }
    .banner-xzf {
      width: 210px;
    }
    .banner-xzf .title {
      font-weight: 700;
      background-color: #263238
    }
    .banner-xzf .item {
      width: 280px;
      line-height: 40px;
      color: #fff;
      font-weight: 600;
      border-bottom: 2px solid #eee;
    }
    .banner-xzf .title {
      font-size: 20px;
      font-weight: 700;
      background-color: #263238;
      padding: 16px 0;
      font-weight: bold;
    }
    .banner-xzf .item .text {
      font-size: 16px;
        cursor: pointer;
      }
    .banner-xzf p {
      width: 100%;
      height: 50px;
      line-height: 50px;
      background-color: #263238;
      position: relative;
    }
    .banner-xzf .children {
      display: none;
      width: 280px;
      left: 119px;
      top: 0px;
      line-height: 40px;
      background: #5EADB1 ;
    }
    .banner-xzf .children li {
      width: 280px;
      height: 50px;
      color: #fff;
      background: #5EADB1;
      border-bottom: 2px solid #eee
    }
	.banner-xzf .children li a {
		display: inline-block;
		color: #fff;
		font-size: 16px;
		width: 100%;
		height: 100%;
	}
    .sjx-right {
      display: inline-block;
      width: 0;
      height: 0;
      display: inline-block;
      border-left: 10px solid #5EADB1;
      border-top: 10px solid transparent;
      border-bottom: 10px solid transparent;
      position: absolute;
      top: 15px;
      right: 10px;
    }
    .sjx-top {
      display: inline-block;
      width: 0;
      height: 0;
      display: inline-block;
      border-top: 10px solid #5EADB1;
      border-right: 10px solid transparent;
      border-left: 10px solid transparent;
      position: absolute;
      top: 20px;
      right: 10px;
    }
    .banner-xzf .col {background: #5EADB1;}
    .banner-xzf .item .col-child {background: #F87300;}
  </style>
</head>
  
<body>  
   <div class="banner-xzf">
    <ul>
    <li class="item title">网上图书商城</li>
    <c:forEach items="${parents}" var="parent">
      <li class="item">
        <p><span class="text">${parent.cname }</span><span class="sjx sjx-right"></span></p>
        <div class="children">
          <ul>
          	<c:forEach items="${parent.children }" var="child">
            <li><a href="<c:url value='/BookServlet?method=findByCategory&cid=${child.cid}'/>">${child.cname}</a></li>
            </c:forEach>
          </ul>
        </div>
      </li>
	</c:forEach>
    </ul>
  </div>
  <script type="text/javascript">

     $(".item").click(function() {
    $(this).find(".children").slideToggle("slow");
    $(this).find('.sjs-right').toggleClass("sjx-top");
    let obj = $(this).find('.sjx').hasClass("sjx-right");
    if(obj){
      $(this).find('.sjx').removeClass("sjx-right").addClass("sjx-top");
    }else {
      $(this).find('.sjx').removeClass("sjx-top").addClass("sjx-right");
    }
  });

   $(".children li").mouseenter(function() {
        $(this).addClass('col-child');
      });

    $(".children li").mouseleave(function() {
      $(this).removeClass('col-child');
    });
    $(".children li").click(function(event){
    	event.stopPropagation();    
    });
  </script>
</body>
</html>
