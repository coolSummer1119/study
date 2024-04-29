window.onload=function(){
	const myForm = document.getElementById('myForm');
	//이벤트 연결
	myForm.onsubmit=function(){
		const items = document.querySelectorAll('input[type="text"],input[type="number"]');
		for(let i =0; i<items.length;i++){
			if(items[i].value.trim()==''){
				const label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 은(는) 필 수 입력');
				items[i].value='';
				items[i].focus();
				return false;
			}
			if(items[i].value<=0||items[i].value==0){
				alert(label.textContent + ' 은(는) 0보다 큰 값을 넣어야합니다.');
				items[i].value='';
				items[i].focus();
				return false;
			}
		}
	};
};