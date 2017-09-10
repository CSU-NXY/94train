<!--
作者：Chenrong
时间：2017-09-09
描述：页面顶部--开始
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>94Train购票网</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div id="header">
    <table border="0" cellpadding="10" width="1200">
        <tr>
            <td>
                <div id="logo" align="left">
                    <div id="LogoContent">
                        <p>94Tickets</p>
                        <p>---------------</p>
                        <p>给你不一样的便捷</p>
                    </div>
                </div>
                <!--这里用于插入主页的logo，可点击logo返回主界面-->
            </td>
            <td>
                <div id="Search" align="center">
                    <div id="SearchContent">
                        <form action="search" method="post">
                            <input type="text" name="search" size="14" /><input type="submit" name="searchProducts" value="搜索"/>
                        </form>
                    </div>
                </div>
                <!--这里用于搜索需要的信息，搜索按钮可以做成一张图-->
            </td>
            <td>
                <div id="menu" align="right">
                    <div id="MenuContent">
                        <a href><img align="middle" ></a>
                        <a href>登录</a> <img align="middle" ><a href>注册</a>
                    </div>
                </div>
                <!--这里用于点击登录注册和登出,中间插入的图片为分隔符-->
            </td>
        </tr>
    </table>
    <!--这里用于页面的标题栏-->
</div>
<!--页面顶部--结束-->