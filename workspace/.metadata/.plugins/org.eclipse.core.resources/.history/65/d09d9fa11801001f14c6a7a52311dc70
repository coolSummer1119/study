<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<h1>회원정보</h1>
이름 : <%= request.getParameter("name") %><br>
id : <%= request.getParameter("id") %><br>
비밀번호 : <%= request.getParameter("password") %><br>
휴대전화 번호 : <%= request.getParameter("phone") %><br>
취미 :
<% 
String[] hobby = request.getParameterValues("hobby");
if(hobby !=null){
%>	
<%	
	for(int i=0;i<hobby.length;i++){
		if(i>0)	out.print(",");
%>
 <%= hobby[i] %><!-- 표현식 -->
<% 
	}
	out.println("<br>");
}
%><br>
자기소개<br>
<%= request.getParameter("content") %>
</body>
</html>