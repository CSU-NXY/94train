<%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/14
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="common/IncludeTop.jsp"/>

<style type="text/css">
    *{margin:0;padding:0;}
    .dev,.con{float: left; margin-top: 20px;}
    .personalInfo{background: #563d7c; padding-left: 15px;font-size: 16px;font-weight: bold;line-height: 40px;color:#cdbcf3 }
    .dev ul li{font-size: 14px;padding-left: 35px;line-height: 40px;display: block;border-bottom: 1px solid #e2e2e2;cursor: pointer;}
    .dev ul li:hover{background-color: #f7f7f7 ;}
    .on{background-image: url(xx.png); background-repeat: no-repeat; background-position: 15px 13px;font-weight: bold;}
    .nrbf{width:inherit;float: left; display: none; padding-left: 20px; color: #464646;letter-spacing:1px; font-size: 16px;line-height: 1.5; padding-top: 5px;}
</style>

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
            <ul id="myInfo" >
                <li class="active"><a href="#base" data-toggle="tab">基本信息</a></li>
                <li><a href="#change" data-toggle="tab">修改信息</a></li>
                <li><a href="#order" data-toggle="tab">我的订单</a></li>
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
                                        <td>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                        <td><input type="password" name="NewPassword" id="NewPassword" placeholder="请填写新密码"/></td>
                                    </tr>
                                    <tr>
                                        <td>原&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
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

                    <div id="query" style="margin-top: 10px;">
                        <span><label>订单号<input type="text" id="orderID"/></label></span>
                        <span><label>日期</label></span>
                        <span>
                                <input type="text" id="StartDate" placeholder="yyyy-mm-dd" value="2017-09-14" readonly="readonly"/>
                                -<input type="text" id="EndDate" placeholder="yyyy-mm-dd" value="2017-09-14" readonly="readonly"/>
                            <!--这里需要点击输入框显示一个日历的div，用于选择时间-->
                            </span>
                        <span>
                            <input type="text" id="sequeue_train_nameText" value="" placeholder="订单/车次/乘车人姓名"/>
                            <span id="clear_input_txt" title="清除"></span><!--这里可以添加一个删除的小图标-->
                            </span>
                        <input type="button" id="querybt" value="查询"/>
                    </div>

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
                                <tr>
                                    <td>1</td>
                                    <td>324124214</td>
                                    <td>k243</td>
                                    <td>张三</td>
                                    <td>20</td>
                                    <td>2017-9-10</td>
                                    <td>2017-9-12 10：24</td>
                                    <td>2017-9-12 10；59</td>
                                    <td>长沙</td>
                                    <td>娄底</td>
                                    <td>已完成</td>
                                    <td>
                                        <button type="button" class="btn btn-dange btn-xs">删除</button>
                                        <button type="button" disabled="disabled" class="btn btn-warning btn-xs">退订</button>
                                        <button type="button" disabled="disabled" class="btn btn-success btn-xs">付款</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>324124214</td>
                                    <td>k243</td>
                                    <td>张三</td>
                                    <td>20</td>
                                    <td>2017-9-20</td>
                                    <td>2017-9-23 10：24</td>
                                    <td>2017-9-23 10；59</td>
                                    <td>长沙</td>
                                    <td>娄底</td>
                                    <td>未付款</td>
                                    <td>
                                        <button type="button" disabled="disabled" class="btn btn-dange btn-xs">删除</button>
                                        <button type="button" disabled="disabled" class="btn btn-warning btn-xs">退订</button>
                                        <button type="button" class="btn btn-success btn-xs">付款</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>324124214</td>
                                    <td>k243</td>
                                    <td>张三</td>
                                    <td>20</td>
                                    <td>2017-9-20</td>
                                    <td>2017-9-22 10：24</td>
                                    <td>2017-9-22 10；59</td>
                                    <td>长沙</td>
                                    <td>娄底</td>
                                    <td>未出行</td>
                                    <td>
                                        <button type="button" disabled="disabled" class="btn btn-dange btn-xs">删除</button>
                                        <button type="button" class="btn btn-warning btn-xs">退订</button>
                                        <button type="button" disabled="disabled" class="btn btn-success btn-xs">付款</button>
                                    </td>
                                </tr>
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
                                <tr>
                                    <td>1</td>
                                    <td>324124214</td>
                                    <td>k243</td>
                                    <td>张三</td>
                                    <td>20</td>
                                    <td>2017-9-20</td>
                                    <td>2017-9-22 10：24</td>
                                    <td>2017-9-22 10；59</td>
                                    <td>长沙</td>
                                    <td>娄底</td>
                                    <td>未出行</td>
                                    <td>
                                        <button type="button" disabled="disabled" class="btn btn-dange btn-xs">删除</button>
                                        <button type="button" class="btn btn-warning btn-xs">退订</button>
                                        <button type="button" disabled="disabled" class="btn btn-success btn-xs">付款</button>
                                    </td>
                                </tr>
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
                                <tr>
                                    <td>1</td>
                                    <td>324124214</td>
                                    <td>k243</td>
                                    <td>张三</td>
                                    <td>20</td>
                                    <td>2017-9-20</td>
                                    <td>2017-9-23 10：24</td>
                                    <td>2017-9-23 10；59</td>
                                    <td>长沙</td>
                                    <td>娄底</td>
                                    <td>未付款</td>
                                    <td>
                                        <button type="button" disabled="disabled" class="btn btn-dange btn-xs">删除</button>
                                        <button type="button" disabled="disabled" class="btn btn-warning btn-xs">退订</button>
                                        <button type="button" class="btn btn-success btn-xs">付款</button>
                                    </td>
                                </tr>
                            </table>
                        </div>

                </div>
                </div>
            </div>
        </div>
    </div>
</div>

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

<script>
    $(function () {
        $(function () {
            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                // Get the name of active tab
                var activeTab = $(e.target).text();
                // Get the name of previous tab
                var previousTab = $(e.relatedTarget).text();
                $(".active-tab span").html(activeTab);
                $(".previous-tab span").html(previousTab);
            });
        });
    });
</script>

<jsp:include page="common/IncludeBottom.jsp"/>

