<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4개 기본객체와 영역</title>
</head>
<body>
<!-- 공유가 되지 않음 -->
<!-- pagecontext를 파일을 생성할때 개별적으로 생성이 되지 때문에 scopeA의 msg를 읽을 수 없음 -->
page 영역의 msg1 = <%= pageContext.getAttribute("msg1") %><br>
request 영역의 msg2 = <%= request.getAttribute("msg2") %><br>
<!-- 하나의 세션을 같이 공유함 //같은 클라이언트라면 하나의 세션을 공유하지만 다른 클라이언트면 공유 x-->
session 영역의 msg3 = <%= session.getAttribute("msg3") %><br>
</body>
</html>