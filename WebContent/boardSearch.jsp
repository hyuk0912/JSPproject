<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%>


<%
	int writePages = 10;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OP.IT</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="CSS/boardSearch.css">


</head>

<body>


   <jsp:include page="boardListChamp.jsp" />
   

   <div class="container">
      
      <form id="searchForm" action="boardSearch.do" method="POST">
      <input type="hidden" name="board_champion" value="${board_champion }"/>
      
      <select id="searchKindId" class="selectpicker" name="searchKind">
          <option value="board_title">제목</option>
         <option value="board_writer">작성자</option>
      </select>
      
      <input type="text" name="searchText"/>
      <input type="submit" value="찾기"/>
      </form>
      
      <table class="table table-bordered table-hover" id="noticeListTable">
         <tr>
            <th>추천순</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성날짜</th>
         </tr>

         
         <c:choose>
            <c:when test="${empty searchList || fn:length(searchList) == 0 }">
               <script>
               alert("검색어가 없습니다.");
               history.back();
               </script>
            </c:when>

            <c:otherwise>
               <c:forEach var="dto" items="${searchList }">
                  
                  <tr>
                     <td id="textflow"><a class="board_menu"
                        href="boardView.do?board_id=${dto.board_likeCnt}&board_champion=${dto.board_champion }">${dto.board_likeCnt }</a></td>
                     <td id="textflow"><a class="board_menu"
                        href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_title }</a></td>
                     <td id="textflow"><a class="board_menu"
                        href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_writer }</a></td>
                     <td id="textflow"><a class="board_menu"
                        href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_viewCnt }</a></td>
                     <td id="textflow"><a class="board_menu"
                        href="boardView.do?board_id=${dto.board_id}&board_champion=${dto.board_champion }">${dto.board_regDate }</a></td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
      </table>
      <a href="boardWrite.do?board_champion=${board_champion }"
         class="btn btn-outline-dark" id="writeBtn">작성하기</a>
   <div class = "clear"></div>
      
      <%--페이징 --%>
      <jsp:include page="pagination_search.jsp">
         <jsp:param value="<%= writePages %>" name="writePages"/>
         <jsp:param value="${totalPage }" name="totalPage"/>
         <jsp:param value="${curPage }" name="curPage"/>
      </jsp:include>

   </div>
   <div class = "clear"></div>
   <br><br>
<jsp:include page="footer.jsp" />
</body>



</html>