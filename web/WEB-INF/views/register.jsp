<%--
  Created by IntelliJ IDEA.
  User: Monarch
  Date: 2017/9/13
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>94购票网</title>
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/scrollable.js"></script>
    <style type="text/css">
        .container{
            min-height: 700px;
            background-color: #f7f5fa;
            padding-top: 10px;
            margin-top: 50px;
        }

        #wizard {
            font-size:12px;
            height:700px;
            margin:20px auto;
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

        #wizard .right{
            float:right;
        }

        #wizard #status{
            background:#78bc6d;
            padding-left:25px !important;
        }
        #status li{
            float:left;
            color:#fff;
            padding:10px 30px;
            background-color: #78bc6d;
        }

        #status li h4{
            color: #000000;
        }

        #status li.active{
            background-color:#44b549;
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

        .prev,.next{
            width:100px;
            height:32px;
            line-height:32px;
            //background:url(xx.gif) repeat-x bottom;
            border:1px solid #d3d3d3;
            cursor:pointer}

        .information{
            padding:10px 0px 0px 20px;
            height: auto;
        }

        .reg{
            height: 50px;
            padding-right: 200px;
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

        .btn{
            display:inline-block;
            overflow:visible;
            padding:0 22px;height:30px;
            line-height:30px;
            *line-height:28px;
            vertical-align:middle;
            text-align:center;
            text-decoration:none;
            border-radius:3px;
            -moz-border-radius:3px;
            -webkit-border-radius:3px;
            font-size:14px;
            border-width:1px;
            border-style:solid;
            cursor:pointer
        }

        .small{
            padding: 50px 30px 50px 30px;
        }

        .space{
            height: 150px;
            width: inherit;
        }

    </style>
</head>
<body>
<div class="container">
    <form>
        <div id="wizard">
            <div class="row text-center">
                <ul id="status" class="list-unstyled">
                        <li class="active col-md-4"><h4>1 基本信息</h4></li>

                        <li class="col-md-4"><h4>2 实名认证</h4></li>

                        <li class="col-md-4"><h4>3 完成注册</h4></li>
                </ul>
            </div>

            <div class="items text-left">
                <div class="page">
                    <div class="col-md-6 col-md-offset-2">
                        <div class="information">
                            <p>每个手机号仅能申请一次帐号！</p>
                        </div>

                        <div class="information">
                            <h4>&nbsp&nbsp&nbsp&nbsp手机号:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="text"/></label><a class="btn btn_vcode"  href="#">短信验证</a></h4>
                            <p class="form_tips">作为登录帐号，请填写未被注册的手机号</p>
                        </div>

                        <div class="information">
                            <h4>&nbsp&nbsp&nbsp&nbsp验证码:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="text"/></label></h4>
                            <p class="form_tips">激活手机后将收到验证短信，请回填短信中的6位验证码字母、数字或者英文符号，最短8位，区分大小写</p>
                        </div>

                        <div class="information">
                            <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp密码:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="password"/></label></h4>
                            <p class="form_tips">字母、数字或者英文符号，最短8位，区分大小写</p>
                        </div>

                        <div class="information">
                            <h4>确认密码:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="password"></label></h4>
                            <p class="form_tips">请再次输入密码</p>
                        </div>

                        <div class="information">
                            <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp邮箱:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="text"></label></h4>
                            <p class="form_tips">绑定邮箱可用于密码找回</p>
                        </div>

                        <div  class="information">
                            <label class="form_tips">
                                <input type="checkbox">我同意并遵守<a href="protocol.jsp" target="_blank">《94购票网服务协议》</a>
                            </label>

                        </div>

                        <div class="information reg">
                            <input type="button" class="next right" value="注册&raquo;" />
                        </div>
                    </div>

                    <div>
                        <p>已有账号，立刻<a href="index.jsp">登录</a>!</p>
                    </div>
                </div>

                <div class="spage">
                        <div class="col-md-6 col-md-offset-3 small">
                            <div class="information">
                                <h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp姓名:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="text"></label></h4>
                                <p class="form_tips">请填写你的真实姓名</p>
                            </div>

                            <div class="information">
                                <h4>身份证号:&nbsp&nbsp&nbsp<label class="form_input_box"><input class="form_input" type="text"></label></h4>
                                <p class="form_tips">请确认你的身份证号准确无误</p>
                            </div>

                            <div class="space">
                            </div>

                            <div class="btn information">
                                <input type="button" class="prev" style="float:left" value="&laquo;上一步" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" class="next right" value="下一步&raquo;" />
                            </div>
                        </div>
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

                        <div class="col-md-offset-4 btn information">
                            <a href="index.jsp"><input type="button" class="next right" value="确认"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        $(function(){
            $("#wizard").scrollable({
                onSeek: function(event,i){
                    $("#status li").removeClass("active").eq(i).addClass("active");
                },
                onBeforeSeek:function(event,i){
                //表单验证的代码写在这
                }
            });
            $("#sub").click(function(){
                var data = $("form").serialize();
                alert(data);
            });
        });
    </script>
</div>
</body>
</html>
