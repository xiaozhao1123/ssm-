<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>"/>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">登录页面</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username"  name="username" placeholder="请输入用户名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" ><a href="regist.jsp">未有账号，去注册</a></button>
                    <button type="button" class="btn btn-primary" id="login">登录</button>
                </div>
            </div>
        </div>
    </div>
            <script type="text/javascript">
                //打开模态框
                $('#myModal').modal({
                    backdrop:"static"
                })
                //验证信息显示
                function show_message(ele,status,msg){
                    //先清除原来的格式
                    $(ele).parent().removeClass("has-success  has-error");
                    $(ele).next("span").text("");
                    if(status=="success"){
                        $(ele).parent().addClass("has-success");
                        $(ele).next("span").text(msg);
                    }
                    else if(status=="error"){
                        $(ele).parent().addClass("has-error");
                        $(ele).next("span").text(msg);
                    }

                }
                //当用户名发生变化时验证用户名是否正确
                $("#username").change(function () {
                    //去后台校验看是否满足
                    $.ajax({
                        url:"login2",
                        data:{
                            username:$("#username").val()
                        },
                        type:"get",
                        success:function (resp) {
                                //显示信息
                            if(resp.flag==false){
                                show_message("#username","error",resp.map.msg);
                                $("#password").prop("disabled","disabled");
                            }else{
                                show_message("#username","success",resp.map.msg);
                                $("#password").removeAttr("disabled")
                            }

                        }
                    })
                })
                //验证密码是否正确
                $("#login").click(function () {
                    var name=$("#username").val();
                    var word=$("#password").val();
                    $.ajax({
                        url:"login1",
                        data:{
                            username:name,
                            password:word
                        },
                        success:function (resp) {
                            if(resp.flag==false){
                                 show_message("#password","error",resp.map.msg)
                            }else{
                                show_message("#password","success",resp.map.msg)
                                location.href="index.jsp";
                            }

                        }
                    })
                })
                $("#password").blur(function () {
                    $("#password").parent().removeClass("has-success  has-error");
                    $("#password").next("span").text("");
                })
            </script>

    </body>
</html>

