<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<style>
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>
<head>
<title>게시판2 목록</title>

</head>

<body>
	<jsp:include page="/Header.jsp" />
	<h2>게시판2</h2>
	<table>
		<tr>
			<th style="width: 70px;">번호</th><th style="width: 400px;">제목</th><th style="width: 100px;">작성자</th><th style="width: 200px;">작성날짜</th>
		</tr>
		
		<c:forEach var="board2Dto" items="${board2List}">
			<tr>
				<td>${board2Dto.bno2}</td><td><a href="./update?bno2=${board2Dto.bno2}">${board2Dto.title2}</a></td><td>${board2Dto.writer2}</td><td>${board2Dto.writeDate2}</td>
			</tr>
		</c:forEach>
	</table>
	<form action='./add' method='get'>
		<button>게시판 목록</button>
		<input type='submit' value='글쓰기'>
	</form>
	
	<jsp:include page="/Tail.jsp" />
</body>
</html>