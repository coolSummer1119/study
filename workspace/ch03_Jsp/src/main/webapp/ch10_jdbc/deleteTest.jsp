<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 처리</title>
<link rel="stylesheet" href="../CSS/style.css" type="text/css">
</head>
<body>
<%
	//POST 방식으로 전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	
	//전송된 데이터 반환
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		conn=DBUtil.getConnection();
		sql="Delete tboard WHERE num=?";
		pstmt = conn.prepareStatement(sql);
		//?에 데이터 바인딩
		pstmt.setInt(1,num);
		
		pstmt.executeUpdate();
		
%>
		<div class="result-display">
			<div class="align-center">
				글 삭제 완료!<p>
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>
<%	
		
	}catch(Exception e){

%>
		<div class="result-display">
			<div class="align-center">
				오류 발생 글 삭제 실패!<p>
				<input type="button" value="글수정폼" onclick="location.href='updateTestForm.jsp">
			</div>
		</div>
<%			
		e.printStackTrace();
	}finally{
		DBUtil.excuteClose(null, pstmt, conn);
	}
%>
</body>
</html>
</body>
</html>