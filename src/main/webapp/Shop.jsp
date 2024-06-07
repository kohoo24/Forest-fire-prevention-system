<%@page import="kr.co.kung.modelExam.ProductsDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.kung.modelExam.ProductsDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DRUID - Plant Shop</title>
<link rel="stylesheet" href="shopstyle.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="product-list">
    <%
    ProductsDAO dao = ProductsDAO.getIns(); // Singleton 인스턴스 가져오기
    List<ProductsDTO> productList = dao.getAllProducts(); // 모든 제품 목록 가져오기
    NumberFormat numberFormat = NumberFormat.getInstance(); // NumberFormat 인스턴스 생성
    
    for (ProductsDTO product : productList) { // 제품 목록 반복
        String plantsname = product.getPlantsname(); // 제품의 고정 키(예: plantsname) 가져오기
        String imageUrl = "image/" + plantsname + ".jpg"; // 이미지 경로 동적 생성
        String formattedPrice = numberFormat.format(product.getPrice()); // 가격을 천 단위로 형식화
        String purchaseUrl = "purchase.jsp?plantsname=" + plantsname; // 구매 페이지 URL 동적 생성
%>
    <a href="<%= purchaseUrl %>" class="product-card-link">
        <div class="product-card">
            <img src="<%= imageUrl %>" alt="<%= plantsname %>" class="product-img">
            <div class="product-name"><%= plantsname %></div>
            <div class="product-description"><%= product.getDescription() %></div>
            <div class="product-price"><%= formattedPrice %>원</div>
            <div class="product-stock">재고: <%= product.getStock() %>개</div>
        </div>
    </a>
<%
    }
%>
</div>
</body>
</html>