<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO employee = dao.getEmployee(user_num);

	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인 된 경우
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="page-main">
<h1 class="align-center">회원정보수정</h1>
<form action="modifyUser.jsp" method="post" id="modify_form">
	<ul>
		<li>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="<%=employee.getName()%>"class="input-check" maxlength="10">
		</li>
		<li>
			<label for="passwd">비밀번호</label>
			<input type="password" name="passwd" id="passwd" class="input-check" maxlength="12">
		</li>
		<li>
			<label for="email">이메일</label>
			<input type="email" name="email" id="email" value="<%=employee.getEmail()%>" class="input-check" maxlength="50">
		</li>
		<li>
			<label for="phone">전화번호</label>
			<input type="text" name="phone" value="<%=member.getPhone()%>" id="phone" maxlength="15">
		</li>
	</ul>
	<div class="align-center">
		<input type="submit" value="수정">
		<input type="button" value="홈으로" onclick="location.href='main.jsp'">
	</div>
</form>
</div>
</body>
</html>
<%	
	}
%>