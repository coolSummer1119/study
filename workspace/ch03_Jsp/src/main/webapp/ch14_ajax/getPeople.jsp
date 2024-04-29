<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.util.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet" %>

[<% 
Connection conn=null;
PreparedStatement pstmt=null;	
ResultSet rs =null;
String sql =null;

try{
	
	//1단계
	conn = DBUtil.getConnection();
	//2단계
	sql = "SELECT * FROM people ORDER BY reg_date DESC";
	//3단계
	pstmt = conn.prepareStatement(sql);
	//데이터 바인딩
	//4단계
	rs = pstmt.executeQuery();
	while(rs.next()){
		String id= rs.getString("id");
		String name= rs.getString("name");
		String job= rs.getString("job");
		String address= rs.getString("address");
		String blood_type= rs.getString("blood_type");
		String reg_date= rs.getString("reg_date");
		
		if(rs.getRow()>1)out.println(",");
		%>
		{
			"id":"<%=id %>",
			"name":"<%=name%>",
			"job":"<%=job %>",
			"address":"<%=address%>",
			"blood_type":"<%=blood_type %>",
			"reg_date":"<%=reg_date %>"
		}
		<%
		
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	DBUtil.excuteClose(rs, pstmt, conn);
}


%>]