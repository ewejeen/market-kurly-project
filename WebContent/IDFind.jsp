<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/reset.css" media="all" />
<link rel="stylesheet" href="css/IDFind.css" media="all" />
</head>
<body>
	<div class="idFind">
		<form action="" name="idForm">
			<ul>
				<li>
					<h2>이메일 주소를 입력해 주세요.</h2>
					<input type="text" name="userEmail" id="userEmail" />
				</li>
				<li><input type="button" value="아이디 찾기" onclick="ajaxIdFind()"/></li>
			</ul>
		</form>
	</div>
	
	<script>

	function ajaxIdFind(){
	
		var xhr = new XMLHttpRequest();
		var userEmail = document.getElementById('userEmail');
		
		var url = "idFind.mo?"
		var data = "userEmail="+userEmail.value;
		
		xhr.open("post",url+data,true);
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var result = xhr.responseText;
				if(userEmail.value==null || userEmail.value==""){
					alert('이메일 주소를 입력해 주세요.');
					return false;
				}
				if(result==null || result==""){
					alert('등록되지 않은 이메일입니다.');
					return false;
				}
				alert('회원님의 아이디는 < '+result+' > 입니다.');
			}
		};
		xhr.send();
	}
	
	</script>
</body>
</html>