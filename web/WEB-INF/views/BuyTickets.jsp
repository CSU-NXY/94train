<!--
作者：chenrong
时间：2017-09-14
描述：预订界面
-->

<jsp:include page="common/IncludeTop.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .table{
        border:1px solid #dddddd;
        width:100%;
        margin-bottom: 20px;
        background-color: #f3f3f3;
    }
</style>

<div class="container">
    <div class="row">
        <div class="col-xs-2"></div>
        <div class="col-xs-8" style="margin-top: 5%;width: 80%; margin-left: 10%">
            <table class="table table-bordered table-striped text-center" align="center">
                <tr align="center" style="background-color: #669999">
                    <td colspan="5" style="color: #ffffff">车次信息</td>
                </tr>

                <tr align="center">
                    <td>${strainID}<!--直接获取列车号显示--></td>
                    <td>${startStation}<!--直接获取出发地显示--></td>
                    <td>开往</td>
                    <td>${endStation}<!--直接获取目的地显示--></td>
                    <td>&nbsp;</td>
                </tr>

                <tr align="center">
                    <td>2017年9月14日<!--直接获取出发日期--></td>
                    <td>${departureTime}<!--获取出发时间--></td>
                    <td>${timeSpent}<!--获取途经时间--></td>
                    <td>${arrivalTime}<!--获取到达时间--></td>
                    <td>${price}<!--获取票价-->元</td>
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
                    <td colspan="4" align="left"><input type="text" id="pName" placeholder="请输入乘车人姓名"/></td>
                </tr>

                <tr>
                    <td>身份证号：</td>
                    <td colspan="4" align="left"><input type="text" id="IDnum" placeholder="请输入身份证号"/></td>
                </tr>

                <tr align="center" style="background-color: #669999">
                    <td colspan="5" style="color: #ffffff">同意条款</td>
                </tr>

                <tr>
                    <td colspan="5" align="left"><input type="checkbox" name="Agree">我已阅读并同意<a href>《用户购票须知》</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/user/viewIndex.do" class="btn btn-warning">返回上一页</a></td>
                    <td colspan="3"></td>
                    <td><a href="${pageContext.request.contextPath}/user/viewOrderPay.do" class="btn btn-success">确认订单</a></td>
                </tr>
            </table>
        </div>
    </div>
</div>


<jsp:include page="common/IncludeBottom.jsp"/>
