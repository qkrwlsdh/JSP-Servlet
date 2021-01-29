<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-list.jsp</title>
</head>
<body>

<%
	final String uploadPath = "/uploadFolder";					// 파일이 업로드될 경로
	final String absoPath = application.getRealPath(uploadPath);// 실제 파일이 업로드된 경로
	
	File dir = new File(absoPath);	// 실제 경로를 파일 객체로 가져와서
	if(dir.exists() && dir.isDirectory()) {	// 존재하고, 디렉토리(폴더)이면
		String[] fileList = dir.list();		// 디렉토리 내의 목록을 가져와서
		pageContext.setAttribute("list", fileList);	// attribute로 저장
		pageContext.setAttribute("uploadPath", uploadPath);	// 출력하기 위해 저장
	}
%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:forEach var="name" items="${list }">
	<h3>${cpath }/${uploadPath }/${name }</h3>
	<div>
		<img src="${cpath }/${uploadPath }/${name }" height="200px">
	</div>
</c:forEach>

</body>
</html>