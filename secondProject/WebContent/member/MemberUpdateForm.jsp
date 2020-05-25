<%@page import="spms.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>

<script type="text/javascript">
	function pageMoveListFnc(){
		location.href = "./list";
	}
	
	function pageMoveDeleteFnc(no){
		var url = "./delete?no=" + no;
		location.href = url;
	}
</script>

<style type="text/css">
	tr, td {
		border-top: 1px solid #444444;
		padding: 10px;
		border-color: #DAD9FF;
	}
	.td {
		text-align: center;
	}
	.tdBtn {
		text-align: center;
		margin-left: 20px;
		width: 60px;
	}
</style>
</head>

<body>
<!-- 337 3번 문제 MemberUpdateServlet 화면출력 위임 -->
	<jsp:include page="/Header.jsp" />
	
	<h1>회원정보</h1>
	<form action='./update' method='post'>
		<table>
			<tr>
				<td class='td'>
					번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호:
				</td>
				<td>
					<input type='text' name='no' value='${memberDto.no}' readonly><br>
				</td>
			</tr>	
			<tr>
				<td class='td'>
					이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름: 
				</td>
				<td>
					<input type='text' name='name' value='${memberDto.name}' readonly><br>
				</td>
			</tr>	
			<tr>
				<td class='td'>
					이&nbsp;메&nbsp;일: 
				</td>
				<td>
					<input type='text' name='email' value='${memberDto.email}'><br>
				</td>
			</tr>	
			<tr>
				<td class='td'>
					비밀번호: 
				</td>
				<td>
					<input type='password' name='password'><br>
				</td>
			</tr>	
			<tr>
				<td class='td'>
					가&nbsp;입&nbsp;일: 
				</td>
				<td>
					${requestScope.memberDto.createDate}<br>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input class='tdBtn' type='submit' value='저장'>
					<input class='tdBtn' type='button' value='삭제' 
						onclick='pageMoveDeleteFnc(${memberDto.no});'>
					<input class='tdBtn' type='button' value='취소' onClick='pageMoveListFnc();'>
				</td>
			</tr>			
			
			
			
			
		</table>
	</form>
	
	<jsp:include page="/Tail.jsp" />
</body>
</html>