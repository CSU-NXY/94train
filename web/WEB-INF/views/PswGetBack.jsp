<%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/22
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="common/IncludeTop.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #wizard {
        font-size: 12px;
        height: 800px;
        margin: 10px auto;
        overflow: hidden;
        position: relative;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }

    #wizard .items {
        width: 10000px;
        clear: both;
        position: absolute;
    }

    #wizard #status {
        padding-left: 25px !important;
    }

    #status li {
        float: left;
        color: #fff;
        padding: 10px 30px;
    }

    #status li.active {
        background-color: #cdbcf3;
        font-weight: normal;
    }

    .page {
        padding-top: 20px;
        width: 1000px;
        float: left;
        min-height: 500px;
    }

    .spage {
        padding-top: 20px;
        width: 1000px;
        float: left;
        min-height: 500px;
    }

    .form_tips {
        padding: 0px 100px 0px 150px;
        color: #8d8d8d
    }
</style>

<div class="container">

    <form role="form">
        <div id="wizard">
            <div class="row bac-color">
                <ul id="status" class="list-unstyled">
                    <li class="col-xs-offset-1 col-xs-2 active">
                        <h4>1 账号验证</h4></li>

                    <li class="col-xs-2 col-xs-offset-2">
                        <h4>2 设置新密码</h4></li>

                    <li class="col-xs-2 col-xs-offset-2">
                        <h4>3 完成修改</h4></li>
                </ul>
            </div>

            <div class="items">
                <div class="page">
                    <div class="row">
                        <div class="col-xs-6 col-xs-offset-2" style="margin-top: 50px;">
                            <div class="form-group">
                                <label class="col-xs-3"><h4>手机号</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" placeholder="姓名"></div>
                                <div class="col-xs-2"><a class="btn btn_vcode" href="#">短信验证</a></div>
                                <p class="form_tips">请填写注册的手机号</p>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"><h4>验证码</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" placeholder="姓名"></div>
                                <p class="form_tips">激活手机后将收到验证短信，请回填短信中的6位验证码字母、数字或者英文符号，最短8位，区分大小写</p>
                            </div>

                            <input type="button" class="btn btn-primary next right" style="" value="注册&raquo;" />

                        </div>

                        <div class="col-xs-2">
                            <p>已有账号，立刻
                                <a href="Login.html"><strong>登录</strong></a>!</p>
                        </div>
                    </div>
                </div>

                <div class="spage">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">

                            <div class="form-group">
                                <label><h4>姓名</h4></label>
                                <input type="text" class="form-control" placeholder="姓名">
                                <p class="form_tips">请填写你的真实姓名</p>
                            </div>

                            <div class="form-group">
                                <label><h4>身份证号</h4></label>
                                <input type="password" class="form-control" placeholder="身份证号">
                                <p class="form_tips">请确认你的身份证号准确无误</p>
                            </div>

                            <div class="row">
                                <div class="col-xs-1 col-xs-offset-2">
                                    <input type="button" class="btn btn-primary prev" style="float:left" value="&laquo;上一步" />
                                </div>
                                <div class="col-xs-1 col-xs-offset-6">
                                    <input type="button" class="btn btn-primary next right" value="下一步&raquo;" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="spage">
                    <div class="row">
                        <div class="col-md-offset-2" style="margin-top: 100px;">
                            <div>
                                <h1>恭喜你修改成功！又一次成功开启你的购票之旅</h1>
                            </div>

                            <div class="col-md-offset-3">
                                <h2>10秒后界面自动跳转</h2>
                            </div>

                            <div class="col-md-offset-4 ">
                                <a href="index.html"><input type="button" class="btn btn-primary btn-lg" value="确认" /></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script type="text/javascript">
    $(function() {
        $("#wizard").scrollable({
            onSeek: function(event, i) {
                $("#wizard #status li").removeClass("active").eq(i).addClass("active");
            },

            onBeforeSeek: function(event, i) {
                //表单验证的代码写在这
            }
        });
        $(".end").click(function() {
            var data = $("form").serialize();
            alert(data);
        });
    });
</script>