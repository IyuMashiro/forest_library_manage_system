<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/6/1
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>add admin</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css" />
</head>
<body>
<header>
    <div id="register-head-icon">
        <a href="${pageContext.request.contextPath}/admin/get/page.html?pageNum=${param.pageNum}&keyword=${param.keyword}">
            <img src="${pageContext.request.contextPath}/fonts/燕窝.svg" />
        </a>
    </div>
    <div id="register-head-wel">
        <span>Add a new admin</span>
    </div>
</header>

<div id="register-form">
    <form action="${pageContext.request.contextPath}/admin/save.html" method="post" role="form">
        <p>${requestScope.exception.message}</p>
        <div class="form-group">
            <label for="exampleInputEmail1">管理员账号</label>
            <input type="text" class="form-control" name="loginAcct" id="exampleInputUser1" placeholder="Shakespeare">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">用户名</label>
            <input type="text" class="form-control" name="name" id="exampleInputEmail1" placeholder="Shakespeare">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">密码</label>
            <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="Password">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">确定密码</label>
            <input type="password" class="form-control" id="exampleInputPassword2" placeholder="rePassword">
        </div>
        <button type="submit" id="register-form-sub" class="btn btn-default">添加</button>
    </form>
</div>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/script/bootstrap.min.js" ></script>
</body>
</html>
