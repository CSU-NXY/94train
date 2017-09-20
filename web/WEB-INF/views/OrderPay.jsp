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
    <table class="table table-bordered table-striped">
        <th colspan="3" bgcolor="#563d7c"><h4 align="center" style="color: #ffffff;">请确认您的订单信息！</h4></th>
            <tr>
                <td>订&nbsp;&nbsp;单&nbsp;&nbsp;号：</td>
                <td><!--这里用于从数据库获取订单编号--></td>
            </tr>
            <tr>
                <td>出发日期：</td>
                <td colspan="2"><!--这里用于从数据库获取列车出发日期（XX年XX月XX日）--></td>
            </tr>
            <tr>
                <td>乘&nbsp;&nbsp;车&nbsp;&nbsp;人：</td>
                <td><!--用于获取姓名-->乘车人姓名</td>
            </tr>
            <tr>
                <td>身份证号：</td>
                <td><!--用于获取乘车人身份证号-->123456789098765432</td>
            </tr>
            <tr align="center" bgcolor="aliceblue">
                <td colspan="3">车票信息</td>
            </tr>
            <tr align="center">
                <td><!--这里用于获取出发站名称-->长沙南</td>
                <td><!--这里用于获取列车号-->G1234</td>
                <td><!--这里用于获取目的地名称-->怀化南</td>
                <!--表格中只显示获取到的信息，后面的字需要删掉-->
            </tr>
            <tr align="center">
                <td><!--这里用于获取出发时间-->出发时间</td>
                <td>开往</td>
                <td><!--这里用于获取座位（直接显示座位号）-->座位号</td>
                <!--表格中只显示获取到的信息，后面的字需要删掉-->
            </tr>
            <tr>
                <td>票&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</td>
                <td>¥20.0<!--用于获取票价作为数字部分的显示-->元</td>
                <td>学生票<!--用于获取票的类别作为文字部分的显示--></td>
            </tr>
            <tr align="center" bgcolor="beige">
                <td colspan="3">请选择支付方式</td>
            </tr>
            <tr align="center">
                <td><label><input type="radio" name="pay">支付宝</label></td>
                <td><label><input type="radio" name="pay">银联卡</label></td>
                <td><label><input type="radio" name="pay">蚂蚁花呗</label></td>
            </tr>
            <tr align="right">
                <td colspan="3"><a href="/index/viewIndex.do" class="btn btn-primary">我已确认订单，去支付</a></td>
            </tr>
        </table>
</div>


<jsp:include page="common/IncludeBottom.jsp"/>