<%@page import="board1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="cpath">${pageContext.request.contextPath }/</c:set>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" scope="session" />				
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: underline;
	}
	
</style>