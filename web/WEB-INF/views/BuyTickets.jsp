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
                    <td colspan="5" style="color: #ffffff"><label>车次信息</label></td>
                </tr>

                <tr align="center">
                    <td><label>${sessionScope.get("strainID")}<!--直接获取列车号显示--></label></td>
                    <td><label>${sessionScope.get("startStation")}<!--直接获取出发地显示--></label></td>
                    <td><label>开往</label></td>
                    <td><label>${sessionScope.get("endStation")}<!--直接获取目的地显示--></label></td>
                    <td><label>&nbsp;</label></td>
                </tr>

                <tr align="center">
                    <td><label>2017年9月14日<!--直接获取出发日期--></label></td>
                    <td><label>${sessionScope.get("departureTime")}<!--获取出发时间--></label></td>
                    <td><label>${sessionScope.get("timeSpent")}<!--获取途经时间--></label></td>
                    <td><label>${sessionScope.get("arrivalTime")}<!--获取到达时间--></label></td>
                    <td><label>${sessionScope.get("price")}<!--获取票价-->元</label></td>
                </tr>
                <tr>
                    <td><label>选择车票类型</label></td>
                    <td colspan="4">
                        <label>
                        <label style="padding:0 10px 0 10px;"><input type="radio" name="type" value="学生票">学生票</label>
                        <label style="padding:0 10px 0 10px;"><input type="radio" name="type" value="成人票">成人票</label>
                        <label style="padding:0 10px 0 10px;"><input type="radio" name="type" value="军人票">军人票</label>
                        <label style="padding:0 10px 0 10px;"><input type="radio" name="type" value="残疾票">残疾票</label>
                        </label>
                    </td>
                </tr>

                <tr>
                    <td><label for="pName">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label></td>
                    <td colspan="4" align="left"><label id="pName">${sessionScope.get("S_Username")}</label></td>
                </tr>

                <tr>
                    <td><label for="IDnum">身份证号：</label></td>
                    <td colspan="4" align="left"><label id="IDnum">${sessionScope.get("S_ID")}</label></td>
                </tr>

                <tr align="center" style="background-color: #669999">
                    <td colspan="5" style="color: #ffffff"><label>同意条款</label></td>
                </tr>

                <tr>
                    <td colspan="5" align="left"><label><input type="checkbox" id="Agree">我已阅读并同意<a href="${pageContext.request.contextPath}/protocol/viewProtocol.do" target="_blank">《用户购票须知》</a></label></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/index/viewIndex.do" class="btn btn-warning">返回上一页</a></td>
                    <td colspan="3"></td>
                    <td><button id="confirm_btn" class="btn btn-success">确认订单</button></td>
                </tr>
            </table>
        </div>
    </div>
</div>


<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">
    $(function () {
        $("#confirm_btn").click(function () {
           // 检查表单
           var radio = document.getElementsByName("type");
           var isCheckRadio = false;
           var checkVal;
           for (var i = 0; i < radio.length; i++) {
               if (radio[i].checked) {
                   isCheckRadio = true;
                   checkVal = radio[i].value;
                   break;
               }
           }
           if(isCheckRadio === false) {
               alert("请选择车票类型");
               return false;
           }

           var pName = document.getElementById("pName").innerHTML;
           var IDnum = document.getElementById("IDnum").innerHTML;
           if (pName === null || "" === pName) {
               alert("请输入乘车人姓名");
               return false;
           }
           if (IDnum === null || "" === IDnum) {
               alert("请输入乘车人姓名");
               return false;
           }
           var Agree = document.getElementById("Agree");
           if (Agree.checked === false) {
               alert("您没有同意用户协议");
               return false;
           }

           var params = {"checkVal":checkVal};
            var form = document.createElement("form");
            form.setAttribute("method", "get");
            form.setAttribute("action", "/Order/confirmOrder.do");

            for(var key in params) {
                if(params.hasOwnProperty(key)) {
                    var hiddenField = document.createElement("input");
                    hiddenField.setAttribute("type", "hidden");
                    hiddenField.setAttribute("name", key);
                    hiddenField.setAttribute("value", params[key]);

                    form.appendChild(hiddenField);
                }
            }

            document.body.appendChild(form);
            form.submit();
        });
    });
</script>