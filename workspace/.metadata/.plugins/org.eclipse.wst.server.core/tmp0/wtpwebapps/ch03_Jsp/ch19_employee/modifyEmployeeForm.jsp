<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeDAO" %>
<%@ page import="kr.employee.vo.EmployeeVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");

	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인 된 경우
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO employee = dao.getEmployee(user_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#modifyEmployee_form').submit(function(){
		const items= document.querySelectorAll('.input-check');
		for(let i=0; i<items.length; i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent+' 항목은 필수 입력');
				items[i].value='';
				items[i].focus();
				return false;
			}
		}
		
	})
});
</script>
</head>
<body>
<div class="page-main">
<h1>사원정보 수정</h1>
	<form id="modifyEmployee_form" action="modifyEmployee.jsp" method="post">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" id="name" name="name" class="input-check" value="<%=employee.getName() %>"  maxlength="12">
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" id="salary" name="salary" class="input-check" max="10000" min="0">
			</li>
			<li>
				<label for="job">업무</label>
				<input type="text" id="job" name="job" class="input-check" value="<%=employee.getJob() %>"   maxlength="12">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="사원정보수정">
			<input type="button" value="메인으로" onclick="location.href='main.jsp'">
		</div>
	</form>
</div>
</body>
</html>
<%	
	}
%>