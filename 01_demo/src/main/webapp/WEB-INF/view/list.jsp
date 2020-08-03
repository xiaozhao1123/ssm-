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
        <div class="container">
                <%--    显示标题    --%>
                <div class="row">
                    <div class="col-md-12">
                        <h1>部门信息查询</h1>
                    </div>
                </div>
                    <%--    按钮显示    --%>
                <div class="row">
                <%--   让按钮偏移到右边 --%>
                    <div class="col-md-4 col-md-offset-8">
                        <button class="btn btn-info">新增</button>
                        <button class="btn btn-danger">删除</button>
                    </div>
                </div>
                    <%--    表格显示   --%>
                <div class="row">

                    <div class="col-md-12">
                        <table class="table table-hover">
                            <tr>
                                <th>#</th>
                                <th>empName</th>
                                <th>gender</th>
                                <th>email</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageinfo.list}" var="emp">
                                <tr>
                                    <th>${emp.empId}</th>
                                    <th>${emp.empName}</th>
                                    <th>${emp.gener}</th>
                                    <th>${emp.email}</th>
                                    <th>${emp.dep.deptName}</th>
                                    <th>
                                        <button class="btn btn-info btn-sm">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                            编辑
                                        </button>
                                        <button class="btn btn-danger btn-sm">
                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            删除
                                        </button>
                                    </th>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                </div>
                    <%--    页脚显示   --%>
                <div class="row">
                    <!--显示文字信息-->
                    <div class="col-md-6">
                        当前第${pageinfo.pageNum}页,总共有${pageinfo.pages}页,共有${pageinfo.total}条记录
                    </div>
                    <!--显示列表信息-->
                    <div class="col-md-6">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li><a href="${APP_PATH}emp?pn=${pageinfo.firstPage}">首页</a></li>
                                <c:if test="${pageinfo.hasPreviousPage}">
                                    <li>
                                        <a href="${APP_PATH}emp?pn=${pageinfo.pageNum-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach items="${pageinfo.navigatepageNums}" var="page_num">
                                <%-- pageinfo.pageNum表示当前页面，page_num你取到的页数，如果这两个相等，则图标变亮--%>
                                    <c:if test="${pageinfo.pageNum==page_num}">
                                        <li class="active"><a href="#">${page_num}</a></li>
                                    </c:if>
                                        <%--   发送请求取你要去的页数    --%>
                                    <c:if test="${pageinfo.pageNum!=page_num}">
                                        <li ><a href="${APP_PATH}emp?pn=${page_num}">${page_num}</a></li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageinfo.hasNextPage}">
                                    <li>
                                        <a href="${APP_PATH}emp?pn=${pageinfo.pageNum+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li><a href="${APP_PATH}emp?pn=${pageinfo.lastPage}">尾页</a></li>
                            </ul>
                        </nav>
                    </div>

                </div>
        </div>
</body>
</html>

