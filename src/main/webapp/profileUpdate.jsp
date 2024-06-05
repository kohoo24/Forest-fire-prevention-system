<%@ page import="kr.co.kung.modelExam.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String userId = (String) session.getAttribute("userid");
    String newName = request.getParameter("newName");
    String newPhone = request.getParameter("newPhone");
    String newAddress = request.getParameter("newAddress");
    String newEmail = request.getParameter("newEmail");
    
    MemberDAO dao = MemberDAO.getIns();
    int result = 0;

    if (newName != null && !newName.isEmpty()) {
        result += dao.updateUser(userId, "name", newName);
    }
    if (newPhone != null && !newPhone.isEmpty()) {
        result += dao.updateUser(userId, "phone", newPhone);
    }
    if (newAddress != null && !newAddress.isEmpty()) {
        result += dao.updateUser(userId, "address", newAddress);
    }
    if (newEmail != null && !newEmail.isEmpty()) {
        result += dao.updateUser(userId, "email", newEmail);
    }
    
    if (result > 0) {
        // 프로필 업데이트가 성공한 후 세션의 이름을 새로운 값으로 업데이트
        if (newName != null && !newName.isEmpty()) {
            session.setAttribute("name", newName);
        }
        response.sendRedirect("profile.jsp");
    } else {
        out.println("Error updating profile.");
    }
%>