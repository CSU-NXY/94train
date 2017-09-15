<%--
  Created by IntelliJ IDEA.
  User: xjsys
  Date: 17-9-7
  Time: 下午3:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style type="text/css">
    .input_control{
        width: 70%;
        margin: 20px auto;
    }

    input[type="text"],#btn1,#btn2{
        box-sizing: border-box;
        text-align: center;
        font-size: 1.4em;
        height: 2.3em;
        border-radius: 0px;
        border:1px solid #fcfff9;
        color: #000000;
        -web-kit-appearance:none;
        -moz-appearance: none;
        display: block;
        outline: 0;
        padding:0 1em;
        text-decoration: none;
        width:100%;
    }

    input[type="text"]:focus{
        border: 1px solid #90feff;
    }

    .btn btn-default{
        border-radius:0px;
    }
</style>



<jsp:include page="WEB-INF/views/common/IncludeTop.jsp"/>

<br>
<div class="row" style="background-color: #fcfffb">
    <br>
    <div class="col-xs-1"></div>
    <div class="col-xs-4" style="background:rgba(100,100,100,0.6);margin-bottom: 20%"> <br>

        <div class="input_control">
            <input type="text" class="form-input" placeholder="出发地">
        </div>

        <div class="input_control">
            <input type="text" class="form-input" placeholder="目的地">
        </div>

        <div class="input_control">
            <input id='mydatepicker' class="form-input" type="text"/>
        </div>


        <button class="btn btn-default" style="width: 70%;height: 2.9em;margin-left: 15%;margin-bottom: 5%;font-size: small"><font size="4.4em">查询</font> </button>

        <br>
        <br>

    </div>
</div>


<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker({
        format:'yyyy-mm-dd'
    });
</script>
<!--
<div class="row">
    <div class="col-xs-1"></div>

    <div class="col-xs-10">
        <table class="table table-hover">
            <caption>列车信息</caption>
            <thead>
            <tr>
                <th>车次</th>
                <th>出发地</th>
                <th>目的地</th>
                <th>出发时间</th>
                <th>到达时间</th>
                <th>运行时间</th>
                <th>票价</th>
                <th>剩余票数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
-->

</body>

<jsp:include page="WEB-INF/views/common/IncludeBottom.jsp"/>