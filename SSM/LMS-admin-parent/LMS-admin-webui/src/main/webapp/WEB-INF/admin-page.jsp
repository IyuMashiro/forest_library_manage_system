<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/5/26
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="zh-CN">
<%@include file="/WEB-INF/include-head.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css"/>
<body>

<%@include file="/WEB-INF/include-nav.jsp" %>

<%@include file="/WEB-INF/include-sidebar.jsp" %>

<%@include file="/WEB-INF/include-mainBar.jsp" %>

<div id="LMS-main">
    <img id="LMS-main-icon" src="${pageContext.request.contextPath}/fonts/设置_管理.svg"/>
    <div id="LMS-main-content">
        <form action="${pageContext.request.contextPath}/admin/get/page.html" method="post" class="navbar-form navbar-left">
            <div class="form-group">
                <input name="keyword" type="text" class="form-control" placeholder="请输入查询条件">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

        <button id="LMS-main-add" type="button" class="btn btn-primary"><img class="LMS-main-icon" src="${pageContext.request.contextPath}/fonts/加.svg"> 新增</button>


        <table class="table" id="LMS-tb">
            <tr id="LMS-tb-head">
                <th>id</th>
                <th>账号名</th>
                <th>用户名</th>
                <th>密码</th>
                <th>注册时间</th>
                <th>操作</th>
            </tr>
            <c:if test="${empty requestScope.pageInfo.list}">
                <tr>
                    <td colspan="5">抱歉！没有查询到您要的数据！</td>
                </tr>
            </c:if>
            <c:if test="${!empty requestScope.pageInfo.list}">
                <c:forEach items ="${requestScope.pageInfo.list}" var="admin" varStatus="myStatus">
                    <tr>
                        <td>${admin.id}</td>
                        <td>${admin.loginAcct}</td>
                        <td>${admin.name}</td>
                        <td>${admin.password}</td>
                        <td>${admin.createDate}</td>
                        <td>
                            <button type="button" class="btn btn-success"><img class="LMS-main-icon" src="${pageContext.request.contextPath}/fonts/完成.svg"></button>
                            <button type="button" class="btn btn-info LMS-main-edit"><img class="LMS-main-icon" src="${pageContext.request.contextPath}/fonts/配置.svg"></button>
                            <button type="button" class="btn btn-danger LMS-main-remove"><img class="LMS-main-icon" src="${pageContext.request.contextPath}/fonts/删除.svg"></button>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>

        <nav aria-label="Page navigation" >
            <div id="LMS-main-page">
                <div class="pagination" id="pagination"></div>
            </div>

        </nav>

    </div>
</div>


<div id="LMS-foot">

</div>

<script src="${pageContext.request.contextPath}/script/admin-page.js"></script>
<script src="${pageContext.request.contextPath}/jQuery/jquery.pagination.js"></script>
<script type="text/javascript">
    $(function(){
        initPagination();

        $(".LMS-main-remove").on("click",function () {

            var id = $(this).parent().prevAll().eq(4).text();

            var flag = confirm("确定删除？")

            if (flag){
                window.location.href = "${pageContext.request.contextPath}/admin/remove/"+id+"/${requestScope.pageInfo.pageNum}/${param.keyword}.html"
            }

        })

        $("#LMS-main-add").on("click",function () {
            window.location.href = "${pageContext.request.contextPath}/admin/to/add/page.html"
        })
        $(".LMS-main-edit").on("click",function () {
            var id = $(this).parent().prevAll().eq(4).text();
            var loginAcct = $(this).parent().prevAll().eq(3).text();
            window.location.href = "${pageContext.request.contextPath}/admin/to/edit/page.html?adminId="+id+"&pageNum=${requestScope.pageInfo.pageNum}&keyword=${param.keyword}&loginAcct="+loginAcct
        })

    });

    function initPagination(){
        //获取总记录数
        var totalRecord = ${requestScope.pageInfo.total};

        //声明一个JSON对象储存Pagination要设置的属性
        var properties  = {
            num_edge_entries:3,                         //边缘页数
            num_display_entries:5,                      //主体页数
            callback:pageSelectCallback,
            items_per_page:${requestScope.pageInfo.pageSize},
            current_page: ${requestScope.pageInfo.pageNum - 1},
            prev_text:"上一页",
            next_text:"下一页"
        };

        $(".pagination").pagination(totalRecord,properties)
    }
    //用户点击 分页页码实现页面跳转
    function pageSelectCallback(pageIndex,jQuery) {
        var pageNum = pageIndex + 1;



        window.location.href = "${pageContext.request.contextPath}/admin/get/page.html?pageNum="+pageNum+"&keyword=${param.keyword}";

        //取消超链接的默认行为
        return false;
    }
</script>
</body>
</html>