<!--
作者：chenrong
时间：2017-09-14
描述：预订界面
-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>预订车票</title>
</head>
<body>
<div id="Info" align="center">
    <table border="0">
        <tr align="center" bgcolor="darkseagreen">
            <td colspan="5">车次信息</td>
        </tr>
        <tr align="center">
            <td>G1234<!--直接获取列车号显示--></td>
            <td>长沙南<!--直接获取出发地显示--></td>
            <td>开往</td>
            <td>湘潭北<!--直接获取目的地显示--></td>
            <td>&nbsp;</td>
        </tr>
        <tr align="center">
            <td>2017年9月14日<!--直接获取出发日期--></td>
            <td>15:24<!--获取出发时间--></td>
            <td>1小时0分钟<!--获取途经时间--></td>
            <td>16:24<!--获取到达时间--></td>
            <td>¥20.0<!--获取票价-->元</td>
        </tr>
        <tr align="center" bgcolor="darkseagreen">
            <td colspan="5">乘客信息</td>
        </tr>
        <tr>
            <td>选择车票类型</td>
            <td colspan="4">
                <label><input type="checkbox" name="type">学生票</label>
                <label><input type="checkbox" name="type">成人票</label>
                <label><input type="checkbox" name="type">军人票</label>
                <label><input type="checkbox" name="type">残疾票</label>
            </td>
        </tr>
        <tr>
            <td>乘&nbsp;&nbsp;车&nbsp;&nbsp;人</td>
            <td colspan="5"><label id="passenger"><input type="checkbox" name="User">张三<!--此处需要获取用户名--></label></td>
        </tr>
        <tr>
            <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
            <td colspan="2"><input type="text" id="pName" placeholder="请输入乘车人姓名"/></td>
        </tr>
        <tr>
            <td>身份证号：</td>
            <td colspan="2"><input type="text" id="IDnum" placeholder="请输入身份证号"/></td>
        </tr>
        <tr>
            <td><input type="button" id="add" value="添加乘客"/></td>
        </tr>
        <tr align="center" bgcolor="darkseagreen">
            <td colspan="5">同意条款</td>
        </tr>
        <tr>
            <td colspan="5"><input type="checkbox" name="Agree">我已阅读并同意<a href>用户购票须知</a></td>
        </tr>
        <tr>
            <td><a href>返回上一页</a></td>
            <td><input type="button" id="submitbt" value="去支付"/></td>
        </tr>
    </table>
</div>
</body>
</html>