<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有书籍</title>
</head>
<link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">
<script type="text/javascript">
    window.onload = function () {
        document.getElementById("del").onclick=function () {

        }
    }
    //此处函数名不能与window.confirm("确认删除？")中confirm相同否则报错
    function conf(bookId) {
        if (window.confirm("确认删除？")) {
            window.location.href = "${pageContext.request.contextPath}/book/delete/" + bookId;
        }
    }
</script>
<body>

<div class="container">
    <h1 align="center">书籍列表</h1>
    <hr>
    <br>

    <div class="row clearfix">
        <div class="row">

            <div class="col-md-4 column">
                <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">回到主界面</a>
                &nbsp;
                <a href="${pageContext.request.contextPath}/book/listAll" class="btn btn-primary">显示所有书籍</a>
            </div>

            <div class="col-md-8 column">
                <form action="${pageContext.request.contextPath}/book/queryBookByName" method="post"
                      class="form-inline" style="float: right">
                    <span style="color: red;font-weight: bold">${error}</span>
                    <input type="text" name="queryName" placeholder="输入要查询的书名" class="form-control" required>
                    <input type="submit" value="查询" class="btn btn-primary">
                </form>
            </div>

        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书籍编号</th>
                    <th>书籍名称</th>
                    <th>书籍数量</th>
                    <th>书籍详情</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="book" items="${bookList}">
                    <tr>
                        <td>${book.bookId}</td>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="javascript:void(0)" class="btn btn-primary"
                               onclick="conf(${book.bookId})">删除书籍</a>&nbsp;
                            <a href="${pageContext.request.contextPath}/book/toUpdate/${book.bookId}" class="btn btn-primary"
                               onclick="">修改书籍</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row clearfix">
        <div class="row">
            <div class="col-md-4 column">
                <a href="${pageContext.request.contextPath}/book/toAddBook" class="btn btn-primary">添加书籍</a>
            </div>
            <div class="col-md-4 column">
            </div>
            <div class="col-md-4 column" >
                <a style="float: right" href="${pageContext.request.contextPath}/book/signOut" class="btn btn-primary">退出登录</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
