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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">注册页面</h4>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="regist">注册</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            //打开模态框
            $("#myModal").modal({
                backdrop:"static"
            })
        })
            //当用户名发生进行用户名校验
            $("#username").change(function () {
                //去后台校验看是否满足
                $.ajax({
                    url:"checkname",
                    data:{
                        username:$("#username").val()
                    },
                    type:"get",
                    success:function (resp) {
                        if(resp.flag==true){
                            show_message("#username","success",resp.map.msg);
                            //为注册按钮添加一个属性
                            $("#regist").attr("falg","success");
                        }
                        else {
                            show_message("#username","error",resp.map.msg);
                            //为注册按钮添加一个属性
                            $("#regist").attr("falg","error");
                        }

                    }
                })
            })

            //进行用户名和密码校验
            function jiaoyan() {
            //用户名校验
            var name=$("#username").val();
            var username=/^[a-z0-9_-]{3,16}$/;
            if(!username.test(name)){
                show_message("#username","error","用户名必须是3到16位的英文");
                return false;
            }
            show_message("#username","success","用户名可用")
            return true;
        }
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
            //进行注册验证
            $("#regist").click(function () {
                //先进行用户名是否合法验证
                if(!jiaoyan()){
                    return false;
                }
                //进行用户是否重复验证
                if($("#regist").attr("falg")=="error"){
                    $("#regist").prop("disabled","disabled");
                    return false;
                }
                var name=$("#username").val();
                var word=$("#password").val();
                $.ajax({
                    url:"register",
                    data:{
                        username:name,
                        password:word
                    },
                    success:function (resp) {
                            alert(resp.map.msg+",前往登录页面")
                            location.href="login.jsp";
                    }
                })
        })

    </script>

</body>
</html>

