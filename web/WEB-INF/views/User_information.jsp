<%@ page import="java.util.List" %>
<%@ page import="com.nxy.model.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/14
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="common/IncludeTop.jsp"/>

<div class="container" style="width: 80%">
    <div class="row">
        <%
            String msg = (String) request.getAttribute("Msg_S");
            if(msg!=null)
            {
        %>
        <div class="alert alert-success" role="alert">${Msg_S}</div>
        <%
            }
        %>
    </div>

    <div class="row">
        <%
            String msg2 = (String) request.getAttribute("Msg_F");
            if(msg2!=null)
            {
        %>
        <div class="alert alert-danger" role="alert">${Msg_F}</div>
        <%
            }
        %>
    </div>

    <div class="row">
        <div class="col-xs-1 dev">
            <p class="personalInfo">个人信息</p>
            <ul id="myInfo" class="nav nav-tabs">

                <li class="active">
                    <a href="#base" data-toggle="tab">基本信息</a>
                </li>
                <li>
                    <a href="#change" data-toggle="tab">修改信息</a>
                </li>
                <li>
                    <a href="#order" data-toggle="tab">我的订单</a>
                </li>
            </ul>
        </div>
        <div class="col-xs-11 con">
            <div id="myTabContent" class="tab-content">

                <div class="tab-pane fade in active" id="base">
                    <table class="table table-bordered table-striped table-hover">
                        <tr>
                            <th>用户编号</th>
                            <th>${UserID}</th>
                        </tr>
                        <tr>
                            <td>手机号</td>
                            <td>${PhoneNum}</td>
                        </tr>
                        <tr>
                            <td>真实姓名</td>
                            <td>${Name}</td>
                        </tr>
                        <tr>
                            <td>邮箱</td>
                            <td>${Email}</td>
                        </tr>
                    </table>
                </div>

                <div class="tab-pane fade" id="change">
                    <div class="container">
                        <div id="content">
                            <table class="table table-hover" id="Modifytable" align="center">
                                <th>编辑个人信息</th>
                                <tr>
                                    <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                                    <td><input type="text" id="Name" disabled="disabled" placeholder="请填写你的姓名" value="${Name}"/></td>
                                </tr>
                                <tr>
                                    <td>身&nbsp;&nbsp;份&nbsp;&nbsp;证：</td>
                                    <td><input type="text" id="ID" disabled="disabled" placeholder="请填写身份证号" value="${ID}"/></td>
                                </tr>
                                <tr>
                                    <td>手&nbsp;&nbsp;机&nbsp;&nbsp;号：</td>
                                    <td><input type="text" disabled="disabled" id="PhoneNum" placeholder="请填写手机号" value="${PhoneNum}"/></td>
                                </tr>
                                <form action="/user/ChangeEmail.do" method="post">
                                    <tr>
                                        <td>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</td>
                                        <td><input type="text" name="Email" id="Email" placeholder="请填写邮箱" value="${Email}"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="submit" class="btn btn-primary"/></td>
                                    </tr>
                                    <tr/>
                                    <tr/>
                                    <tr/>
                                </form>
                                <form action="/user/ChangePassword.do" method="post">
                                    <tr>
                                        <td>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                        <td><input type="password"  name="OldPassword" id="OldPassword" placeholder="请填写旧密码"/></td>
                                    </tr>
                                    <tr>
                                        <td>新&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                        <td><input type="password" name="NewPassword" id="NewPassword" placeholder="请填写新密码"/></td>
                                    </tr>
                                    <tr>
                                        <td>重&nbsp;&nbsp;&nbsp;&nbsp;复&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                        <td><input type="password" name="RepeatPassword" id="RepeatPassword" placeholder="请确认新密码"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="submit" class="btn btn-primary"/></td>
                                    </tr>
                                </form>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="order">

                    <ul id="myOrd" class="nav nav-tabs">
                        <li class="active"><a href="#all" data-toggle="tab">全部订单</a></li>
                        <li><a href="#noEnd" data-toggle="tab">未出行订单</a></li>
                        <li><a href="#noPay" data-toggle="tab">待付款订单</a></li>
                    </ul>

                    <%--<div id="query" style="margin-top: 10px;">--%>
                        <%--<span><label>订单号<input id="orderID"/></label></span>--%>
                        <%--<span><label>日期</label></span>--%>
                        <%--<span>--%>
                                <%--<input type="text" id="StartDate" placeholder="yyyy-mm-dd" value="2017-09-14" readonly="readonly"/>--%>
                                <%--<input type="text" id="EndDate" placeholder="yyyy-mm-dd" value="2017-09-14" readonly="readonly"/>--%>
                            <%--<!--这里需要点击输入框显示一个日历的div，用于选择时间-->--%>
                            <%--</span>--%>
                        <%--<span>--%>
                            <%--<input type="text" id="sequeue_train_nameText" value="" placeholder="订单/车次/乘车人姓名"/>--%>
                            <%--<span id="clear_input_txt" title="清除"></span><!--这里可以添加一个删除的小图标-->--%>
                            <%--</span>--%>
                        <%--<input type="button" id="querybt" value="查询"/>--%>
                    <%--</div>--%>

                    <div id="noticketlist" style="display: none;">
                        <div id="no-ticket">
                            <span></span>
                            <p>您没有对应的订单内容，您可以通过<br clear="none" />
                                <a href="#" id="book_ticket_id" shape="rect">车票预订</a>功能，来制定出行计划。</p>
                            <!--车票预订的超链接跳转到购票页面-->
                        </div>
                    </div>

                    <div id="myOrderContent" class="tab-content">
                        <div class="tab-pane fade in active" id="all">
                            <table class="table table-bordered table-striped table-hover" id="orderInfoALL">
                                <tr align="center">
                                    <td>序号</td>
                                    <td>订单号</td>
                                    <td>车次信息</td>
                                    <td>乘车人</td>
                                    <td>票款金额</td>
                                    <td>订单时间</td>
                                    <td>发车时间</td>
                                    <td>到站时间</td>
                                    <td>起点站</td>
                                    <td>终点站</td>
                                    <td>订单状态</td>
                                    <td>操作<td>
                                </tr>
                                <tbody id="ordershow" style="display: none">
                                <tr>
                                    <td class="_id"></td>
                                    <td class="_orderID"></td>

                                    <td class="_trainID"></td>
                                    <td class="_userID"></td>
                                    <td class="_Price"></td>

                                    <td class="_OrderDate"></td>
                                    <td class="_DepartureTime"></td>
                                    <td class="_ArrivalTime"></td>

                                    <td class="_StartStation"></td>
                                    <td class="_EndStation"></td>

                                    <td class="_Status"></td>

                                    <td class="_operation">
                                        <button type="button" onclick="acs(this)" class="btn btn-dange btn-xs" >删除</button>
                                        <button type="button" onclick="returnTicket(this)" class="btn btn-warning btn-xs" >退订</button>
                                        <button type="button" onclick="buyTicket(this)" class="btn btn-success btn-xs" >付款</button>
                                    </td>
                                </tr>
                                </tbody>
                                <tbody id="ordersall">

                                </tbody>

                            </table>
                        </div>

                        <div class="tab-pane fade" id="noEnd">
                            <table class="table table-bordered table-striped table-hover" id="orderInfoNoEnd">
                                <tr align="center">
                                    <td>序号</td>
                                    <td>订单号</td>
                                    <td>车次信息</td>
                                    <td>乘车人</td>
                                    <td>票款金额</td>
                                    <td>订单时间</td>
                                    <td>发车时间</td>
                                    <td>到站时间</td>
                                    <td>起点站</td>
                                    <td>终点站</td>
                                    <td>订单状态</td>
                                    <td>操作</td>
                                </tr>
                                <tbody id="ordersNoend">

                                </tbody>
                            </table>
                        </div>

                        <div class="tab-pane fade" id="noPay">
                            <table class="table table-bordered table-striped table-hover" id="orderInfoNoPay">
                                <tr align="center">
                                    <td>序号</td>
                                    <td>订单号</td>
                                    <td>车次信息</td>
                                    <td>乘车人</td>
                                    <td>票款金额</td>
                                    <td>订单时间</td>
                                    <td>发车时间</td>
                                    <td>到站时间</td>
                                    <td>起点站</td>
                                    <td>终点站</td>
                                    <td>车票状态</td>
                                    <td>操作</td>
                                </tr>
                                <tbody id="ordersNopay">

                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<jsp:include page="common/IncludeBottom.jsp"/>

<script>
    $(function() {
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            // Get the name of active tab
            var activeTab = $(e.target).text();
            // Get the name of previous tab
            var previousTab = $(e.relatedTarget).text();
            $(".active-tab span").html(activeTab);
            $(".previous-tab span").html(previousTab);
        });
    });
</script>

<script type="text/javascript">
    $(function(a){
        var b;
        a(".nrbf").eq(0).show(),
            b=location.href,
            b=b.substring(b.indexOf(".htm?")+5),
            1==b?(a(".dev ul li").eq(0).addClass("on").siblings().removeClass("on"),a(".nrbf").eq(0).show().siblings().hide())
                :2==b?(a(".dev ul li").eq(1).addClass("on").siblings().removeClass("on"),a(".nrbf").eq(1).show().siblings().hide())
                :3==b?(a(".dev ul li").eq(2).addClass("on").siblings().removeClass("on"),a(".nrbf").eq(2).show().siblings().hide())
                    :(a(".dev ul li").eq(0).addClass("on").siblings().removeClass("on"),
                        a(".nrbf").eq(0).show().siblings().hide()),
            a(".dev ul li").click(function(){
                var b=a(this).index();
                a(this).addClass("on").siblings().removeClass("on"),
                    a(".nrbf").eq(b).show().siblings().hide()
            })
    });
</script>

<script type="text/javascript">
    var order = $("#ordershow").children();
    var dataGrid = $("#ordersall");
    var noEnd = $("#ordersNoend");
    var noPay = $("#ordersNopay");
    $(function () {
        PostID();

    });
    function PostID() {
        $("#ordershow").hidden;
        $.ajax({
            type: "POST",
            url: "/user/viewOrder.do",
            data : ${sessionScope.S_UserID},
            success: function(data) {
                dataGrid.empty();
                noEnd.empty();
                noPay.empty();
                $.each(data, function (index, row) {
                    var tr = order.clone();
                    var tr2;
                    var tr3;
                    var count1 = 1;
                    var count2 = 1;
                    dataGrid.append(tr);
                    $.each(row, function (name, value) {

                            tr.find("._id").text(index+1);
                            tr.find("._" + name).text(value);
                            if(name=="status"){
                                if(value==1) {
                                    tr.find("._status").text("已完成");
                                    tr.children().last().children().eq(2).attr("disabled","disabled");

                                }
                                if(value==0){
                                    tr.find("._status").text("未出行");
                                    tr.children().last().children().eq(2).attr("disabled","disabled");
                                    tr2 = tr.clone();
                                    tr2.find("._id").text(count1);
                                    count1++;
                                }
                                if(value==-1){
                                    tr.find("._status").text("未支付");
                                    tr.children().last().children().eq(1).attr("disabled","disabled");
                                    tr3 = tr.clone();
                                    tr3.find("._id").text(count2);
                                    count2++;
                                }
                            }
                    })
                    if(tr2!=null){
                        noEnd.append(tr2);
                    }
                    if(tr3!=null){
                        noPay.append(tr3);
                    }
                });
            }
        },"json");

        return false;
    }

    function acs(obj) {
        var params = {}
        var $td = $(obj).parents('tr').children('td').eq(1).text();
        var $trainid = $(obj).parents('tr').children('td').eq(2).text();
        var $start = $(obj).parents('tr').children('td').eq(8).text();
        var $end = $(obj).parents('tr').children('td').eq(9).text();

        params.id = $td;
        params.trainid = $trainid;
        params.start = $start;
        params.end = $end;
        if(confirm("确定要删除此订单吗？")){
            window.event.returnValue = true;
        }else{
            window.event.returnValue = false;
        }

        if(window.event.returnValue == true){
            $.ajax({
                url:"/Order/deleteOrder.do",
                type:"post",
                data:params,
                dataType:"json",
                success:function (data) {

                },
                error:function () {

                    PostID();
                }
            })
        }
        return false;
    }

    function returnTicket(obj) {
        var params = {}
        var $td= $(obj).parents('tr').children('td').eq(1).text();

        params.id = $td;
        params.status = -1;

        if(confirm("确定要退款码？")){
            window.event.returnValue = true;
        }else{
            window.event.returnValue = false;
        }

        if(window.event.returnValue == true){
            $.ajax({
                url:"/Order/returnTicket.do",
                type:"post",
                data:params,
                dataType:"json",
                success:function (data) {

                },
                error:function () {

                    PostID();
                }
            })
        }
        return false;
    }

    function buyTicket(obj) {
        var params = {}
        var $td= $(obj).parents('tr').children('td').eq(1).text();

        params.id = $td;
        params.status = 0;

        if(confirm("确定要付款码？")){
            window.event.returnValue = true;
        }else{
            window.event.returnValue = false;
        }

        if(window.event.returnValue == true){
            $.ajax({
                url:"/Order/buyTicket.do",
                type:"post",
                data:params,
                dataType:"json",
                success:function (data) {

                },
                error:function () {

                    PostID();
                }
            })
        }
        return false;
    }
</script>

<script>
    $(document).ready(function() {
        if(location.hash) {
            $('a[href=' + location.hash + ']').tab('show');
        }
        $(document.body).on("click", "a[data-toggle]", function(event) {
            location.hash = this.getAttribute("href");
        });
    });
    $(window).on('popstate', function() {
        var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");
        $('a[href=' + anchor + ']').tab('show');
    });
</script>
