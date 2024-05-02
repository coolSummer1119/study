<%@ page language="java" contentType="text/plane; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>
<%@ page import="kr.employee.vo.EmployeeDAO"%>
<%
	//전송된 데이터 인코딩 타입 지정
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO employee = dao.checkEmployee(id);
	
	if(employee!=null){//아이디 중복
%>
	{"result":"idDuplicated"}				
<%
	}else{//아이디 미중복
%>
	{"result":"idNotFound"}				
<%
	}
%>