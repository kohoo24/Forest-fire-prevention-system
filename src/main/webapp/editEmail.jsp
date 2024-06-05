<%@ page import="kr.co.kung.modelExam.MemberDTO"%>
<%@ page import="kr.co.kung.modelExam.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 변경</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div style="margin: 20px auto; width: 50%;">
    <h2 style="text-align: center;">이메일 변경</h2>
    <% 
        String userId = (String) session.getAttribute("userid");
        MemberDAO dao = MemberDAO.getIns();
        MemberDTO user = dao.getMember(userId);
    %>
    <form method="post" action="profileUpdate.jsp">
        <label for="currentEmail">현재 이메일:</label>
        <%= user.getEmail() %><br>
        <label for="newEmail">새로운 이메일:</label>
        <input type="text" id="newEmail" name="newEmail" required><br>
        <input type="submit" value="변경">
    </form>
    <a href="profile.jsp">프로필로 돌아가기</a>
</div>
</body>
</html>