<%@page import="kr.board.vo.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeDAO" %>
<%
	//데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="employee" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty name="employee" property="*"/>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.insertEmployee(employee);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 추가완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>직원 추가 완료</h1>
	<div class="result-display">
		직원 정보를 추가했습니다.<p>
		<button onclick="location.href='main.jsp'">메인으로</button>
	</div>
</div>
</body>
</html>