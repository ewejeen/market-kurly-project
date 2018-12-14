<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A글 등록</title>
<link rel="stylesheet" href="css/QNARegister.css">
</head>
<body>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		<div id="main">
			<div class="board">
				<div class="leftBoard">
					<span class="title">고객센터</span>

					<ul>
						<li><span class="con">공지사항</span> <span class="ar">></span></li>
						<li><span class="con">자주하는 질문</span> <span class="ar">></span>
						</li>
						<li><span class="con">1:1 문의</span> <span class="ar">></span>
						</li>
						<li><span class="con">대량주문 문의</span> <span class="ar">></span>
						</li>
						<li><span class="con">상품 제안</span> <span class="ar">></span>
						</li>
						<li><span class="con">에코포장 피드백</span> <span class="ar">></span>
						</li>
					</ul>
					<div class="onetoone">
						<div class="txt">
							<span>도움이 필요하신가요?</span> <span class="second">1:1 문의하기</span>
						</div>
						<div class="ar">
							<span>></span>
						</div>
					</div>
				</div>

				<div class="rightBoard">
					<div class="title">
						<h2>1:1 문의</h2>
					</div>
					<div class="con">
						<ul>
							<li>
								<div class="conLeft">제목</div>
								<div class="conRight">
									<select name="title">
										<option value="">선택해주세요</option>
										<option value="배송지연/불만">배송지연/불만</option>
										<option value="컬리패스 (무료배송)">컬리패스 (무료배송)</option>
										<option value="반품문의">반품문의</option>
										<option value="A/S문의">A/S문의</option>
										<option value="환불문의">환불문의</option>
										<option value="주문결제문의">주문결제문의</option>
										<option value="회원정보문의">회원정보문의</option>
										<option value="취소문의">취소문의</option>
										<option value="교환문의">교환문의</option>
										<option value="상품정보문의">상품정보문의</option>
										<option value="기타문의">기타문의</option>
									</select> <input type="text" name="title">
								</div>
							</li>
							<li>
								<div class="conLeft">주문번호</div>
								<div class="conRight">
									<input type="text" name="orderNo" disabled> <input
										type="button" value="주문조회">
								</div>
							</li>
							<li>
								<div class="conLeft">이메일</div>
								<div class="conRight">
									<input type="text" name="email" placeholder="yoojin@gmail.com"
										disabled> <input type="checkbox" name="emailCheck"><span>답변수신을
										이메일로 받겠습니다.</span>
								</div>
							</li>
							<li>
								<div class="conLeft">문자메시지</div>
								<div class="conRight">
									<input type="text" name="phone" placeholder="010-1234-5678"
										disabled> <input type="checkbox" name="phoneCheck"><span>답변수신을
										문자메시지로 받겠습니다.</span>
								</div>
							</li>
							<li class="QNA">
								<div class="conLeft">내용</div>
								<div class="conRight">
									<div class="txt">
										<p>1:1 문의 작성 전 확인해주세요!</p>
										<p class="title">반품 / 환불</p>
										<p>- 제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.</p>
										<p class="title">주문취소</p>
										<p>
											- 주문취소 신청을 배송일 전날 오후 6시까지 가능합니다. 오후 6시 이후에는 생산이 시작되어 취소가
											불가능합니다.<br> - 주문상품의 부분 취소는 불가능합니다. 전체 주문취소 후 재구매 해주세요.
										</p>
										<p class="title">배송</p>
										<p>
											- 주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.<br> - 배송일 및 배송시간
											지정은 불가능합니다. (예약배송 포함)
										</p>
										<p class="last">* 주문취소 외 평일 오후 4시 (주말 공휴일 12시)까지 접수된 문의는
											당일 답변드립니다. 이후 문의는 다음날 오전 8시 부터 순차적으로 답변드립니다.</p>
									</div>
									<textarea rows="4" cols="50"></textarea>
								</div>
							</li>
							<li>
								<div class="conLeft">이미지</div>
								<div class="conRight">
									<div class="rightTop">
										<span class="no">1</span> <input type="button" value="파일 선택">
										<span class="file">선택된 파일 없음</span> <img
											src="img/btn_upload_plus.gif" alt="업로드 추가">
									</div>
									<div class="rightBtm">
										<span>- 파일은 최대 5개까지 업로드가 지원됩니다.</span>
									</div>
								</div>
							</li>
						</ul>
						<div class="saveBtn">
							<input type="button" value="저장">
						</div>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>