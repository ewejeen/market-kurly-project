<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/MemberLogin.css" media="all" />
<script src="js/loginFn.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div id="login">
			<div class="loginTop">
				<span class="mainGnb">홈 > <b>로그인</b></span>
				<h1 class="title">로그인</h1>
			</div>
			<div class="loginMain">
				<form action="memberLogin.mo" method="post" name="loginForm">
					<div class="loginContents">
						<div class="loginLeft">
								<ul>
									<li>
										<label for="userId">아이디</label>
										<input type="text" name="userId" id="userId">
									</li>
									<li>
										<label for="userPw">비밀번호</label>
										<input type="password" name="userPw" id="userPw">
									</li>	
									<li>
										<input type="checkbox" name="secureLogin" checked>
										<p>보안접속</p>
									</li>
								</ul>
						</div>
						<div class="loginRight">
							<input type="button" value="회원 로그인" onclick="loginFn()">
						</div>
					</div>
				</form>
				<div class="helpButtons">
					<ul>
						<li><input type="button" value="아이디 찾기" onclick="idFindFn()"></li>
						<li>
							<input type="button" value="비밀번호 찾기" class="pwFind" onclick="pwFindFn()">
						</li>
						<li><input type="button" value="회원가입" onclick="location.href='MemberJoin.jsp'"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script>
		function idFindFn(){
			window.open('IDFind.jsp','아이디 찾기','width=600px, height=400px');
		}
		function pwFindFn(){
			window.open('PWFind.jsp','비밀번호 찾기','width=600px, height=400px');
		}
	</script>
</body>
</html>