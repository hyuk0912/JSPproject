<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		history.back();
	</script>
<% }else if(cnt == 2){ %>
	<script>
		alert("본인이 작성한 글이 아닙니다.")
		history.back();
	</script>
<% } else { %>
	<script>
		location.href = "boardListTable.do?board_champion=${board_champion }";
	</script>
<% } %>


