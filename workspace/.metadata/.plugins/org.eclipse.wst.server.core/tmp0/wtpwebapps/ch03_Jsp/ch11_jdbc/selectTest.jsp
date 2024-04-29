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
<title>제품 목록</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
</head>
<body class="page-main">
<h1>제품 목록</h1>
<div class="align-right">
	<input type="button" value="제품등록" onclick="location.href='insertTestForm.jsp'">
</div>
<%
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		conn=DBUtil.getConnection();
		
		sql = "SELECT * FROM product ORDER BY num DESC";
		
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
%>
	<table>
		<tr>
			<th>제품 번호</th>
			<th>제품명</th>
			<th>원산지</th>
			<th>등록일자</th>
		</tr>
<%		
	while(rs.next()){
		int num= rs.getInt("num");
		String name = rs.getString("name");
		String origin = rs.getString("origin");
		Date reg_date = rs.getDate("reg_date");
%>
		<tr>
			<td><%=num %></td>
			<td><a href="detailTest.jsp?num=<%=num%>"><%=name %></a></td>
			<td><%=origin %></td>
			<td><%=reg_date %></td>
		</tr>	
<%
	}
%>
	</table>
<%
	}catch(Exception e){
		e.printStackTrace();
%>
		<div class="result-display">
			<span>오류 발생!</span>
		</div>
<%
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
%>

</body>
</html>