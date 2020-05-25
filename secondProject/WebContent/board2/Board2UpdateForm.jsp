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
	
	function len_chk(){
		var frm = document.insertFrm.contents2;
		if(frm.value.length > 300){
			alert("300자 이내로 기재해주세요.");
			frm.value = frm.value.substring(0,300);
			frm.focus();
		}
	}
	
	window.onload = function() {
		var lenInputObj = document.getElementById("lenInput");
		var frm = document.insertFrm.contents2;
		lenInputObj.value = frm.value.length;
		frm.addEventListener('keyup', function(){
			lenInputObj.value = frm.value.length;
		});
	}
</script>

</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<form action='./update' method='post' name='insertFrm'>
		<input type='hidden' name='bno2' value='${board2Dto.bno2}'><br>
		<c:if test="${(board2Dto.writer2 eq sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck eq 'Y'}">
			<h2>글수정</h2>
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <textarea onKeyup="len_chk();" rows="20px" cols="70px" name='contents2' style="vertical-align: top;">${board2Dto.contents2}</textarea><br>
			글자수: <input id='lenInput' type='text' value=''><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 eq sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck ne 'Y'}">
			<h2>글수정</h2>
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <textarea onKeyup="len_chk();" rows="20px" cols="70px" name='contents2' style="vertical-align: top;">${board2Dto.contents2}</textarea><br>
			글자수: <input id='lenInput' type='text' value=''><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 ne sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck eq 'Y'}">
			<h2>글수정</h2>
			제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
			내용: <textarea onKeyup="len_chk();" rows="20px" cols="70px" name='contents2' style="vertical-align: top;">${board2Dto.contents2}</textarea><br>
			글자수: <input id='lenInput' type='text' value=''><br>
			<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
			<input type='submit' value='저장'>
		</c:if>
		<c:if test="${(board2Dto.writer2 ne sessionScope.memberDto.name) && sessionScope.memberDto.adminCheck ne 'Y'}">
			<h2>글읽기</h2>
			제목: <input type='text' name='title2' value='${board2Dto.title2}' readonly="readonly"><br>
			내용: <textarea onKeyup="len_chk();" rows="20px" cols="70px" name='contents2' style="vertical-align: top;" readonly="readonly">${board2Dto.contents2}</textarea><br>
		</c:if>
		<input type='button' value='뒤로가기' onclick="moveBoard2ListFnc();">
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>
</html>