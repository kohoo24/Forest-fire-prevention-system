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
<%
String name = (String)session.getAttribute("name");
%>
function checkLoggedIn() {
    <% if(session.getAttribute("userid") != null) { %>
        alert("이미 회원입니다.");
    <% } else { %>
        window.location.href = "signup.jsp";
    <% } %>
}
</script>
</head>
<body>
<header>
  <div class="top-bar">
    <p>create by. hohyun, giwan, eunsu</p>
  </div>
  <div class="nav-bar">
    <h1 class="logo">DRUID</h1>
    <div class="search-bar">
      <input type="text" placeholder="Search">
      <button>🔍</button>
    </div>
    <div class="auth-buttons">
      <% if(session.getAttribute("userid") == null) { %>
        <form action="login_form.jsp" method="post">
          <button type="submit">Login</button>
        </form>
        <form action="signup.jsp" method="post">
          <button type="submit">Sign up</button>
        </form>
      <% } else { %>
      	<a href="myinfo.jsp"><%=name %>님 환영합니다.</a>
        <form action="logout.jsp" method="post">
          <button type="submit">Logout</button>
        </form>
      <% } %>
    </div>
  </div>
</header>

<nav class="main-nav">
  <a href="Category.jsp">Category</a>
  <a href="main.jsp">Home</a>
  <a href="Shop.jsp">Shop</a>
  <a href="Contact_Us.jsp">Contact Us</a>
</nav>

<main>
  <div class="hero-section">
    <a href="#" onclick="checkLoggedIn()">
      <img src="image/banner.jpg" width="1900" height="746">
    </a>
  </div>

  <section class="category-section">
    <h2>Category Of Plants</h2>
    <div class="categories">
      <div class="category-item"></div>
      <div class="category-item"></div>
      <div class="category-item"></div>
      <div class="category-item"></div>
    </div>
  </section>
  
</main>
</body>
</html>

