<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<script type="text/javascript">
	
	function moveBoardListFnc() {
		
		location.href = '../member/list';
	}
	
	function moveBoardWriteFnc() {
		
	}
	
	
	
</script>

<body>

	<jsp:include page="/Header.jsp"></jsp:include>

	

<div id="mainContents" style="margin-top: 70px;">
	<div>
		<table style="border: 1px solid black; border-collapse: collapse; margin-bottom: 30px; width: 770px;">
			<tr style="border: 1px solid black;">				
				<th style="border: 1px solid black; width: 70px;">번호</th>
				<th style="border: 1px solid black; width: 400px;">제목</th>
				<th style="border: 1px solid black; width: 100px;">작성자</th>
				<th style="border: 1px solid black; width: 200px;">작성날짜</th>
			</tr>
			<c:forEach var="noticeDto" items="${noticeList}">
			<tr style="border: 1px solid black;">
				<td style="border: 1px solid black;">${noticeDto.no}</td>
				<td style="border: 1px solid black;"><a href="./update?no=${noticeDto.no}" style="text-decoration: none; color: black;">${noticeDto.title}</a></td>
				<td style="border: 1px solid black;">${noticeDto.writer}</td>
				<td style="border: 1px solid black;">${noticeDto.writeDate}</td>
			</tr>
			</c:forEach>
		</table>
		<div>
			<input onclick="moveBoardListFnc();" type="button" value="뒤로가기" >
			
			<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
				<form action="./add" method="get">
					<input type="submit" value="글쓰기" style="margin-left: 600px;">
				</form>
			</c:if>
		</div>
		
	</div>
	
</div>


	

	<jsp:include page="/Tail.jsp"></jsp:include>
	
	
</body>

</html>