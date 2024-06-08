<%@ page import="kr.co.kung.modelExam.ProductsDTO"%>
<%@ page import="kr.co.kung.modelExam.ProductsDAO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String plantsname = request.getParameter("plantsname");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    // 현재 시간을 구하여 구매 시간으로 사용합니다.


    // ProductsDAO를 사용하여 구매 내역을 데이터베이스에 저장합니다.
    ProductsDAO dao = ProductsDAO.getIns();
    boolean purchaseSuccess = dao.purchaseProduct((String) session.getAttribute("userid"), plantsname, quantity);

    // 구매 결과에 따라 메시지를 출력합니다.
    if (purchaseSuccess) {
        out.println("<h1>구매가 완료되었습니다!</h1>");
        out.println("<p>구매한 제품: " + plantsname + "</p>");
        out.println("<p>구매 수량: " + quantity + "</p>");
    } else {
        out.println("<h1>구매에 실패하였습니다!</h1>");
        out.println("<p>구매할 수량이 재고보다 많습니다.</p>");
    }
%>
<a href="main.jsp">Druid</a>
<a href="Shop.jsp">Shop</a>
<a href="profile.jsp">profile</a>

