<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DRUID - Plant Shop</title>
<link rel="stylesheet" href="styles.css">
<script>
function checkLoggedIn() {
    <% if(session.getAttribute("userid") != null) { %>
        alert("이미 회원입니다.");
    <% } else { %>
        window.location.href = "signup.jsp";
    <% } %>
}
</script>
<body>
<jsp:include page="header.jsp"/>
<main>
    <a href="#" onclick="checkLoggedIn()">
      <img src="image/banner.jpg" width="1900" height="746">
    </a>
  
</main>
</body>
</html>
