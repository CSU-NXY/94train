<!--
作者：chenrong
时间：2017-09-14
描述：预订界面
-->

<jsp:include page="common/IncludeTop.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">

</style>

<div class="container">
    <div id="buyTicket" style="padding-top: 20px">
        <form action="" method="get">
            <div id="step1">
                <div class="container">
                    <table class="table table-bordered table-striped text-center">
                        <tr align="center" bgcolor="#563d7c">
                            <td colspan="5" style="background-color:#563d7c;color: #ffffff">车次信息</td>
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
                            <td colspan="5"><label><input type="checkbox" name="Agree"></label>我已阅读并同意<a href>用户购票须知</a></td>
                        </tr>

                        <tr>
                            <td><a href="/index/viewIndex.do" class="btn btn-warning">返回上一页</a></td>
                            <td><a href="/user/viewOrderPay.do"class="btn btn-success" onclick="fun(this)" value="step1">确认订单</a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="step2" style="display: none">
                <div class="container" id="order">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th colspan="3" bgcolor="#563d7c">
                                <h4 align="center" style="color: #ffffff;">请确认您的订单信息！</h4>
                            </th>
                        </tr>
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
                        <tr align="center" bgcolor="#563d7c">
                            <td colspan="3" style="color: #ffffff;">请选择支付方式</td>
                        </tr>
                        <tr align="center">
                            <td><label><input type="radio" name="pay">支付宝</label></td>
                            <td><label><input type="radio" name="pay">银联卡</label></td>
                            <td><label><input type="radio" name="pay">蚂蚁花呗</label></td>
                        </tr>
                        <tr align="right">
                            <td colspan="3"><a href="/index/viewIndex.do" class="btn btn-primary" onclick="fun(this)" value="step2">我已确认订单，去支付</a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="step3" style="display: none">
                <div class="col-md-offset-2 small">
                    <div class="information">
                        <h1>恭喜你购票成功！祝你旅途愉快，欢迎再次使用本网站购票</h1>
                    </div>

                    <div class="col-md-offset-3 information">
                        <h2>10秒后界面自动跳转</h2>
                    </div>

                    <div class="space">
                    </div>

                    <div class="col-md-offset-4 information">
                        <a href="/index/viewIndex.do"><input type="button" class="btn btn-primary btn-lg" value="确认"/></a>
                    </div>
                </div>
            </div>
        </form>
    </div>

        <%--javascript 的学习,理解该段代码的意思--%>
    <script type="text/javascript">
         function fun(obj) {

             var step1 = document.getElementById("step1");
             var step2 = document.getElementById("step2");

             if(obj.value == "step1"){
                 alert("aaaaaaaa");
                 step1.style.display = "none";
                 step2.style.display = "block"
             }else if(obj.value == "step2"){
                 step2.style.display = "none";
                 step3.style.display = "block";
             }
         }
    </script>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>