<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 추가</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/CSS/style.css" type="text/css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let count = 0;
	
	$('#confirm_id').click(function(){
		if($('#id').val().trim()==''){
			$('#id').val('').focus();
			return;
		}
		//서버와통신
		$.ajax({
			url:'confirmId.jsp',
			type:'post',
			data:{id:$('#id').val()},
			dataType:'json',
			success:function(param){
				if(param.result =='idDuplicated'){
					count=0;
					$('#id_signed').text('중복된 아이디').css('color','red');					
					$('#id').val('').focus();
				}else if(param.result =='idNotFound'){
					count=1;
					$('#id_signed').text('사용 가능 아이디').css('color','black');
					
				}else{
					count=0;
					alert('id중복 체크 오류');
				}		
			},
			error:function(){
				count=0;
				alert('네트워크 오류 발생');
			}
		})
	})
	
	
	$('#insert_form').submit(function(){
		const items=document.querySelectorAll('.input-check');
		for(let i=0;i<items.length;i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent+' 항목은 필수 입력');
				items[i].value='';
				items[i].focus();
				return false;
			}
			if(items[i].id == 'id'&&count==0){
				alert('아이디 중복체크 필수');
				return false;
			}
		}
	});
});
</script>
</head>
<body>
<div class="page-main">
<h1>직원 추가</h1>
	<form id="insert_form" action="insert.jsp" method="post">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" id="id" name="id" class="input-check" size="7" autocomplete="off" maxlength="12">
				<input type="button" id="confirm_id" value="ID중복확인">
				<span id="id_signed"></span>
			</li>
			<li>
				<label for="name">이름</label>
				<input type="text" id="name" name="name" class="input-check"  maxlength="12">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" id="passwd" name="passwd" class="input-check"  maxlength="12">
			</li>
			<li>
				<label for="salary">급여</label>
				<input type="number" id="salary" name="salary" class="input-check" max="10000" min="0">
			</li>
			<li>
				<label for="job">업무</label>
				<input type="text" id="job" name="job" class="input-check"  maxlength="12">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="직원추가">
			<input type="button" value="직원목록" onclick="location.href='list.jsp'">
		</div>
	</form>
</div>
</body>
</html>