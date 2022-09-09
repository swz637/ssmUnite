<%--
  Created by IntelliJ IDEA.
  User: 637
  Date: 2022/8/25
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改书籍</title>
</head>
<link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">
<body>
<div class="container">
    <h1 align="center">添加书籍</h1>


    <form action="${pageContext.request.contextPath}/book/update" method="post">
        <input type="hidden" name="bookId" value="${aBook.bookId}">
        <div class="form-group">
            <label>书籍名称：</label>
            <input type="text" name="bookName" required class="form-control" value="${aBook.bookName}">
        </div>

        <div class="form-group">
            <label>书籍数量：</label>
            <input type="text" name="bookCounts" required class="form-control" value="${aBook.bookCounts}">
        </div>

        <div class="form-group">
            <label>书籍详情：</label>
            <input type="text" name="detail" required class="form-control" value="${aBook.detail}">
        </div>

        <input type="submit" value="提交" class="btn btn-primary">
    </form>
</div>
</body>
</html>
