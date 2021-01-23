<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--
     ,ad8888ba,   88888888ba       8888888888     888888888888888
    d8"'    `"8b  88      "8b          88               888
   d8'        `8b 88      ,8P          d8               888
   88          88 88aaaaaa8P'          88               888
   88          88 88""""""'            88               888
   Y8,        ,8P 88                   Y8               888
    Y8a.    .a8P  88                   Y8               888
     `"Y8888Y"'   88               8888888888           888

   
   dev@op.it
-->



<%-- search_id : name값 --%>
   <%
      String search_id = (String) request.getAttribute("search_id");
   	%>
   	
   	<%
      if(search_id != search_id.replaceAll("\\p{Punct}", "") || search_id == null || search_id == ""){ %>
   		  <script>
   		 	location.href="noneIderror.jsp"
   		 </script> 
   	<% }%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전적 검색 페이지</title>
<link rel="stylesheet" href="CSS/historyMain.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  
</head>
<body>
   
   <jsp:include page="thema.jsp" />
   
   <div class="container">

      <!-- 소환사 기본정보 -->
      <div id="summoner">
         <%-- 
            소환사의 기본정보 : 닉네임, 레벨, 랭크(?승?패) -> 이번시즌 
         --%>
         <div id="summoner_img"></div>
         <div id="summoner_info"></div>
      </div>

      <div id="league">
         <!-- 소환사 솔로랭크 정보 -->
         <div id="leagueSolo">
            <%-- 
               솔로랭크 : 랭킹:519,988위(33%), 리그: 솔로랭크5X5, 등급:PLATINUM IV, 리그포인트:36, 승급전:-, 12전 6승 6패(50.00%)
            --%>
         </div>

         <!-- 소환사 자유랭크 정보 -->
         <div id="leagueFlex">
            <%-- 
               자유랭크 : 랭킹:519,988위(33%), 리그: 자유랭크5X5, 등급:SILVER IV, 리그포인트:72, 승급전:진행중, , 112전 49승 63패(43.75%)
            --%>
         </div>
      </div>


      <!-- 챔피언 숙련도 상위 10개  정보 -->
      <div id="champion_mastery">
         <%-- 
                           숙련도 총합 : ?? 점
            [챔피언 이미지파일] 르블랑                      395,843 점 
            [챔피언 이미지파일] 자르반4세                  185,200 점
                     
         --%>
         <div id="mastery_img"></div>
         <div id="mastery_info"></div>

      </div>

      <!-- 최근 플레이한 게임 -->
      <div id="recentPlay">
         <%-- 
                                                   <최근 게임 목록>  
            메뉴 - 승/패    챔피언    타입          KDA       S/R       팀                아이템          
                  승      럭스      솔로랭크       평점5.00      점멸/점화      가렌/야스오...등      몰락/도란검...               
                                       2/1/3                                             
                                                                                    
         --%>


      </div>

   </div>

   <script>
      // 전적 검색창에 입력한 아이디
      search_id = "${search_id }";
      
   </script>

	 <script type="text/javascript" src="JS/historyMain.js"></script>
	<jsp:include page="footer.jsp" />
</body>

</html>