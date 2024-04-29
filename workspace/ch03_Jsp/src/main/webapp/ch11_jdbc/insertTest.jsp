<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	
	Connection conn=null;
	PreparedStatement pstmt =null;
	String sql = null;
	
	
	try{
		conn = DBUtil.getConnection();
		sql = "INSERT INTO product (num,name,price,stock,origin,reg_date) VALUES (product_seq.nextval,?,?,?,?,SYSDATE)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		
		pstmt.executeUpdate();
%>
	<div class="result-display">
		제품 추가 완료!
		<p>
		<div class="align-center">
			<input type="button" value="추가" onclick="location.href='insertTestForm.jsp'">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</div>
<%
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBUtil.excuteClose(null, pstmt, conn);
	}
%>

</body>
</html>