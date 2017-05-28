<%--
  Created by IntelliJ IDEA.
  User: lucio
  Date: 28/05/2017
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %> 使用这个会提示报错--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
            <table class="table table-hover table-bordered" id="emps_tables">
                <thead>
                <tr>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示分页数据--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info_area"></div>
        <%--分页条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">
    //页面加载完成以后z直接去发送一个ajax请求,拿到分页数据
    $(function () { //页面加载完成以后
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=1",
            type: "GET",
            success: function (result) {
                //解析json,解析分页信息
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        })
    });
    /**
     * 解析json,添加表格数据
     * @param result
     */
    function build_emps_table(result) {
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {    //索引,当前页
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var gender = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var email = $("<td></td>").append(item.email);
            var deptId = $("<td></td>").append(item.department.deptId);

            var editBtn = $("<button></button>")
                .addClass("btn btn-primary btn-sm")
                .append($("<span></span>"))
                .addClass("glyphicon glyphicon-star")
                .append("编辑");
            var delBtn = $("<button></button>")
                .addClass("btn btn-danger btn-sm")
                .append($("<span></span>"))
                .addClass("glyphicon glyphicon-inbox")
                .append("删除");

            var btnId = $("<td></td>")
                .append(editBtn)
                .append(delBtn);

            $("<tr></tr>").append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(deptId)
                .append(btnId)
                .appendTo("#emps_tables tbody");
        });
    }

    /**
     * 解析分显示分页信息
     * @param result
     */
    function build_page_info(result) {
        //当前页,总页,总条记录
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" +
            result.extend.pageInfo.total + "条记录");
    }

    /**
     * 解析分显示分页条数据,点击条有下一页
     * @param result
     */
    function build_page_nav(result) {
        //构建元素
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);
        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
</body>
</html>
