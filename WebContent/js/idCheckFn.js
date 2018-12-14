var xhr = new XMLHttpRequest();

function idCheckFn() {
	var userId = document.getElementById('userId');

	var url = "idCheck.mo";
	var data = "userId=" + userId.value;
	xhr.open('post', url, true);
	xhr.setRequestHeader('Content-Type',
			'application/x-www-form-urlencoded;charset=utf8');
	xhr.onreadystatechange = idCheckOk;
	xhr.send(data);
}

function idCheckOk() {
	if (xhr.readyState == 4 && xhr.status == 200) {
		var userId = document.getElementById('userId');
		var idCheck = document.getElementById('idCheck');
		var result = xhr.responseText;

		if (userId.value == "" || userId.value == null) {
			alert('아이디를 입력해 주세요.');
			userId.focus();
			return false;
		}

		if (result == 1) {
			alert('이미 등록된 아이디입니다.');
			userId.value = "";
			userId.focus();
		} else {
			alert('사용이 가능합니다.');
			idCheck.value = "checked";
			userId.focus();
		}
	}
}