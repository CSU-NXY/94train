<!--
作者：chenrong
时间：2017-09-14
描述：订单确认支付页面
-->
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="common/IncludeTop.jsp"/>


<hr>

<div class="container" id="order">
    <table class="table table-bordered table-striped" style="margin-top: 5%; width: 81%;" align="center">
        <th colspan="3" style="text-align: center;background-color: #669999;color: #ffffff;">
           请确认您的订单信息！
        </th>
        <tr>
            <td align="center" style="width: 27%">订&nbsp;&nbsp;单&nbsp;&nbsp;号：</td>
            <td colspan="2" align="left">123<!--这里用于从数据库获取订单编号--></td>
        </tr>
        <tr>
            <td align="center">订单日期：</td>
            <td colspan="2" align="left"><%=new java.util.Date().toString()%></td>
        </tr>
        <tr>
            <td align="center">乘&nbsp;&nbsp;车&nbsp;&nbsp;人：</td>
            <td colspan="2" align="left"><!--用于获取姓名-->${sessionScope.get("S_Name")}</td>
        </tr>
        <tr>
            <td align="center">身份证号：</td>
            <td colspan="2" align="left"><!--用于获取乘车人身份证号-->${sessionScope.get("S_ID")}</td>
        </tr>
        <tr align="center" bgcolor="#669999">
            <td colspan="3" style="color: #ffffff;">车票信息</td>
        </tr>
        <tr align="center">
            <td><!--这里用于获取出发站名称-->${sessionScope.get("startStation")}</td>
            <td style="width: 27%"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span></td>
            <td style="width: 27%"><!--这里用于获取目的地名称-->${sessionScope.get("endStation")}</td>
            <!--表格中只显示获取到的信息，后面的字需要删掉-->
        </tr>
        <tr align="center">
            <td><!--这里用于获取出发时间-->${sessionScope.get("departureTime")}</td>
            <td>${sessionScope.get("strainID")}</td>
            <td>${sessionScope.get("arrivalTime")}</td>
            <!--表格中只显示获取到的信息，后面的字需要删掉-->
        </tr>
        <tr align="center">
            <td>票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</td>
            <td>${price}<!--用于获取票价作为数字部分的显示-->元</td>
            <td>${sessionScope.get("checkVal")}<!--用于获取票的类别作为文字部分的显示--></td>
        </tr>
        <tr align="center" bgcolor="#669999">
            <td colspan="3" style="color: #ffffff;">请选择支付方式</td>
        </tr>
        <tr align="center">
            <td><label><input type="radio" name="pay">支付宝</label></td>
            <td><label><input type="radio" name="pay">银联卡</label></td>
            <td><label><input type="radio" name="pay">蚂蚁花呗</label></td>
        </tr>
        <tr align="center">
            <td>
                <%--<a href="${pageContext.request.contextPath}/user/viewBuyTickets.do" class="btn btn-warning">取消</a>--%>
                <a id="noPay" href="${pageContext.request.contextPath}/Order/noPay.do" class="btn btn-default">暂不付款并加入我的订单</a>
            </td>
            <td>
                <%--<a href="/Order/noPay.do" class="btn btn-default">暂不付款并加入我的订单</a>--%>
            </td>
            <td>
                <a id="pay" href="${pageContext.request.contextPath}/Order/pay.do" class="btn btn-primary">付款</a>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    这里是个二维码,用于收钱.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a href="${pageContext.request.contextPath}/index/viewIndex.do" type="button" class="btn btn-primary">我已付款</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">
    $(function () {
        $("#noPay").click(function () {
            alert("加入订单成功，请及时付款！");
            return true;
        });
        $("#pay").click(function () {
            alert("付款成功！");
            return true;
        });
    });
</script>
