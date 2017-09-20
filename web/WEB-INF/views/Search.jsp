<%--
  Created by IntelliJ IDEA.
  User: nxy
  Date: 17-9-13
  Time: 下午5:09
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="common/IncludeTop.jsp"/>

<hr>

<!--车票搜索框-->
<div>
    <div class="container">
        <form class="form-inline" id="searchForm">
            <div class="form-group">
                <label for="departure">出发地：</label>
                <input class="form-control" id="departure" name="departure" value="${departure}">
            </div>
            <div class="form-group">
                <label for="destination">目的地：</label>
                <input class="form-control" id="destination" name="destination" value="${destination}">
            </div>
            <button class="btn btn-primary">搜索</button>
        </form>
    </div>
</div>

<div class="panel panel-primary" style="margin-top: 65px;">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 车次信息</h3>
    </div>
    <div class="panel-body">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>车次</th>
                <th>出发站</th>
                <th>到达站</th>
                <th>发车时间</th>
                <th>到达时间</th>
                <th>历时</th>
                <th>票价</th>
                <th>票量</th>
                <th style="width:15%;">操作</th>
            </tr>
            </thead>
            <tbody id="template" style="display:none;">
            <tr>
                <th class="_StrainID"></th>
                <td class="_StartStation"></td>
                <td class="_EndStation"></td>
                <td class="_DepartureTime"></td>
                <td class="_ArrivalTime"></td>
                <td class="_CountLeft"></td>
                <td class="_price"></td>
                <td>
                    <button type="button" class="btn btn-primary btn-sm">购买</button>
                </td>
            </tr>
            </tbody>
            <tbody id="dataGrid"></tbody>
        </table>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">
$(function () {
    var searchForm = $("#searchForm");
    var dataGrid = $("#dataGrid");
    var template = $("#template").children;
    searchForm.submit(function () {
        $.get(
            "/search/searchTrains.do",
            searchForm.serializeArray(),
            function (data) {
                alert(data);
                dataGrid.empty();
                $.each(data, function (index, row) {
                    var tr = template.clone();
                    dataGrid.append(tr);
                    $.each(row, function (name, value) {
                        tr.find("._" + name).text(value);
                    })
                });
            }, "json");
        return false;
    }).submit();
});
</script>