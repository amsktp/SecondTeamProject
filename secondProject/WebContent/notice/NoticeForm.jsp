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
		font-size: 30px;
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
	
	#threeDiv{
		height: 300px;
		text-align: left;
	}
	
	#fourDiv{
		height: 80px;
		line-height: 80px;
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
 	
</style>

</head>

<script type="text/javascript">
	
	function pageMoveFnc() {
		
		location.href = './list';
	}
	
</script>

<body>
	<div id="wholeDiv">
		<div id="firstDiv">
			<div id="secondDiv">
				공지사항
			</div>
			
				<div id="threeDiv">
					<c:forEach var="noticeDto" items="${requestScope.noticeList}">
						
						<a href="">
							${noticeDto}
						</a>
						
						<textarea rows="10" cols="10">${noticeDto}</textarea><br>
<%-- 						<input type='text' name='name' value='${noticeDto.contents}'> <br> --%>

					</c:forEach>
					
				</div>
			<div id="fourDiv">
				관리자 닉네임
			</div>
		</div>
		
		<form action="./update" method="post">
			<input id="firstInput" type="button" value="뒤로가기" onClick='pageMoveFnc();'>
			<input id="secondInput" type="submit" value="작성" >
		</form>
		
	</div>

	
	
</body>

</html>