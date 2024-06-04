<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script>
function validateForm() {
    var userid = document.forms["loginForm"]["userid"].value;
    var pw = document.forms["loginForm"]["pw"].value;

    if (userid == "") {
        alert("아이디를 입력하세요.");
        document.forms["loginForm"]["userid"].focus();
        return false;
    }
    if (pw == "") {
        alert("비밀번호를 입력하세요.");
        document.forms["loginForm"]["pw"].focus();
        return false;
    }
    return true;
}
</script>
</head>
<body>
<a href="main.jsp">Druid</a>
<form name="loginForm" action="login_confirm.jsp" method="post" onsubmit="return validateForm()">
  
  <label>
    아이디 : <input  type="text" name="userid" size="10"/>
  </label><br>
  <label>
    비밀번호 : <input type="password" name="pw" size="10"/>
  </label><br>
  <input type="submit" value="로그인"/>
  <a href="signup.jsp">회원가입</a>
</form>
</body>
</html>