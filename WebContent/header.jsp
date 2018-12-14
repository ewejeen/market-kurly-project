<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/reset.css" media="all" />
<link rel="stylesheet" href="css/header.css" media="all" />

<div class="headerAd">
	<img src="img/closeButton.png" alt="닫기">
</div>
<span class="headerline"></span>
<span class="headerShadow"></span>

<div id="header">
	<div class="topHeader">
		<div class="topMenu">
			<div class="topGnb">
				<ul>
				<%
				if(session.getAttribute("sessionId")==null){
				%>
					<li><a href="MemberJoin.jsp">회원가입</a></li>
					<li><span class="topvline"></span> <a href="MemberLogin.jsp">로그인</a></li>				
					<li><span class="topvline"></span> <a href="boardList.bo">고객센터</a></li>
					<!-- <li><span class="topvline"></span> <a href="NotLoggedIn.jsp">고객센터</a></li>-->
				<%	
				} else{
				%>
					<li class="sId"><span class="sId"><%=session.getAttribute("sessionId") %> </span></li>
					<li><span class="topvline"></span> <a href="memberLogout.mo">로그아웃</a></li>				
					<li><span class="topvline"></span> <a href="boardList.bo">고객센터</a></li>
				<%
				}
				%>
					<li class="loc"><span class="topvline"></span> <a href="#">배송지역검색</a></li>
				</ul>
			</div>

			<div class="title">
				<img src="img/kurly_logo.png" alt="로고" class="logo" onclick="location.href='MainIndex.jsp'">
			</div>

		</div>

	</div>

	<div class="bottomHeader">
		<div class="mainGnb">
			<ul>
				<li class="first"><span class="line l1"></span> <span
					class="line l2"></span> <span class="line l3"></span> <a href="">전체
						카테고리</a></li>
				<li><a href="">신상품</a></li>
				<li><span class="vline"></span> <a href="">베스트</a></li>
				<li><span class="vline"></span> <a href="">알뜰쇼핑</a></li>
				<li><span class="vline"></span> <a href="">이벤트</a></li>
				<li class="search"><input type="text" name="search" id="search">
				</li>
				<li class="last"></li>
			</ul>
		</div>

	</div>

</div>
