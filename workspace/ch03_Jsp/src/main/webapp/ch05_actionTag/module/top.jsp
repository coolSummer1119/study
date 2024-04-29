<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String company = request.getParameter("company");
%>
<b><%= company %></b><!-- 인코딩을 따로 안하면 깨져서 전송됨. -->
상단메뉴 :
<a href="#">HOME</a>
<a href="#">INFO</a>
<a href="#">SIGN IN</a>