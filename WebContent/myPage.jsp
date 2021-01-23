<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
	String user_id = (String)session.getAttribute("user_id");
%>

<c:choose>
	<c:when test="${empty user_id }">
		<script>
			location.href="myPageNoLogin.jsp";
		</script>
	</c:when>
	<c:otherwise>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="CSS/myPage.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>OP.IT</title>
</head>
<body>

<script>
//휴대폰번호 입력제한 
$(document).on("keyup", "#phone-number", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3")
			.replace("--", "-") );
	}

);


</script>
<!-- 공통 header+nav -->
<jsp:include page="thema.jsp"/>

<div class = "container">
<section class="container profile">
	<!-- 프로필사진설정 박스 -->
	<div class="card" style="width:500px">
   		<img class="card-img-top" src="profileImage/${list[0].user_profileImage }" alt="Card image" style="width:100%">
   		<div class="card-body">
     		<h4 class="card-title">프로필 사진 설정</h4>
     		<form action="profileUpload.do" method="POST" enctype="Multipart/form-data">
     		
     		<input type="file" name="user_profileImage" id="profilePhotoChange" class="btn-secondary btn-secondary btn-file col-sm-3">
     		
     		<input type="submit" id="profilePhotoChange" class="btn btn-outline-dark" value="저장">
     		
     		</form>
   		</div>
 	</div>
 	
 	<!-- 개인정보관리 박스 -->
 	<div id="profile2" class="container">
    	<div class="row">
    		<div class="col-sm-12 text-center">
    			
     	<div class="col-sm-1 text-center" id="emptyspace"><br></div>
    			<div class="col-sm-10 text-center" id="joinform">
    				<h2>개인정보관리</h2>
               		<form  name="frm" action="myPageUpdateOk.do" method="POST" class="needs-validation" >
                  		<table class="table table-boardered">
                     		<tr>
                        		<th>Change Password</th>
                        		<td><input type="password" class="form-control"
                           		name="user_pw" placeholder="비밀번호는 영문만 넣어주세요" value="${list[0].user_pw }"  minlength="5" maxlength="15" required>
                           	</td>
                     		</tr>
		                    
		                     <tr>
		                        <th>User Email</th>
		                        <td><input type="email" class="form-control" name="user_email" value="${list[0].user_email }" required></td>
		                     </tr>
		                     <tr>
		                        <th>User PhoneNumber</th>
		                        <td><input type="tel"  id = "phone-number" class="form-control" name="user_phone" value="${list[0].user_phone }" required></td>
		                     </tr>
		                     <tr>
		                        <td colspan="2">
		                        <input type="submit" class="btn btn-outline-dark" value="변경하기">
		                        <input type="button" id="memberDelete" class="btn btn-outline-dark"  value="탈퇴하기"></td>
		                     </tr>
                  		</table>
               		</form>
            	</div>
    		</div>
   		 </div>
	</div>
</section>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="JS/myPage.js"></script>
   
</body>
</html>
	</c:otherwise>
</c:choose>   