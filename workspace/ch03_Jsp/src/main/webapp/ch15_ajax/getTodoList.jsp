<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="kr.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
[<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		//connection 객체 반환
		conn=DBUtil.getConnection();
		//sql문 작성
		sql="SELECT * FROM todo ORDER BY id DESC";
		//preparedStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//sql문 실행
		rs = pstmt.executeQuery();
		while(rs.next()){
			int id = rs.getInt("id");
			String todo = rs.getString("todo");
			Date created = rs.getDate("created");
			int completed = rs.getInt("completed");
			
			if(rs.getRow()>1)out.print(",");
			%>
			{
				"id":<%=id %>,
				"todo":"<%=todo %>",
				"created":"<%=created %>",
				"completed":<%=completed %>
			}
			<%
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
%>]
