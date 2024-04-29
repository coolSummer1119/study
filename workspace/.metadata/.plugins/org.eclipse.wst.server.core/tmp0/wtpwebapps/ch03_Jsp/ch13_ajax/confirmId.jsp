<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id= request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;	
	ResultSet rs=null;
	String sql =null;
	
	try{
		
		//1단계
		conn = DBUtil.getConnection();
		//2단계
		sql = "SELECT id FROM people WHERE id=?";
		//3단계
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){//ID 중복
%>		<%-- JSON !로 할경우에는 로그에 남아서 에러가 뜸. --%>
		{"result":"idDuplicated"}
<%
		}else{//ID 미중복			
%>
		{"result":"idNotFound"}
<%
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
%>
		{"result":"failure"}
<%
	}finally{
		DBUtil.excuteClose(rs, pstmt, conn);
	}
	
%>