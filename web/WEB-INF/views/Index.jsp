<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:include page="common/IncludeTop.jsp"/>

<!--背景开始-->
<div class="carousel slide" style="width: 100%;" id="myCarousel" data-ride="carousel" data-pause="false">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators" style="z-index: 4">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner" style="z-index: -1;width: 100%;height:inherit">
        <div class="item active">
            <img src="../../static/images/bg1.jpg" alt="First slide" style="height: 100%;width: 100%">
        </div>
        <div class="item">
            <img src="../../static/images/bg2.jpg" alt="Second slide" style="height: 100%;width: 100%">
        </div>
        <div class="item">
            <img src="../../static/images/bg3.jpg" alt="Third slide" style="height: 100%;width: 100%">
        </div>
        <div class="item">
            <img src="../../static/images/bg4.jpg" alt="Forth slide" style="height: 100%;width: 100%">
        </div>
        <div class="item">
            <img src="../../static/images/bg5.jpg" alt="Fifth slide" style="height: 100%;width: 100%">
        </div>
    </div>

    <div class="row" style="position: absolute;z-index:3;top: 0; left: 15%; width: 70%; height: 100%;" >
        <!--搜索框-->
        <div class="col-xs-3 alpha60" style="border-radius: 10%; margin-top: 65px" >
            <br>
            <div style="padding-left: 20%">
                <form id="searchForm">
                <div class="form-group">
                    <h4><strong>出发地</strong></h4>
                    <label><input class="form-control" placeholder="请填写汉字" name="departure" id="departure"></label>
                </div>

                <div class="form-group">
                    <h4><strong>目的地</strong></h4>
                    <label><input class="form-control" placeholder="请填写汉字" name="destination" id="destination"></label>
                </div>

                <div class="form-group">
                    <h4><strong>日期</strong></h4>
                    <label><input id="mydatepicker" class="form-control" placeholder="点击以选择日期"/></label>
                </div>

                <div class="form-group">
                    <button class="btn btn-outline-inverse btn-search" style="position: relative;left: 20%" ><i class="glyphicon glyphicon-search"></i>查询
                    </button>
                </div>
            </form>
            </div>
            <br>
        </div>

        <!--车票框-->
        <div class="col-xs-8 col-xs-offset-1 alpha60" style="border-radius: 2%;margin-top:65px;">
            <div class="panel panel-primary" style="margin-top: 20px; opacity: 0.78">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 车次信息</h3>
                </div>
                <div class="panel-body">
                    <table id="trainTable" class="table table-bordered alpha60">
                        <thead>
                        <tr>
                            <th>车次</th>
                            <th>出发站</th>
                            <th>到达站</th>
                            <th>发车时间</th>
                            <th>到达时间</th>
                            <th>历时</th>
                            <th>票量</th>
                            <th>票价</th>
                            <th style="width:15%;">操作</th>
                        </tr>
                        </thead>
                        <tbody id="dataGrid"></tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>

    <!--车票模板，不显示-->
    <table style="display: none;">
        <tbody id="template" style="display: none;">
        <tr>
            <th class="_StrainID"></th>
            <td class="_StartStation"></td>
            <td class="_EndStation"></td>
            <td class="_DepartureTime"></td>
            <td class="_ArrivalTime"></td>
            <td class="_TimeSpent"></td>
            <td class="_CountLeft"></td>
            <td class="_price"></td>
            <td>
                <button type="button" class="btn btn-primary btn-sm get-train">购买</button>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- 图片左右方来回滚动图片的左右箭头-->
    <a href="#myCarousel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
    <a href="#myCarousel" class="carousel-control right" data-slide="next">&rsaquo;</a>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker({
        format: 'yyyy-mm-dd'
    });
</script>


<script type="text/javascript">
    $(function () {
        // Autocomplete部分
        var availableTags = null;
        $.getJSON("/search/getAllStations.do",function(result){

            $( "#departure" ).autocomplete({
                source: result
            });
            $( "#destination" ).autocomplete({
                source: result
            });
        });

        var trainTable = $("#trainTable").DataTable();

        // 车票查询-显示部分
        var searchForm = $("#searchForm");
        var dataGrid = $("#dataGrid");
        var template = $("#template").children();
        searchForm.submit(function () {
            $.get(
                "/search/searchTrains.do",
                searchForm.serializeArray(),
                function (data) {

                    var currentDate = new Date();
                    var currentyear = currentDate.getFullYear();
                    var currentmonth = currentDate.getMonth() + 1;
                    var currentdate= currentDate.getDate();

                    var searchDate = document.getElementById("mydatepicker").value;
                    var year = searchDate.substr(0,4);
                    var month = searchDate.substr(5,2).replace("0","");
                    var day = searchDate.substr(8,2).replace("0","");

                    if(currentyear < year){
                        trainTable.destroy();
                        dataGrid.empty();
                        $.each(data, function (index, row) {
                            var tr = template.clone();
                            dataGrid.append(tr);
                            $.each(row, function (name, value) {
                                tr.find("._" + name).text(value);
                            })
                        });

                        $(".get-train").click(function () {
                            // 验证是否登录
                            var S_ID = '<%=session.getAttribute("S_ID")%>';
                            if (S_ID.toString() === "null" || S_ID === "") {
                                alert("请先登录");
                                return false;
                            }

                            var item = $(this).parent().parent();
                            var strainID = item.find("._StrainID").html();
                            var startStation = item.find("._StartStation").html();
                            var endStation = item.find("._EndStation").html();
                            var departureTime = item.find("._DepartureTime").html();
                            var arrivalTime = item.find("._ArrivalTime").html();
                            var timeSpent = item.find("._TimeSpent").html();
                            var countLeft = item.find("._CountLeft").html();
                            var price = item.find("._price").html();
                            var params = {"strainID":strainID,
                                "startStation":startStation,
                                "endStation":endStation,
                                "departureTime":departureTime,
                                "arrivalTime":arrivalTime,
                                "timeSpent":timeSpent,
                                "countLeft":countLeft,
                                "price":price};
                            //$.get("/buyTickets/buyTickets.do",data);
                            var form = document.createElement("form");
                            form.setAttribute("method", "get");
                            form.setAttribute("action", "/buyTickets/buyTickets.do");

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

                        trainTable = $("#trainTable").DataTable({
                            "lengthMenu": [ 5, 10, 15]
                        });

                    }
                    else if(currentyear == year){
                        if(currentmonth < month){
                            trainTable.destroy();
                            dataGrid.empty();
                            $.each(data, function (index, row) {
                                var tr = template.clone();
                                dataGrid.append(tr);
                                $.each(row, function (name, value) {
                                    tr.find("._" + name).text(value);
                                })
                            });

                            $(".get-train").click(function () {
                                // 验证是否登录
                                var S_ID = '<%=session.getAttribute("S_ID")%>';
                                if (S_ID.toString() === "null" || S_ID === "") {
                                    alert("请先登录");
                                    return false;
                                }

                                var item = $(this).parent().parent();
                                var strainID = item.find("._StrainID").html();
                                var startStation = item.find("._StartStation").html();
                                var endStation = item.find("._EndStation").html();
                                var departureTime = item.find("._DepartureTime").html();
                                var arrivalTime = item.find("._ArrivalTime").html();
                                var timeSpent = item.find("._TimeSpent").html();
                                var countLeft = item.find("._CountLeft").html();
                                var price = item.find("._price").html();
                                var params = {"strainID":strainID,
                                    "startStation":startStation,
                                    "endStation":endStation,
                                    "departureTime":departureTime,
                                    "arrivalTime":arrivalTime,
                                    "timeSpent":timeSpent,
                                    "countLeft":countLeft,
                                    "price":price};
                                //$.get("/buyTickets/buyTickets.do",data);
                                var form = document.createElement("form");
                                form.setAttribute("method", "get");
                                form.setAttribute("action", "/buyTickets/buyTickets.do");

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

                            trainTable = $("#trainTable").DataTable({
                                "lengthMenu": [ 5, 10, 15]
                            });
                        }
                        else if(currentmonth == month){
                            if(currentdate < day){
                                trainTable.destroy();
                                dataGrid.empty();
                                $.each(data, function (index, row) {
                                    var tr = template.clone();
                                    dataGrid.append(tr);
                                    $.each(row, function (name, value) {
                                        tr.find("._" + name).text(value);
                                    })
                                });

                                $(".get-train").click(function () {
                                    // 验证是否登录
                                    var S_ID = '<%=session.getAttribute("S_ID")%>';
                                    if (S_ID.toString() === "null" || S_ID === "") {
                                        alert("请先登录");
                                        return false;
                                    }

                                    var item = $(this).parent().parent();
                                    var strainID = item.find("._StrainID").html();
                                    var startStation = item.find("._StartStation").html();
                                    var endStation = item.find("._EndStation").html();
                                    var departureTime = item.find("._DepartureTime").html();
                                    var arrivalTime = item.find("._ArrivalTime").html();
                                    var timeSpent = item.find("._TimeSpent").html();
                                    var countLeft = item.find("._CountLeft").html();
                                    var price = item.find("._price").html();
                                    var params = {"strainID":strainID,
                                        "startStation":startStation,
                                        "endStation":endStation,
                                        "departureTime":departureTime,
                                        "arrivalTime":arrivalTime,
                                        "timeSpent":timeSpent,
                                        "countLeft":countLeft,
                                        "price":price};
                                    //$.get("/buyTickets/buyTickets.do",data);
                                    var form = document.createElement("form");
                                    form.setAttribute("method", "get");
                                    form.setAttribute("action", "/buyTickets/buyTickets.do");

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

                                trainTable = $("#trainTable").DataTable({
                                    "lengthMenu": [ 5, 10, 15]
                                });
                            }
                            else alert("选择的日期不合法！");
                        }
                        else alert("选择的日期不合法！");
                    }
                    else alert("选择的日期不合法！");

                }, "json");
            return false;
        });
    });
</script>
