<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<meta charset="UTF-8">
<title>전적 검색 페이지 에러</title>
<link rel="stylesheet" href="CSS/error.css" />
</head>
<body>
	<jsp:include page="thema.jsp"/>
	
	<div class="container">

		<div class="message">
			<h2>검색창에 정확한 소환사명을 입력해주세요.</h2>	
		</div>
		<div id="errorView">	
			<img src="img/profilePhoto/notfound.png" alt="여기에 이미지 추가" />		
	</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>