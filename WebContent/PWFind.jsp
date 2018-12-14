<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="css/reset.css" media="all" />
<link rel="stylesheet" href="css/PWFind.css" media="all" />
</head>
<body>
	<div class="pwFind">
		<form action="" name="pwForm">
			<ul>
				<li>
					<h2>아이디를 입력해 주세요.</h2>
					<input type="text" name="userId" id="userId" />
				</li>
				<li>
					<h2>이메일 주소를 입력해 주세요.</h2>
					<input type="text" name="userEmail" id="userEmail" />
				</li>
				<li><input type="button" value="비밀번호 찾기" onclick="ajaxPwFind()"/></li>
			</ul>
		</form>
	</div>
	
	<script>

	function ajaxPwFind(){
	
		var xhr = new XMLHttpRequest();
		var userId = document.getElementById('userId');
		var userEmail = document.getElementById('userEmail');
		
		var url = "pwFind.mo?"
		var data = "userId="+userId.value+"&userEmail="+userEmail.value;
		
		xhr.open("post",url+data,true);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var result = xhr.responseText;
				if(userId.value==null || userId.value==""){
					alert('아이디를 입력해 주세요.');
					return false;
				}
				if(userEmail.value==null || userEmail.value==""){
					alert('이메일 주소를 입력해 주세요.');
					return false;
				}
				if(result==null || result==""){
					alert('등록되지 않은 아이디 혹은 이메일입니다.');
					return false;
				}
				alert('회원님의 비밀번호는 < '+result+' > 입니다.');
			}
		};
		xhr.send();
	}
	
	</script>
</body>
</html>