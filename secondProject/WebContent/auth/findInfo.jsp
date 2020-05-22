<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이메일로 비밀번호 찾기</title>
<script type="text/javascript">
	function findPwdFnc(){
		alert("");
	}
</script>	
	
</head>

<body>
	<h2>이메일로 비밀번호 찾기</h2>
	<form action="#" method = "post">
		이메일:	<input type="text" name="eamil"><br>
				<input type="button" onclick="findPwdFnc();" value="찾기">
	</form>

</body>

</html>