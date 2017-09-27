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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/train.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery-ui.css">
    </head>

<body>
<div class="bac-color top">
    <div class="container">
        <div class="row">
            <div class="col-xs-3">
                <label><h1 style="color: #cdbcf3"><a href="${pageContext.request.contextPath}/index/viewIndex.do"><span class="glyphicon glyphicon-bed" style="color: #ffffff">&nbsp;94购票网</span></a></h1></label>
            </div>

            <div class="col-xs-5"></div>

            <div class="col-xs-4">

                <%
                    if(session.getAttribute("S_UserID")==null)
                    {
                %>
                <div>
                    <a class="btn btn-lin navbar-btn" href="${pageContext.request.contextPath}/registerAndLogin/viewLogin.do"><h3>登录</h3></a>
                    <a class="btn btn-lin navbar-btn" href="${pageContext.request.contextPath}/registerAndLogin/viewRegister.do"><h3>注册</h3></a>
                </div>
                <%
                }
                else
                    {
                %>
                <div>

                    <ol class="nav nav-pills">
                        <li><label><h3 class="white">Hi,<a href="${pageContext.request.contextPath}/user/viewUserInfo.do" class="white">${sessionScope.get("S_Name")}</a></h3></label></li>
                        <li>&nbsp;&nbsp;</li>
                        <li><form style="margin-top: 15px"><a class="btn btn-success" href="${pageContext.request.contextPath}/index/viewIndex.do">我要买票</a></form></li>
                        <li><form style="margin-top: 15px" method="post" action="/registerAndLogin/LogOut.do"><input  class="btn btn-warning" type="submit" value="退出登录"></form></li>
                    </ol>
                </div>
                <%
                    }
                %>

            </div>
        </div>
    </div>
</div>

<div class="main">
