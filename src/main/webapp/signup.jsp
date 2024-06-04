<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="signupInsert.jsp" method="post">
  
  <label>
    아이디 : <input type="text" name="userid" size="10"/>
  </label><br>
  <label>
    비밀번호 : <input type="password" name="pw" size="10"/>
  </label><br>
  <label>
    이름 : <input type="text" name="name" size="10"/>
  </label><br>
  <label>
    전화번호 : <input type="text" name="phone" size="10"/>
  </label><br>
  <label>
    주소 : <input type="text" name="address" size="10"/>
  </label><br>
  <label>
    이메일 : <input type="email" name="email" size="10"/>
  </label><br>
  <input type="submit" value="회원가입"/>
  <a href="login_form.jsp">로그인</a>

</form>
</body>
</html>