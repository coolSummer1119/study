<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원가입</title>
<script type="text/javascript">
window.onload =function(){
	/* 유효성 체크 반복문 사용*/
	const myForm = document.getElementById('myForm');
	myForm.onsubmit = function(){
		const input = document.querySelectorAll('.input');
		for(let i=0; i<input.length; i++){
			if(input[i].value.trim()==''){
				const label = document.querySelector('label[for="' + input[i].id + '"]');
				
				alert(label.textContent + '을 입력해주세요');
				input[i].value='';
				input[i].focus();
				return false;
			}
			/* id가 id인 input의 패턴이 영문 숫자 합쳐 4~12자 사이 */
			if(input[i].id == 'id' && !/^[A-Za-z0-9]{4,12}$/.test(input[i].value)){
				alert('영문 또는 숫자 사용, 최소 4자 ~ 최대 10자를 사용');
				input[i].value='';
				input[i].focus();
				return false;
			}
		}
		
		/* const input = document.getElementsByClassName('input');
		const inputName = ['이름','아이디','비밀번호'];
		for(let i=0; i<input.length; i++){
			if(input[i].value.trim()==''){
				alert(inputName[i] + '을 입력해주세요');
				input[i].value='';
				input[i].focus();
				return false;
			}
		} */
	}
}
</script>
</head>
<body>
<%-- 이름 (name), 아이디(id), 비밀번호(password), 전화번호(phone),취미(hobby) -영화보기, 음악감상, 등산, 낚시, 춤
	자기소개(content) - textarea
	
	s06_register.jsp로 전송 , 전송 방식post
	출력예시
	이름 : 홍길동 (필수)
	아이디 : dragon (필수)
	비밀번호 : 1234 (필수)
	전화번호 : 010-1234-5678
	자기소개 : 서울에서 태어나서 계속 서울 거주
 --%>
<form action="s06_register.jsp" method="post" id="myForm">
	<label for="name">이름</label> 
	<input type="text" name="name"	id="name" class="input"><br>
	<label for="id">아이디</label> 
	<input type="text" name="id"	id="id" class="input"><br>
	<label for="password">비밀번호</label> 
	<input type="text" name="password"	id="password" class="input"><br>
	전화번호<input type="text" name="phone"	id="phone"><br>
	취미
	<br>
	<input type="checkbox" name="hobby"	value="영화보기">영화보기
	<input type="checkbox" name="hobby"	value="음악감상">음악감상
	<input type="checkbox" name="hobby"	value="등산">등산
	<input type="checkbox" name="hobby"	value="낚시">낚시
	<input type="checkbox" name="hobby"	value="춤">춤
	<br>
	자기소개
	<br>
	<textarea rows="5" cols="50" name="content"></textarea>
	
	<br>
	<input type="submit" value="전송">
</form>
</body>
</html>