<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드 테스트</title>
</head>
<body>
forwardA.jsp페이지. 보여지지 않습니다
<!-- forward를 하면 a에서 만든 request를 B에서는 공유를 함. -->
</body>
</html>
<jsp:forward page="forwardB.jsp">
	<jsp:param value="오랜지" name="color"/>
</jsp:forward>