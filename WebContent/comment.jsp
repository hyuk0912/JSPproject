<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>OP.IT</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OP.IT</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">




<style>
*{
	margin: 0;
	padding: 0;
}

.commentCntDiv{
	background-color: lightgray;
	width: 100%;
	height: 100px;
	margin-bottom: 50px;
	margin-top: 100px;
}
.commentTxt1 {
	float: left;
	font-size: 30px;
	margin-top: 30px;
	margin-left: 20px;
}
.commentTxt2 {
	float: left;
	font-size: 20px; 
	margin-top: 35px;
	margin-left: 20px;
}

#commentHr{
	background-color: gray;
	height: 1px;
}

#commentTextArea{
	margin-top: 50px;
	margin-bottom: 50px;
}


#replySubmitBt {
	float: right;
	margin-bottom: 50px;
}

</style>

</head>
<body>


	<div class="commentCntDiv">
		<p class="commentTxt1">댓글</p>
		<p class="commentTxt2">총 0개</p>
	</div>
	<form action="replyWriteOk.do" method="POST">
		<input type="hidden" name="reply_writer" value="hyuk"/>
		<textarea rows="5" cols="30" class="form-control" name="reply_content" id="commentTextArea"></textarea>
		<input type="hidden" name="board_id" value="${param.board_id }"/>
		<input type="hidden" name="board_champion" value="${param.board_champion }"/>
		<input id="replySubmitBt" type="submit" value="댓글 작성"/>
	</form>
	<h3>최신순</h3>
	<hr id="commentHr">
	<div class="comment">
		<ul>
			<li>작성자 : ${list[0].reply_writer }</li>
			<li>내용 : ${list[0].reply_content }</li>
			<li>작성시간 : ${list[0].reply_regDate }</li>
		</ul>
	</div>

</body>
</html>