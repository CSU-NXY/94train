<!--
作者：chenrong
时间：2017-09-14
描述：订单确认支付页面
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="common/IncludeTop.jsp"/>


<hr>

<%--<html>--%>
<%--<head>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>确认订单/支付</title>--%>
<%--</head>--%>
<%--<body>--%>
<div class="container" id="order">
    <table class="table table-bordered table-striped" style="margin-top: 5%; width: 81%;" align="center">
        <th colspan="3" style="text-align: center;background-color: #669999;color: #ffffff;">
           请确认您的订单信息！
        </th>
        <tr>
            <td align="center" style="width: 27%">订&nbsp;&nbsp;单&nbsp;&nbsp;号：</td>
            <td colspan="2" align="left"><!--这里用于从数据库获取订单编号--></td>
        </tr>
        <tr>
            <td align="center">出发日期：</td>
            <td colspan="2" align="left"><!--这里用于从数据库获取列车出发日期（XX年XX月XX日）--></td>
        </tr>
        <tr>
            <td align="center">乘&nbsp;&nbsp;车&nbsp;&nbsp;人：</td>
            <td colspan="2" align="left"><!--用于获取姓名-->乘车人姓名</td>
        </tr>
        <tr>
            <td align="center">身份证号：</td>
            <td colspan="2" align="left"><!--用于获取乘车人身份证号-->123456789098765432</td>
        </tr>
        <tr align="center" bgcolor="#669999">
            <td colspan="3" style="color: #ffffff;">车票信息</td>
        </tr>
        <tr align="center">
            <td><!--这里用于获取出发站名称-->长沙南</td>
            <td style="width: 27%"><!--这里用于获取列车号-->G1234</td>
            <td style="width: 27%"><!--这里用于获取目的地名称-->怀化南</td>
            <!--表格中只显示获取到的信息，后面的字需要删掉-->
        </tr>
        <tr align="center">
            <td><!--这里用于获取出发时间-->出发时间</td>
            <td>开往</td>
            <td><!--这里用于获取座位（直接显示座位号）-->座位号</td>
            <!--表格中只显示获取到的信息，后面的字需要删掉-->
        </tr>
        <tr align="center">
            <td>票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</td>
            <td>¥20.0<!--用于获取票价作为数字部分的显示-->元</td>
            <td>学生票<!--用于获取票的类别作为文字部分的显示--></td>
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
                <a href="/user/viewBuyTickets.do" class="btn btn-warning">返回上一步</a>
            </td>
            <td>
                <a href="/index/viewIndex.do" class="btn btn-default">暂不付款并加入我的订单</a>
            </td>
            <td>
                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">付款</button>
            </td>
        </tr>
    </table>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!--<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"></h4>
                </div>-->
                <div class="modal-body">
                    这里是个二维码,用于收钱.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a href="/index/viewIndex.do" type="button" class="btn btn-primary">我已付款</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>
