<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<jsp:include page="common/IncludeTop.jsp"/>

<style type="text/css">
    <!--
    主页背景自动切换样式开始-- >
    #container {
        width: 100%;
        height: 500px;
        position: relative;
    }

    .carousel-inner {
        position: relative;
        width: 100%;
        overflow: hidden;
        height: 500px;
    }

    .carousel-inner > .item > img {
        display: block;
        line-height: 1;
        z-index: 1;
    }

    .carousel-indicators {
        position: absolute;
        bottom: 10px;
        left: 45%;
        z-index: 2;
        list-style-type: none;
    }

    .carousel-indicators li {
        display: inline-block;
        padding: 0 15px;
        font-size: 24px;
        color: #999;
        cursor: pointer;
        z-index: 2;
    }

    .active1 {
        font-size: 28px;
        color: #fff;
    }

    .carousel-control {
        position: absolute;
        text-decoration: none;
        color: #999;
        font-weight: bold;
        opacity: .5;
        font-size: 40px;
        z-index: 3;
    }

    .carousel-control:hover {
        color: #fff;
        text-decoration: none;
        opacity: .9;
        outline: none;
        font-size: 42px;
    }

    .prev {
        top: 30%;
        left: 20px;
    }

    .next {
        top: 30%;
        right: 20px;
    }

    /*主页背景自动切换样式结束*/
    /*.search {*/
        /*background-color: #563d7c;*/
        /*margin-left: -100px;*/
        /*color: #ffffff;*/
        /*margin-bottom: 0px;*/
    /*}*/

    .result {
        background-color: #f3f3f3;
        margin-bottom: 0px;
    }

    .input_control {
        width: 80%;
        margin: 20px auto;
    }

    .btn-search {
        background-color: inherit;
        width: auto;
        margin: 20px 5px 20px 0;
        padding: 18px 24px;
        font-size: 21px;
    }

    .btn-outline-inverse {
        border-color: #ffffff;
        color: #ffffff;
    }

    .btn-outline-inverse:hover, .btn-outline-inverse:focus, .btn-outline-inverse:active {
        color: #563d7c;
        text-shadow: none;
        background-color: #ffffff;
        border-color: #ffffff;
    }

    /*搜索框半透明*/
    .alpha60 {
        /* Fallback for web browsers that don't support RGBa */
        background-color: rgb(255, 255, 255);
        /* RGBa with 0.6 opacity, 如果要更改透明度,修改第四个参数 */
        background-color: rgba(255, 255, 255, 0.6);
        /* For IE 5.5 - 7*/
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
        /* For IE 8*/
        -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
    }


</style>
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
    <div class="carousel-inner" style="z-index: -1;width: 100%;height: inherit">
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
        <div class="col-md-3 form-group alpha60" style="border-radius: 10%; margin-top: 65px" >
            <br>
            <form id="searchForm">
                <div class="input_control">
                    <h4><strong>出发地</strong></h4><input class="form-control" placeholder="请填写汉字" name="departure">
                </div>

                <div class="input_control">
                    <h4><strong>目的地</strong></h4><input class="form-control" placeholder="请填写汉字" name="destination">
                </div>

                <div class="input_control">
                    <h4><strong>日期</strong></h4><input id='mydatepicker' class="form-control"
                                                       placeholder="点击以选择日期"/>
                </div>

                <div class="input_control">
                    <button class="btn btn-outline-inverse btn-search" style="position: relative;left: 35%">查询
                    </button>
                </div>
            </form>
            <br>
        </div>

        <!--车票框-->
        <div class="col-xs-7 col-xs-offset-1">
            <div class="panel panel-primary" style="margin-top: 65px; opacity: 0.78">
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
                            <td class="_TimeSpent"></td>
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
            <!--选择页数-->
            <div class="card-footer p-0">
                <nav aria-label="5">
                    <ul class="pagination justify-content-end mt-3 mr-3 pull-right">
                        <li class="page-item disabled">
                            <span class="page-link">&laquo;Previous</span>
                        </li>

                        <li class="page-item active">
                            <span class="page-link">1<span class="sr-only">(current)</span></span>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next&raquo;</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- 图片左右方来回滚动图片的左右箭头-->
    <a href="#myCarousel" class="carousel-control left" data-slide="prev">&lsaquo;</a>
    <a href="#myCarousel" class="carousel-control right" data-slide="next">&rsaquo;</a>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>
<%--<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>--%>
<script type="text/javascript">
    $(function () {
        var searchForm = $("#searchForm");
        var dataGrid = $("#dataGrid");
        var template = $("#template").children();
        searchForm.submit(function () {
            $.get(
                "/search/searchTrains.do",
                searchForm.serializeArray(),
                function (data) {
                    dataGrid.empty();
                    $.each(data, function (index, row) {
                        var tr = template.clone();
                        dataGrid.append(tr);
                        $.each(row, function (name, value) {
                            tr.find("._" + name).text(value);
                            tr.find("._TimeSpent").text("2小时03分");
                        })
                    });
                }, "json");
            return false;
        });
    });
</script>

