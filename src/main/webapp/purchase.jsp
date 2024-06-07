<%@page import="java.text.NumberFormat"%>
<%@page import="kr.co.kung.modelExam.ProductsDTO"%>
<%@page import="kr.co.kung.modelExam.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 페이지</title>
<link rel="stylesheet" href="shopstyle.css">
<style>
    .product-img {
        max-width: 300px; /* 이미지 최대 너비 설정 */
        height: auto; /* 자동 높이 조정 */
    }
    .product-detail {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .product-name, .product-description, .product-price, .product-stock {
        margin: 10px 0; /* 각 요소 간격 조정 */
    }
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="purchase-page">
    <%
    String plantsname = request.getParameter("plantsname");
    ProductsDAO dao = ProductsDAO.getIns();
    ProductsDTO product = dao.getProductByPlantsname(plantsname); // 제품 정보 가져오기
    
    if (product != null) {
        String imageUrl = "image/" + plantsname + ".jpg"; // 이미지 경로 동적 생성
        String formattedPrice = NumberFormat.getInstance().format(product.getPrice()); // 가격 형식화
    %>
        <div class="product-detail">
            <img src="<%= imageUrl %>" alt="<%= plantsname %>" class="product-img">
            <div class="product-name"><%= plantsname %></div>
            <div class="product-description"><%= product.getDescription() %></div>
            <div class="product-price"><%= formattedPrice %>원</div>
            <div class="product-stock">재고: <%= product.getStock() %>개</div>
            <form action="purchaseAction.jsp" method="post">
                <input type="hidden" name="plantsname" value="<%= plantsname %>">
                <button type="submit">구매하기</button>
            </form>
        </div>
    <%
    } else {
    %>
        <div class="error-message">해당 제품을 찾을 수 없습니다.</div>
    <%
    }
    %>
</div>
</body>
</html>