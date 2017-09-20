<%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/13
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>

<jsp:include page="views/common/IncludeTop.jsp"/>

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
;
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

<div class="container">
    <div class="row">
            <div id="wizard">
                <div class="row text-center bac-color">
                    <ul id="status" class="list-unstyled">
                        <li class="col-xs-offset-1 col-xs-2 active"><h4>1 基本信息</h4></li>

                        <li class="col-xs-2 col-xs-offset-2"><h4>2 实名认证</h4></li>

                        <li class="col-xs-2 col-xs-offset-2"><h4>3 完成注册</h4></li>
                    </ul>
                </div>

                <div class="items text-left">
                    <form role="form">
                        <div class="page">
                            <div class="col-md-6 col-md-offset-2">
                                <div class="form-group">
                                    <p>每个手机号仅能申请一次帐号！</p>
                                </div>

                                <div class="form-group">
                                    <label>手机号</label>
                                    <input type="text" class="form-control" placeholder="手机号">
                                    <a class="btn btn_vcode"  href="#">短信验证</a>
                                    <p class="form_tips">作为登录帐号，请填写未被注册的手机号</p>
                                </div>

                                <div class="form-group">
                                    <label>验证码</label>
                                    <input type="text" class="form-control" placeholder="验证码">
                                    <p class="form_tips">激活手机后将收到验证短信，请回填短信中的6位验证码字母、数字或者英文符号，最短8位，区分大小写</p>
                                </div>

                                <div class="form-group">
                                    <label>密码</label>
                                    <input type="text" class="form-control" placeholder="密码">
                                    <p class="form_tips">字母、数字或者英文符号，最短8位，区分大小写</p>
                                </div>

                                <div class="form-group">
                                    <label>确认密码</label>
                                    <input type="text" class="form-control" placeholder="密码">

                                    <p class="form_tips">请再次输入密码</p>
                                </div>

                                <div class="form-group">
                                    <label>邮箱</label>
                                    <input type="text" class="form-control" placeholder="邮箱">
                                    <p class="form_tips">绑定邮箱可用于密码找回</p>
                                </div>

                                <div  class="form-group">
                                    <label class="form_tips">
                                        <input type="checkbox">我同意并遵守<a href="/protocol/viewProtocol.do" target="_blank">《94购票网服务协议》</a>
                                    </label>
                                </div>

                                <ul class="pager">
                                    <li class=""><a href="#">上一步</a></li>
                                    <li class=""><a href="#">下一步</a></li>
                                </ul>
                            </div>

                            <div>
                                <p>已有账号，立刻<a href="/registerAndLogin/viewLogin.do"><strong>登录</strong></a>!</p>
                            </div>
                        </div>

                        <div class="spage">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 small">
                                    <div class="form-group">
                                        <label>姓名</label>
                                        <input type="text" class="form-control" placeholder="姓名">
                                        <p class="form_tips">请填写你的真实姓名</p>
                                    </div>

                                    <div class="form-group">
                                        <label>身份证号</label>
                                        <input type="text" class="form-control" placeholder="身份证号">
                                        <p class="form_tips">请确认你的身份证号准确无误</p>
                                    </div>
                                </div>
                            </div>

                            <ul class="pager">
                                <li class=""><a href="#">上一步</a></li>
                                <li class=""><a href="#">下一步</a></li>
                            </ul>

                        </div>

                        <div class="spage">
                            <div class="col-md-offset-2 small">
                                <div>
                                    <h1>恭喜你注册成功！成功开启你的购票之旅</h1>
                                </div>

                                <div class="col-md-offset-3">
                                    <h2>10秒后界面自动跳转</h2>
                                </div>

                                <div class="space">
                                </div>

                                <div class="col-md-offset-4 information">
                                    <a href="/index/viewIndex.do"><input type="button" class="btn btn-primary btn-lg" value="确认"/></a>
                                </div>
                            </div>
                        </div>

                    </form>
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

<jsp:include page="views/common/IncludeBottom.jsp"/>