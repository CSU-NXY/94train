<!--
        作者：Chenrong
        时间：2017-09-09
        描述：页面顶部--开始
        -->
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>94Train购票网</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
        <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dcalendar.picker.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/includeTop.css">
    </head>

<body>
<div class="bac-color top">
    <div class="container">
        <div class="row">
            <div class="col-xs-3">
                <label><a href="${pageContext.request.contextPath}/index/viewIndex.do"><h1 style="color: #cdbcf3"><span class="glyphicon glyphicon-bed" style="color: #ffffff"></span>94购票网</h1></a></label>
            </div>

            <div class="col-xs-5">

            </div>

            <div class="col-xs-4">

                <%
                    if(session.getAttribute("S_UserID")==null)
                    {
                %>
                <div>
                    <a class="btn btn-link navbar-btn" href="${pageContext.request.contextPath}/registerAndLogin/viewLogin.do"><h3>登录</h3></a>
                    <a class="btn btn-link navbar-btn" href="${pageContext.request.contextPath}/registerAndLogin/viewRegister.do"><h3>注册</h3></a>
                </div>
                <%
                }
                else
                    {
                %>
                <div>
                    <ul class="nav nav-pills">
                        <li><label><h3 class="white">Hi,<a href="${pageContext.request.contextPath}/user/viewUserInfo.do" class="white">${sessionScope.get("S_Username")}</a></h3></label></li>
                        <li>&nbsp;&nbsp;</li>

                        <li class="active" style="margin-top: 10px;"><a href="/index/viewIndex.do">我要买票</a></li>
                        <li style="margin-top: 10px;"><form method="post" action="/registerAndLogin/LogOut.do"><input type="submit" class="btn btn-warning" value="退出登录"></form></li>

                    </ul>
                   <% }
                %>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main">
