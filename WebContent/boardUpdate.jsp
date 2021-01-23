<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String user_id = (String) session.getAttribute("user_id");

%>
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>

	<c:when test="${list[0].board_writer != user_id }">
		<script>
			alert("본인이 작성한 글이 아닙니다.")
			history.back();
		</script>
	</c:when>

	<c:when test="${empty user_id }">
		<script>
			alert("로그인이 필요합니다.")
			location.href = "login.do";
		</script>
	</c:when>
	<c:otherwise>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="ckeditor/ckeditor.js"></script>

<title>게시글 수정하기-${list[0].board_title }</title>


<script src="//cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
<link rel="stylesheet" href="CSS/boardUpdate.css">


</head>

<script>
	function chkSubmit() {
		frm = document.forms["frm"];

		var board_title = frm["board_title"].value.trim();

		if (board_title == "") {
			alert("제목을 반드시 작성해야 합니다");
			frm["board_title"].focus();
			return false;
		}
		return true;
	} // end chkSubmit()
</script>

<body>

	<jsp:include page="thema.jsp" />


	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2 class="text-center">게시글 수정하기</h2>
			<form name="frm" action="boardUpdateOk.do" method="POST"
				onsubmit="return chkSubmit()">
				<input type="hidden" name="board_id" value="${list[0].board_id }">
				<input type="hidden" name="board_champion"
					value="${list[0].board_champion }">
				<table class="table table-striped">
					<tr>
						<td class="danger">작성자</td>
						<td></td>
						<td class="danger">작성일</td>
						<td></td>
					</tr>
					<tr>
						<td  class="danger" >제목</td>
						<td colspan="3"><input type="text" class="form-control"
							name="board_title" value="${list[0].board_title }" /></td>
					</tr>

					<tr>
						<td class="danger">글내용</td>
						<td colspan="3"><textarea rows="10" cols="50" name="board_content"
								class="form-control"  id="editor1">${list[0].board_content }</textarea>
								<script>
								//CKEDITOR 적용
								CKEDITOR
								.replace(
										'editor1',
									{
									allowedContent : true, // HTML 태그 자동삭제 방지 설정
									width : '1000px', // 최초 너비, 높이 지정 가능
									height : '400px',
									filebrowserUploadUrl : '${pageContext.request.contextPath}/BoardFileUpload.do'
									});
								
								
								</script>
								
								</td>
					</tr>

					<tr>
						<td colspan="4" class="text-center">
							<button type="button" class="btn btn-primary" id="listBtn"
								onclick="location.href='boardListTable.do?board_champion=${list[0].board_champion}'">전체
								게시글보기</button> <input type="submit" value="수정하기" class="btn btn-success"
							id="updateSubmit" onclick="alert('수정완료')">
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>


</body>
		</html>

	</c:otherwise>
</c:choose>