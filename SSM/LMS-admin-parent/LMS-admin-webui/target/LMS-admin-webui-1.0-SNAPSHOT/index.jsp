<%--
  Created by IntelliJ IDEA.
  User: 31641
  Date: 2022/5/24
  Time: 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
  </head>
  <body>
    <a href="${pageContext.request.contextPath}/test/ssm.html">测试SSM整合环境</a>

    <br/>

  <button id="but1">stu</button>
  <button id="but2">点我弹窗</button>

  <script type="text/javascript" src="jQuery/jquery.min.js"></script>
  <script type="text/javascript" src="layer/layer.js"></script>
  <script type="text/javascript">
    $(function () {
      $("#but1").click(function () {
        var Student = {
          "stuId":5,
          "stuName":"tom",
          "address":{
            "province":"广东",
            "city":"深圳",
            "street":"后端"
          },
        "subjectList":[{
          "subjectName":"javaSE",
          "subjectScore":"99"
        },{
          "subjectName":"javaSE",
          "subjectScore":"99"
          }
        ],
          "map":{
            "k1":"v1",
            "k2":"v2"
          }
        }
        var requestBody = JSON.stringify(Student);
        $.ajax({
          "url":"send/compose/object.json",
          "type":"post",
          "data":requestBody,
          "contentType":"application/json;charset=UTF-8",
          "dataType":"json",
          "success":function (response) {
              console.log(response);
          },
          "error":function (response) {
              console.log(response);
          }
        })

      });

      $("#but2").click(function () {
        layer.msg("layer弹框")
      });
    });
  </script>
  </body>
</html>
