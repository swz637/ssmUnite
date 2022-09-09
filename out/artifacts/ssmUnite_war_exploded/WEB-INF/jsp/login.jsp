<%--
  Created by IntelliJ IDEA.
  User: 637
  Date: 2022/8/28
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link href="https://www.bootcss.com/p/layoutit/css/bootstrap-combined.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
    window.onload = function () {
        if (${msg}){

        }else {
            let element = document.getElementById("msg1");
            element.innerText="用户名或密码错误"
        }
    }
</script>

<body>
<div class="container-fluid">
    <h1 align="center">用户登录</h1>
    <hr>
    <br>

    <div class="row-fluid">
        <div class="span4">
        </div>
        <div class="span8">
            <form class="form-horizontal" method="post" action="/book/Login">

                <div class="control-group">
                    <div id="msg1" style="color: red;font-weight: bold" class="controls"></div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputName">用户名</label>
                    <div class="controls">
                        <input id="inputName" type="text" name="uName"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">密码</label>
                    <div class="controls">
                        <input id="inputPassword" type="password" name="pwd"/>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <label class="checkbox"><input type="checkbox" /> Remember me</label>
                        <button type="submit" class="btn">登陆</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
</body>
</html>
