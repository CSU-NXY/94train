<%--
  Created by IntelliJ IDEA.
  User: Ezio
  Date: 2017/9/22
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="common/IncludeTop.jsp"/>

<div id="template" class="hidden">
    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>车次</th>
            <th>途径站点数</th>
            <th>座位数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row" name="index">1</th>
            <td name="TrainID">Mark</td>
            <td name="Sections">Otto</td>
            <td name="Seats">@mdo</td>
            <td name="Action">
                <a class="btn btn-link" href="/Admin/TrainInfo.do?TrainID=">查看</a>
                <a class="btn btn-link" href="/Admin/TrainDelete.do?TrainID=">删除</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">

            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>车次</th>
                            <th>途径站点数</th>
                            <th>座位数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="Mark">
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row">1</th>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>


        </div>
        <div class="col-md-1"></div>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <button type="button" class="btn btn-default" id="Add">添加</button>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">

    $(document).ready(
        function ()
        {
            ajax_json();
            $("#Add").click(function () {
                var demo = $('#template table tbody tr');
                var mark = $('#Mark');
                var temp = demo.clone();
                temp.find("[name='index']").html(Number(mark.children().last().find("[name='index']").html())+1);
                temp.find("[name='TrainID']").html("<input name=\"Station\" type=\"text\">");
                temp.find("[name='Seats']").html("<input name=\"Station\" type=\"text\">");
                temp.find("[name='Sections']").html(0);
                var a = temp.find("[name='Action']").children("a").first();
                a.html("确认");
                a.click(function () {
                    $(this).html("查看");
                    var input1 = $(this).parent().parent().find("[name='TrainID']");
                    input1.html(input1.children().first().val());
                    var input2 = $(this).parent().parent().find("[name='Seats']");
                    input2.html(input2.children().first().val());
                    $(this).attr("href",a.attr("href")+input1.html()+"&seats="+input2.html());
                    $(this).unbind();
                    return false;
                })
                var b = temp.find("[name='Action']").children("a").last();
                b.click(function () {
                    $(this).parent().parent().remove();
                })
                mark.append(temp);
            })
        }
    );
    function ajax_json(){
        $.getJSON("/Admin/TrainList.do",
            function(data)
            {
                var demo = $('#template table tbody tr');
                var mark = $('#Mark');
                mark.empty();
                data.forEach(function(item,index)
                {
                    var temp = demo.clone();
                    temp.find("[name='index']").html(index+1);
                    temp.find("[name='TrainID']").html(item["trainID"]);
                    temp.find("[name='Seats']").html(item["seats"]);
                    temp.find("[name='Sections']").html(item["stationCount"]);
                    var a = temp.find("[name='Action']").children("a").first();
                    a.attr("href",a.attr("href")+item["trainID"]+"&seats="+item["seats"]);
                    var b = temp.find("[name='Action']").children("a").last();
                    b.attr("href",b.attr("href")+item["trainID"]);
                    mark.append(temp);
                });
            });
    }
</script>