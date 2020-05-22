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

table,tr,td {
	border: 1px solid black;
	border-collapse: collapse;
	
}

table {
	width: 700px;
}

#trHead {
	background-color: skyblue;
	font-weight: bold;
	font-size: 15px;
	text-align: center;
}
</style>
<script type="text/javascript">

</script>
<body>

	<jsp:include page="/Header.jsp" />
	
	<c:if test="${sessionScope.memberDto.adminCheck eq 'N'}">
		<h1>게시판 선택 페이지</h1>
	</c:if>
	<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
	
		<h1>관리자 페이지</h1>
		<p>
			<a href='./add'>신규 회원</a>
		</p>
		<table>
			<tr id='trHead'>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>회원이메일</td>
				<td>가입날짜</td>
				<td>관리버튼</td>
			</tr>
			<c:forEach var="memberDto" items="${memberList}">
				<tr>
					<td>${memberDto.no}</td>
					<td>${memberDto.name}</td>
					<td>${memberDto.email}</td>
					<td>${memberDto.createDate}</td>
					<td>
						<a href='./delete?no=${memberDto.no}'><input type='button' value='삭제'></a>
						<a href='./update?no=${memberDto.no}'><input type='button' value='수정'></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</c:if>
	
	<br>
	
	<a href="../board1/list?pageNo=1">
		<button>
			게시판1
		</button>
	</a>
	

	<a href="../board2/list">
		<button>
		게시판2
		</button>
	</a>


	<a href="../notice/list">
		<button>
			공지사항
		</button>
	</a>
	<jsp:include page="/Tail.jsp" />
</body>
</html>