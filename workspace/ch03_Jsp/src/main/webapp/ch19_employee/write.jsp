<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	String user_id	= (String)session.getAttribute("user_id");

	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인 된 경우
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vo" class="kr.story.vo.StoryVO"/>
<jsp:setProperty name="vo" property="*"/>
<%
	vo.setIp(request.getRemoteAddr());
	vo.setNum(user_num);
	vo.setId(user_id);
	
	StoryDAO dao = StoryDAO.getInstance();
	dao.insert(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>글 쓰기 완료</h1>
	<div class="result-display">
		<div class="align-center">
			게시판에 글을 등록했습니다.<p>
			<button onclick="location.href='list.jsp'">목록</button>
		</div>
	</div>
</div>
</body>
</html>
<%
}
%>