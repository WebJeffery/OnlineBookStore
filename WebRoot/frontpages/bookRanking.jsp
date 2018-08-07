<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <title>图书</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }
    a {
      text-decoration: none;
      color: #666;
      text-align: center;
    }
    .book-ranking {
      width: 210px;
      border: 1px solid #edecec;
    }
    .book-ranking .ranking-title {
      height: 28px;
      line-height: 28px;
      background: #f7f7f7;
      border-bottom: 1px solid #edecec;
    }
    .book-ranking .ranking-title h3 {
      text-align: center;
      font-size: 17px;
      font-weight: 700;
      font-family: "Microsoft Yahei";
    }
    .book-ranking .book-cell {
      height: 76px;
      overflow: hidden;
      zoom: 1;
    }
    .book-ranking .ranking-content li {
      border-bottom: 1px dotted #dcdcdc;
      padding: 8px 0 7px;
    }
    .book-ranking .book-cell .img {
      width: 60px;
      height: 60px;
      padding: 8px;
      float: left;
      margin-right: 4px;
      background: #fff;
    }
    .book-ranking .book-cell .book-name {
      height: 36px;
      line-height: 18px;
      font-size: 13px;
      margin-bottom: 8px;
      padding-top: 8px;
    }
    .book-ranking .book-name a {
      text-align: left;
    }
    .book-ranking .price {
      height: 16px;
      line-height: 16px;
      margin-bottom: 8px;
    }
    .book-ranking .price .price-n {
      margin-right: 4px;
      color: #db2a41;
      font-size: 13px;
      font-family: "Microsoft Yahei";
    }
    .book-ranking .price .price-o {
      color: #999;
      font-size: 12px;
      text-decoration: line-through;
    }
    .img, .book-cell {
        text-align: center;
    }
    .book-cell, .book-name, .price {
      overflow: hidden;
    }
  </style>
</head>
<body>
  <div class="book-ranking">
    <div class="ranking-title">
      <h3>热售书销榜</h3>
    </div>
    <div class="ranking-content">
      <ul >
      <c:forEach items="${bookList }" var="book">
        <li>
          <div class="book-cell">
            <div class="img">
              <a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>" target="body"><img width="60" height="60" src="<c:url value='/${book.image_b }'/>" alt=""/></a>
            </div>
            <div class="book-name">
              <a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>" target="body">${book.bname }</a>
            </div>
            <div class="price">
              <span class="price-n">&yen;${book.currPrice }</span>
              <span class="price-o">&yen;${book.price }</span>
            </div>
          </div>
        </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</body>
</html>
