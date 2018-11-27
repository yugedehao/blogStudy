<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一天零一页</title>
    <link rel="shortcut icon" type="image/x-icon" href="/static/images/icon.png" media="screen" />

    <link rel="stylesheet" type="text/css" href="/static/css/about.css">
</head>
<body background="img/bg.png" >
    <div>
        <header id="header">
            <nav>
                <ul>
                    <li>
                        <a href="/" style="color:#AB82FF">首页</a>
                        <a href="/about" style="color:#AB82FF">关于</a>
                    </li>
                </ul>
                <div class="my-info" onmouseover="hiddeewm()" onmouseout="hiddeewm()">
                    <figure></figure>
                    <span style="color:#AB82FF">星·光</span>
                </div>
            </nav>
        </header>
        <div id="bg" >
            <p>
                和所有以梦为马的诗人一样
                <br>
                <i>岁月易逝 一滴不剩</i>
            </p>
        </div>
        <div id="container">
            <article class="article">
                <p>
                    <br><br><br><br>
                <h3>你来人间一趟，你要看看太阳</h3>
                <br><br>
                <h3>邮箱:<a href="mailto:withstars@126.com">withstars@126.com</a></h3>
                <br><br><br><br>
                </p>
            </article>
        </div>
    </div>
    <footer id="footer">
        <section id="copyright">
            <p style="font-size: 20px">
                © 2018 <a href="/">星·光</a>
            </p>
        </section>
    </footer>
</body>
</html>