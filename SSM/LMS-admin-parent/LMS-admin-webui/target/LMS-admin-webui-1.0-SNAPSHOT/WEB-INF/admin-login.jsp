<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>login</title>
	<base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">

	<link rel="icon" href="${pageContext.request.contextPath}/fonts/燕窝.svg">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin-login.css" />


</head>
<body>
<header>
	<div id="adminLogin-head-icon">
		<a href="index.html">
			<img src="${pageContext.request.contextPath}/fonts/设置_管理.svg" />
		</a>
	</div>
	<div id="adminLogin-head-wel">
		<span>ForestSoul library manage system</span>
	</div>
</header>

<div id="adminLogin-form">
	<form method="post" action="admin/do/admin-login.html">
		<p>${requestScope.exception.message}</p>
		<div class="form-group">
			<label for="exampleInputEmail1">管理员账号</label>
			<input type="text" class="form-control" name="acct" id="exampleInputEmail1" placeholder="admin">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">密码</label>
			<a href="#" id="adminLogin-form-pw">遗忘了密码 ?</a>
			<input type="password" class="form-control" name="pw" id="exampleInputPassword1" placeholder="Password">
		</div>
		<button type="submit" id="adminLogin-form-sub" class="btn btn-default">登录</button>
	</form>
</div>

<div id="adminLogin-new-ac">
	<span>Back user sign in?</span>
	<a href="login.html">Click here!</a>
</div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/script/bootstrap.min.js" ></script>
</body>
</html>