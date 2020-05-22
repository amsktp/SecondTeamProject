<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	div{
		border: 1px solid black;
		text-align: center;

	}
	
	#wholeDiv{
		width: 600px;
		margin: auto;
		height: 700px;
		border: 1px solid white;
		padding-top: 150px;
	}
	
	#firstDiv{
		width: 600px;
		margin: auto;

	}
	
	#secondDiv{
		height: 80px;
		line-height: 80px;
	}
	
	.threeDiv{
		height: 292px;
		width: 595px;
		text-align: left;
	}
	
	#fourDiv{
		height: 80px;
		line-height: 80px;
		text-align: right;
		padding-right: 10px;
	}
	
 	#firstInput{ 
 		float: right; 
		width: 70px;
		height: 40px;
		margin-top: 10px;
		margin-left: 10px;
 	}
 	
 	#secondInput{ 
 		float: right; 
		width: 70px;
		height: 40px;
		margin-top: 10px;
 	}
 	input {
 		height: 20px;
 		text-align: center;
 		margin: auto;
 		vertical-align: middle;
 	}
 	
</style>

</head>

<script type="text/javascript">
	
	function pageMoveFnc() {
		
		location.href = './update';
	}
	
	function sucessFnc() {
		
		var contents = document.getElementsByClassName('threeDiv')[1];
		var contentsInner = contents.value;
		
		var title = document.getElementsByName('nTitle')[0];
		var titleValue = title.value;
		
		if (contentsInner != "" && titleValue != "") {
		}else if(titleValue == "") {
			alert("제목이 입력되지않았습니다.");
			return false;
		}else if(contentsInner == "") {
			alert("내용이 입력되지않았습니다.");
			return false;
		}
	}
	
</script>

<body>
<jsp:include page="/Header.jsp"/>

	<div id="wholeDiv">
		<form action="./add" method="post" onsubmit = 'return sucessFnc();'>
			<div id="firstDiv">
				<div id="secondDiv">
					제목: <input type="text" value="" name="nTitle">
				</div>			
					<div class="threeDiv">
						<input class="threeDiv" type="text" value="" name="nContents">
					</div>
				<div id="fourDiv">
					작성자: 괸리자
				</div>
			</div>
			<input id="firstInput" type="button" value="뒤로가기" onClick='pageMoveFnc();'>
			<input id="secondInput" type="submit" value="작성완료" >
		</form>
		
	</div>

	
<jsp:include page="/Tail.jsp"/>	
</body>

</html>