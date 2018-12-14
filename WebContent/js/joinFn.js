

function joinFn() {
	var idCheck = document.getElementById('idCheck');
	var emailCheck = document.getElementById('emailCheck');

	var userId = document.getElementById('userId');
	var userPw = document.getElementById('userPw');
	var userName = document.getElementById('userName');
	var userPhone = document.getElementsByName('userPhone');
	var userEmail = document.getElementById('userEmail');

	var checked = document.getElementById('allChecked');
	var checked2 = document.getElementById('allChecked2');

	if (idCheck.value != 'checked') {
		alert('아이디 중복 확인을 해 주세요.');
		idCheck.focus();
		return false;
	}
	if (emailCheck.value != 'checked') {
		alert('이메일 중복 확인을 해 주세요.');
		emailCheck.focus();
		return false;
	}

	if (userId.value == "" || userId.value == "") {
		alert('아이디를 입력해 주세요.');
		userId.focus();
		return false;
	}
	if (userPw.value == "" || userPw.value == "") {
		alert('비밀번호를 입력해 주세요.');
		userPw.focus();
		return false;
	}
	
	if(pwCheck()!=true){
		alert('비밀번호 확인 값이 다릅니다.');
		return false;
	}
	
	if (userName.value == "" || userName.value == "") {
		alert('이름을 입력해 주세요.');
		userName.focus();
		return false;
	}
	if (userPhone[0].value == "" || userPhone[0].value == "") {
		alert('휴대폰 번호를 입력해 주세요.');
		userPhone[0].focus();
		return false;
	}
	if (userPhone[1].value == "" || userPhone[1].value == "") {
		alert('휴대폰 번호를 입력해 주세요.');
		userPhone[1].focus();
		return false;
	}
	if (userPhone[2].value == "" || userPhone[2].value == "") {
		alert('휴대폰 번호를 입력해 주세요.');
		userPhone[2].focus();
		return false;
	}
	if (userEmail.value == "" || userEmail.value == "") {
		alert('이메일 주소를 입력해 주세요.');
		userEmail.focus();
		return false;
	}

	if (checked.value == 'checked' || checked2.value == 'checked') {
		if (confirm('회원 가입을 진행합니다.') == true) {
			joinForm.submit();
		} else {
			return;
		}	
	} else{
		alert('이용 약관에 동의해야 가입할 수 있습니다.');
		return false;		
	}


}