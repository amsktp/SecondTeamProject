<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	function moveBoard2ListFnc() {
		location.href = "./list";
	}
</script>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<h2>글쓰기</h2>
	<form action='./add' method='post'>
		제목: <input type='text' name='title2'><br>
		내용: <input type='text' name='contents2' style="width:200px; height:50px;"><br>
		<input type='button' value='취소' onclick="moveBoard2ListFnc();">
		<input type='submit' value='글쓰기'>
	</form>
	<jsp:include page="/Tail.jsp" />
</body>
</html>