<%@ page import="kr.co.kung.modelExam.MemberDAO"%>
<%@ page import="kr.co.kung.modelExam.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
    
    request.setCharacterEncoding("UTF-8");

    
    String userid = request.getParameter("userid");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String email = request.getParameter("email");


    MemberDTO members = new MemberDTO();
    members.setUserid(userid);
    members.setPw(pw);
    members.setName(name);
    members.setPhone(phone);
    members.setAddress(address);
    members.setEmail(email);

   
    MemberDAO dao = MemberDAO.getIns();
    int res = dao.Insert(members);

    if (res == 1) {
        session.setAttribute("name", members.getName());
        response.sendRedirect("login_form.jsp");
    } else {
        response.sendRedirect("signup.jsp");
    }
    %>
</body>
</html>
