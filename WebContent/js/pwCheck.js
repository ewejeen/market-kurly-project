function pwCheck() {
	var userPw = document.getElementById('userPw');
	var userPwCheck = document.getElementById('userPwCheck');
	var pwGuide = document.getElementById('pwGuide');

	if (userPw.value == userPwCheck.value) {
		pwGuide.innerHTML = "비밀번호가 동일합니다.";
		pwGuide.style.color = "#008040";
		return true;
	} else {
		pwGuide.innerHTML = "동일한 비밀번호를 입력해 주세요.";
		pwGuide.style.color = "#ff0000";
		return false;
	}
}