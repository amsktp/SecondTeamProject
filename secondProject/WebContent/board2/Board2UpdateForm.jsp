<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

<script type="text/javascript">
	function pageMoveListFnc(){
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
	
	<h2>글쓰기</h2>
	<form action='./update' method='post'>
		제목: <input type='text' name='title2' value='${board2Dto.title2}'><br>
		내용: <input type='text' name='contents2' value='${board2Dto.contents2}'><br>
		<input type='hidden' name='bno2' value='${board2Dto.bno2}'><br>
		<input type='button' value='삭제' onclick='pageMoveDeleteFnc(${board2Dto.bno2});'>
		<input type='submit' value='저장'>
	</form>
	
	<jsp:include page="/Tail.jsp" />
	
</body>
</html>