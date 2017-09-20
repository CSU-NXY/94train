<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 17-9-7
  Time: 下午2:46
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="common/IncludeTop.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="row">
        <div class="col-xs-4" ></div>
        <div class="col-xs-4" >
            <form class="form-group" action="" method="get">
                <h2>欢迎登录</h2>
                <label for="inputEmail">用户名/手机号</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="用户名/手机号" required autofocus>
                <label for="inputPassword">密码</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="密码" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> 记住密码 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">忘记密码</a>
                    </label>
                </div>
                <a href="/index/viewIndex.do" class="btn btn-lg btn-primary btn-block" type="submit">登录</a>
            </form>
        </div>
    </div> <!-- /container -->
</div>

<jsp:include page="common/IncludeBottom.jsp"/>