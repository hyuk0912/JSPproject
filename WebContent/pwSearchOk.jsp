<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String user_pw = (String)request.getAttribute("user_pw"); %>

<%System.out.print("user_pw :"+ user_pw); %>


<% if(user_pw == ""){ %>
<script>
	location.href="searchPWFail.jsp"
</script>
<%}else{ %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>OP.IT</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="CSS/myPageNoLogin.css" />
</head>
<body>
<jsp:include page="thema.jsp"></jsp:include>

<div class="container">
	<div class="outer">
		<div class="goLogin">
			<div class="loginNeed">
			<h4>찾으시는 비밀번호는  <%=user_pw %> 입니다.</h4>
			</div>
			<div class="inner">
				<button type="button" id="loginNo" class="btn btn-secondary" onclick="location.href='login.do'">로그인하기</button>		
			</div>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%} %>


