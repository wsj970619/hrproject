<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>员工展示</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <style>
        #container {
            width: 800px;
            margin: 10px auto;
        }

        #container .selected {
            background: #337ab7
        }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

    <script>
        $(document).ready(function () {

            $("#add").click(function () {
                $("#modalBody").html("");
                $("#modalBody").load("showAdd");
                $("#modalLabel").text("新增")
                $("#modal").modal("show");
            });

            //可以监听模态框打开或关闭的事件
            $('#modal').on('show.bs.modal', function () {
                console.log('模态框即将显示');
            });

            $('#modal').on('hidden.bs.modal', function () {
                console.log('模态框已关闭');
            });

            var id = -1;
            /*  搜索执行一次后，发现无法通过单机选中表格中的行
            在 #search 的 click 事件中，旧的 .data 行被移除（使用了 $(".data").remove();），然后通过 JavaScript 动态插入新的 .data 行。
            使用 $(".data").click(function () {...}) 是静态绑定方式，只对当前页面中存在的 .data 元素生效。
                $(".data").click(function () {
                $(".data").removeClass("selected");
                $(this).addClass("selected");
                id = $(this).data("id");
            })*/
            /*使用 $(document).on("click", ".data", function () {...}) 可以确保即使 .data 行是动态插入的，也能正常响应点击事件。
这种方式称为 事件委托，它利用了事件冒泡机制，将事件监听器绑定到文档的某个父级元素上，从而支持动态内容的交互。*/
            $(document).on("click",".data",function () {
                $(".data").removeClass("selected");
                $(this).addClass("selected");
                id = $(this).data("id");
            })

            $("#update").click(function () {
                if (id >= 0) {
                    $("#modalBody").html("");
                    $("#modalBody").load("showUpdate?id=" + id );
                    $("#modalLabel").text("修改")
                    $("#modal").modal("show");
                } else {
                    alert("请选中数据");
                }
            })
            $("#delete").click(function () {
                if (id >= 0) {
                    location.href = "delete?id=" + id;
                } else {
                    alert("请选中数据");
                }
            })
            $("#search").click(function () {
                $.ajax({
                    url: "searchByCondition",
                    type: "post",
                    data: $("#searchForm").serialize(),
                    dataType: "json",
                    success: function (data) {
                        $(".data").remove();
                        for (var i = 0; i < data.length; i++) {
                            var tr = "<tr class='data' data-id=" + data[i].id + ">" +
                                "<td>" + data[i].number +
                                "</td><td>" + data[i].name +
                                "</td><td>" + data[i].gender +
                                "</td><td>" + data[i].age +
                                "</td><td>" + data[i].dep.name +
                                "</td>< /tr>"
                            $("table").append(tr);
                        }
                    }
                })
            });

          /*这段代码做了两件事：
                先执行 .serialize()
                再触发搜索
                但这个时候：
                    表单还没有被清空！
                因为：
                    type="reset" 是浏览器原生行为；
                你绑定的 click 事件是在它之前执行的；
                所以你在 JS 中获取到的是“清空前”的数据。*/
            $("#reset").click(function () {
                // 建议：延迟一下等 reset 生效
                setTimeout(function () {
                    $("#search").click(); // 触发搜索（此时表单已清空）
                }, 0);
            });


        })
    </script>
</head>
<body>

<div id="container">
    <form id="searchForm" class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-2">
                <input type="text" class="form-control" name="number"
                       placeholder="编号" value=${c.number}>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="name"
                       placeholder="姓名" value=${c.name}>
            </div>
            <div class="col-sm-2 ">
                <select name="gender" class="form-control">
                    <option value="">性别</option>
                    <option value="男" <c:if test="${c.gender =='男'}"> selected</c:if>>男</option>
                    <option value="女" <c:if test="${c.gender =='女'}"> selected</c:if>>女</option>
                </select>
            </div>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="age" placeholder="年龄"
                       value=${c.age!=null?c.age:''}>
            </div>

            <div class="col-sm-2 ">
                <select name="dep.id" class="form-control">
                    <option value="">部门</option>
                    <c:forEach items="${depList}" var="dep">
                        <option value="${dep.id }"
                                <c:if test="${dep.id ==c.dep.id}"> selected</c:if>>${dep.name }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-sm-1">
                <%--之前的hrsys_ssm_iframe里面是 button type="submit" 搭配
                <form action="search" class="form-horizontal" method="post">
                和后端的search方法实现按条件搜索--%>
                <button type="button" class="btn btn-primary" id="search">搜索</button>
            </div>
            <div class="col-sm-1">
                <button type="reset" class="btn btn-primary" id="reset">清空</button>
            </div>
        </div>
    </form>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th>编号</th>
            <th>名字</th>
            <th>性别</th>
            <th>年龄</th>
            <th>部门</th>
        </tr>

        <c:forEach items="${list}" var="data">
            <tr class="data" data-id="${data.id }">
                <td>${data.number }</td>
                <td>${data.name }</td>
                <td>${data.gender }</td>
                <td>${data.age }</td>
                <td>${data.dep.name }</td>
            </tr>
        </c:forEach>
    </table>
    <button type="button" class="btn btn-primary" id="add">新增</button>
    <button type="button" class="btn btn-primary" id="update">修改</button>
    <button type="button" class="btn btn-danger" id="delete">删除</button>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="modalLabel"></h4>
                </div>
                <div class="modal-body" id="modalBody">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>