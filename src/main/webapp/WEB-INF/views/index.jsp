<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER -->
	<header>
		<h1><img src="logo.jpg" alt="오늘 뭐하지?"></h1>
		<div>
			<c:if test="${userInfo eq null}">
			<a href="/auth/login">로그인</a>
			<a href="/auth/join">회원가입</a>
			</c:if>
			<c:if test="${userInfo ne null}">
			<a href="/auth/logout">로그아웃</a>
			<a href="/auth/view">회원정보</a>
			</c:if>
		</div>
		<div>
			<input type="text" value="검색어 입력">
			<input type="submit" value="검색">
		</div>
		<nav>
			<ul id="menu">
				<li><a href="">지역별 축제</a>
				<li><a href="">전국 축제</a>
				<li><a href="">인기 축제</a>
				<li><a href="">찜 목록</a>
			</ul>
		</nav>		
	</header>
	<!-- HEADER END -->

<c:if test="${userInfo eq null}">
로그인을 해주시기 바랍니다.
<a href="/auth/login">로그인</a>
<a href="/auth/join">회원가입</a><br>
<a href=""><img src="/resources/kakao_login/ko/kakao_login_medium_narrow.png"/></a><br>
<a href=""><img src="/resources/kakao_login/ko/kakao_login_medium_wide.png"/></a>
</c:if>
<c:if test="${userInfo ne null}">
${userInfo.uiName}님 안녕하세요.
<a href="/auth/view">회원정보</a>
<a href="/auth/list">게시판</a>
<a href="/logout">로그아웃</a>
</c:if>


	<!-- MAIN -->
	<main>
		
	</main>
	<!-- MAIN END -->


	<!-- FOOTER -->
	<footer>
		<div>
			<p>오늘 뭐하지?</p>
		</div>
		<div>
			<p>사이트 제작 : NowonEzen3rdTeam</p>
		</div>
		<p>팀원 : 남궁명건, 박진영, 송준수, 최아름, 현상민</p>
		<p>팀 이메일 : nowonezen3rdteam@gmail.com</p>
		<p>데이터 제공 : 한국관광공사</p>
	</footer>
	<!-- FOOTER END -->

</body>
</html>