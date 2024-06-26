<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="page-main">
	<h1 class="align-center">제품 등록</h1>
	<form action="insertTest.jsp" method="post" id=myForm>
		<ul><!-- 이름 가격 수량 원산지 -->
			<li>
				<label for="name">제품명</label>
				<input type="text" name="name" id="name" size="20" maxlength="10">
			</li>		
			<li>
				<label for="price">가격</label>
				<input type="number" name="price" id="price">
			</li>		
			<li>
				<label for="stock">수량</label>
				<input type="number" name="stock" id="stock">
			</li>		
			<li>
				<label for="origin">원산지</label>
				<input type="text" name="origin" id="origin" size="20" maxlength="10">
			</li>		
		</ul>
	<div class="align-center">
		<input type="submit" value="추가">
		<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
	</div>
	</form>	
</div>
</body>
</html>