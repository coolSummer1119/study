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
<title>제품 정보 업데이트</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	String sql = null;
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	try{
		
		
		conn = DBUtil.getConnection();
		sql = "UPDATE product SET name=?, price=?, stock=?, origin=? WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
%>
</body>
</html>