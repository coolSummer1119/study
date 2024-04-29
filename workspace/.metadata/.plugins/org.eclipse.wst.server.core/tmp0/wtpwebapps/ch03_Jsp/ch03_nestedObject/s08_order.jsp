<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	
	page import = "java.util.HashMap"
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 구매</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//가격정보
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	
	//배송비
	int delivery_fee = 5000;
	
	//총구매비용
	int sum = 0;
	
%> 
이름 : <%= request.getParameter("name") %><br>
배송희망일 : <%= request.getParameter("order_date") %><br>
구입 내용 : 
<%
String[] item = request.getParameterValues("item");
if(item!=null){
	for(int i=0;i<item.length;i++){
		sum+=map.get(item[i]);
		if(i>0) out.print(",");
%>
	<%= item[i] %>
<%
	}//end of for
	if(sum<300000)sum+=delivery_fee;
	else delivery_fee = 0;
%>
<br>
배송비 : <%= String.format("%,d원",delivery_fee)%>
<br>
총 구매비용(배송비 포함) : <%= String.format("%,d원", sum)%>
<%
}//end of if
%>

</body>
</html>