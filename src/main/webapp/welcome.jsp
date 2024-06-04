<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String name = (String)session.getAttribute("name");
    String id = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1><%= name %>(<%= id %>)님 환영합니다.</h1>
    <a href="main.jsp">홈페이지</a>
    <a href="logout.jsp">로그아웃</a>
    <a href="memberOut.jsp">회원탈퇴</a>
    <h2>아</h2>
</body>
</html>
