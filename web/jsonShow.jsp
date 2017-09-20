<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-19
  Time: 上午10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <script src="static/js/jquery-1.11.0.min.js"></script>
<head>
    <title>json数据处理</title>
</head>
<body>
<script>
    var url = "tojson.do";
    function a() {
        $.post(url,{},function (data) {
            $.
            alert(data[0]["userID"]);
        },"json");
    }
</script>

<div id="div"></div>
<table id="table">
    <tr>
        <td>1</td>
        <td>2</td>
    </tr>
    <tr>
        <td>3</td>
        <td>4</td>
    </tr>
</table>

<button id="showJson" onclick="a()">来啊打我啊</button>

</body>
</html>
