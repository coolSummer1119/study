<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.util.PagingUtil" %>
<%
//선택된 페이지 번호
	String pageNum = request.getParameter("pageNum");	
	//최초에 listl.jsp를 호출하면 pageNum을 전달할 수 없기 때문에 null 이 되고 연산되지 않는
	//문제가 있어서 최초 호출시 무조건 1페이지로 설정
	if(pageNum ==null){
		pageNum = "1";
	}
	
	//한 화면에 몇 개의 글(행,레코드)를 보여줄 지 지정
	int rowCount= 10;
	//한 화면에 몇 개의 페이지 수를 보여줄 지 지정
	int pageCount =10;
	//현재 선택한 페이지(String -> int)
	int currentPage = Integer.parseInt(pageNum);
	
	StoryDAO dao = StoryDAO.getInstance();
	int count=dao.getCount();
	
	PagingUtil util = new PagingUtil(currentPage,count,rowCount,pageCount,"list.jsp");
	
	List<StoryVO> list =null;
	if(count>0){
		list = dao.getList(util.getStartRow(),util.getEndRow());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
</head>
<body>
<div class="page-main">
	<h1>사원 이야기</h1>
	<div class="align-right">
		<input type="button" value="글쓰기" onclick="location.href='writeForm.jsp'">
<%
	Integer user_num = (Integer)session.getAttribute("user_num");

	if(user_num!=null){//로그인이 되지 않은 경우
%>
		<input type="button" value="홈으로" onclick="location.href='main.jsp'">
<%
	}
%>
	</div>
<%
	if(count==0){
%>
	<div class="result-display">저장된 글이 없습니다.</div>
<%
	}else{
		
%>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
<%
	for(StoryVO storyVO : list){
%>
		<tr>
			<td><%= storyVO.getSnum() %></td>
			<td><a href="detail.jsp?snum=<%= storyVO.getSnum()%>"><%= storyVO.getTitle() %></a></td>
			<td><%= storyVO.getId() %></td>
			<td><%= storyVO.getReg_date() %></td>
		</tr>		
<%
	}
%>
	</table>
	<!-- 목록 출력 끝 -->
	<!-- 페이지 표시 시작 -->
	<div class="align-center">
		<%= util.getPage() %>
	</div>
	<!-- 페이지 표시 끝 -->
<%
	}
%>
</div>
</body>
</html>