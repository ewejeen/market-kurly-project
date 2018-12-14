<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/MemberJoin.css" media="all" />
<script src="js/jquery-3.3.1.js"></script>
<script src="js/idCheckFn.js"></script>
<script src="js/pwCheck.js"></script>
<script src="js/emailCheckFn.js"></script>
<script src="js/joinFn.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="wrap">
		<div id="main">

			<div class="join">
				<span class="mainGnb">홈 > <b>회원가입</b></span>
				<h1 class="title">회원가입</h1>
				<form action="memberJoin.mo" method="post" name="joinForm">
					<table class="table1">
						<tr class="one sec1">
							<td class="left">기본정보</td>
							<td class="right sec1">* 필수입력사항</td>
						</tr>
						<tr class="id">
							<td class="left">아이디 *</td>
							<td class="right">
								<input type="text" name="userId" id="userId" size="20" />
								<input type="hidden" name="idCheck" id="idCheck" value="unchecked" />
								<input type="button" value="아이디 중복확인" onclick="idCheckFn()"/>
							</td>
						</tr>
						<tr>
							<td class="left">비밀번호 *</td>
							<td class="right"><input type="password" name="userPw" id="userPw" size="20" /></td>
						</tr>
						<tr>
							<td class="left">비밀번호확인 *</td>
							<td class="right"><input type="password" name="userPwCheck" id="userPwCheck" onkeyup="pwCheck()" size="20" />
							<span id="pwGuide">동일한 비밀번호를 입력해 주세요.</span>
							</td>
						</tr>
						<tr>
							<td class="left">이름 *</td>
							<td class="right"><input type="text" name="userName" id="userName" size="20" />
							</td>
						</tr>
						<tr class="phone">
							<td class="left">휴대폰 *</td>
							<td class="right">
								<input type="text" name="userPhone" id="userPhone" class="userPhone one" size="6" maxlength="3" />-
								<input type="text" name="userPhone" id="userPhone" class="userPhone two" size="6" maxlength="4" />-
								<input type="text" name="userPhone" id="userPhone" class="userPhone three" size="" maxlength="4" />
							</td>
						</tr>

						<tr class="email">
							<td class="left">이메일 *</td>
							<td class="right">
								<input type="text" name="userEmail" id="userEmail" size="25" />
								<input type="hidden" name="emailCheck" id="emailCheck" value="unchecked" />
								<input type="button" value="이메일 중복확인" onclick="emailCheckFn()"/>
							</td>
						</tr>
					</table>
					
					<table class="table2">
						<tr class="one sec2">
							<td class="left" colspan="2">추가정보</td>
						</tr>
						<tr>
							<td class="left">성별</td>
							<td class="right">
								<input type="radio" name="userGender" value="남자" checked />남자 
								<input type="radio" name="userGender" value="여자" />여자 
								<input type="radio" name="userGender" value="선택안함" />선택안함 <br>
							</td>
						</tr>
						<tr class="bd">
							<td class="left">생년월일</td>
							<td class="right bday">
								<input type="text" name="userBD" maxlength="4"> 년 
								<input type="text" name="userBD" maxlength="2"> 월 
								<input type="text" name="userBD" maxlength="2"> 일
							</td>
						</tr>
					</table>


					<!----------------table3-------------------->

					<table class="table3">
						<tr class="one sec3">
							<td class="left" colspan="2">이용약관동의* <span>모든 항목에 동의해야  회원가입을 할 수 있습니다. </span>
							</td>
						</tr>
					</table>

					<div class="agree" >
						<ul>
							<li>
								<input type="checkbox" name="cb" id="all"> 전체 동의
								<input type="hidden" name="allChecked" id="allChecked" value="unchecked">
								<input type="hidden" name="allChecked2" id="allChecked2" value="unchecked">
							</li>
							<li>
								<input type="checkbox" name="cb" class="chk 1"> 이용약관
								<span>(필수)</span>
								<a href="term1.html" onclick="window.open(this.href, '이용약관','width=800px, height=500px');return false;">약관 보기 ></a> 
							</li>
							<li>
								<input type="checkbox" name="cb" class="chk 2"> 개인정보처리방침
								<span>(필수)</span>
								<a href="term2.html" onclick="window.open(this.href, '개인정보처리방침','width=800px, height=500px');return false;">약관 보기 ></a> 
							</li>
							<li>
								<input type="checkbox" name="cb" class="chk 3"> 본인은 만 14세 이상입니다.
								<span>(필수)</span>
							</li>
						</ul>

					</div>
					<div class="submit">
						<input type="button" value="가입하기" onclick="joinFn()"/>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<script>

		$('#all').click(function() {
			if ($('#all').prop('checked')) {
				$('input[name=cb]').prop('checked', true);
				$('#allChecked').val('checked');
			} else {
				$('input[name=cb]').prop('checked', false);
				$('#allChecked').val('unchecked');
			}
		});
	
		$('.chk').click(function() {
			var count = 0;
			var $size = $('.chk').length;
			for (var i = 0; i < $size; i++) {
				if ($('.chk').eq(i).prop('checked') == true) {
					count++;
				}
			}
			if (count == '3') {
				$('#allChecked2').val('checked');
			} else{
				$('#allChecked2').val('unchecked');
			}
		});
		
	</script>
</body>
</html>