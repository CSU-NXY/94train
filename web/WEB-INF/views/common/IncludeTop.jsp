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
        <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
        <link rel="icon" href="../../../static/images/favicon.ico">
        <script type="text/javascript" src="../../../static/js/jquery.min.js"></script>
        <script type="text/javascript" src="../../../static/js/scrollable.js"></script>
        <style type="text/css">
        .main{
            margin-top: 10px;
        }

        .white{
            color: #ffffff;
        }

        .bottom{
            position: absolute;
            top: 100%;
            margin-top:-60px;
            width: 100%;
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

        </style>
    </head>

<body>
<div class="bac-color">
    <div class="container">
        <div class="row" >
            <div class="col-xs-3">
                <a href="/index/viewIndex.do"><img src="${pageContext.request.contextPath}/static/images/tomas.jpg" class="img-thumbnail"></a>
            </div>

            <div class="col-xs-6 text-center">

            </div>

            <div class="col-xs-3">
                <div >
                    <a class="btn btn-link" href="/registerAndLogin/viewLogin.do"><h3>登录</h3></a>
                    <a class="btn btn-link" href="/registerAndLogin/viewRegister.do"><h3>注册</h3></a>
                </div>
                <div style="display: none">
                    <h3 class="white">Hi,<a class="btn btn-link" href="/user/viewUserInfo.do">xxx</a>&nbsp;<a class="btn btn-link">退出登录</a></h3>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main" >