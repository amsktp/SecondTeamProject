<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<script type="text/javascript">
	function moveAddPageFnc() {
		location.href = '../member/add';
	}

</script>

</head>

<body>
	<h2>사용자 로그인</h2>
	<form action="./login" method="post">
		이메일: 	<input type="text" name="email"><br>
		암호: 	<input type="password" name="password"><br>
				<input type="submit" value="로그인">
				<input onclick="moveAddPageFnc();" type="button" value="회원가입">
	</form>
	
</body>
</html>