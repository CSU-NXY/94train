<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/13
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="common/IncludeTop.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    #wizard {
        font-size:12px;
        height:700px;
        margin:10px auto;
        overflow:hidden;
        position:relative;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
    }

    #wizard .items{
        width:10000px;
        clear:both;
        position:absolute;
    }

    #wizard #status{
        padding-left:25px !important;
    }

    #wizard .row{
        background-color: #563d7c;
    }

    #status li{
        float:left;
        color:#fff;
        padding:10px 30px;
    }

    #status li h4{
        color: #ffffff;
    }

    #status li.active{
        background-color: #cdbcf3;
        font-weight:normal;
    }

    .page{
        padding:20px 30px;
        width:1200px;
        float:left;
        min-height: 500px;
    }

    .spage{
        padding:50px 20px 50px 20px;
        width:1200px;
        float:left;
        min-height: 500px;
    }

    .information{
        padding:10px 0px 0px 20px;
        height: auto;
    }

    .form_input{
        width:100%;
        background-color:transparent;
        border:0;outline:0;
        height:22px;
        *line-height:22px;
        margin:4px 0;
    }

    .form_tips{
        padding:0px 150px 0px 100px;
        color:#8d8d8d
    }

    .form_input_box{
        display:inline-block;
        position:relative;
        height:30px;
        line-height:30px;
        vertical-align:middle;
        width:278px;
        font-size:14px;
        padding:0 10px;
        border:1px solid #e7e7eb;
        box-shadow:none;
        -moz-box-shadow:none;
        -webkit-box-shadow:none;
        border-radius:0;
        -moz-border-radius:0;
        -webkit-border-radius:0;
        background-color:#fff
    }

    .btn_vcode{
        padding:0;
        width:110px;
        margin-left:5px
    }

    .small{
        padding: 50px 30px 50px 30px;
    }

    .space{
        height: 150px;
        width: inherit;
    }

    .end{

    }

</style>
<script>
    function PostData() {
        alert($("#registerForm1").serialize());
        $.ajax({
            type: "POST",
            url: "/registerAndLogin/noJump.do",
            data : $("#registerForm1").serialize(),
            success: function(msg) {
            }
        });
        return false;
    }

    function PostData2() {
        alert($("#registerForm2").serialize());
        $.ajax({
            type: "POST",
            url: "/registerAndLogin/noJump2.do",
            data : $("#registerForm2").serialize(),
            success: function(msg) {
            }
        });
        return false;
    }
</script>

<div class="container">
    <div class="row">
        <div id="wizard">
            <div class="row text-center">
                    <ul id="status" class="list-unstyled">
                        <li class="col-xs-offset-1 col-xs-2 active"><h4>1 基本信息</h4></li>

                        <li class="col-xs-2 col-xs-offset-2"><h4>2 实名认证</h4></li>

                        <li class="col-xs-2 col-xs-offset-2"><h4>3 完成注册</h4></li>
                    </ul>
                </div>

            <div class="items text-left">
                <div class="page">
                    <div class="col-md-6 col-md-offset-2">
                        <form id="registerForm1" onsubmit="return PostData()">
                            <div class="information">
                                <p>每个手机号仅能申请一次帐号！</p>
                            </div>

                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp手机号:&nbsp&nbsp&nbsp<label><input class="form_input" name="PhoneNum" type="text"/></label><a class="btn btn_vcode"  href="#">短信验证</a></h4>
                                <p class="form_tips">作为登录帐号，请填写未被注册的手机号</p>
                            </div>

                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp验证码:&nbsp&nbsp&nbsp<label><input class="form_input" name="checkcode" type="text"/></label></h4>
                                <p class="form_tips">激活手机后将收到验证短信，请回填短信中的6位验证码字母、数字或者英文符号，最短8位，区分大小写</p>
                            </div>

                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp密码:&nbsp&nbsp&nbsp<label><input class="form_input" name="Password" type="password"/></label></h4>
                                <p class="form_tips">字母、数字或者英文符号，最短8位，区分大小写</p>
                            </div>

                            <!--ajax-->
                            <div class="information">
                                <h4>确认密码:&nbsp&nbsp&nbsp<label><input class="form_input" type="password"></label></h4>
                                <p class="form_tips">请再次输入密码</p>
                            </div>

                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp邮箱:&nbsp&nbsp&nbsp<label><input class="form_input" name="Email" type="text"></label></h4>
                                <p class="form_tips">绑定邮箱可用于密码找回</p>
                            </div>

                            <div  class="information">
                                <label class="form_tips">
                                    <input type="checkbox">我同意并遵守<a href="/protocol/viewProtocol.do" target="_blank">《94购票网服务协议》</a>
                                </label>
                            </div>

                            <div class="information">
                                <input type="submit" class="btn btn-primary next right" style="position: relative;left: 35%" value="注册&raquo;" />
                            </div>
                        </form>
                    </div>

                    <div>
                            <p>已有账号，立刻<a href="/registerAndLogin/viewLogin.do"><strong>登录</strong></a>!</p>
                        </div>
                </div>

                <div class="spage">
                    <form:form id="registerForm2" onsubmit="return PostData2()">
                        <div class="col-md-6 col-md-offset-3 small">
                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp姓名:&nbsp&nbsp&nbsp<label><input class="form_input" name="Name" type="text"></label></h4>
                                <p class="form_tips">请填写你的真实姓名</p>
                            </div>

                            <div class="information">
                                <h4>身份证号:&nbsp&nbsp&nbsp<label><input class="form_input" name="ID" type="text"></label></h4>
                                <p class="form_tips">请确认你的身份证号准确无误</p>
                            </div>

                            <div class="row" style="background-color: #ffffff">
                                <div class="col-xs-1 col-xs-offset-2">
                                    <input type="button" class="btn btn-primary prev" style="float:left" value="&laquo;上一步" />
                                </div>
                                <div class="col-xs-1 col-xs-offset-6">
                                    <input type="submit" class="btn btn-primary next right" value="下一步&raquo;" />
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>

                <div class="spage">
                        <div class="col-md-offset-2 small">
                            <div class="information">
                                <h1>恭喜你注册成功！成功开启你的购票之旅</h1>
                            </div>

                            <div class="col-md-offset-3 information">
                                <h2>10秒后界面自动跳转</h2>
                            </div>

                            <div class="space">
                            </div>

                            <div class="col-md-offset-4 information">
                                <a href="/index/viewIndex.do"><input type="button" class="btn btn-primary btn-lg" value="确认"/></a>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <%--javascript 的学习,理解该段代码的意思--%>
        <script type="text/javascript">
            $(function(){
                $("#wizard").scrollable({
                    onSeek: function(event,i){
                        $("#wizard #status li").removeClass("active").eq(i).addClass("active");
                    },

                    onBeforeSeek:function(event,i){
                        //表单验证的代码写在这
                    }
                });
                $(".end").click(function(){
                    var data = $("form").serialize();
                    alert(data);
                });
            });
        </script>

    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>
