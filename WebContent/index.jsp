<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--
	  ,ad8888ba,   88888888ba        8888888888    	 888888888888888
	 d8"'    `"8b  88      "8b       	 88   			   888
	d8'        `8b 88      ,8P      	 d8          	   888
	88          88 88aaaaaa8P'      	 88                888
	88          88 88""""""'        	 88                888
	Y8,        ,8P 88               	 Y8                888
	 Y8a.    .a8P  88                	 Y8                888
	  `"Y8888Y"'   88       		 8888888888            888

	
	dev@op.it
-->

<!DOCTYPE html>
<html lang="ko">
<head>

<!-- 초기화면 배율 설정-->

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!--구글폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/index.css">




<meta charset="UTF-8">
<title>OP.IT</title>


</head>
<body>

	<jsp:include page="thema.jsp" />


	<!-- 백그라운드 영상  -->
	<section class="video">
		<div class="overlay"></div>
		<video playsinline="playsinline" autoplay="autoplay" muted="muted"
			loop="loop">
			<source src="img/kda-worlds-login.mp4" type="video/mp4">
		</video>

		<!-- 전적검색창 -->
		<div class="container h-100">
			<div class="d-flex justify-content-center h-100 align-items-center">
				<form id="searchFrm" action="historyMain.do" method="POST">
					<div class="search">
						<script>
						function checkSpacebar() {
							var kcode = event.keyCode;
							if (kcode == 32)
								event.returnValue = false;
						}
						</script>
						
						<input class="search_input" type="text" name="search_id" onkeydown="checkSpacebar();" 
							placeholder="소환사명을 입력해주세요 .."/>
						<button type="submit" class="search_icon">
							<i class="fa fa-search" ></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</section>

	<!-- 유투브 부분 -->
	<section class="my-5">
		<div class="container">
			<div class="row">

				<div class="youtube">
					<iframe width="500" height="325"
						src="https://www.youtube.com/embed/MIl-H3NShvc" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<div class="youtubenote">
						<p class="note">게임 업데이트</p>
						<p class="note1">10.21 패치 노트 소식</p>
						<p class="youtubetag">
							이익! 릴리아의 목소리로 패치를 들어보세요!<br> 잠들 시간~｜10.21 TFT 패치노트 하이라이트 -
							전략적 팀 전투
						</p>
						<img src="img/youtube.png" class="youtubelogo">League of
						Legends - Korea
						<button type="button" class="btn btn-dark"
							style="font-size: 14px;"
							onclick="location.href='https://www.youtube.com/channel/UCooLkG0FfrkPBQsSuC95L6w'">자세히
							보기</button>
					</div>
					<br>
				</div>
				<div class="youtube">
					<iframe width="500" height="325" src="https://www.youtube.com/embed/YV5OzhMaZYk" 
					frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen></iframe>
					
					<div class="youtubenote">
						<p class="note">LCK</p>
						<p class="note1">OPENING CEREMONY (feat.머쉬베놈)</p>
						<p class="youtubetag"> GEN.G, T1 두둥등장 | 2020 LCK 스프링</p>

					</div>

				</div>
			</div>
		</div>

	</section>



	<jsp:include page="footer.jsp" />



</body>

</html>