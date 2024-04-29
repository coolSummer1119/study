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
<title>제품 상세보기</title>
<link rel="stylesheet" href="../CSS/style.css"	type="text/css">
</head>
<body class="page-main">
<h1>제품 상세보기</h1>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		conn = DBUtil.getConnection();
		sql = "SELECT * FROM product WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs= pstmt.executeQuery();
		
		if(rs.next()){
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			String origin = rs.getString("origin");
			Date reg_date = rs.getDate("reg_date");
%>
			<ul>
				<li>제품번호 : <%=num %></li>
				<li>제품명 : <%= name%></li>
				<li>가격 : <%= String.format("%,d원",price)%></li>
				<li>수량 : <%=String.format("%,d개",stock)%></li>
				<li>원산지 : <%=origin %></li>
				<li>등록일자 : <%=reg_date %></li>
			</ul>
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
					제품 정보가 없습니다.<p>
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
					오류 발생<p>
					<input type="button" value="목록" onclick="location.href='selectTest.jsp'">			
				</div>
			</div>
<%			
		
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
%>

</body>
</html>