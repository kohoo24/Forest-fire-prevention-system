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
<%
String name = (String)session.getAttribute("name");
%>
</head>
<body>
<jsp:include page="header.jsp"/>
<table>
    
        <tr>
            <th>이름</th> <!-- 테이블 헤더: Plant Name -->
            <th>내용</th> <!-- 테이블 헤더: Description -->
            <th>가격</th> <!-- 테이블 헤더: Price -->
            <th>재고</th> <!-- 테이블 헤더: Stock -->
        </tr>
        <%
            ProductsDAO dao = ProductsDAO.getIns(); // Singleton 인스턴스 가져오기
            List<ProductsDTO> productList = dao.getAllProducts(); // 모든 제품 목록 가져오기
            
            for (ProductsDTO product : productList) { // 제품 목록 반복
        %>
        <tr>
            <td><%= product.getPlantsname() %></td> <!-- 제품 이름 출력 -->
            <td><%= product.getDescription() %></td> <!-- 제품 설명 출력 -->
            <td><%= product.getPrice() %>원</td> <!-- 제품 가격 출력 -->
            <td><%= product.getStock() %></td> <!-- 제품 재고 출력 -->
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>