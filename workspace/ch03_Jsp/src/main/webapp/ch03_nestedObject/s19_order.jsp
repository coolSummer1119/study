<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@	

	page import = "java.util.HashMap"	

%>

  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//가격정보
HashMap<String,Integer> map = new HashMap<String,Integer>();
map.put("짜장면",4000);
map.put("짬뽕",5000);
map.put("볶음밥",6000);

int c0 = map.get("짜장면")*Integer.parseInt(request.getParameter("food_c0"));

int c1 = map.get("짬뽕")*Integer.parseInt(request.getParameter("food_c1"));

int c2 = map.get("볶음밥")*Integer.parseInt(request.getParameter("food_c2"));

int sum = c0+c1+c2;

%>



짜장면 <%= request.getParameter("food_c0") %>개<br>

짬 뽕 <%= request.getParameter("food_c1") %>개<br>

볶음밥 <%= request.getParameter("food_c2") %>개<br>

총 지불 금액 : <%= sum%>원

</body>

</html>