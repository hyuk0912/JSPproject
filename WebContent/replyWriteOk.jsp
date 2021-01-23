<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>


<% if(cnt == 0){ %>
	<script>
		history.back();
	</script>
<% }else if (cnt == 2){%>
	<script>
		alert("로그인이 필요합니다.");
		history.back();
	</script>
<% } else { %>
	<script>
		location.href = "boardView.do?board_id=${param.board_id}&board_champion=${param.board_champion }";
	</script>
<% } %>