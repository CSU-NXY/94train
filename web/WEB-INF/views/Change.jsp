<%--
  Created by IntelliJ IDEA.
  User: Ezio
  Date: 2017/9/22
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>94Train购票网-管理员界面</title>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                    temp.find("[name='TrainID']").html("<input name=\"Station\" type=\"text\" value=\"车次号_"+temp.find("[name='index']").html()+ "\"\>");
                    temp.find("[name='TrainID']").children().first().blur(CheckName);
                    temp.find("[name='Seats']").html("<input name=\"Station\" type=\"text\" value=\"120\">");
                    temp.find("[name='Seats']").children().first().blur(CheckCount);
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
                        b.click(function () {
                            if(confirm('确定要执行删除操作吗?'))
                            {
                                return true;
                            }
                            return false;
                        })
                        mark.append(temp);
                    });
                });
        }

        function CheckCount() {
            var num = $(this).val();
            var regTime = /^\d+$/;
            if(!regTime.test(num)||parseInt(num)<0)
            {
                $(this).val("120");
                alert("数字不符合规范");
                $(this).focus();
                return;
            }
        }

        function CheckName() {
            var i = $(this);
            var name = $(this).val();
            if(name=="") {
                $(this).val("车次名");
                alert("车次名不为空!");
                $(this).focus();
            }
            $("#Mark").children().each(function(index,item){
                if(name == $(item).find("[name='TrainID']").html())
                {
                    i.val("_"+name);
                    alert("车次号不可重复!");
                    $(this).focus();
                    return;
                }
            })
        }
    </script>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-3">
            <label><a href="${pageContext.request.contextPath}/Admin/Change.do"><h1 style="color: #cdbcf3"><span class="glyphicon glyphicon-bed" style="color: #ffffff"></span>94购票网</h1></a></label>
        </div>

        <div class="col-xs-5">

        </div>

        <div class="col-xs-4">
                    <div>
                        <ul class="nav nav-pills">
                            <li><label><h3 class="white">Hi,${sessionScope.get("S_Name")}</h3></label></li>
                            <li>&nbsp;&nbsp;</li>
                            <li style="margin-top: 10px;"><form method="post" action="/registerAndLogin/LogOut.do"><input type="submit" class="btn btn-warning" value="退出登录"></form></li>
                        </ul>
                    </div>
        </div>
    </div>
</div>
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
            <button type="button" class="btn-lg btn-default" id="Add">添加</button>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>

</body>
</html>