<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>이메일로 비밀번호 찾기</title>
<script type="text/javascript">
		
	window.onload = function() {
		
		var hiddenPwd = document.getElementById('hiddenPwd');
		
		
		if(hiddenPwd.value != ''){
			alert('${memberDto.name}' + "님의 비밀번호는" + '${memberDto.password}' +"입니다.");
			
			location.href = "../auth/login?id=${memberDto.email}";
		}
		
		
	}		
	
	function movePageLoginFnc(){
		location.href = "../auth/login";
	}
</script>	
	
</head>

<body>
	<h2>이메일로 비밀번호 찾기</h2>
	<form action="./find" method = "post">
		이메일:	<input type="text" name="email"><br>
				<input type="submit" value="찾기">
				<input type="button" onclick="movePageLoginFnc();"value="로그인">
				<input id="hiddenPwd" type="hidden" value="${requestScope.memberDto.password}">
	</form>

</body>

</html>