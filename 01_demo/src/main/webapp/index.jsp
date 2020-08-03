<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工查询页面</title>
    <base href="<%=basePath%>"/>
    <!--引入jquery-->
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <!-- 引入Bootstrap -->
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <!-- ===============================员工添加========================================== -->
    <div class="modal fade" id="emp_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="empName_add_input">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  id="empName_add_input" name="empName" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_add_input" name="email" placeholder="Email@123.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gener</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gener" id="genge1_add_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gener" id="genge2_add_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">DepartmenName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_add_input">
                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="but_save">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ===============================员工修改========================================== -->
    <div class="modal fade" id="emp_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="empName_add_input">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="emp_update_name"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_update_input" name="email" placeholder="Email@123.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gener</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gener" id="genge1_update_input" value="男" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gener" id="genge2_update_input" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">DepartmenName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_update_input">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="but_update">更新</button>
                </div>
            </div>
        </div>
    </div>
        <%--    显示标题    --%>
    <div class="row">
        <div class="col-md-12">
            <h1>部门信息查询</h1>
        </div>
    </div>
    <%--    按钮显示    --%>
    <div class="row">
        <%--   让按钮偏移到右边 --%>
        <div class="col-md-3 col-md-offset-9" >
            <button class="btn btn-info" id="add">新增</button>
            <button class="btn btn-danger" id="deletes">删除</button>
        </div>
    </div>
    <%--    表格显示   --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="tab" >
                <thead>
                        <tr>
                            <th><input type="checkbox" id="checkall"></th>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                </thead>
                <tbody id="bo">

                </tbody>


            </table>
        </div>
    </div>
    <%--    页脚显示   --%>
    <div class="row">
        <!--显示文字信息-->
        <div class="col-md-6" id="page_info"></div>
        <!--显示列表信息-->
        <div class="col-md-6" id="page"></div>
    </div>

        <%--    一系列的操作--%>
    <script type="text/javascript">
        //页面加载完成后，发送axjx请求
        $(function () {
              to_page(1);
        })
            //获取总记录数
             var num;
            //记录当前页
            var ye;
            /*
            ======================================= 员工添加============================================
            * */
            //获取员工信息
            function gettabl(rep) {
            //先清除原来的数据
            $("#tab tbody").empty();
            var emp = rep.map.pageinfo.list;
            $.each(emp, function (index, item) {
                //添加编辑按钮
                var edbu = $("<button></button>").addClass("btn btn-info btn-sm edt_button").append($("<span></span>")
                    .addClass("glyphicon glyphicon-pencil")).append("编辑");
                //添加删除按钮
                var delbu = $("<button></button>").addClass("btn btn-danger btn-sm del_button").append($("<span></span>")
                    .addClass("glyphicon glyphicon-trash")).append("删除");
                //为删除按钮添加一个属性，用来保存员工信息
                $(delbu).attr("del_id",item.empId);
                //为编辑按钮添加一个属性，用来保存员工信息
                $(edbu).attr("up_id",item.empId);
                //添加一个复选框
                var che_but=$("<td><input type='checkbox' class='check_item' ></td>")
                var but = $("<td></td>").append(edbu).append(delbu);
                var idtd=$("<td></td>").append(item.empId);
                var nametd=$("<td></td>").append(item.empName);
                var genertd=$("<td></td>").append(item.gener);
                var emailtd=$("<td></td>").append(item.email);
                var detd=$("<td></td>").append(item.dep.deptName);
                $("<tr></tr>").append(che_but)
                    .append(idtd)
                    .append(nametd)
                    .append(genertd)
                    .append(emailtd)
                    .append(detd)
                    .append(but)
                    .appendTo("#tab tbody")

            })
        }
            //显示分页信息
            function fen1(rep) {
                //先清除原来的数据
                $("#page_info").empty();
                $("#page_info").append("当前是"+rep.map.pageinfo.pageNum+"页，共有"+rep.map.pageinfo.pages+" 页" +
                    "，共有"+rep.map.pageinfo.total+"记录");
                //获取总记录数
                num=rep.map.pageinfo.total;
                ye=rep.map.pageinfo.pageNum;
            }
            //显示分页条
            function fen2(rep) {
                // 先清除原来的数据
                $("#page").empty();
                var ul=$("<ul></ul>").addClass("pagination")

                //首页、末页
                var firstpage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var lastpage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
                //前一页、后一页标志
                var pre=$("<li></li>").append($("<a></a>").append("&laquo;"));
                var afr=$("<li></li>").append($("<a></a>").append("&raquo;"));

                //首页和前一页的禁用
                if(rep.map.pageinfo.hasPreviousPage==false){
                    firstpage.addClass("disabled");
                    pre.addClass("disabled")
                }
                //首页和前一页的跳转
                firstpage.click(function () {
                    to_page(1);
                })
                pre.click(function () {
                    //去当前页的前一页
                    to_page(rep.map.pageinfo.pageNum-1)
                })



                //尾页和后一页的禁用
                if(rep.map.pageinfo.hasNextPage==false){
                    lastpage.addClass("disabled");
                    afr.addClass("disabled")
                }
                // 尾页和后一页的跳转
                lastpage.click(function () {
                    to_page(rep.map.pageinfo.pages);
                })
                afr.click(function () {
                    //去当前页的下一页
                    to_page(rep.map.pageinfo.pageNum+1)
                })
                ul.append(firstpage).append(pre);
                $.each(rep.map.pageinfo.navigatepageNums,function (index,item) {
                    var uml=$("<li></li>").append($("<a></a>").append(item));
                    //如果当前页等于遍历的那页
                    if(rep.map.pageinfo.pageNum==item){
                        uml.addClass("active");
                    }
                    uml.click(function () {
                        to_page(item);
                    })
                    ul.append(uml);
                })
                ul.append(afr).append(lastpage);
                var nav=$("<nav></nav>").append(ul);
                $("#page").append(nav);
            }
            //进行页面跳转
            function to_page(pn) {
                $.ajax({
                    url:"${APP_PATH}emps",
                    data:"pn="+pn,
                    type:"get",
                    success:function (rep) {
                        //1、解析并获取成员数据
                        gettabl(rep);
                        //2解析显示分页信息
                        fen1(rep);
                        //3解析显示分条信息
                        fen2(rep);
                    }
                })
            }
            //点击添加按钮进行添加
            $("#add").click(function () {
                //重置模态框
                rest_form("#emp_add form");
                //查询部门信息
                dept_find("#dept_add_input");
                //弹出模态框
                $('#emp_add').modal({
                    backdrop:"static",
                })
            })
            //查询部门信息并显示
            function dept_find(ele) {
                $(ele).empty();
                $.ajax({
                    url:"${APP_PATH}depts",
                    type:"get",
                    success:function (res) {
                        //遍历得到的每一个部门信息
                        $.each(res.map.depts,function () {
                            var dept_sel=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                            dept_sel.appendTo(ele)
                        })
                    }
                })
            }
            //校验姓名和邮箱是否合法
            function jiao_form(){
                //============检验姓名=========================
                //1、获取要校验的姓名数据
                var name = $("#empName_add_input").val();
                //2、定义正则表达式
                var regx=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u4e00-\u9fa5_a-zA-Z0-9_]{2,7})/;
               if(!regx.test(name)){
                   show_msg("#empName_add_input","error","姓名必须是3到5位中文或6-16位英文");
                   return false;
               }
               else{
                   show_msg("#empName_add_input","success","");
               }

                //============检验姓名=========================
                //1、获取要校验的邮箱数据
                var email = $("#email_add_input").val();
                //2、定义正则表达式
                var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                if(!reg.test(email)){
                    show_msg("#email_add_input","error","邮箱格式不正确");
                    return false;
                }
                else{
                    show_msg("#email_add_input","success","");
                }
                return  true;
            }
            //校验方法信息显示
            function show_msg(ele,status,msg){
                //先清空原来的信息
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg)
                }else if("error"==status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg)
                }

            }
            //检验是否有重名的员工存在
            $("#empName_add_input").change(function () {
                var empname=this.value;
                $.ajax({
                    url:"${APP_PATH}check",
                    data:"empname="+empname,
                    type:"post",
                    success:function (rep) {
                        if(rep.flag==true){
                            show_msg("#empName_add_input","success","用户名可用");
                            $("#but_save").attr("va","success");
                        }else {
                            show_msg("#empName_add_input","error",rep.map.va_msg);
                            $("#but_save").attr("va","error");
                        }
                    }
                })
            })
            //进行表单的内容和格式的重置
            function rest_form(ele){
                //重置表单内容,jquery没有充值方法，要转为dom对象
                $(ele)[0].reset();
                //重置表格的边框颜色
                $(ele).find("*").removeClass("has-error has-success");
                //重置表单中带有help-black的span标签的内容
                $(ele).find(".help-block").text("");
            }
            //点击保存按钮时，添加员工
            $("#but_save").click(function () {
                    //先对要提交的数据进行校验
                    if(!jiao_form()){
                        //不在往下进行
                        return false;
                    }
                    //再检验用户名是否存在
                    if($("#but_save").attr("va")=="error"){
                        //不在往下进行
                        return  false;
                    }
                    $.ajax({
                        url:"${APP_PATH}empsadd",
                        type:"get",
                        //$("#emp_add form").serialize()是jquery中提供的获取表单域的内容
                        data:$("#emp_add form").serialize(),
                        success:function (rep) {
                               //成功后，先关闭模态框
                            $("#emp_add").modal('hide');
                            /*
                            返回最后一页，
                            pageinfo规定，当返回的页数超过总页数，返回最后一页
                            **/
                            //num表示总记录数
                            to_page(num);
                        }
                    })
            })

            /*
           ======================================= 员工修改============================================
           */

            /*
            *       无法使用$(".edt_button").click(function(){
            *       })
            *       因为编辑按钮以及那些员工信息是在绑定单击事件之后才创造出来的，所以没有效果
            *       使用on方法可以有效，即使这个元素是以后再添加进来的也有效。
            * */
            //点击编辑按钮跳出mo态框
            $(document).on("click",".edt_button",function () {
                //重置模态框
                rest_form("#emp_update form");
                //查询部门信息
                dept_find("#dept_update_input");
                //弹出模态框
                $("#emp_update").modal({
                    backdrop:"static",
                })
                //查询员工信息
                //先找到员工的id,因为编辑按钮有一个属性表示当前员工的id
                var id=$(this).attr("up_id");
                //为跟新按钮添加一个属性，用来保存员工信息
                $("#but_update").attr("update_id",id);
                emp_find(id);
        })
            //查询员工信息并显示
            function emp_find(id) {
                $.ajax({
                    url:"${APP_PATH}emp_find/"+id,
                    type:"get",
                    success:function (rep) {
                        // console.log(rep);
                        var empdata=rep.map.emp;
                        $("#emp_update_name").text(empdata.empName);
                        $("#email_update_input").val(empdata.email);
                        $("#emp_update input[name=gener]").val([empdata.gener]);
                        $("#dept_update_input ").val([empdata.dId]);
                    }
                })
            }
            //点击跟新按钮时完成更新
            $("#but_update").click(function () {
                //第一步先进行邮箱验证
                //第二步，邮箱验证通过后，向后台发送ajax请求保存新的员工数据
                    $.ajax({
                        url:"${APP_PATH}update/"+$(this).attr("update_id"),
                        type:"get",
                        //serialize()将表格中的内容转为字符串
                        data:$("#emp_update form").serialize(),
                        success:function (rep) {
                                //关闭模态框
                                 $("#emp_update").modal("hide");
                                //回到本页面
                                 to_page(ye);
                        }
                    })
            })
        /*
          ======================================= 员工修改============================================
          */
        //点击删除按钮进行单个员工删除
        $(document).on("click",".del_button",function () {
            //获取员工姓名(先找到他的父元素tr，再找到tr的第二个td，获取td的内容)
           var ename= $(this).parents("tr").find("td:eq(2)").text();
            //弹出对话框确认是否删除
            if(confirm("确定要删除【"+ename+"】吗")){
                //发送ajax请求
                $.ajax({
                    url:"${AAP_PATh}emp_del/"+$(this).attr("del_id"),
                    type:"post",
                    success:function (rep) {
                        alert(rep.msg)
                        //回到本页
                        to_page(ye);
                    }
                })
            }

        })
        //全选全不选功能
        $("#checkall").click(function () {
            /*
                prop修改和查询原生属性的值
                attr获取自定义属性的值
            * */
            //让其他的复选框的状态和checkall这个复选框的状态保持一致
            $(".check_item").prop("checked",$(this).prop("checked"));
        })
        //复选框c_but的属性
        $(document).on("click",".check_item",function () {
            // alert($("#c_but").prop("checked"));
            //先判断复选框选中的数量是否和复选框的数量相同
            //:checked表示被选中的复选框
            var f=$(".check_item:checked").length== $(".check_item").length;
            //如果相同就让checkall复选框被选中(如果f为true，就选中，部位true，就不选)
            $("#checkall").prop("checked",f);
        })
        //点击删除进行多个删除
        $("#deletes").click(function () {
  /*******************************姓名组合******************************************/
            //获取要删除的姓名(通过被选中的复选框找到他的父元素tr，再找到他的第三个td，再获取内容)
            var enames="";
           $.each( $(".check_item:checked"),function () {
                enames+=$(this).parents("tr").find("td:eq(2)").text()+",";
           })
            //去除姓名多余的逗号
            enames.substring(0,enames.length-1);
    /*******************************id组合******************************************/
            //获取要删除的姓名(通过被选中的复选框找到他的父元素tr，再找到他的第二个td，再获取内容)
            var ids="";
            $.each( $(".check_item:checked"),function () {
                ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            //去除姓名多余的逗号
            ids.substring(0,enames.length-1);
           if(confirm("确定要删除【"+enames+"】吗")){
                $.ajax({
                    url:"${APP_PATH}emp_delete/"+ids,
                    type:"get",
                    success:function (rep) {
                        alert(rep.msg)
                        //回到本页
                        to_page(ye);
                    }
                })
           }

        })
    </script>
</body>
</html>

