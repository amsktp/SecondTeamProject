<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
button{
	border: 1px solid black;
	width: 150px;
	margin-right: 100px;
	border-radius: 2px;
	box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 
		0 6px 20px 0 rgba(0,0,0,0.19);
}
a {
	text-decoration: none;
	
}
</style>
<body>

	<jsp:include page="/Header.jsp" />
	
	<h1>회원목록</h1>
	
	<p>
		<a href='#'>신규 회원</a>
	</p>
	
	<c:forEach var="memberDto" items="${memberList}">
		${memberDto.no},
		<a href='./update?no=${memberDto.no}'>${memberDto.name}</a>,
		${memberDto.email},
		${memberDto.createDate}
		<a href='./delete?no=${memberDto.no}'>[삭제]</a><br>
	</c:forEach>
<<<<<<< HEAD
	<br>
	
	<button>
		게시판1
	</button>
	<button>
		게시판2
	</button>
	<button>
		공지사항
	</button>
=======
	
	<a href="../board1/list">게시판</a>
>>>>>>> branch 'master' of https://github.com/amsktp/SecondTeamProject.git
	
	<jsp:include page="/Tail.jsp" />
</body>
</html>