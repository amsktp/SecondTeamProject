<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>

<script type="text/javascript">
	
	function moveBoard1ListFnc() {
		
		location.href = "./list";
	}

	function moveUpdateFnc() {
		
		location.href = "./update?no=" + ${requestScope.board1Dto.no}
	}
	
</script>

</head>

<jsp:useBean 
	id="board1Dto"
	scope="request"
	class="spms.dto.Board1Dto"
/>



<body>
<!-- 337 1번 문제 MemberAddServlet 화면출력 위임 -->
	<jsp:include page="/Header.jsp" />
	
	<div>
		<h1>글쓰기</h1>
			<div style="margin-bottom: 20px;">
				제목 : ${requestScope.board1Dto.title}
			</div>
			<div  style="margin-bottom: 30px;">
				내용 : ${requestScope.board1Dto.contents}
			</div>
			
			<div style="text-align: right; width: 600px;">
				<c:if test="${requestScope.board1Dto.writerEmail eq sessionScope.memberDto.email}">
					<input type='button' value='글 수정' onclick="moveUpdateFnc();">
				</c:if>
	
				<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
					<input type='button' value='글 수정' onclick="moveUpdateFnc();">
				</c:if>
			
				<input type='button' value='뒤로가기' onclick="moveBoard1ListFnc();">
			</div>
			
			
	</div>
	<jsp:include page="/Tail.jsp" />
</body>
</html>