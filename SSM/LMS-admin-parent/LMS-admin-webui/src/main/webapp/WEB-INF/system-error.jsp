<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/5/25
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<html>
<head>
    <title>系统错误</title>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system-error.css">
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">ForestSoulLibrary</a>
        </div>
    </div><!-- /.container-fluid -->
</nav>


        <div id="error-page-main">
            <img id="error-page-icon" src="${pageContext.request.contextPath}/fonts/网络错误404.svg">

            <div id="error-page-text">
                <span>系统似乎出现了些问题！正在加紧修复！</span>
                <br/>
                <span>错误原因：</span>
                ${requestScope.exception.message}
            </div>

        </div>
        <div id="error-page-form">
            <form>
                <div class="form-group">
                    <span>您可以向我们提交错误代码，帮助我们更快的修复</span>
                    <label for="exampleInputEmail1">错误代码</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Shakespeare">
                </div>

                <button type="submit" id="error-page-sub" class="btn btn-default">提交</button>
                <div class="center">OR</div>
                <button type="button" id="error-page-back" class="btn btn-default">返回主页面</button>
            </form>
        </div>


        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/script/bootstrap.min.js" ></script>
</body>
</html>
