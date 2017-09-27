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

<div class="container">
    <div class="row">
        <div id="wizard">
            <div class="row bac-color">
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
                            <p><h4>每个手机只能注册一个账号</h4></p>
                            <div class="form-group">
                                <label class="col-xs-3"><h4>手机号</h4></label>
                                <div class="col-xs-7"><input class="form-control" name="PhoneNum" id="PhoneNum" placeholder="手机号"></div>
                                <div class="col-xs-2"><input class="btn btn_vcode" id="sendMsg" onclick="sendWord()" value="短信验证"></div>
                                <p class="form_tips">作为登录帐号，请填写未被注册的手机号</p>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"><h4>验证码</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" name="CheckCode" id="CheckCode" placeholder="验证码" onblur="checkWord()"></div>
                                <p class="form_tips">激活手机后将收到验证短信，请回填短信中的6位验证码字母、数字或者英文符号，最短8位，区分大小写</p>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"><h4>密码</h4></label>
                                <div class="col-xs-7"><input type="password" class="form-control" name="Password" id="password" placeholder="密码"></div>
                                <p class="form_tips">字母、数字或者英文符号，最短8位，区分大小写</p>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"><h4>确认密码</h4></label>
                                <div class="col-xs-7"><input type="password" class="form-control" name="password" id="password2" placeholder="确认密码" onblur="checkPwd()"></div>
                                <div class="col-xs-2"><span name="checkPwd" id="checkPwd">aaa</span></div>
                                <p class="form_tips">请再次输入密码</p>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"><h4>邮箱</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" name="Email" id="email" placeholder="邮箱"></div>
                                <p class="form_tips">请再次输入密码</p>
                            </div>
                            <div class="checkbox">
                                <label class="form_tips">
                                <label><input type="checkbox" name="Agree" checked="checked"></label>我已阅读并同意
                                <a href="/WEB-INF/views/Protocol.jsp" target="_blank">《94购票网服务协议》</a>
                            </label>
                            </div>
                            <input type="submit" class="btn btn-primary" onclick="checkMsg()" value="注册&raquo;"/>

                    </form>
                    </div>

                    <div>
                            <p>已有账号，立刻<a href="/registerAndLogin/viewLogin.do"><strong>登录</strong></a>!</p>
                        </div>
                </div>

                <div class="page">
                    <form id="registerForm2" onsubmit="return PostData2()">
                        <div class="col-md-6 col-md-offset-3" style="margin-top: 100px;">
                            <div class="form-group">
                                <label class="col-xs-3"><h4>姓名</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" name="Name" placeholder="姓名"></div>
                                <p class="form_tips">请填写你的真实姓名</p>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3"><h4>身份证号</h4></label>
                                <div class="col-xs-7"><input type="text" class="form-control" name="ID" placeholder="身份证号"></div>
                                <p class="form_tips">请确认你的身份证号准确无误</p>
                            </div>

                            <div class="row" style="background-color: #ffffff">
                                <div class="col-xs-1 col-xs-offset-2">
                                    <input type="button" class="btn btn-primary" onclick="prePage()" style="float:left" value="&laquo;上一步" />
                                </div>
                                <div class="col-xs-1 col-xs-offset-6">
                                    <input type="submit" class="btn btn-primary" onclick="nextPage()" value="下一步&raquo;" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="page">
                        <div class="col-xs-offset-2" style="margin-top: 100px;">
                            <div>
                                <h1>恭喜你注册成功！成功开启你的购票之旅</h1>
                            </div>

                            <div class="col-xs-offset-3">
                                <h2>10秒后界面自动跳转</h2>
                            </div>

                            <div class="space">
                            </div>

                            <div class="col-md-offset-4">
                                <a href="/index/viewIndex.do"><input type="button" class="btn btn-primary btn-lg" value="确认"/></a>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="common/IncludeBottom.jsp"/>

<script>
    var countdown=60;
    function settime() {
            var val = document.getElementById("sendMsg");
        if (countdown == 0) {
            val.removeAttribute("disabled");
            val.value="短信验证";
            countdown = 60;
            return;
        } else {
            val.setAttribute("disabled", true);
            val.value="重新发送(" + countdown + ")";
            countdown = countdown - 1;
        }
        setTimeout(function() {
            settime(val)
        },1000)
    }

    function checkPhone() {

        var phone = document.getElementById("PhoneNum").value;
        var flag = false;
        var message = "";
        var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(phone == ''){
            message = "手机号码不能为空！";
        } else
        if(phone.length != 11){
            message = "请输入有效的手机号码！";
        }
        else if(!myreg.test(phone)){
            message = "请输入有效的手机号码！";
        }else if(checkPhoneIsExist(phone) == "false"){
            message = "该手机号码已经被绑定！";
        }else{
            flag = true;
        }

        if(!flag){
            alert(message);
        }
        return flag;
    }

    
    function checkPhoneIsExist(obj) {
        var num = {};
        var message = "";
        num.phone = obj;
        $.ajax({
            type: "POST",
            url: "/registerAndLogin/checkPhoneNumIsExist.do",
            async: false,
            data : num,
            success: function(msg) {
                message = msg;
            }
        });
        return message;
    }

    function checkCode(obj) {
        var checkCode = obj;
        if(checkCode == ''){
            return false;
        }
        return true;
    }

    function checkPwd() {
        var fpwd = $("input[name='Password']").val();
        var lpwd = $("input[name='password']").val();

        if(fpwd==lpwd){
            $("#checkPwd").html("密码正确");
            return true;
        }else{
            $("#checkPwd").html("密码错误");
            return false;
        }
    }

    function checkMsg() {
        var checkword = {}
        checkword.id = $("input[name='CheckCode']").val();

        var checkcode = $("#CheckCode").val();
        var pwd = $("#password").val();
        var pwd2 = $("#password2").val();
        var email = $("#email").val();

        if(checkPhone()){
            if(checkCode(checkcode)){
                if(checkCode(pwd)){
                    if(checkCode(pwd2)) {
                        if (checkPwd()) {
                            if (checkCode(email)) {
                                $.ajax({
                                    type: "POST",
                                    url: "/registerAndLogin/checkWord.do",
                                    data: checkword,
                                    success: function (msg) {
                                        if (msg.equal("true")) {
                                            nextPage();
                                        } else {
                                            alert("短信验证码错误,请重新验证")
                                        }
                                    }
                                });
                            }else {alert("请输入邮箱");}
                        }else {alert("请确认密码");}
                    }else {alert("请确认密码");}
                }else {alert("请输入密码");}
            }else{alert("请输入验证码");}
        }
        return false;
    }
    
    function prePage() {
        var scrollable=$("#wizard").scrollable();
        scrollable.prev(1000,function () {
            return true;
        })
    }

    function nextPage() {
        var scrollable=$("#wizard").scrollable();
        scrollable.next(1000,function () {
            return true;
        })
    }

    function sendWord() {
        if(checkPhone()){
            settime();
            var check = $("input[name='PhoneNum']").val();
            var num = {};
            num.id = check;

            $.ajax({
                type: "POST",
                url: "/registerAndLogin/getWord.do",
                data : num,
                success: function(msg) {
                }
            });

        return false;
        }
    }

    function PostData() {
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
            // alert(data);
        });
    });
</script>
