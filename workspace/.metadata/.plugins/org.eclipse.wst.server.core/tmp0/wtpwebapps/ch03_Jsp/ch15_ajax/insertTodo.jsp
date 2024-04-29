<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%
	//전송된 데이터 인코딩 지정
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String todo = request.getParameter("todo");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		//connection객체 반환
		conn = DBUtil.getConnection();
		//sql문 작성
		sql = "INSERT INTO todo (id,todo) VALUES(todo_seq.nextval,?)";
		//preparedstatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//데이터 바인딩
		pstmt.setString(1, todo);
		//sql문 수행
		pstmt.executeUpdate();
		
		%>
		{"result":"success"}
		<%
	}catch(Exception e){
		e.printStackTrace();
		%>
		{"result":"failure"}
		<%
	}finally{
		//자원정리
		DBUtil.excuteClose(null, pstmt, conn);
	}
%>
   
