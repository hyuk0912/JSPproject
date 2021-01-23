<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String user_id = (String)session.getAttribute("user_id");
%>

<c:set var="championKey" value="<%= new int [] {
86,
3,
41,
79,
104,
150,
267,
75,
111,
56,
20,
76,
518,
122,
131,
119,
13,
497,
33,
99,
68,
58,
89,
421,
107,
236,
876,
11,
57,
90,
54,
82,
25,
36,
21,
432,
110,
254,
45,
67,
161,
106,
201,
63,
8,
53,
112,
78,
14,
517,
35,
235,
113,
875,
37,
16,
98,
102,
50,
72,
15,
5,
134,
27,
412,
103,
32,
136,
427,
268,
84,
266,
523,
12,
1,
34,
22,
157,
245,
60,
62,
516,
61,
2,
777,
83,
77,
6,
19,
350,
39,
28,
81,
420,
59,
498,
143,
154,
40,
24,
238,
101,
126,
142,
115,
202,
26,
222,
31,
43,
164,
38,
30,
69,
145,
121,
55,
429,
85,
51,
141,
10,
96,
42,
133,
240,
246,
203,
44,
91,
163,
223,
48,
18,
23,
4,
29,
17,
555,
80,
9,
114,
105,
74,
120
} %>"/>


<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/champList.css">


<title>OP.IT</title>

</head>
<body>
	<jsp:include page="thema.jsp" />
	<div class="container">
		<h1 id="champTitle">챔피언 공략 게시판</h1>
		<h3 id="champSubTitle">챔피언을 선택해 주세요</h3>

		<c:forEach var="i"  begin="0" end="144" varStatus="status">

			<div class="championList">
				<a href="boardListTable.do?board_champion=${championKey[i] }">
					<img class="championListImg"
						src="img/championImg/RiotX_ChampionList${championKey[i] }.jpg" alt="">
				</a>
			</div>

		</c:forEach>
		<div class="clear"></div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>



</html>

