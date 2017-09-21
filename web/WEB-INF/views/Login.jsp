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
                <h2>Please sign in</h2>
                <label for="inputEmail">Email address</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputPassword">Password</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <a class="btn btn-lg btn-primary btn-block" type="submit" href="\index\viewIndex.do">Sign in</a>
            </form>
        </div>
    </div> <!-- /container -->
</div>


<jsp:include page="common/IncludeBottom.jsp"/>