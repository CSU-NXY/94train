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



            <form class="form-group" action="\registerAndLogin\Login.do" method="post">
                <h2>Please sign in</h2>
                <label for="PhoneNum">Email address</label>
                <input type="number" name = "PhoneNum" id="PhoneNum" class="form-control" placeholder="Phone Number" required autofocus>
                <label for="Password">Password</label>
                <input type="password"  name="Password" id="Password" class="form-control" placeholder="Password" required>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <<input class="btn btn-lg btn-primary btn-block" type="submit">Sign in</form>
            </form>
        </div>
    </div> <!-- /container -->
</div>


<jsp:include page="common/IncludeBottom.jsp"/>