<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	//POST방식으로 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password= request.getParameter("password");
	
	//테스트 용으로 id와 비밀번호가 같으면 로그인 처리
	if(id.equals(password)){//로그인 성공
							// 속성명, 	속성값
		session.setAttribute("user_id" , id);
%>
	<%=id %>님이 로그인했습니다.<br>
	<input type="button" value="로그인 체크" onclick="location.href='s04_sessionLoginCheck.jsp'">
	<input type="button" value="로그아웃" onclick="location.href='s05_sessionLogout.jsp'">
<%
	}else{//로그인 실패
%>
	<script type="text/javascript">
		alert('로그인에 실패했습니다.');
		/* 이전페이지로 돌아가기 */
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>