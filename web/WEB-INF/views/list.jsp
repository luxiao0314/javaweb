<%--
  Created by IntelliJ IDEA.
  User: lucio
  Date: 28/05/2017
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %> 使用这个会提示报错--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>员工列表</title>
    <%
        request.setAttribute("APP_PATH", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud -->
    <script type="text/javascript"
            src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--搭建显示页面--%>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-lg-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示表格数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered">
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender == "M" ? "男" : "女"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptName}</th>
                        <th>
                            <button type="button" class="btn btn-primary btn-sm" aria-label="Left Align">
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                                编辑
                            </button>
                            <button type="button" class="btn btn-danger btn-sm" aria-label="Left Align">
                                <span class="glyphicon glyphicon-inbox" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--显示分页数据--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6">
            当前记录数
        </div>
        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="...">
                <ul class="pagination">
                    <li><a href="#">首页</a></li>
                    <li class="disabled">
                        <a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">1</a></li>
                    <li class="disabled">
                        <a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
                    </li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>
