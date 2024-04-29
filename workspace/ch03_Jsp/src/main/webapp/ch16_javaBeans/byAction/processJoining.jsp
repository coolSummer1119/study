<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	
%>
<%--import시켜서 하지 말고 꼭 풀네임 명시 + 단독태그형태--%>
<jsp:useBean id="member" class="kr.web.member.MemberVO"/>
<%--
useBean의 id와 setProperty의 명을 일치 시키기
property 에 *을 넣으면 모든 프로 퍼티
--%>
<jsp:setProperty name="member" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
아이디 : <jsp:getProperty property="id" name="member"/><br>
비밀번호 : <jsp:getProperty property="password" name="member"/><br>
이름 : <jsp:getProperty property="name" name="member"/><br>
이메일 : <jsp:getProperty property="email" name="member"/><br>
주소 : <jsp:getProperty property="address" name="member"/>
</body>
</html>