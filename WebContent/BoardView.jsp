<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="org.kurly.BoardDTO.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	Timestamp regdate = dto.getRegdate();
	String date = new SimpleDateFormat("yyyy-MM-dd").format(regdate);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기::<%=dto.getTitle() %></title>
<link rel="stylesheet" href="css/BoardView.css">

<script>
	
	var xhr = new XMLHttpRequest();
	
	function deleteFn(){
		var no = document.getElementById('no');
		
		var url = 'boardDelete.bo';
		var data = '?no='+no.value;
		
		xhr.open('post',url+data,true);
		xhr.setRequestHeader('Content-Type','application/x-www-urlencoded;charset=utf8');
		xhr.onreadystatechange=deleteOk;
		xhr.send(null);
	}
	
	function deleteOk(){
		if(xhr.readyState==4 && xhr.status==200){
			var result = xhr.responseText;
			if(result==1){
				alert('게시글이 성공적으로 삭제되었습니다.');
				location.href='boardList.bo';
			} else{
				alert('게시글 삭제 실패. 다시 시도해 주세요.');
			}
		}
	}
</script>

</head>
<body>

	<div id="wrap">

		<jsp:include page="header.jsp" />

		<div id="main">

			<div class="homeGnb">
				<span class="homeGnb">홈 > 고객행복센터 > <b>공지사항</b></span>
			</div>

			<div class="mainTitle">
				<h4>공지사항</h4>
				<span>컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
			</div>

			<div class="mainTable">
				<ul>
					<li>
						<input type="hidden" name="no" id="no" value="<%=dto.getNo() %>" />
						<span class="title">제목</span>
						<span class="con"><%=dto.getTitle() %></span>
					</li>
					<li>
						<span class="title">작성자</span>
						<span class="con"><%=dto.getWriter() %></span>
					</li>
					<li>
						<span class="title">작성일</span>
						<span class="con1"><%=date %></span>
						<span class="title">조회수</span>
						<span class="con2"><%=dto.getHit() %></span></li>
				</ul>
				<div class="mainContent">
					<%=dto.getContent()%>
				</div>
			</div>
			<div class="btmButton">
				<input type="button" value="목록" id="list" onclick="location.href='boardList.bo'">
				<%
				if(session.getAttribute("sessionId").equals("admin")){
				%>
				<div class="admin">
					<input type="button" value="수정" onclick="location.href='boardUpdateView.bo?no='+<%=dto.getNo()%>">
					<input type="button" value="삭제" onclick="deleteFn()">				
				</div>
				<%	
				}
				%>
			</div>

			<div class="btmMove">
				<ul>
					<li class="prev"><span class="title">∧ 이전글</span> <span
						class="con">[가격인상공지] [우오가시] 민물 양념장어 (2018. 8. 23~)</span></li>
					<li class="next"><span class="title">∨ 다음글</span> <span
						class="con">[가격인상공지] "라온현미유" 리콜 안내</span></li>
				</ul>
			</div>

			<jsp:include page="footer.jsp" />

		</div>
	</div>
</body>
</html>