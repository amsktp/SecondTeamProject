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
	
	#threeDiv{
		height: 300px;
		text-align: left;
		font-size: 15px;
		padding-top: 10px;
		padding-left: 10px;
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
		margin-left: 10px;
 	}
 	
 	#threeInput{
 		float: right; 
		width: 70px;
		height: 40px;
		margin-top: 10px;
 	}
 	
 	.inputTag{
 		font-size: 20px;
 	}
 	
</style>

</head>

<script type="text/javascript">
	
	function pageMoveFnc() {
		
		location.href = './list';
	}
	
	function pageDeleteFnc(no) {
		
		var url = "./delete?no=" + no;
		location.href = url;
	}
	
	
	
</script>

<body>

	<jsp:include page="/Header.jsp"></jsp:include>
	
	<div id="wholeDiv">
		<form action="./update" method="post">
			<div id="firstDiv">
				<div id="secondDiv">
					공지사항
				</div>
				<div id="threeDiv">

				<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
					제목 : <input class="inputTag" type="text" value="${requestScope.noticeDto.title}"	name="title">
					<br>
					<br>	
					
						<p style="float: left;">내용 :</p>
						<textarea style="width: 500px; height: 240px; float: left; margin-left: 10px;" rows="10" cols="10" name="contents">${requestScope.noticeDto.contents}</textarea>
					
				</c:if>
				<c:if test="${sessionScope.memberDto.adminCheck eq 'N'}">
					제목 : <input class="inputTag" type="text" value="${requestScope.noticeDto.title}" name="title" readonly="readonly"><br>
					<br>	
							
					<p style="float: left;">내용 :</p>
					<textarea style="width: 500px; height: 240px; float: left; margin-left: 10px;" rows="10" cols="10" name="contents">${requestScope.noticeDto.contents}</textarea>
				</c:if>
						
						<input type="hidden" value="${requestScope.noticeDto.writer}" name="writer">
						<input type="hidden" value="${requestScope.noticeDto.no}" name="no">

				</div>
				<div id="fourDiv">
				관리자
				</div>
			</div>
			<input id="firstInput" type="button" value="뒤로가기" onclick='pageMoveFnc();'>
			<c:if test="${sessionScope.memberDto.adminCheck eq 'Y'}">
				<input id="secondInput" type="button" value="삭제" onclick="pageDeleteFnc(${requestScope.noticeDto.no});">
				<input id="threeInput" type="submit" value="저장" >
			</c:if>
		</form>
		
	</div>
	
	<jsp:include page="/Tail.jsp"></jsp:include>

	
	
</body>

</html>