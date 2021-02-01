<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<script>
	const row = '${row}';
				// 문자열로 묶어주지않으면 ;만 찍힐수있다
				// setAttribute로 row를 세팅해서 보냈기 때문에 ${row}로 불러와짐
	const password = '${password}';
	
	if(row == 1){	// 자료형은 무시하고 값만 비교한다
		alert('재발급 된 비밀번호는 ' + password + '입니다');
		location.replace('${cpath}/login');
	} else{
		alert('일치하는 정보를 찾을 수 없습니다');
		history.back();
	}
</script>