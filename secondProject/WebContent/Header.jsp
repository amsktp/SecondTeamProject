<%@page import="spms.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <jsp:useBean id="member" --%>
<%-- 	scope="session" --%>
<%-- 	class="spms.dto.MemberDto" --%>
<%-- /> --%>


<%-- <% --%>
<!--  	MemberDto memberDto = (MemberDto)session.getAttribute("memberDto"); -->
<!-- %> -->

<div style="background-color:#00008b; color:#ffffff; height:20px; padding: 5px;">
	SPMS(Simple Project Management System)
	
	<c:if test="${sessionScope.memberDto.email ne null}">
		<span style="float:right;">
			<a style="color:white; text-decoration: none;" href="<%=request.getContextPath()%>/member/update?no=${sessionScope.memberDto.no}">
				${sessionScope.memberDto.name}
			</a>
			<a style="color:white; text-decoration: none;" href="<%=request.getContextPath()%>/auth/logout">로그아웃</a>
		</span>
	</c:if>

박지훈 정의광 이찬양 류제건 양우진

양양의 지건

</div>

