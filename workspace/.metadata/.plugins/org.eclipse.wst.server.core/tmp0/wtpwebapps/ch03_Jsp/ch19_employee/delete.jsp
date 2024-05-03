<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%@ page import="kr.employee.vo.EmployeeDAO"%>
<%
	String user_id = (String)session.getAttribute("user_id");
	if(user_id==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인된경우
		//전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		//아이디, 비밀번호 일치 여부 체크
		EmployeeDAO dao = EmployeeDAO.getInstance();
		EmployeeVO employee = dao.checkEmployee(id);
		boolean check=false;
		
		//id가 등록되어 있고 로그인한 아이디와 일치할 경우
		if(employee!=null && user_id.equals(id)){
			//비밀번호 일치 여부 체크
			check = employee.isCheckedPassword(passwd);
		}
		if(check){//인증 성공
			//회원 정보 삭제
			dao.deleteEmployee(employee.getNum());
			//로그아웃
			session.invalidate();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 삭제</title>
</head>
<body>
<div class="page-main">
	<h1>사원정보 삭제완료</h1>
	<div class="result-display">
		사원정보 삭제가 완료 되었습니다.<p>
		<button onclick="location.href='main.jsp'">홈으로</button>
	</div>
</div>
</body>
</html>
<%
		}else{
%>
	<script type="text/javascript">
		alert('아이디 또는 비밀번호가 불일치합니다.');
		history.go(-1)
	</script>
<%
		}
	}
%>