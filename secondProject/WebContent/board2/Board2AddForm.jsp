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
		frm.addEventListener('keyup', function(){
			lenInputObj.value = frm.value.length;
		});
	}
</script>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<h2>글쓰기</h2>
	<form action='./add' method='post' name='insertFrm'>
		제목: <input type='text' name='title2'><br>
		내용: <textarea onKeyup="len_chk();" rows="20px" cols="70px" name='contents2' style="vertical-align: top;" placeholder="300자 이내로 기재해주세요."></textarea><br>
		글자수: <input id='lenInput' type='text' value=''><br>
		<input type='button' value='취소' onclick="moveBoard2ListFnc();">
		<input type='submit' value='글쓰기'>
	</form>
	<jsp:include page="/Tail.jsp" />
</body>
</html>