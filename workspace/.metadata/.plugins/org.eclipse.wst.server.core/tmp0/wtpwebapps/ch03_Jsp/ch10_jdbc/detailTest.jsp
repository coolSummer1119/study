<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세 정보 보기</title>
<link rel="stylesheet" href="../CSS/style.css"	type="text/css">
</head>
<body>
<div class="page-main">
	<h2>글상세 정보</h2>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	Connection conn =null;
	PreparedStatement pstmt =null;
	ResultSet rs= null;
	String sql =null;
	
	try{
		conn=DBUtil.getConnection();
		
		sql="SELECT * FROM tboard WHERE num=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		//sql문을 테이블에 반영하고 결과행을 resultset 담아서 반환
		rs = pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			String title=rs.getString("title");
			String content=rs.getString("content");
			Date reg_date = rs.getDate("reg_date");
			
%>
	<ul>
		<li>글번호 : <%=num %></li>
		<li>제목 : <%=title %></li>
		<li>작성자 : <%=name %></li>
		<li>작성일 : <%=reg_date %></li>
	</ul>
	<hr width="100%" size="1" noshade="noshade">
	<p>
		<%=content %>
	</p>
	<hr width="100%" size="1" noshade="noshade">
	<div class="align-right">
		<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%=num%>'">
		<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%=num%>'">
		<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
	</div>
<% 
		}else{
%>
	<div class="result-display">
		<div class="align-center">
			글상세 정보가 없습니다.<p>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">			
		</div>
	</div>
<%

		}
		
	}catch(Exception e){
		e.printStackTrace();
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 글 상세 정보 호출 실패!<p>
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">			
			</div>
		</div>
<%
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
%>

</div>
</body>
</html>