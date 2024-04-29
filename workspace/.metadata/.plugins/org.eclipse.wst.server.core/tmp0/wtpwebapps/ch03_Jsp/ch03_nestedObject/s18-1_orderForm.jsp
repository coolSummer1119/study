<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식주문</title>
<style type="text/css">
table{
	border: 1px solid;
}

</style>
<script type="text/javascript">
//수량을 입력, 세가지 음식 중 하나는 꼭 주문.
//짜장 4- 짬뽕5- 볶음밥 6-
/*  
[출력 예시] 
짜장면 2개
짬뽕 1개
총 지불 금액 :13,000원
*/
window.onload = function() {
    const myForm = document.getElementById('myForm');
    //폼이벤트 연결
    myForm.onsubmit = function() {
        const items = document.querySelectorAll('input[type="number"]');

        for (let i = 0; i < items.length; i++) {
        	if(items[i].value==0){
        		const label =document.querySelector('label[for="'+items[i].id+'"]');
        		alert(label.textContent + '의 수량을 입력하세요');
        		items[i].value=0;
        		items[i].focus();
        		return false;
        	}//end of if
        }//end of for
		if(items[0].value==0&&items[1].value==0&&items[2].value==0){
			alert('세가지 음식중 하나는 꼭 주문 해야합니다');
			return false;
		}
    }
}
</script>
</head>
<body>
<form action="s19-1_order.jsp" method="post" id="myForm">
	<table>
		<tr>
			<td class="title">식사류</td>
			<td>
				<ul>
					<li>
						<label for="c0">짜장면</label>
						<input type="number" name="food_c0" id="c0" min="0" max="99" value="0" class="food">
					</li>
					<li>
						<label for="c1">짬뽕</label>
						<input type="number" name="food_c1" id="c1" min="0" max="99" value="0" class="food">
					</li>
					<li>
						<label for="c2">볶음밥</label>
						<input type="number" name="food_c2" id="c2" min="0" max="99" value="0" class="food">
					</li>
				</ul>			
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="전송">
			</td>
		</tr>
	</table>
</form>
</body>
</html>