<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userid = request.getParameter("userid");
    String userpw = request.getParameter("pw");
    String sql = "SELECT pw, name FROM user WHERE userid=?";

    String uid = "test2";
    String upw = "1234";
    String url = "jdbc:mysql://121.163.148.1/plantsdb";

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, uid, upw);
        pst = con.prepareStatement(sql);
        pst.setString(1, userid);
        rs = pst.executeQuery();
        if (rs.next()) {
            String dbPw = rs.getString("pw");
            String dbName = rs.getString("name");

            if (userpw.equals(dbPw)) {
                session.setAttribute("userid", userid);
                session.setAttribute("name", dbName);
                response.sendRedirect("main.jsp");
            } else {
%>
<script>
    alert("비밀번호가 틀립니다.");
    window.location.href = "login_form.jsp";
</script>
<%
            }
        } else {
%>
<script>
    alert("아이디가 존재하지 않습니다.");
    window.location.href = "login_form.jsp";
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
%>