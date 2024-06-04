<%@ page import="kr.co.kung.modelExam.MemberDAO"%>
<%@ page import="kr.co.kung.modelExam.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">src\main\webapp\signupInsert.jsp
<title>Insert title here</title>
</head>
<body>
    <%
    
    request.setCharacterEncoding("EUC-KR");

    
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
        response.sendRedirect("signupOk.jsp");
    } else {
        response.sendRedirect("signup.jsp");
    }
    %>
</body>
</html>
