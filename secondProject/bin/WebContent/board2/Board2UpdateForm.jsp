<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<script type="text/javascript">
	function moveBoard2ListFnc(){
		location.href = "./list";
	}
	
	function pageMoveDeleteFnc(bno2){
		var url = "./delete?bno2=" + bno2;
		location.href = url;
	}
</script>

</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<h2>글쓰기(수정)</h2>
	<form action='./update' method='post'>
		<input type='hidden' name='bno2' value='${board2Dto.bno2}'><br>
		<c:if test="${(board2Dto.writer2 eq sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck eq 'Y'}">
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <input type='text' name='contents2' value='${board2Dto.contents2}' style="width:200px; height:50px;"><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 eq sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck ne 'Y'}">
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <input type='text' name='contents2' value='${board2Dto.contents2}' style="width:200px; height:50px;"><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 ne sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck eq 'Y'}">
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <input type='text' name='contents2' value='${board2Dto.contents2}' style="width:200px; height:50px;"><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 ne sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck ne 'Y'}">
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <input type='text' name='contents2' value='${board2Dto.contents2}' style="width:200px; height:50px;" readonly="readonly"><br>
		</c:if>
		<input type='button' value='뒤로가기' onclick="moveBoard2ListFnc();">
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>
</html>