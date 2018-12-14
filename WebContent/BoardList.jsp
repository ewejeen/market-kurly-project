<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.kurly.BoardDTO.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link rel="stylesheet" href="css/BoardList.css" media="all" />
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
						<h2>공지사항</h2>
						<span>컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</span>
						
						<c:if test="${sessionId=='admin' }">
							<input type="button" id="adminWrite" value="글 작성" onclick="location.href='BoardWrite.jsp'"/>
						</c:if>
					</div>
					<div class="con">
						<table>
							<tr>
								<th class="number">번호</th>
								<th class="title">제목</th>
								<th class="writer">작성자</th>
								<th class="date">작성일</th>
								<th class="view">조회</th>
							</tr>
							<tbody id="tb">
								<%
								for(BoardDTO dto:list){
									Timestamp regdate = dto.getRegdate();
									String date = new SimpleDateFormat("yyyy-MM-dd").format(regdate);
								%>
								<tr>
									<td class="number"><%=dto.getNo() %></td>
									<td class="title" onclick="location.href='boardView.bo?no=<%=dto.getNo()%>'"><%=dto.getTitle() %></td>								
									<td class="writer"><%=dto.getWriter() %></td>								
									<td class="date"><%=date %></td>								
									<td class="view"><%=dto.getHit() %></td>		
								</tr>						
								<%
								}
								%>
							
							<!-- 
								<tr>
									<td class="number">공지</td>
									<td class="title" onclick="location.href='BoardView.jsp'">[가격인상공지] 제주 삼다수 2종 (묶음) (2018. 9. 14~)</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2018-09-10</td>
									<td class="view">4</td>
								</tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">이용약관 및 개인정보처리방침 개정</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2018-09-06</td>
									<td class="view">71</td>
								</tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">마켓컬리 고객님께 안내드립니다.</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2018-07-31</td>
									<td class="view">3264</td>
								</tr>
								<tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">컬리패스 개편 안내(6/5~)</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2018-05-18</td>
									<td class="view">10887</td>
								</tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">크리스마스(12/25), 신정(1/1) 배송안내 드립니다.</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2017-12-18</td>
									<td class="view">2516</td>
								</tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">마켓컬리 배송 안내</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2016-01-08</td>
									<td class="view">659355</td>
								</tr>
								<tr>
									<td class="number">공지</td>
									<td class="title">마켓컬리 교환 및 환불 규정 안내</td>
									<td class="writer">MarketKurly</td>
									<td class="date">2015-09-15</td>
									<td class="view">9723</td>
								</tr>\
								
							 -->
							 
							 	
							</tbody>
						</table>
					</div>
					<div class="pageNo">
						<div class="pageCon">
							<ul>
								<li><<</li>
								<li><</li>
								<li>1</li>
								<li>2</li>
								<li>3</li>
								<li>4</li>
								<li>5</li>
								<li>6</li>
								<li>7</li>
								<li>8</li>
								<li>9</li>
								<li>10</li>
								<li>></li>
								<li>>></li>
							</ul>
						</div>
					</div>
					<div class="search">
						<div class="left">
							<span>검색어</span> <input type="checkbox" name="이름">
							<p>이름</p>
							<input type="checkbox" name="제목">
							<p>제목</p>
							<input type="checkbox" name="내용">
							<p>내용
						</div>
						<div class="right">
							<img src="img/search.png" alt="검색"> <input type="text"
								name="검색">
						</div>
					</div>

				</div>
			</div>

			<jsp:include page="footer.jsp" />
		</div>

	</div>


</body>
</html>