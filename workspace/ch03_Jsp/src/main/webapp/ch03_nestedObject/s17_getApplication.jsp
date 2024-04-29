<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 속성 보기</title>
</head>
<body>
	 <!-- 
	 id가 브라우저를 지워도 남아있게 되는데 지우기 위해서는 servers에서 멈췄다 키지 않으면 남아있음.
     service할때는 session을 기준으로 작업할것
     application으로 할 경우에는 다른 사람도 데이터에 접근을 할 수 있어서 왜곡의 가능성이 있음.
     기본 객체 pageContent		request		session		application
     영역		page <			request <	session< 	application
     일반데이터 								여기까지|| 일반데이터는 appliction에서 하지않고 환경설정정보 공유
     -->
<%
	Enumeration<String> attrEnum = application.getAttributeNames();
	while(attrEnum.hasMoreElements()){
		//속성명
		String name = attrEnum.nextElement();
		//속성값
		Object value = application.getAttribute(name);
%>
application 속성 : <b><%= name %></b> = <%= value %><br>
<%		
		
	}
%>
</body>
</html>