<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%--요청 경로에서 문서는 없고, 폴더만 있으면, 해당 폴더에서 index.***을 찾아서 연결한다 --%>

<%-- <c:redirect url="ex02.jsp" /> --%>
<jsp:forward page="ex02.jsp" />

</body>
</html>