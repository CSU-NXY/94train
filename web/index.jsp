<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="WEB-INF/views/common/IncludeTop.jsp"/>

<div class="container">
    <div class="jumbotron">
        <h1>94火车售票系统</h1>
    </div>

    <div class="row">
        <div class="col-sm-8">
            <div class="row">
                <h3>精彩图文</h3>
                <img src="${pageContext.request.contextPath}/static/images/tomas.jpg" class="img-thumbnail">
            </div>

            <div class="row">
                <table class="table">
                    <caption>车次信息</caption>
                    <thead>
                    <tr>
                        <th>路线</th>
                        <th>车票日期</th>
                        <th>发车时间</th>
                        <th>到达时间</th>
                        <th>票价</th>
                        <th>票量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    </tbody></table>
            </div>
        </div>


        <div class="col-sm-4">
            <div class="row-sm-4" background="#cccccc">
                <span class="badge"><h5>登录/注册</h5></span>
                <div class="input-group">
                    <span class="input-group-addon">用户名</span>
                    <input type="text" class="form-control" placeholder="username">
                </div><br>

                <div class="input-group">
                    <span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;码</span>
                    <input type="password" class="form-control" placeholder="password">
                </div><br>
                <button type="button" class="btn btn-default btn-sm">登录</button>
                <button type="button" class="btn btn-default btn-sm">注册</button>
            </div>


            <div class="row-sm-4">
                <h3>公告</h3>
                <ul class="list-group">
                    <li class="list-group-item"><a href="#">公告一</a></li>
                    <li class="list-group-item"><a href="#">公告二</a></li>
                    <li class="list-group-item"><a href="#">公告三</a></li>
                    <li class="list-group-item"><a href="#">公告四</a></li>
                    <li class="list-group-item"><a href="#">公告五</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>

<jsp:include page="WEB-INF/views/common/IncludeBottom.jsp"/>