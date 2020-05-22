<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>

<script type="text/javascript">
	
	function moveBoard1ListFnc() {
		
		location.href = "./list?pageNo=1";
	}

	function countNumFnc(){
		
		var content = document.getElementById('content');
		
		var contentLength = content.value.length;
		
		var LengthSpan = document.getElementById('LengthSpan');
		
		LengthSpan.innerHTML = contentLength + '글자';
	}
	
	function writeValiFnc() {
		
		var title = document.getElementById('title');
		
		var content = document.getElementById('content');
	
		if(title.value == '' || content.value == ''){
			alert('제목 또는 내용을 입력해 주세요');
			return false;
		}
		
	}
	
</script>

</head>

<body>
<!-- 337 1번 문제 MemberAddServlet 화면출력 위임 -->
	<jsp:include page="/Header.jsp" />
	
	<div>
		<h1>글쓰기</h1>
		<form action='./add' method='post' onsubmit="return writeValiFnc()">
			<div>
				제목: <input id="title" type='text' name='title' style="width: 520px; margin-bottom: 20px;">
			</div>
			<div  style="margin-bottom: 30px;">
				내용: <textarea onkeyup="countNumFnc();" id="content" rows="20px" cols="70px"
					 name='content' style="vertical-align: top; resize: none;"></textarea>
			</div>
			<div>
				<span id="LengthSpan"></span> / 한글 300 글자
				
			</div>
			<input type='submit' value='글쓰기' style="margin-left: 470px;">
			
			<input type='button' value='취소' onclick="moveBoard1ListFnc();">
		</form>
	</div>
	<jsp:include page="/Tail.jsp" />
</body>
</html>