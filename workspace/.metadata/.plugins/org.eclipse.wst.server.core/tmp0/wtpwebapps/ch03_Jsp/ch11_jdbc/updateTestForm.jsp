<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<h2 class="align-center">제품 정보 수정</h2>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	try{
		conn = DBUtil.getConnection();
		sql = "SELECT * FROM product WHERE num = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs= pstmt.executeQuery();
		
		if(rs.next()){
			String name = rs.getString("name");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			String origin = rs.getString("origin");
%>
			<form id="myForm" action="updateTest.jsp" method="post">
				<input type="hidden" name="num" value="<%=num %>">
				<ul>
					<li>
						<label for="name">제품명</label>
						<input type="text" name="name" id="name" size="20" maxlength="10" value="<%=name %>">
					</li>
					<li>
						<label for="price">제목</label>
						<input type="number" name="price" id="price" value="<%=price%>">
					</li>
					<li>
						<label for="stock">수량</label>
						<input type="number" name="stock" id="stock" value="<%=stock%>">
					</li>
					<li>
						<label for="origin">원산지</label>
						<input type="text" name="origin" id="origin" size="20" maxlength="10" value="<%=name %>">
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="제품 정보 수정">
					<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
				</div>
			</form>
			
<%			
		}else{
%>
			<div class="result-display">
				<div class="align-center">
					오류 발생!<p>
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
					오류 발생!<p>
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