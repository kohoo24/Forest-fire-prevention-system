<%@ page import="kr.co.kung.modelExam.ProductsDAO" %>
<%@ page import="kr.co.kung.modelExam.BuyDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.co.kung.modelExam.BuyDTO" %>
<%@ page import="kr.co.kung.modelExam.MemberDTO" %>
<%@ page import="kr.co.kung.modelExam.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 페이지</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="margin: 20px auto; width: 50%;">
    <h2 style="text-align: center;">내 정보 변경</h2>
    
    <%-- 사용자의 정보를 가져오는 부분 --%>
    <% 
        String userId = (String) session.getAttribute("userid");
        MemberDAO memberDAO = MemberDAO.getIns();
        MemberDTO user = memberDAO.getMember(userId);
        
        if (user != null) {
    %>
    <div style="margin-bottom: 10px;">
        <strong>아이디:</strong> <%= user.getUserid() %><br>
        <strong>이름:</strong> <%= user.getName() %> (<a href="editName.jsp">변경</a>)<br>
        <strong>전화번호:</strong> <%= user.getPhone() %> (<a href="editPhone.jsp">변경</a>)<br>
        <strong>주소:</strong> <%= user.getAddress() %> (<a href="editAddress.jsp">변경</a>)<br>
        <strong>Email:</strong> <%= user.getEmail() %> (<a href="editEmail.jsp">변경</a>)<br>
    </div>
    <% } else { %>
    <div style="text-align: center; color: red;">
        User not found.
    </div>
    <% } %>

    <%-- 사용자의 구매 내역을 가져오는 부분 --%>
    <h2 style="text-align: center;">내 구매 내역</h2>
    <table border="1" style="width: 100%;">
        <tr>
            <th>제품명</th>
            <th>수량</th>
        </tr>
        <% 
            ProductsDAO productsDAO = ProductsDAO.getIns();
        	BuyDAO buyDAO = BuyDAO.getIns();
        	List<BuyDTO> buyList = buyDAO.getBuyList(userId);
            if (buyList != null && !buyList.isEmpty()) {
                for (BuyDTO buy : buyList) {
        %>
        <tr>
            <td><%= buy.getPlantsname() %></td>
            <td><%= buy.getQuantity() %></td>
        </tr>
        <% 
                }
            } else { 
        %>
        <tr>
            <td colspan="3" style="text-align: center;">구매 내역이 없습니다.</td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
