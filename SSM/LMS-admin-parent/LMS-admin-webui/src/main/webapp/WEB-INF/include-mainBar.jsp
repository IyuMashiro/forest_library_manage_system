<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/28
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<div class="LMS-main-bar" id="bar1">
    <ul class="nav nav-tabs" >
        <li  role="presentation" class="active"><a href="${pageContext.request.contextPath}/admin/get/page.html">管理员账号管理</a></li>
        <li  role="presentation"><a href="#">普通用户账号管理</a></li>
    </ul>
</div>

<div class="LMS-main-bar" id="bar2">
    <ul class="nav nav-tabs" >
        <li  role="presentation" class="active"><a href="#">图书管理</a></li>
        <li  role="presentation"><a href="#">已下架图书</a></li>
        <li  role="presentation"><a href="#">已借完图书</a></li>
        <li  role="presentation"><a href="#">已售罄图书</a></li>
    </ul>
</div>

<div class="LMS-main-bar" id="bar3">
    <ul class="nav nav-tabs" >
        <li  role="presentation" class="active"><a href="#">借阅管理</a></li>
        <li  role="presentation"><a href="#">已借阅书籍</a></li>
        <li  role="presentation"><a href="#">未借阅书籍</a></li>
        <li  role="presentation"><a href="#">逾期书籍</a></li>
    </ul>
</div>



<div class="LMS-main-bar"id="bar4">
    <ul class="nav nav-tabs" >
        <li  role="presentation" class="active"><a href="#">订单管理</a></li>
        <li  role="presentation"><a href="#">未支付订单</a></li>
        <li  role="presentation"><a href="#">已付款订单</a></li>
        <li  role="presentation"><a href="#">已完成订单</a></li>
        </ul>
</div>
