<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>



<%  
   int cnt = (Integer)request.getAttribute("result");
   String user_id = request.getAttribute("user_id")+"";
   int user_uid = (Integer)request.getAttribute("user_uid");

%>



<% if(cnt == 0){ %>
   <script>
      alert("아이디와 비밀번호를 확인해 주세요.");
      history.back();
   </script>
<% } else { 
      session.setAttribute("user_id", user_id);
      session.setAttribute("user_uid", user_uid);
      System.out.print("유저 세션 생성");
%>
   <script>
      location.href = "index.jsp";
   </script>
      
<%

} %>