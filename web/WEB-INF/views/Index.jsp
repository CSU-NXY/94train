<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="common/IncludeTop.jsp"/>

<style type="text/css">
    .search{
        background-color: #563d7c;
        margin-left: -100px;
        color: #ffffff;
        margin-bottom: 0px;
    }

    .result{
        background-color: #f3f3f3;
        margin-bottom: 0px;
    }

    .input_control {
        width: 80%;
        margin: 20px auto;
    }

    .btn-search{
        background-color: inherit;
        width: auto;
        margin: 20px 5px 20px 0;
        padding: 18px 24px;
        font-size: 21px;
    }

    .btn-outline-inverse {
        border-color: #ffffff;
        color: #ffffff;
    }

    .btn-outline-inverse:hover, .btn-outline-inverse:focus, .btn-outline-inverse:active {
        color: #563d7c;
        text-shadow: none;
        background-color: #ffffff;
        border-color: #ffffff;
    }

</style>
<div class="container" style="margin-top: 100px;margin-bottom: 100px;">
    <div class="row">
        <div class="col-md-3 form-group search">
            <br>
            <div class="input_control">
                <h4><strong>出发地</strong></h4><input type="text" class="form-control" placeholder="请填写汉字">
            </div>

            <div class="input_control">
                <h4><strong>目的地</strong></h4><input type="text" class="form-control" placeholder="请填写汉字">
            </div>

            <div class="input_control">
                <h4><strong>日期</strong></h4><input id='mydatepicker' class="form-control" placeholder="点击以选择日期" type="text"/>
            </div>

            <div class="input_control">
                <button class="btn btn-outline-inverse btn-search" style="position: relative;left: 35%">查询</button>
            </div>
            <br>
        </div>

        <div class="col-xs-7 col-xs-offset-1 result">
            <table class="table table-bordered table-striped">
                <caption>车次信息</caption>
                <thead>
                <tr>
                    <th>车次</th>
                    <th>出发站</th>
                    <th>到达站</th>
                    <th>发车时间</th>
                    <th>到达时间</th>
                    <th>历时</th>
                    <th>票价</th>
                    <th>票量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>k12</td>
                    <td>长沙</td>
                    <td>武汉</td>
                    <td>10:16</td>
                    <td>12:18</td>
                    <td>2小时02分</td>
                    <td>20元</td>
                    <td>充足</td>
                    <td>
                        <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>G2633</td>
                    <td>长沙</td>
                    <td>武汉</td>
                    <td>2:23</td>
                    <td>3:06</td>
                    <td>43分</td>
                    <td>65元</td>
                    <td>15张</td>
                    <td>
                        <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>G2506</td>
                    <td>长沙</td>
                    <td>武汉</td>
                    <td>15:37</td>
                    <td>16:14</td>
                    <td>37分</td>
                    <td>65元</td>
                    <td>20张</td>
                    <td>
                        <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>G2506</td>
                    <td>长沙</td>
                    <td>武汉</td>
                    <td>15:37</td>
                    <td>16:14</td>
                    <td>37分</td>
                    <td>65元</td>
                    <td>20张</td>
                    <td>
                        <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>G2506</td>
                    <td>长沙</td>
                    <td>武汉</td>
                    <td>15:37</td>
                    <td>16:14</td>
                    <td>37分</td>
                    <td>65元</td>
                    <td>20张</td>
                    <td>
                        <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                    </td>
                </tr>
                </tbody>
            </table>
            <!--选择页数-->
            <div class="card-footer p-0">
                <nav aria-label="5">
                    <ul class="pagination justify-content-end mt-3 mr-3 pull-right">
                        <li class="page-item disabled">
                            <span class="page-link">&laquo;Previous</span>
                        </li>

                        <li class="page-item active">
                            <span class="page-link">1<span class="sr-only">(current)</span></span>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next&raquo;</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker({
        format: 'yyyy-mm-dd'
    });
</script>

<jsp:include page="common/IncludeBottom.jsp"/>
