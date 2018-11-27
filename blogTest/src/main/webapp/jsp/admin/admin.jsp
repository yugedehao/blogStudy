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
    <link rel="stylesheet" href="/static/css/bootstrap4.0.min.css" >
    <script src="/static/js/jquery.slim.min.js" ></script>
    <script src="/static/js/popper.min.js" ></script>
    <script src="/static/js/bootstrap4.0.min.js"></script>
    <script src="/static/js/layer.js"></script>

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
    <div align="center">
        <a href="/jsp/admin/article/add">那就写点吧！</a>
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
                <a href="/jsp/admin/article/edit?id=${article.id}">修改</a>
                <a href="/jsp/admin/delete?id=${article.id}" onclick="ifdelete(${article.id})">删除</a>
                <button type="button" onclick="ifdelete('${article.id}')">${article.id}</button>
                <script>
                    function ifdelete(id) {
                        layer.confirm('确定删除该文章吗?', {
                            btn: ['确定','取消'] //按钮
                        }, function(){
                            $.ajax({
                                type: 'POST',
                                url: '/jsp/admin/delete',
                                dataType:'json',
                                data:{"id":id},
                                success: function(data){
                                    if(data['stateCode']==1){
                                        layer.msg('删除成功!',{icon:1,time:1000});
                                        setTimeout("window.location.reload()",1000);
                                    }
                                    else {
                                        layer.msg('删除失败!',{icon:5,time:1000});
                                    }
                                },
                                error:function(data) {
                                    console.log('错误...');
                                }
                            });
                        });
                    }
                </script>
            </footer>
        </article>
        </c:forEach>
        <div style="text-align: center;align: center;">
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
                © 2018 <a href="/">一天零一页</a>
            </p>
        </section>
    </footer>
</body>
</html>