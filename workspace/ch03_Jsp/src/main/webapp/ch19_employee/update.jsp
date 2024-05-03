<%@page import="kr.story.vo.StoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	Integer user_snum = (Integer)session.getAttribute("user_snum");

	if(user_snum==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인 된 경우
		
		request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	vo.setSnum(user_snum);

	StoryDAO dao = StoryDAO.getInstance();
	dao.update(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>게시글 수정완료</h1>
	<div class="result-display">
		<div class="align-center">
			게시글 수정 완료!<p>
			<button onclick="location.href='myPage.jsp'">Mypage</button>
		</div>
	</div>
</div>
</body>
</html>
<%
}
%>