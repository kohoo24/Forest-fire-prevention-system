<%@page import="kr.co.kung.modelExam.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kung.modelExam.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DRUID - Plant Shop</title>
<link rel="stylesheet" href="styles.css">
<style>
    .product-list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }
    .product-card {
        border: 1px solid #ddd;
        padding: 16px;
        width: 200px;
        text-align: center;
    }
    .product-img {
        width: 100%;
        height: auto;
    }
    .product-name {
        font-size: 1.2em;
        margin: 10px 0;
    }
    .product-description {
        font-size: 0.9em;
        color: #666;
    }
    .product-price {
        color: #e74c3c;
        font-weight: bold;
        margin: 10px 0;
    }
    .product-stock {
        color: #27ae60;
    }
</style>
<%
String name = (String)session.getAttribute("name");
%>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="product-list">
    <%
    ProductsDAO dao = ProductsDAO.getIns(); // Singleton 인스턴스 가져오기
    List<ProductsDTO> productList = dao.getAllProducts(); // 모든 제품 목록 가져오기
    
    for (ProductsDTO product : productList) { // 제품 목록 반복
        String plantsname = product.getPlantsname(); // 제품의 고정 키(예: plantsname) 가져오기
        String imageUrl = "image/" + plantsname + ".jpg"; // 이미지 경로 동적 생성
        
        // 나머지 코드...
%>
    <!-- 이미지 출력 등을 위한 HTML 코드 -->
    <div class="product-card">
        <img src="<%= imageUrl %>" alt="<%= plantsname %>" class="product-img">
        <div class="product-name"><%= plantsname %></div>
        <div class="product-description"><%= product.getDescription() %></div>
        <div class="product-price"><%= product.getPrice() %>원</div>
        <div class="product-stock">재고: <%= product.getStock() %>개</div>
    </div>
<%
    }
%>
</div>
</body>
</html>
