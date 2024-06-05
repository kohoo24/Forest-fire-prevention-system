<%@ page import="kr.co.kung.modelExam.MemberDTO"%>
<%@ page import="kr.co.kung.modelExam.MemberDAO"%>
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
    
    <%-- Retrieve user information from the database --%>
    <% 
        String userId = (String) session.getAttribute("userid");
        MemberDAO dao = MemberDAO.getIns();
        MemberDTO user = dao.getMember(userId);
        
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
</div>
</body>
</html>