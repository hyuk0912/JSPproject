<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<!-- 초기화면 배율 설정-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--아이콘-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>



<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

  



<!-- css파일 불러오기-->
<link rel="stylesheet" href="CSS/login.css">
<!-- 

1) login.jsp : 로그인을 할때 보여지는 폼 화면

2) loginCommand : 실질적으로 값을 전달받아 처리하는 페이지

3) loginOK.jsp : 로그인 버튼 눌렀을때 결과를 알려주는 페이지 (로그인 완료)

4) thema.jsp : 저장된 값과 비교하여 로그인 기능을 처리하는 페이지

5) themaLoginCommand.java :

6) logout.jsp : 로그아웃 페이지

 -->


<title>OP.IT</title>
</head>
<body>
   <jsp:include page="thema.jsp" />

   <!-- 로그인 부분 -->
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
               <!--  로그인 왼쪽 이미지 -->
               <img src="img/1.png" alt="PNG">
            </div>
            <!-- 로그인 폼 -->
            <div class="login">
               <!-- method="post"는 POST 방식을 이용하여 URL 경로를 숨기는 기능 -->
               <form class="login100-form validate-form" action="loginOk.do"
                  method="POST">
                  <span class="login100-form-title"> <!-- 제목 -->
                     <p class="loginfont" style="font-size: 40px;">OP.IT 로그인</p>
                  </span>

                  <div class="wrap-input100 validate-input">
                     <input class="input100" type="text" name="user_id"
                        placeholder="아이디를 입력해주세요." required> <span class="focus-input100"></span>
                     <span class="symbol-input100"> <!-- 아이디 아이콘 --> <i
                        class="fa fa-envelope" aria-hidden="true"></i>
                     </span>
                  </div>

                  <div class="wrap-input100 validate-input"
                     data-validate="Password is required">
                     <input class="input100" type="password" name="user_pw"
                        placeholder="비밀번호를 입력해주세요." required> <span
                        class="focus-input100"></span> <span class="symbol-input100">
                        <i class="fa fa-lock" aria-hidden="true"></i> <!-- 비밀번호 아이콘 -->
                     </span>
                  </div>

                  <div class="container-login100-form-btn">
                     <button type="submit" class="login100-form-btn">로그인</button>
                  </div>
                  <br>
                  
                  
                  <div class="text-center p-t-12">
                     <a class="txt1" href="idSearch.do"> 아이디찾기 </a> <a class="txt2"
                        href="pwSearch.do"> 비밀번호 찾기 </a>
                        <br>
                        <br>
                     <a class="txt3" href="signUp.jsp">계정생성</a>
                     <!-- 네이버 로그인 -->
                  <div id="naverIdLogin" class="btn btn-block .btn-social"></div>
                  <!-- 카카오 로그인 -->
                   <a id="kakao-login-btn" class="btn btn-block .btn-social"></a>
                  <a href="http://developers.kakao.com/logout"></a>
                  <script type='text/javascript'>
                                    // 사용할 앱의 JavaScript 키를 설정
                     Kakao.init('50e0127f513ee387d3b10a3312f2fb89');

                     // 카카오 로그인 버튼을 생성합니다.
                     Kakao.Auth.createLoginButton({
                              container : '#kakao-login-btn',
                              success : function(authObj) {

                                 // 로그인 성공시, API를 호출합니다.
                                 Kakao.API.request({
                                          url : '/v2/user/me',
                                          success : function(res) {
                                             console.log(res);

                                             var userID = res.id; //유저의 카카오톡 고유 id
                                             var userEmail = res.kakao_account.email; //유저의 이메일
                                             var userNickName = res.properties.nickname; //유저가 등록한 별명

                                             console.log(userID);
                                             console.log(userEmail);
                                             console.log(userNickName);
                                          },
                                          fail : function(error) {
                                             alert(JSON.stringify(error));
                                          }
                                       });
                              },
                              fail : function(err) {
                                 alert(JSON.stringify(err));
                              }
                           });
 
                  </script>
                   </div>
       

               </form>
            </div>
         </div>
      </div>
   </div>


   <jsp:include page="footer.jsp" />
   <script src="JS/social_login.js"></script>
   



</body>
</html>


