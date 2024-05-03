<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	int snum = Integer.parseInt(request.getParameter("snum"));
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO storyVO = dao.getStory(snum);
	session.setAttribute("user_snum",storyVO.getSnum());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>게시판 글 상세</h1>
	<ul>
		<li>글번호 : <%= storyVO.getNum() %></li>
		<li>제목 : <%= storyVO.getTitle() %></li>
		<li>작성자 : <%= storyVO.getId() %></li>
	</ul>
	<hr size="1" width="100%" noshade="noshade">
	<p>
		<%= storyVO.getContent() %>
	</p>
	<div class="align-right">
		작성일 : <%=storyVO.getReg_date() %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num!=null && user_num==storyVO.getNum()){
		
%>
		<input type="button" value="수정" onclick="location.href='updateForm.jsp?snum=<%=storyVO.getSnum() %>'">
		<input type="button" value="삭제" onclick="location.href='deleteStory.jsp?snum=<%=storyVO.getSnum() %>'">
<%		
}
%>
		<input type="button" value="목록" onclick="location.href='list.jsp'">		
	</div>
</div>
</body>
</html>