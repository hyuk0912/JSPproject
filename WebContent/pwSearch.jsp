<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/pwSearch.css">

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<title>OP.IT</title>
</head>
<body>

<jsp:include page="thema.jsp"/>



	<!-- 로그인 부분 -->
	
		<div class="container-login100"id="idSearchDiv">
			<div class="wrap-login100" id="idSearch">
				<!-- 로그인 폼 -->
				<form class="login100-form validate-form" id="idSearchForm" action="pwSearchOk.do" method="POST">
					<span class="login100-form-title"> <!-- 제목 -->
						<p class="loginfont"  style="font-size: 40px;">비밀번호 찾기</p>
					</span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_id" 
							placeholder="아이디를 입력해주세요." required> <span class="focus-input100"></span>
						<span class="symbol-input100"><i class="fas fa-id-card"></i>
						</span>
					</div>
					
					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="user_name"
							placeholder="이름을 입력해주세요." required> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fas fa-user"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="user_email"
							placeholder="E-mail을 입력해주세요." required> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fas fa-envelope"></i>
						</span>
					</div>
					
					<div class="text-center p-t-12">
						<button type="submit" class="btn btn-secondary">비밀번호 찾기</button>
							
					</div>
				</form>
				
			</div>
		</div>
	


<jsp:include page="footer.jsp"></jsp:include>



</body>
</html>


