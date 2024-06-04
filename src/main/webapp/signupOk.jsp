<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
      String name=(String)session.getAttribute("name");
	  request.setCharacterEncoding("UTF-8");
    %>
<h1 style="text-align: center;"> <%=name %>님 격하게 환영합니다!!!!</h1>
<a href="login_form.jsp">로그인</a>
<a href="main.jsp">홈페이지</a>


</body>
</html>