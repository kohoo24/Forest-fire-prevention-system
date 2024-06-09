<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>.container {
    width: 100%;
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}
.a1 {
    color: #4caf50;
    text-decoration: none;
}

.a1:hover {
    text-decoration: underline;
}
body {
    font-family: Arial, sans-serif;
    background-color: #f0f8f0;
    }
label {
    display: block;
    margin-bottom: 10px;
    color: #4caf50;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <label>
        <a class="a1" href="profile.jsp">내 정보보기</a>
    </label>
    <label>
        <a class="a1" href="memberOut.jsp">회원탈퇴</a>
    </label>
</div>
</body>
</html>