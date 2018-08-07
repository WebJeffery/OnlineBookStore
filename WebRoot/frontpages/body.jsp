<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'body.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/base.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/frontpages/css/body.css'/>" />
</head>
<body>
<div class="banner">
	<div class="box" id="xzf-banner">
	    <!-- 轮播图 -->
	    <div class="inner">
	        <ul id="inner-ul">
	        <c:forEach items="${bookList }" var = "book">
	            <li>
	            <a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>" target="body">
	            <img width="100%" height="100%" src="<c:url value='/${book.image_w }'/>" alt=""/>
	            </a>
	            </li>
			</c:forEach>
	        </ul>
	    </div>
	    <!-- 小圆点 -->
	    <ol id="oid">
	    </ol>
	    <span  id="previ" class="pre">上一张</span>
	    <span  id="next" class="next">下一张</span>
	</div>
	<!-- 图书排行榜 -->
	 <div class="right">
      <iframe frameborder="0" src="<c:url value='/BookServlet?method=findBookRanding'/>" scrolling = "no"></iframe>
    </div>
</div>
<script>
    var Target =0;
    var timer=null;
    var speed=0;
    var key=0;
    var myBanner = findById("xzf-banner");
    var uls = findById("inner-ul");
    var oid = findById("oid");
    //上一张
    var previFun = findById("previ");
    //下一张
    var nextFun = findById("next");
    var ols = null;
    var ulChildren = uls.children;
    var len = ulChildren.length;
    //轮播图的宽度和高度
    var widthNum = 600;
    var heightNum = myBanner.offsetHeight;
    function Banner(obj){
        //保存盒子宽度
        widthNum = obj.width;
        //盒子的宽度和高度
        myBanner.style.width = widthNum + "px";
        myBanner.style.height = obj.height + "px";
        for(var i = 0; i < ulChildren.length; i++){
            ulChildren[i].style.width = widthNum + "px";
        }
        uls.style.width = widthNum * len + "px";
        uls.style.height = obj.height + "px";

        //生成小圆点
        createDot(len);
        //拿到所有的小圆点对象
        ols = oid.children;
        //为每个小圆点添加点击事件
        addClickEvent(ols,widthNum);
        autoplay(widthNum);
        previFun.addEventListener("click", function(){
            previ(widthNum);
        });
        nextFun.addEventListener("click", function(){
            next(widthNum);
        });
    }
    //查找id属性对象
    function findById (obj) {
        return document.getElementById(obj);
    }
    //创建小圆点
    function createDot (len) {
         for (var i = 1; i <= len; i++) {
            let lis = document.createElement("li");
            let lisText = document.createTextNode(i);
            lis.appendChild(lisText);
            if(i === 1) {   //给第一个li标签添加一个class属性值cul
                lis.setAttribute("class", "cul");
            }
            oid.appendChild(lis);
        };
    }
    //给每个小圆点添加点击事件
    function addClickEvent (ols,width) {
        let parseWidth = Number(width);
        for(var i=0; i<ols.length; i++){
        ols[i].index=i;
        ols[i].onclick=function () {
            clearInterval(timer);
            for(var i=0; i<ols.length; i++){
                ols[i].className="";
            }
            this.className="cul";
            key=this.index;     //核心代码
            Target=this.index*(-parseWidth);
            buffer(Target);
        };

    };
    }
//    缓冲运动
    function buffer(target) {
       timer = setInterval(function () {
           speed = (target - uls.offsetLeft)/10;
           speed = speed>=0?Math.ceil(speed):Math.floor(speed);
           uls.style.left=uls.offsetLeft+speed+"px";
        },50);
    }

//    下一张轮播图
    function next(width) {
        var parseWidth = Number(width);
        clearInterval(timer);
        key=++key%len;
        for(var i=0; i<ols.length; i++){
            ols[i].className="";
        }
        ols[key].className="cul";
        Target=key*(-parseWidth);
        buffer(Target);
    }
//    上一张轮播图
    function previ(width) {
        var parseWidth = Number(width);

        clearInterval(timer);
        key<=0?key=len:key;
        key--;
        for(var i=0; i<ols.length; i++){
            ols[i].className="";
        }
        ols[key].className="cul";
        Target=key*(-parseWidth);
        buffer(Target);

    }
//    自动播放
    function autoplay(width) {
        clearInterval(myBanner.timer);
        myBanner.timer=setInterval(function () {
            next(width);
        },3000);
    }
    myBanner.onmouseover=function () {
        clearInterval(myBanner.timer);
        previFun.style.display = "block";
        nextFun.style.display = "block";

    }
    myBanner.onmouseout=function () {
        autoplay(widthNum);
        previFun.style.display = "none";
        nextFun.style.display = "none";
    }
    new Banner({width:widthNum,height:heightNum});
</script>
  </body>
</html>
