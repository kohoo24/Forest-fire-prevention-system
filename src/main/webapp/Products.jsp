<%@ page import="kr.co.kung.modelExam.ProductsDAO" %> 
<%@ page import="kr.co.kung.modelExam.ProductsDTO" %> 
<%@ page import="java.util.List" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
    <title>Plant List</title> 
</head>
<body>
<<<<<<< Updated upstream
<table>
    <h1>Plant List</h1> 
=======
<h1>Plant List</h1> 
<table>
    
>>>>>>> Stashed changes
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
            <td><%= product.getPrice() %></td> <!-- 제품 가격 출력 -->
            <td><%= product.getStock() %></td> <!-- 제품 재고 출력 -->
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>