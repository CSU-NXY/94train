<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 17-9-7
  Time: 下午2:46
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="common/IncludeTop.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username ="";
    String password="";
    String remember_me="";
    Cookie[] cookies = request.getCookies();
         for (int i = 0; i < cookies.length; i++) {//对cookies中的数据进行遍历，找到用户名、密码的数据
            if ("username".equals(cookies[i].getName()))
            {
                username = cookies[i].getValue();
            }
            else if ("password".equals(cookies[i].getName()))
            {
                password = cookies[i].getValue();
            }
            else if("remember-me".equals(cookies[i].getName()))
             {
                 remember_me=cookies[i].getValue();
             }
         }
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        if("<%=remember_me%>"=="Checked")
        {
            $("#remember").attr("checked","checked");
        }
        else
        {
            $("#remember").removeAttr("checked");
        }
    });
</script>
<div class="container">

    <div class="row">
        <div class="col-xs-offset-3 col-xs-6" >
            <%
                String msg = (String) request.getAttribute("Msg");
                if(msg!=null)
                {
            %>
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only">Error:</span>
                ${Msg}
            </div>
            <%
                }
            %>


            <form class="form-group" role="form" action="/registerAndLogin/Login.do" method="post">
                <div class="form-group">
                    <h2>欢迎登录</h2>
                </div>

                <div class="form-group">
                    <label for="PhoneNum">手机号</label>
                    <input type="number" id="PhoneNum" name="PhoneNum" class="form-control" placeholder="手机号" value="<%=username%>" autofocus>
                </div>

                <div class="form-group">
                    <label for="Password">密码</label>
                    <input type="password" id="Password" name="Password" class="form-control" placeholder="密码" value="<%=password%>" required>
                </div>
                   
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="true" id="remember" name="remember"> 记住密码
                        </label>
                    </div>
                    <input class="btn btn-lg btn-primary btn-block" type="submit" value="登录">
                </form>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>


