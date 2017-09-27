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
                    var mark = $('#Mark');
                    var copy =$('#template2 table tbody tr').clone();
                    copy.children().eq(2).children().first().blur(CheckTime);
                    copy.children().eq(3).children().first().blur(CheckTime);
                    copy.children().eq(1).children().first().blur(CheckName);
                    copy.children().eq(4).children().first().blur(CheckPrice);
                    copy.children().eq(5).children().first().blur(CheckCount);
                    mark.append(copy);
                    var th = $("#table > tbody > tr > th");
                    th.each(function(index,element) {
                        $(element).html(index+1);
                    });
                    var a = copy.find("[name='Action']").children("a").first();
                    a.click(save);
                    var b = copy.find("[name='Action']").children("a").last();
                    b.click(del);
                    });
                $("#Save").click(ajax_save);
            }

        );

        function ajax_save() {
            if($("#Mark").children().length<2)
            {
                alert("车站数至少为2!");
                return;
            }
            if($("#Mark input").length>0)
            {
                alert("请先保存之后提交!");
                return;
            }
            $.post("/Admin/SaveTrainList.do",
                {"json":GetData(),"trainid":'${requestScope.get("TrainID")}',"index":$("#Mark").children().length,"seats":'${requestScope.get("seats")}'},
                function (response) {
                    window.location.replace("/Admin/Change.do");
                })
        }

        function GetData()
        {
            var body = $("#Mark");
            var json=new Array();
            for(var i=0;i<body.children().length;i++)
            {
                var temp = body.children().eq(i);
                var dic = {};
                for(var j = 1;j<6;j++)
                {
                    var key = temp.children().eq(j).attr("name");
                    var value = temp.children().eq(j).html();
                    if(value=="---")
                        value = null;
                    dic[key] = value;
                }
                json.push(dic);
            }
            var str = JSON.stringify(json);
            alert("JSON数据为:"+str);
            return str;
        }

        function ajax_json(){
            $.getJSON("/Admin/TrainSectionList.do?TrainID=${requestScope.get("TrainID")}",
                function(data)
                {
                    var demo = $('#template table tbody tr');
                    var mark = $('#Mark');
                    mark.empty();
                    data.forEach(function(item,index)
                    {
                        var temp = demo.clone();
                        temp.find("[name='index']").html(index+1);
                        temp.find("[name='Station']").html(item["startStation"]);
                        temp.find("[name='ArrivalTime']").html(item["arrivalTime"]);
                        temp.find("[name='DepartureTime']").html(item["departureTime"]);
                        temp.find("[name='Price']").html(item["price"]);
                        temp.find("[name='Count']").html(item["countLeft"]);
                        var a = temp.find("[name='Action']").children("a").first();
                        a.attr("href",a.attr("href")+item["trainID"]);
                        var b = temp.find("[name='Action']").children("a").last();
                        b.attr("href",b.attr("href")+item["trainID"]);
                        
                        a.click(change);

                        b.click(del);
                        mark.append(temp);
                    });
                    mark.children().first().find("[name='ArrivalTime']").html("---");
                    mark.children().last().find("[name='DepartureTime']").html("---");
                    mark.children().last().find("[name='Price']").html("---");
                    mark.children().last().find("[name='Count']").html("---");
                });
        }

        function change(){
            var c = $(this).parent().parent();
            var d = $('#template2 table tbody tr').clone();
            for(var i = 1;i<6;i++)
            {
                d.children().eq(i).children().first().attr("value",c.children().eq(i).html());
                c.children().eq(i).html(d.children().eq(i).html());
                if(i==1)
                    c.children().eq(i).children().first().blur(CheckName);
                else if(i==2||i==3)
                    c.children().eq(i).children().first().blur(CheckTime);
                else if(i==4)
                    c.children().eq(i).children().first().blur(CheckPrice);
                else if(i==5)
                    c.children().eq(i).children().first().blur(CheckCount);
            }
            $(this).unbind();
            $(this).click(save)
            $(this).html("保存");
            return false;
        }

        function save(){
            var c = $(this).parent().parent();
            for(var i = 1;i<6;i++)
            {
                c.children().eq(i).html(c.children().eq(i).children().first().val());
            }
            $(this).unbind();
            $(this).click(change);
            $(this).html("修改");
            return false;
        }

        function del() {
            if(confirm('确定要执行删除操作吗?'))
            {
                $(this).parent().parent().remove();
                var th = $("#table > tbody > tr > th");

                th.each(function(index,element) {
                    $(element).html(index+1);
                });
            }
            return false;
        }

        function CheckTime() {
            var time = $(this).val();
            var regTime = /^([0-2][0-9]):([0-5][0-9]):([0-5][0-9])$/;
            var result = false;
            if (regTime.test(time)) {
                if ((parseInt(RegExp.$1) < 24) && (parseInt(RegExp.$2) < 60) && (parseInt(RegExp.$3) < 60)) {
                    result = true;
                }
            }
            if(time=="---")
                result = true;
            if(!result)
            {
                alert("时间格式错误!");
                $(this).val("---");
            }
        }

        function CheckPrice() {
            var num = $(this).val();
            if(num=="---")
                return;
            var regTime = /^\d+(\.\d+)?$/;
            if(!regTime.test(num)||parseInt(num)<0)
            {
                $(this).val("20");
                alert("数字不符合规范");
                $(this).focus();
                return;
            }
        }

        function CheckCount() {
            var num = $(this).val();
            if(num=="---")
                return;
            var regTime = /^\d+$/;
            if(!regTime.test(num)||parseInt(num)<0)
            {
                $(this).val(${requestScope.get("seats")});
                alert("数字不符合规范");
                $(this).focus();
                return;
            }
        }

        function CheckName() {
            var name = $(this).val();
            if(name=="") {
                $(this).val("车站名");
                alert("车站名不为空!");
                $(this).focus();
            }
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
            <th>车站</th>
            <th>到达时间</th>
            <th>发车时间</th>
            <th>价格</th>
            <th>剩余票数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row" name="index">1</th>
            <td name="Station">Mark</td>
            <td name="ArrivalTime">Otto</td>
            <td name="DepartureTime">@mdo</td>
            <td name="Price"></td>
            <td name="Count"></td>
            <td name="Action">
                <a class="btn btn-link" href="#">修改</a>
                <a class="btn btn-link" href="#">删除</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>
<div id="template2" class="hidden">
    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>车站</th>
            <th>到达时间</th>
            <th>发车时间</th>
            <th>价格</th>
            <th>剩余票数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row" name="index">1</th>
            <td name="Station">
                <input name="Station" type="text" value="车站名">
            </td>
            <td name="ArrivalTime">
                <input name="ArrivalTime" type="text" value="---">
            </td>
            <td name="DepartureTime">
                <input name="DepartureTime" type="text" value="---">
            </td>
            <td name="Price">
                <input name="Price" type="text" value="20">
            </td>
            <td name="Count">
                <input name="Count" type="text" value="${requestScope.get("seats")}">
            </td>
            <td name="Action">
                <a class="btn btn-link" href="#">保存</a>
                <a class="btn btn-link" href="#">删除</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>
<div class="container">
    <div class="row">
        <h1 class="page-header">车次号:${requestScope.get("TrainID")}</h1>
    </div>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
<div>
    <table class="table table-striped table-hover" id="table">
        <thead>
        <tr>
            <th>#</th>
            <th>车站</th>
            <th>到达时间</th>
            <th>发车时间</th>
            <th>价格</th>
            <th>剩余票数</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="Mark">

        </tbody>
    </table>
</div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10"><div>
                <div>
                    <button class="btn btn-default" type="submit" id="Add">添加</button>
                    <button  class="btn btn-success"type="submit" id="Save">保存</button>
                    <a  class="btn btn-default" href="/Admin/Change.do">返回</a>
                </div>
            </div></div>
            <div class="col-md-1"></div>
        </div>
</div>
</body>
</html>

