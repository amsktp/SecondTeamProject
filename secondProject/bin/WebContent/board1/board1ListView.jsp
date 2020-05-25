<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function moveBoardListFnc() {
		
		location.href="../member/list";
	}

	
	function moveBoardWriteFnc() {
		
		location.href="./add";
		
	}
</script>

</head>
	<% int pageNo = Integer.parseInt(request.getParameter("pageNo")); 
	   int startNo = (pageNo-1) * 10;
	   int endNo = 10 * pageNo;
		int cnt = 1;
	%>
<body>

<jsp:include page="/Header.jsp"/>

<jsp:useBean 
	id="board1List"
	scope="request"
	class="java.util.ArrayList"
	type="java.util.ArrayList<spms.dto.Board1Dto>"
/>

<div id="mainContents" style="margin-top: 70px;">
	<div>
		<table style="border: 1px solid black; border-collapse: collapse; margin-bottom: 30px; width: 770px;">
			<tr style="border: 1px solid black;">				
				<th style="border: 1px solid black; width: 70px;">번호</th>
				<th style="border: 1px solid black; width: 400px;">제목</th>
				<th style="border: 1px solid black; width: 100px;">작성자</th>
				<th style="border: 1px solid black; width: 200px;">작성날짜</th>
			</tr>
			<c:forEach var="board1Dto" items="${board1List}" begin="<%=startNo%>" end="<%=endNo%>">
			<tr style="border: 1px solid black;">
				<td style="border: 1px solid black;">${board1Dto.no}</td>
				<td style="border: 1px solid black;"><a href="./contents?no=${board1Dto.no}" style="text-decoration: none; color: black;">${board1Dto.title}</a></td>
				<td style="border: 1px solid black;">${board1Dto.writer}</td>
				<td style="border: 1px solid black;">${board1Dto.writeDate}</td>
			</tr>
			</c:forEach>
		</table>

		<div style="width: 770px; text-align: center;">
			<c:forEach var="i" begin="1" end="${board1List.size() / 10 +1}">
				<a href="./list?pageNo=<%=cnt%>">[<%=cnt%>]</a>
				<%cnt++; %>
			</c:forEach>
		</div>		

		<div>
			<input onclick="moveBoardListFnc();" type="button" value="게시판 목록" >
			<input onclick="moveBoardWriteFnc();" type="button" value="글쓰기" style="margin-left: 600px;">
		</div>
	</div>
	
</div>

<jsp:include page="/Tail.jsp"/>

</body>
</html>