<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	request.setCharacterEncoding("utf-8");

	int snum = Integer.parseInt(request.getParameter("snum"));
	
	StoryDAO dao = StoryDAO.getInstance();
	dao.delete(snum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
<div class="page-main">
	<h1>글 삭제 완료</h1>
	<div class="result-display">
		글삭제가 완료 되었습니다.<p>
		<button onclick="location.href='list.jsp'">목록으로</button>
	</div>
</div>
</body>
</html>