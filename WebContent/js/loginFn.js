function loginFn() {
	var loginForm = document.loginForm;
	var userId = document.getElementById('userId');
	var userPw = document.getElementById('userPw');

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

	loginForm.submit();
}