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
    <!--引入jquery-->
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <!-- 引入Bootstrap -->
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container-fluid">
            <%--     标题显示   --%>
            <div class="row">
                <div class="col-md-12" align="center"><h3>图书管理</h3></div>
            </div>
            <%--     按钮操作  --%>
            <div class="row">
                <div class="col-md-9"></div>
                <div class="col-md-offset-3">
                    <button type="button" class="btn btn-info" id="add_book">添加</button>
                    <button type="button" class="btn btn-danger " id="del_book">删除</button>
                    <button type="button" class="btn btn-primary" id="find_book">查询</button>
                </div>
            </div>
            <%--        表单内容    --%>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover">
                        <thead align="center">
                        <tr >
                            <td><input type="checkbox" id="check_all"></td>
                            <td>编号</td>
                            <td>书名</td>
                            <td>作者</td>
                            <td>书室</td>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody id="tbody"  align="center">

                        </tbody>
                    </table>
                </div>
            </div>
            <%--   页脚信息         --%>
             <div class="row">
                <div class="col-md-6" id="page-ye"></div>
                <div class="col-md-6" id="page-tiao"></div>
             </div>
    </div>

    <!--===========================================书籍添加============================================-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加书籍</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bid" id="bid" placeholder="请输入书籍编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">书名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bname" id="bname" placeholder="请输入书名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">书室</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="room" id="abook">

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="add_books">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!--===========================================书籍查询============================================-->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" >查询书籍</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bid" id="bid2" placeholder="请输入你要查询的编号">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">书名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bid" id="bname2" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bid" id="author2" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">书室</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bid" id="room2" >
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="find_books">查询</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!--===========================================书籍修改============================================-->
    <div class="modal fade" id="modal_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" >修改书籍</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="text" id="bid3" disabled="disabled">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">书名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="bname" id="bname3" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="author" id="author3" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">书室</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="room" id="edtbook">

                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="update_books">更新</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        //记录总记录数
        var allnum,num;
        $(function () {
            to_page(1)
        })
        // <!--===========================================所有书籍查询============================================-->
        //显示书籍表格
        function show_book_table(resp){
            $("tbody").empty();
            //获取所有表格信息
            var book=resp.map.page.list;
            //遍历得到每一本书
            $.each(book,function (index,item) {
                //获取书的每一个属性
                var bid=$("<td></td>").append(item.bid);
                var bname=$("<td></td>").append(item.bname);
                var author=$("<td></td>").append(item.author);
                var room=$("<td></td>").append(item.room);
                var check=$("<td><input type='checkbox' class='checkid'></td>")
                //得到编辑按钮

                var ed=$("<button></button>").addClass("btn btn-info btn-sm edt_btn").append($("<span></span>")
                    .addClass("glyphicon glyphicon-pencil")).append("编辑");
                ed.attr("edt_id",item.bid);
                //得到删除按钮
                var del=$("<button></button>").addClass("btn btn-danger btn-sm del_btn").append($("<span></span>")
                    .addClass("glyphicon glyphicon-trash")).append("删除");
                del.attr("del_id",item.bid);
                //得到组合
                var but=$("<td></td>").append(ed).append(del);

                $("<tr></tr>").append(check)
                    .append(bid)
                .append(bname)
                .append(author)
                .append(room)
                .append(but)
                .appendTo("#tbody")
            })
        }
        //显示分页信息
        function show_book_fen(resp) {
            $("#page-ye").text("共有"+resp.map.page.pages+"页，共有"+resp.map.page.total+"记录，当前页是"+resp.map.page.pageNum+"页")
            allnum=resp.map.page.total;
            num=resp.map.page.pageNum;
        }
        //显示分页条
        function show_book_tiao(resp) {
            $("#page-tiao").empty();
            //创建ul标签
            var ul=$("<ul></ul>").addClass("pagination");


            //创建首页和前一页
            var firstpage=$("<li></li>").append($("<a></a>").attr("href","javascript:void(0)").text("首页"));
            var prepage=$("<li></li>").append($("<a></a>").attr("href","javascript:void(0)").append("&laquo;"));
            //创建末页和后一页
            var lastpage=$("<li></li>").append($("<a></a>").attr("href","javascript:void(0)").text("末页"));
            var nextpage=$("<li></li>").append($("<a></a>").attr("href","javascript:void(0)").append("&raquo;"));

            //把首页和前一页加入ul
            ul.append(firstpage).append(prepage);

            //如果没有前一页，就把首页和前一页禁用
            if(!resp.map.page.hasPreviousPage){
                firstpage.addClass("disabled")
                prepage.addClass("disabled")
            }
            //如果没有前后页，就把首页和前一页禁用
            if(!resp.map.page.hasNextPage){
                lastpage.addClass("disabled")
                nextpage.addClass("disabled")
            }
            firstpage.click(function () {
                to_page(1)
            })
            prepage.click(function () {
                to_page(resp.map.page.pageNum-1)
            })
           lastpage.click(function () {
                to_page(resp.map.page.pages)
            })
            nextpage.click(function () {
                to_page(resp.map.page.pageNum+1)
            })

            //创建普通页
            $.each(resp.map.page.navigatepageNums,function (index,item) {
                var page=$("<li></li>").append($("<a></a>").attr("href","javascript:void(0)").text(item));
                if(item==resp.map.page.pageNum){
                    page.addClass("active");
                }
                page.click(function () {
                    to_page(item)
                })

                //把普通页加入ul
                ul.append(page);
            })

            //把后一页和最后一页加入ul
            ul.append(nextpage).append(lastpage);

            //创建nav并加入分页条
            $("<nav></nav>").append(ul).appendTo("#page-tiao")
        }
        //页面跳转
        function to_page(pn){
            $.ajax({
                url:"findall",
                type:"get",
                data:"pn="+pn,
                success:function (resp) {
                    //显示书籍表格
                    show_book_table(resp)
                    show_book_fen(resp)
                    show_book_tiao(resp)
                }
            })
        }
        <!--===========================================书籍添加============================================-->
        //点击添加按钮
        $("#add_book").click(function () {
            rest_form("#myModal form")
            //打开模态框
            $('#myModal').modal({
                backdrop:"static"
            })
            //显示书籍的书室信息
            book_room("#abook");
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
        //当书籍号放生变化时
        $("#bid").change(function () {
            $.ajax({
                url:"checkbid",
                data:{
                    bid:$("#bid").val(),
                },
                success:function (resp) {
                    //判断bid是否存在
                    if(resp.flag==false){
                        show_message("#bid","error",resp.map.msg);
                        $("#bname").prop("disabled","disabled");
                        $("#author").prop("disabled","disabled");
                    }
                    else {
                        show_message("#bid","success",resp.map.msg);
                        $("#bname").removeAttr("disabled")
                        $("#author").removeAttr("disabled")
                    }
                }
            })
        })
        //验证书记号是否正确
        function yanbid() {
            var bid=$("#bid").val();
            if(bid<1000||bid>9999){
                show_message("#bid","error","对不起，书籍号必须是1000到9999之间的数");
                return false;
            }
            return true;
        }
        //获取书室信息并放在下拉列表中
        function book_room(ele){
            $(ele).empty();
            $.ajax({
                url:"findroom",
                success:function (resp) {
                    //遍历得到每一本书的书室
                    // alert(resp.map.book);
                    $.each(resp.map.book,function () {
                        $("<option></option>").append(this.room).appendTo(ele);
                    })
                }
            })
        }
        //点击保存按钮
        $("#add_books").click(function () {
            if(!yanbid()){
                return false;
            }
            $.ajax({
                url:"addbook",
                //$("#emp_add form").serialize()是jquery中提供的获取表单域的内容
                data:$("#myModal form").serialize(),
                success:function (resp) {
                    //先关闭模态框
                    $('#myModal').modal('hide')
                    //跳转到最后一页
                    to_page(allnum);
                }
            })
        })
        //<!--===========================================书籍查询============================================-->
        //点击总查询按钮时
        $("#find_book").click(function () {
            $("#modal").modal({
                backdrop:"static"
            })
            rest_form("#modal form");
        })
        //当书籍号放生变化时
        $("#bid2").change(function () {
            $("#bname2").val("");
            $("#author2").val("");
            $("#room2").val("");
            $.ajax({
                url:"find_book",
                data:{
                    bid:$("#bid2").val(),
                },
                success:function (resp) {
                    if(resp.flag==false){
                        show_message("#bid2","error",resp.map.msg);
                        $("#find_books").prop("disabled","disabled");
                    }else {
                        show_message("#bid2","success","");
                        $("#find_books").removeAttr("disabled");
                    }

                }
            })
        })
        //点击查询按钮时
        $("#find_books").click(function () {
                $.ajax({
                    url:"find_book",
                    data:{
                        bid:$("#bid2").val(),
                    },
                    success:function (resp) {
                       $("#bid2").val(resp.map.books.bid);
                       $("#bname2").val(resp.map.books.bname);
                       $("#author2").val(resp.map.books.author);
                       $("#room2").val(resp.map.books.room);
                    }
                })
        })
        //进行表单的内容和格式的重置
        function rest_form(ele){
            //重置表单内容,jquery没有reset方法，要转为dom对象
            $(ele)[0].reset();
            //重置表格的边框颜色
            $(ele).find("*").removeClass("has-error has-success");
            //重置表单中带有help-black的span标签的内容
            $(ele).find(".help-block").text("");
        }
        <!--===========================================书籍修改============================================-->
        //因为修改按钮是后来获取数据得到的，所有使用on
        $(document).on("click",".edt_btn",function () {
            //先获取书籍的书室
            book_room("#edtbook");
            //获取书籍信息，首先要获取要编辑的bid：
            // 方法一：可以先找到编辑按钮，再找到编辑按钮的父元素tr，找到tr的第一个子元素bid
           // 方法二：在定义编辑按钮时添加一个属性用来存储bid
            $.ajax({
                url:"findbooks",
                data:"bid="+$(this).attr("edt_id"),
                success:function (resp) {
                    $("#bid3").val(resp.map.b.bid);
                    $("#bname3").val(resp.map.b.bname);
                    $("#author3").val(resp.map.b.author);
                    $("#edtbook").val(resp.map.b.room);
                }
            })
           //弹出模态框
            $("#modal_update").modal({
                backdrop:"static"
            })
            //把书籍的id值传递给更新按钮
            $("#update_books").attr("bid",$(this).attr("edt_id"));
        })
        //点击修改按钮
        $("#update_books").click(function () {
            //进行ajax请求修改数据
            $.ajax({
                url:"updatebook",
                data:{
                    bid:$(this).attr("bid"),
                    bname:$("#bname3").val(),
                    author:$("#author3").val(),
                    room:$("#edtbook").val()
                },
                // data:$("#modal_update form").serialize(),
                success:function (resp) {
                    //显示操作信息
                    alert(resp.map.msg);
                    //关闭模态框
                    $("#modal_update").modal("hide");
                    //回到本业
                    to_page(num);
                }
            })
        })
        <!--===========================================书籍删除============================================-->
        //点击删除按钮进行单个删除
        $(document).on("click",".del_btn",function () {
            var name=$(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确认删除【"+name+"】吗")) {
                    $.ajax({
                        url:"delbook",
                        data:"bid="+$(this).attr("del_id"),
                        success:function (resp) {
                            alert(resp.map.msg);
                            to_page(num)
                        }
                    })
                }

        })
        //全选和全不选
        $("#check_all").click(function () {
                //让所有的框的状态和checkall相同
                $(".checkid").prop("checked",$(this).prop("checked"));
        })
        $(document).on("click",".checkid",function () {
            //判断选中状态的的状态框数量是否等于状态框的数量
               var flag= $(".checkid:checked").length==$(".checkid").length;
               $("#check_all").prop("checked",flag);
        })
        //点击删除按钮进行多个删除
        $("#del_book").click(function () {
            var names="";
            var bids="";
            //找到要删除书籍的名称
            $.each($(".checkid:checked"),function () {
              names=names+$(this).parents("tr").find("td:eq(2)").text()+",";
              bids=bids+$(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            //去掉名称的最后一个逗号
            names.substring(0,names.length-1);
            bids.substring(0,bids.length-1);
            if(confirm("确定要删除【"+names+"】吗")){
                    $.ajax({
                        url:"delbooks",
                        data:"bid="+bids,
                        success:function (resp) {
                                alert(resp.map.msg);
                                to_page(num)
                        }
                    })
            }


        })

    </script>
</body>
</html>

