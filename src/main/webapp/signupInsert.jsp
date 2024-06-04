<%@page import="kr.co.kung.modelExam.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="members" class="kr.co.kung.modelExam.MemberDTO"/>
    <jsp:setProperty name="members" property="*"/>
    
    <%
    MemberDAO dao = MemberDAO.getIns();
    System.out.println("성공");
    int res = dao.Insert(members);
    if (res == 1) {
        session.setAttribute("name", members.getName());
        response.sendRedirect("signupOk.jsp");
    } else {
        response.sendRedirect("signup.jsp");
    }
    %>
</body>
</html>
