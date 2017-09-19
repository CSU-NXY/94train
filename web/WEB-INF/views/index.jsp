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
    .input_control {
        width: 70%;
        margin: 20px auto;
    }

    input[type="text"], #btn1, #btn2 {
        box-sizing: border-box;
        text-align: center;
        font-size: 1.4em;
        height: 2.3em;
        border-radius: 0px;
        border: 1px solid #fcfff9;
        color: #000000;
        -web-kit-appearance: none;
        -moz-appearance: none;
        display: block;
        outline: 0;
        padding: 0 1em;
        text-decoration: none;
        width: 100%;
    }

    input[type="text"]:focus {
        border: 1px solid #90feff;
    }
</style>


<link rel="stylesheet" href="../../static/css/bootstrap.min.css"/>
<link rel="stylesheet" href="../../static/css/dcalendar.picker.css"/>
<script type="text/javascript" src="../../static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../../static/js/dcalendar.picker.js"></script>

<br>
<div class="row" style="background-color: #fcfffb">
    <br>
    <div class="col-xs-1"></div>
    <div class="col-xs-4" style="background:rgba(100,100,100,0.6);margin-bottom: 5%"><br>

        <div class="input_control">
            <input type="text" class="form-input" placeholder="出发地">
        </div>

        <div class="input_control">
            <input type="text" class="form-input" placeholder="目的地">
        </div>


        <div class="input_control">
            <input id='mydatepicker' class="form-input" type="text"/>

        </div>


        <button class="btn btn-default"
                style="width: 70%;height: 2.9em;background-color: #8029fc;margin-left: 15%;margin-bottom: 5%;font-size: small">
            <font size="4.4em">查询</font></button>
        <br>
        <br>

    </div>
</div>


<script type="text/javascript">
    $('#mydatepicker').dcalendarpicker({
        format: 'yyyy-mm-dd'
    });
</script>

</body>

<jsp:include page="common/IncludeBottom.jsp"/>
