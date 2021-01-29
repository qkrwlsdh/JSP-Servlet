<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="page" value="${empty param.page ? 1 : param.page }" /> 
<c:set var="map" value="${dao.selectAll(page) }" />
<c:set var="list" value="${map.list }"/>
<main>
<div class="paging">
	<c:forEach begin="1" end="${pageCount }" var="i">
		<a href="${cpath }/?page=${i}">[${i }]</a>
	</c:forEach>
</div>
</main>