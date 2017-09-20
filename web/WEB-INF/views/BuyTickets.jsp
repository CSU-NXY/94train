<!--
作者：chenrong
时间：2017-09-14
描述：预订界面
-->

<jsp:include page="common/IncludeTop.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div class="row">
        <div class="col-xs-2"></div>
        <div class="col-xs-8">
            <table class="table table-bordered table-striped text-center">
                <tr align="center" bgcolor="#563d7c">
                    <td colspan="5" style="color: #ffffff">车次信息</td>
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

                <tr>
                    <td>选择车票类型</td>
                    <td colspan="4">
                        <label style="padding:0px 10px 0px 10px;"><input type="radio" name="type">学生票</label>
                        <label style="padding:0px 10px 0px 10px;"><input type="radio" name="type">成人票</label>
                        <label style="padding:0px 10px 0px 10px;"><input type="radio" name="type">军人票</label>
                        <label style="padding:0px 10px 0px 10px;"><input type="radio" name="type">残疾票</label>
                    </td>
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

                <tr align="center" bgcolor="#563d7c">
                    <td colspan="5" style="color: #ffffff">同意条款</td>
                </tr>

                <tr>
                    <td colspan="5"><input type="checkbox" name="Agree">我已阅读并同意<a href>用户购票须知</a></td>
                </tr>

                <tr>
                    <td><a href>返回上一页</a></td>
                    <td><a href="/user/viewOrderPay.do" class="btn btn-primary">确认订单</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>


<jsp:include page="common/IncludeBottom.jsp"/>
