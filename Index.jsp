<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="common/IncludeTop.jsp"/>

<style type="text/css">
    <!--主页背景自动切换样式开始-->
    #container{
        width: 100%;
        height:500px;
        position: relative;
    }
    .carousel-inner{
        position: relative;
        width: 100%;
        overflow: hidden;
        height:500px;
    }
    .carousel-inner>.item>img{
        display: block;
        line-height: 1;
        z-index: 1;
    }
    .carousel-indicators{
        position: absolute;
        bottom:10px;
        left:45%;
        z-index: 2;
        list-style-type: none;
    }
    .carousel-indicators li{
        display:inline-block;
        padding: 0 15px;
        font-size: 24px;
        color:#999;
        cursor: pointer;
        z-index: 2;
    }
    .active1{
        font-size: 28px;
        color:#fff;
    }
    .carousel-control{
        position: absolute;
        text-decoration:none;
        color: #999;
        font-weight: bold;
        opacity: .5;
        font-size: 40px;
        z-index: 3;
    }
    .carousel-control:hover{
        color:#fff;
        text-decoration: none;
        opacity: .9;
        outline: none;
        font-size: 42px;
    }
    .prev{
        top: 30%;
        left:20px;
    }
    .next{
        top:30%;
        right: 20px;
    }
    <!--主页背景自动切换样式结束-->

    .search{
        background-color: #563d7c;
        margin-left: -100px;
        color: #ffffff;
        margin-bottom: 0px;
    }

    .result{
        background-color: #f3f3f3;
        margin-bottom: 0px;
    }

    .input_control {
        width: 80%;
        margin: 20px auto;
    }

    .btn-search{
        background-color: inherit;
        width: auto;
        margin: 20px 5px 20px 0;
        padding: 18px 24px;
        font-size: 21px;
    }

    .btn-outline-inverse {
        background-color: #563d7c;
        border-color: #ffffff;
        color: #ffffff;
    }

    .btn-outline-inverse:hover, .btn-outline-inverse:focus, .btn-outline-inverse:active {
        color: #563d7c;
        text-shadow: none;
        background-color: #ffffff;
        border-color: #ffffff;
    }

</style>
<div class="home">
    <!--背景开始-->
    <div class="carousel-inner" style="height: 100%;">
        <!-- 包含图片的容器 -->
        <div class="item" style="display: block;z-index: -1;width: 100%;height: 100%;">
            <img src="../../static/images/bg2.jpg" style="width: 100%;height: 100%;">
            <img src="../../static/images/bg3.jpg" style="width: 100%;height: 100%;">
            <img src="../../static/images/bg4.jpg" style="width: 100%;height: 100%;">
            <img src="../../static/images/bg5.jpg" style="width: 100%;height: 100%;">
            <img src="../../static/images/bg1.jpg" style="width: 100%;height: 100%;">
        </div>
        <%--<div class="item"><img src="../../static/images/bg2.jpg"></div>--%>
        <%--<div class="item"><img src="../../static/images/bg3.jpg"></div>--%>
        <%--<div class="item"><img src="../../static/images/bg4.jpg"></div>--%>
        <%--<div class="item"><img src="../../static/images/bg5.jpg"></div>--%>
        <div class="container" style="padding-top: 100px;padding-bottom: 100px;">
            <div class="row"style="position: absolute;z-index:3;top: 100px; left: 15%; width: 80%; height: 100%;">
                <div class="col-md-3 form-group search">
                    <form id="searchForm">

                        <div class="input_control">
                            <h4><strong>出发地</strong></h4>
                            <label><input type="text" class="form-control" placeholder="请填写汉字"></label>
                        </div>

                        <div class="input_control">
                            <h4><strong>目的地</strong></h4>
                            <label><input type="text" class="form-control" placeholder="请填写汉字"></label>
                        </div>

                        <div class="input_control">
                            <h4><strong>日期</strong></h4>
                            <label><input id='mydatepicker' class="form-control" placeholder="点击以选择日期" type="text"/></label>
                        </div>

                        <div class="input_control" id="search">
                            <span class="input-group-btn" >
                                <button class="btn btn-outline-inverse btn-search" type="submit" value="search" onclick="fun(this)" style="position: relative;left: 30%">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </span>
                        </div>
                    </form>
                </div>

                <div class="col-xs-7 col-xs-offset-1">
                    <div class="result" style="display: none" id="show">
                        <table class="table table-bordered table-striped">
                            <caption>车次信息</caption>
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
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="template">
                            <tr>
                                <td>k12</td>
                                <td>长沙</td>
                                <td>武汉</td>
                                <td>10:16</td>
                                <td>12:18</td>
                                <td>2小时02分</td>
                                <td>20元</td>
                                <td>充足</td>
                                <td>
                                    <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                                </td>
                            </tr>

                            </tbody>
                            <tbody style="display: none">
                            <tr>
                                <th scope="row" class="_rowNumber"></th>
                                <td class="_title"></td>
                                <td class="_content"></td>
                                <td class="_gmtCreate"></td>
                                <td>
                                    <a class="btn btn-xs btn-primary btn-outline-inverse" href="/user/viewBuyTickets.do">购买</a>
                                </td>
                            </tr>
                            </tbody>
                            <tbody id="datagrid">

                            </tbody>
                        </table>
                        <!--选择页数-->
                        <div style="text-align: center">
                            <ul class="pagination">
                                <li><a href="#">&laquo;</a></li>
                                <li><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 图片左右方来回滚动图片的左右箭头-->
        <a href="#" class="carousel-control prev"><span style="z-index: 3"><</span></a>
        <a href="#" class="carousel-control next"><span style="z-index: 3">></span></a>
    </div>
    <!-- 图片下方的指示圆圈-->
    <%--<ul class="carousel-indicators" style="z-index: 3;">--%>
    <%--<li id='pic1'></li>--%>
    <%--<li id='pic2'></li>--%>
    <%--<li id='pic3'></li>--%>
    <%--<li id='pic4'></li>--%>
    <%--<li id='pic5'></li>--%>
    <%--&lt;%&ndash;<li id='pic5'>●</li>&ndash;%&gt;--%>
    <%--</ul>--%>
    <!--背景结束-->
</div>

<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
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
<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker({
    format: 'yyyy-mm-dd'
    });

    function fun(obj) {
        var show = document.getElementById("show");
        show.style.display = "block";
    }
    <!--背景切换开始-->
    window.onload = function() {
        //轮播初始化
        var lunbo = document.getElementById('content');
        var imgs = lunbo.getElementsByTagName('img');
        var uls = lunbo.getElementsByTagName('ul');
        var lis = lunbo.getElementsByTagName('li');
        //初始状态下，一个圆圈为高亮模式
        lis[0].style.fontSize = '26px';
        lis[0].style.color = '#fff';
        //定义一个全局变量，用来进行自动轮播图片顺序的变化
        var pic_index = 1;
        //自动轮播.使用pic_time记录播放，可以随时使用clearInterval()清除掉。
        var pic_time = setInterval(autobofang, 3000);
        //手动轮播
        for(var i = 0; i < lis.length; i++) {
            lis[i].addEventListener("mouseover", change, false);
        }

        function change(event) {
            var event = event || window.event;
            var target = event.target || event.srcElement;
            var children = target.parentNode.children;
            for(var i = 0; i < children.length; i++) {
                if(target == children[i]) {
                    picChange(i);
                }
            }
        }
        //图片切换函数
        function picChange(i) {
            //让所有图片都不显示，所有圆圈都为普通样式
            for(var j = 0; j < imgs.length; j++) {
                imgs[j].style.display = 'none';
                lis[j].style.fontSize = '24px';
                lis[j].style.color = '#999';
            }
            //让选中的索引的图片显示，对应的圆圈高亮
            imgs[i].style.display = 'block';
            lis[i].style.fontSize = '26px';
            lis[i].style.color = '#fff';
        }
        //自动播放的事件处理
        function autobofang() {
            if(pic_index >= lis.length) {
                pic_index = 0;
            }
            change1(pic_index);
            pic_index++;
        }
        //自动播放的图片转化中的事件
        function change1(index) {
            picChange(index);
            //鼠标移入ul标签，自动播放图片暂停
            uls[0].addEventListener("mouseover", pause, false);
            //鼠标移出ul标签，自动播放图片继续
            uls[0].addEventListener("mouseout", go, false);
        }
        //自动播放暂停函数
        function pause(event) {
            var event = event || window.event;
            var target = event.target || event.srcElement;
            switch(target.id) {
                case "pic1":
                    clearInterval(pic_time);
                    break;
                case "pic2":
                    clearInterval(pic_time);
                    break;
                case "pic3":
                    clearInterval(pic_time);
                    break;
                case "pic4":
                    clearInterval(pic_time);
                    break;
                case "pic5":
                    clearInterval(pic_time);
                    break;
            }
        }
        //自动播放图片继续函数
        function go(event) {
            var event = event || window.event;
            var target = event.target || event.srcElement;
            switch(target.id) {
                case "pic1":
                    pic_index = 1;
                    pic_time = setInterval(autobofang, 3000);
                    break;
                case "pic2":
                    pic_index = 2;
                    pic_time = setInterval(autobofang, 3000);
                    break;
                case "pic3":
                    pic_index = 3;
                    pic_time = setInterval(autobofang, 3000);
                    break;
                case "pic4":
                    pic_index = 3;
                    pic_time = setInterval(autobofang, 3000);
                    break;
                case "pic5":
                    break;
            }
        }
    }
    <!--背景切换结束-->
</script>
<jsp:include page="common/IncludeBottom.jsp"/>
