<!--
        作者：Chenrong
        时间：2017-09-09
        描述：页面顶部--开始
        -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>94Train购票网</title>
        <!-- Hi，如果你要在自己的网站上引入bootstrap样式文件的话，请使用当前最新版本v3.0.3的CDN链接，页面加载速度会更快！-->
        <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
        <link rel="icon" href="../../../static/images/favicon.ico">
        <link rel="stylesheet" href="../../../static/css/dcalendar.picker.css">
        <link rel="stylesheet" href="../../../static/css/bootstrap.min.css">

        <script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../../static/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../../../static/js/jquery.min.js"></script>
        <script type="text/javascript" src="../../../static/js/scrollable.js"></script>
        <script type="text/javascript" src="../../../static/js/dcalendar.picker.js"></script>


        <style type="text/css">
        .white{
            color: #ffffff;
        }

        .white:hover{
            color: #cdbcf3;

}
        .bac-color{
            background-color: #563d7c;
        }

        .btn-link{
            color: #cdbcf3;
        }

        .btn-link:hover, .btn-link:focus, .btn-link:active{
            color: #ffffff;
        }

        .main {
            height: 80%;
            position: relative;
        }

        .top,.bottom{
            height: 10%;
            position: relative;
        }

        </style>
    </head>

<body>
<div class="bac-color top">
    <div class="container">
        <div class="row">
            <div class="col-xs-3">
                <label><a href="/index/viewIndex.do"><h1 style="color: #cdbcf3"><span class="glyphicon glyphicon-plane" style="color: #ffffff"></span>94购票网</h1></a></label>
            </div>

            <div class="col-xs-5">

            </div>

            <div class="col-xs-4">

                <%
                    if(session.getAttribute("S_UserID")==null)
                    {
                %>
                <div>
                    <a class="btn btn-link navbar-btn" href="/registerAndLogin/viewLogin.do"><h3>登录</h3></a>
                    <a class="btn btn-link navbar-btn" href="/registerAndLogin/viewRegister.do"><h3>注册</h3></a>
                </div>
                <%
                }
                else
                    {
                %>
                <div>
                    <ul class="nav nav-pills">
                        <li><label><h3 class="white">Hi,<a href="/user/viewUserInfo.do" class="white">${sessionScope.get("S_Username")}</a></h3></label></li>
                        <li>&nbsp;&nbsp;</li>
                        <li class="active" style="margin-top: 10px;"><a href="/index/viewIndex.do">我要买票</a></li>
                        <li style="margin-top: 10px;"><button class="btn btn-link" onclick="unload()">退出登录</button></li>
                    </ul>
                   <% }
                %>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main">