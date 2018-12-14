var xhr = new XMLHttpRequest();

function emailCheckFn() {
	var userEmail = document.getElementById('userEmail');

	var url = "emailCheck.mo";
	var data = "userEmail=" + userEmail.value;
	xhr.open('post', url, true);
	xhr.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded;charset=utf8');
	xhr.onreadystatechange = emailCheckOk;
	xhr.send(data);
}

function emailCheckOk() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var userEmail = document.getElementById('userEmail');
		var emailCheck = document.getElementById('emailCheck');
		var result = xhr.responseText;

		if (userEmail.value == "" || userEmail.value == null) {
			alert('이메일 주소를 입력해 주세요.');
			userEmail.focus();
			return false;
		}

		if (result == 1) {
			alert('이미 등록된 이메일입니다.');
			userEmail.value = "";
			userEmail.focus();
		} else {
			alert('사용이 가능합니다.');
			emailCheck.value = "checked";
			userEmail.focus();
		}
	}
}