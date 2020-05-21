<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<h2>글쓰기</h2>
	<form action='./add' method='post'>
		제목: <input type='text' name='title2'><br>
		내용: <input type='text' name='contents2'><br>
		<input type='reset' value='삭제'>
		<input type='submit' value='글쓰기'>
	</form>
	<jsp:include page="/Tail.jsp" />
</body>
</html>