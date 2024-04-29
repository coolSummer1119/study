<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response.sendRedirect() 테스트</title>
</head>
<body>
현재 페이지는 s09_responseA.jsp 입니다.
화면에 보여지지 않습니다.
</body>
</html>
그래서 이렇게 없어도 됨.
 -->
<!-- 위 메모리가 불러들여 왔다가 아래 sendRedirect 때문에 다시 없어짐. -->
<% 
response.sendRedirect("s10_responseB.jsp"); 
%>