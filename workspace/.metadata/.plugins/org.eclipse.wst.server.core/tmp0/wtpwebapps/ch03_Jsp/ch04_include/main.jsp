<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 디렉티브</title>
</head>
<body>
<!-- 마치 파일안에 변수가 있는것 처럼 -->
이미지 경로 : <%= img_path %><br>
파일 경로 : <%= file_path %>

</body>
</html>