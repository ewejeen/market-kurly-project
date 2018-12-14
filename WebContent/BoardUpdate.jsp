<%@page import="org.kurly.BoardDTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	String content = dto.getContent();
	content.replace("</br>","<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 글 작성</title>
<link rel="stylesheet" href="css/BoardUpdate.css">
<script>
	var xhr = new XMLHttpRequest();
	
	function updateFn(){
		var no = document.getElementById('no');
		var title = document.getElementById('title');
		var content = document.getElementById('content').value;
		content = content.replace(/(?:\r\n|\r|\n)/g,'<br/>');
		var writer = document.getElementById('writer');
		var url = 'boardUpdate.bo';
		var data = '?no='+no.value+'&title='+encodeURI(title.value)+'&content='+encodeURI(content)+'&writer='+encodeURI(writer.value);
		
		xhr.open('post',url+data,true);
		xhr.setRequestHeader('Content-Type','application/x-www-urlencoded;charset=utf8');
		xhr.onreadystatechange=updateOk;
		xhr.send(null);
	}
	
	function updateOk(){
		if(xhr.readyState==4 && xhr.status==200){
			var result = xhr.responseText;
			var no = document.getElementById('no');
			
			if(result==1){
				alert('글 수정 성공');
				location.href='boardView.bo?no='+no.value;
			} else{
				alert('글 수정 실패');
			}
		}
	}
	
	
</script>
</head>
<body>

	<div id="wrap">
		<jsp:include page="header.jsp" />
		<div id="main">
			<div class="board">
				<div class="leftBoard">
					<span class="title">고객센터</span>

					<ul>
						<li onclick="location.href='boardList.bo'"><span class="con">공지사항</span> <span class="ar">></span></li>
						<li><span class="con">자주하는 질문</span> <span class="ar">></span>
						</li>
						<li onclick="location.href='QNARegister.jsp'"><span class="con">1:1 문의</span> <span class="ar">></span>
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
						<h2>공지 글 수정</h2>
					</div>
					<div class="con">
						<ul>
							<li>
								<div class="conLeft">제목</div>
								<div class="conRight">
									<input type="hidden" name="no" id="no" value="<%=dto.getNo()%>">
									<input type="text" name="title" id="title" value="<%=dto.getTitle()%>">
								</div>
							</li>
							<li>
								<div class="conLeft">작성자</div>
								<div class="conRight">
									<span class="writer"><%=session.getAttribute("sessionId")%></span>
									<input type="hidden" name="writer" id="writer" value="<%=session.getAttribute("sessionId") %>" />
								</div>
							</li>
							
							<li class="QNA">
								<div class="conLeft">내용</div>
								<div class="conRight">
									<textarea rows="4" cols="50" id="content" name="content"><%=content%></textarea>
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
							<input type="button" value="저장" onclick="updateFn()">
						</div>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="footer.jsp" />

	</div>
</body>
</html>