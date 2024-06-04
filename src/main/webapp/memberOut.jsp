<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userid=(String)session.getAttribute("userid");
String sql="DELETE FROM user where userid=?";

String uid="test2";
String upw="1234";
String url="jdbc:mysql://121.163.148.1/plantsdb";

Connection con=null;
PreparedStatement pst=null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection(url,uid,upw);
	pst=con.prepareStatement(sql);
	pst.setString(1,userid);
	int result=pst.executeUpdate();
	if(result==1){
		session.invalidate();
		response.sendRedirect("main.jsp");
	}else{
		response.sendRedirect("welcome.jsp");
	}
	
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	try{
		con.close();
		pst.close();
		
		
	}catch(Exception e2){
		e2.printStackTrace();
	}
}

%>