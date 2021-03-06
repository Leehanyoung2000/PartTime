<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 화면 최적화 -->
	<meta name="viewport" content="width-device-width", initial-scale="1">
	<title>알바선배</title>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
	<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="main.jsp">알바선배</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="main.jsp">홈</a></li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a></li>
					<!--<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>-->
				</ul>
			</div>
		</div>
	</nav>
<center>
	<!-- 로그인 양식 -->
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-4">	<!-- 영역 크기 -->
			<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
			<div class="jumbotron" style="padding-top: 20px;">
				<header class="py-5 bg-light border-bottom mb-4">
		            <div class="container">
		                <div class="text-center my-5">
		                    <a class="nav-link" href="main.jsp"><h1 class="fw-bolder">알바선배</h1></a>
		                </div>
		            </div>
	        	</header>
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
		</div>	
	</div>
</center>
</body>