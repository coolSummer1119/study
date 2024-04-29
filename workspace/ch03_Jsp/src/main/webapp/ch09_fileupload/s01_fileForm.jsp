<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
								<!--	꼭 포스트**enctype을 명시하지 않으면 정상 업로드 하더라도 처리가 안됨 -->
<form action="/ch03_Jsp/fileUpload" method="post" enctype="multipart/form-data">
	작성자<input type="text" name="user"><br>
	제목 <input type="text" name="title"><br>
	파일명 <input type="file" name="uploadFile"><br>
	<input type="submit" value="파일 올리기">
</form>
</body>
</html>