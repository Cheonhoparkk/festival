<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/headers.css" >
</head>
<header>
	<div id="headerDiv" class="px-3 py-2 text-bg-dark">
		<div class="container">
				<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				
				<!-- 로고 -->
				<a href="/" class="d-flex align-items-center col-md-4 mb-2 mb-md-0 text-dark text-decoration-none">
					<img src="/resources/images/Free_Sample_By_Wix_2.jpg" alt="오늘 뭐하지?"
					class="bi me-2" width="50" height="50" aria-label="logo">
				</a>
				
				<!-- 상단 메뉴바 -->
				<nav>
					<ul id="menu" class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
						<li>
							<a href="/views/festivalInfo/list" class="nav-link text-white">
								지역별 축제
							</a>
						</li>
						<li>
							<a href="/views/festivalInfo/finishedList" class="nav-link text-white">
								종료된 축제
							</a>
						</li>
						<li>
							<a href="/views/festivalInfo/likesList" class="nav-link text-white">
								인기 축제
							</a>
						</li>
						<li>
							<a href="/views/my-list/list" class="nav-link text-white">
								마이리스트
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- 하단 메뉴바 -->
	<div class="px-3 py-2 border-bottom mb-3">
		<div class="container d-flex flex-wrap justify-content-center">
			<div class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" role="search">
				<input type="search" id="search" class="form-control" placeholder="축제 검색(Enter)" class="form-control">
			</div>
			<div class="text-end">
				<c:if test="${userInfo eq null}">
					<button class="btn btn-light text-dark me-2"
						onclick='location.href="/views/user-info/login"'>로그인</button>
					<button class="btn btn-primary" onclick='location.href="/views/user-info/join"''>회원가입</button>
				</c:if>
				<c:if test="${userInfo ne null}">
				<button class="btn btn-light text-dark me-2" onclick=' location.href="/auth/logout"''>로그아웃</button>
					<button class="btn btn-primary" onclick='location.href="/views/user-info/view"''>회원정보</button>
				</c:if>
			</div>
		</div>
	</div>
</header>
<script>
		document.querySelector(' title').innerText = '오늘 뭐하지'; const searchDo = document.querySelector('#search'); function
			searchGo() { location.href = '/views/festivalInfo/searchlist?fesTitle=' + searchDo.value; }
		searchDo.addEventListener('keyup', key => {
			if (key.keyCode === 13) {
				searchGo();
			}
		})
</script>