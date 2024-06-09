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
<link rel="stylesheet" href="path/to/your/style.css">
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
    <a href="main.jsp">Druid</a>
    <a href="Shop.jsp">Shop</a>
    <a href="profile.jsp">Profile</a>
</div>
</body>
</html>
