<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-14
  Time: 下午4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../WEB-INF/views/common/IncludeTop.jsp"/>

    <!--标签部分开始-->
    <div id="orderTab" class="row">
        <ul class="nav navbar-nav">
            <li><a href>全部订单</a></li>
            <li><a href>未出行订单</a></li>
            <li><a href>待付款订单</a></li>
        </ul>
    </div>
    <!--需要用bootstrap修改为横向排版-->
    <!--标签部分结束-->

    <!--查询部分开始-->
    <div id="query" class="row">
        <span>
            <label>订单号<input type="text" id="orderID"/></label>
        </span>

        <span>
            <label>日期</label>
        </span>

        <span>
            <input id="StartDate" type="text"/>
            <input id="EndDate" type="text" />
            <!--这里需要点击输入框显示一个日历的div，用于选择时间-->
        </span>

        <span>
            <input type="text" id="sequeue_train_nameText" value="" placeholder="订单/车次/乘车人姓名"/>
            <span id="clear_input_txt" title="清除"></span><!--这里可以添加一个删除的小图标-->
        </span>

        <input type="button" id="querybt" value="查询"/>
    </div>
    <!--查询部分结束-->

    <!-- 未查询出数据开始   -->
    <div id="noticketlist" style="display: none;">
        <div id="no-ticket">
            <span></span>
            <p>您没有对应的订单内容，您可以通过<br clear="none" />
                <a href="#nogo" id="book_ticket_id" shape="rect">车票预订</a>功能，来制定出行计划。</p>
            <!--车票预订的超链接跳转到购票页面-->
        </div>
    </div>
    <!-- 未查询出数据结束   -->

    <!--查询出数据开始-->
    <div id="order" style="display: none;">
        <table id="orderInfo">
            <tr align="center">
                <td>序号</td>
                <td>订单号</td>
                <td>车次信息</td>
                <td>座位信息</td>
                <td>乘车人</td>
                <td>票款金额</td>
                <td>车票状态</td>
            </tr>
        </table>
    </div>
    <!--查询出数据结束-->

<script type="text/javascript">
    $('#StartDate').dcalendarpicker({
        format:'yyyy-mm-dd'
    });

    $('#EndDate').dcalendarpicker({
        format:'yyyy-mm-dd'
    });
</script>

</div>
<jsp:include page="../../WEB-INF/views/common/IncludeBottom.jsp"/>