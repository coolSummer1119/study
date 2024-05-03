<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인이 된경우
		//전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.employee.vo.EmployeeVO"/>
<jsp:setProperty property="*" name ="vo"/>
<%
	//num이 전송되지 않았기 때문에 session에 저장된 num을 사용
	vo.setNum(user_num);

	EmployeeDAO dao = EmployeeDAO.getInstance();
	dao.updateEmployee(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보수정 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>사원정보 수정완료</h1>
	<div class="result-display">
		<div class="align-center">
			사원정보수정 완료!<p>
			<button onclick="location.href='myPage.jsp'">Mypage</button>
		</div>
	</div>
</div>
</body>
</html>
<%
	}
%>