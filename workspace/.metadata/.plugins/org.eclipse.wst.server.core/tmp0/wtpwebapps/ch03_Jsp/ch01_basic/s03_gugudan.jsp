<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
5단<br>
------------------<br>
<%
	for(int i=1;i<=9;i++){
		//출력
		out.println("5 * " + i + " = " + i*5 + "<br>");
	}
%>

</body>
</html>