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
    myForm.onsubmit = function() {
        const quantity = document.getElementsByClassName('food');
        let totalQuantity = 0;

        // 입력된 수량의 총 합을 계산합니다.
        for (let i = 0; i < quantity.length; i++) {
            totalQuantity += quantity[i].value;
        }

        // 총 합이 0이면 어떤 음식도 주문하지 않은 것으로 간주합니다.
        if (totalQuantity == 0) {
            alert('최소 한 가지 음식을 선택해주세요.');
            return false; // 폼 제출을 중지합니다.
        }
    }
}
</script>
</head>
<body>
<form action="s19_order.jsp" method="post" id="myForm">
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