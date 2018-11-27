<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>一天零一页</title>
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/icon.png" media="screen" />
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script src="/static/js/jquery-3.2.1.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
</head>
<body background="/static/images/bg.png" >
<div>
    <header id="header"><!--<header> 标签定义文档的页眉（介绍信息）-->
        <nav>
            <ul>
                <li>
                    <a href="/" style="color:#AB82FF">首页</a>
                    <a href="/about" style="color:#AB82FF">关于</a>
                </li>
            </ul>
            <div class="my-info" onmouseover="hiddeewm()" onmouseout="hiddeewm()">
                <figure>
                    <img src="/static/images/nopict.jpg" width="50px" height="50px"/>
                </figure><!--用作文档中插图的图像-->
                <span style="color:#AB82FF">一天零一页</span>
            </div>
        </nav>
    </header>
    <div id="bg" >
        <p>
            和所有以梦为马的诗人一样
            <br />
            <i>岁月易逝 一滴不剩</i><!--<i> 标签显示斜体文本效果-->
        </p>
    </div>
</div>
<div id="container">
    <c:forEach items="${articles}" var="article"><!--foreach遍历 item要迭代的list集合 var要遍历的变量-->
        <article class="article"><!--<article> 标签规定独立的自包含内容-->
            <time>${article.localTime}</time>
            <h2 class="title"><a href="article?id=${article.id}">${article.title}</a></h2>
            <span><i>${article.keywords}</i></span>
            <section class="article-content markdown-body">
                <blockquote><!--<blockquote> 标签定义块引用-->
                    <p>${article.desci}</p>
                </blockquote>
                ......
            </section><!--<section> 标签定义文档中的节（section、区段）,比如章节、页眉、页脚或文档中的其他部分-->
            <footer>
                <a href="article?id=${article.id}">阅读全文</a>
            </footer>
        </article>
    </c:forEach>
    <div style="text-align: center">
        <ul class="pagination" >
            <li <c:if test="${pageInfo.pageNum==1}">class="disabled"</c:if>><a href="/?page=1">&laquo;</a></li>
            <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="pageNo">
                <li <c:if test="${pageInfo.pageNum==pageNo}">class="active"</c:if>><a href="/?page=${pageNo}">${pageNo}</a></li>
            </c:forEach>
            <li <c:if test="${pageInfo.pageNum==pageInfo.pages}">class="disabled"</c:if>><a href="/?page=${pageInfo.pages}">&raquo;</a></li>
        </ul>
    </div>
</div>
    <footer id="footer">
        <section id="copyright">
            <p style="font-size: 20px">
               <a href="/jsp/admin/" style="color: whitesmoke;"> © </a>2018 <a href="/">一天零一页</a>
            </p>
        </section>
    </footer>
</body>
</html>