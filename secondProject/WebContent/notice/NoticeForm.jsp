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

	

<div id="mainContents" style="margin-top: 40px;">
	<div style="width: 770px;">
	
		<h1>공지사항</h1>
		
		<table style="border-top: 1px solid white; border-collapse:collapse; margin-bottom: 30px; 
				width: 770px; text-align: center;">
			<tr style="height: 40px; color: #4B58E3;">				
				<th style="width: 70px;">번호</th>
				<th style="width: 400px;">제목</th>
				<th style="width: 100px;">작성자</th>
				<th style="width: 200px;">작성날짜</th>
			</tr>
			<c:forEach var="noticeDto" items="${noticeList}">
			<tr style="border-top: 1px solid #DAD9FF;">
				<td style="height: 40px;">${noticeDto.no}</td>
				<td style="height: 40px;"><a href="./update?no=${noticeDto.no}" style="text-decoration: none; color: black;">${noticeDto.title}</a>
				</td>

				<td>관리자</td>
				<td>${noticeDto.writeDate}</td>
			</tr>
			</c:forEach>
		</table>
		<div>
			<input style="color: white; border-radius: 5px; background-color: #47C83E; height:30px;"
				onclick="moveBoardListFnc();" type="button" value="뒤로가기" >
			
			<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
				<form action="./add" method="get" 
					style="float: right; width: 100px; text-align: right;">
					<input type="submit" value="글쓰기" style="color: white; border-radius: 5px;
							height:30px; background-color: #00D8FF">
				</form>
			</c:if>
		</div>
		
	</div>
	
</div>


	

	<jsp:include page="/Tail.jsp"></jsp:include>
	
	
</body>

</html>