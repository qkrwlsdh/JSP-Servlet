<%@page import="day12.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.jsp</title>
</head>
<body>
<h1>DB Connection Pool Test</h1>
<hr>
<%-- <c:set var="dao" value="<%=new DAO() %>"/> --%>
<c:set var="dao" value="<%=DAO.getInstance() %>"/>
<c:set var="test" value="${dao.test() }"/>
<h3>${test }</h3>

<c:set var="dao2" value="<%=DAO.getInstance() %>"/>
<c:set var="dao3" value="<%=DAO.getInstance() %>"/>
<%-- <c:set var="dao4" value="<%=new DAO() %>"/> --%>
<%-- <c:set var="dao5" value="<%=new DAO() %>"/> --%>

<p>dao : ${dao }</p>
<p>dao2 : ${dao2 }</p>
<p>dao3 : ${dao3 }</p>
<p>dao4 : ${dao4 }</p>
<p>dao5 : ${dao5 }</p>
</body>
</html>