<%@ page import="kr.co.kung.modelExam.ProductsDTO"%>
<%@ page import="kr.co.kung.modelExam.ProductsDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 결과</title>
<style>
.container {
    width: 100%;
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}
.a1 {
    color: #4caf50;
    text-decoration: none;
}

.a1:hover {
    text-decoration: underline;
}
body {
    font-family: Arial, sans-serif;
    background-color: #f0f8f0;
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <%
        String plantsname = request.getParameter("plantsname");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductsDAO dao = ProductsDAO.getIns();
        boolean purchaseSuccess = dao.purchaseProduct((String) session.getAttribute("userid"), plantsname, quantity);

        if (purchaseSuccess) {
    %>
    <h1>구매가 완료되었습니다!</h1>
    <p>구매한 제품: <%= plantsname %></p>
    <p>구매 수량: <%= quantity %></p>
    <% } else { %>
    <h1>구매에 실패하였습니다!</h1>
    <p>구매할 수량이 재고보다 많습니다.</p>
    <% } %>
    <a class="a1" href="main.jsp">Home</a>
    <a class="a1" href="Shop.jsp">Shop</a>
    <a class="a1" href="profile.jsp">Profile</a>
</div>
</body>
</html>
