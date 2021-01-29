<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp : 파일 업로드</title>
</head>
<body>

<h1>ex01-form.jsp : 파일 업로드</h1>
<hr>

<%
	request.setCharacterEncoding("UTF-8");

	String savePath = "/uploadFolder";				// 파일이 업로드 될 경로
	int uploadFileSizeLimit = 10 * 1024 * 1024;		// 크기는 10MB 제한
	String encType = "UTF-8";						// 글자가 있으면 UTF-8로 인코딩
	
	String uploadFilePath = application.getRealPath(savePath);
	
	File folder = new File(uploadFilePath);	// 업로드 경로를 파일 객체로 지정하여
	
	if(folder.exists() == false) {	// 경로에 파일이나 폴더가 없으면
		folder.mkdir();				// 새로 폴더를 만들어라 (make directory)
	}
	
// 	Runtime.getRuntime().exec("open " + uploadFilePath);
	
	// application은 실행되는 웹 프로그램을 의미한다
	// 실행되는 프로그램 (자바 .class 파일)의 위치를 절대경로로 계산하여 파일이 저장된 위치의 주소를 uploadFilePath에 저장
	
// 	uploadFilePath = "D:\\(디지털컨버전스)마이크로서비스 기반 응용SW 개발자 양성 1회차\\4. UI구현 (HTML+JSP)\\jsp\\workspace-jsp\\day15\\WebContent\\uploadFolder";
// 	uploadFilePath = "D:\\fileUploadTest";
	
	MultipartRequest mp = new MultipartRequest(
				request,				// 기본 요청 객체
				uploadFilePath,			// 파일 업로드 경로
				uploadFileSizeLimit,	// 파일 업로드 크기 제한
				encType,				// 인코딩 타입
				new DefaultFileRenamePolicy()	// 파일 이름 명명 규칙을 담고 있는 객체(중복이면 뒤에 숫자붙임)
			);
	
	File uploadFile = mp.getFile("uploadFile");
	
	System.out.println(uploadFile);
	System.out.println(uploadFile.getAbsolutePath());
	System.out.println(uploadFile.getName());
	
	pageContext.setAttribute("savePath", savePath);
	pageContext.setAttribute("fileName", uploadFile.getName());
	
	// 프로젝트 내부에서 WebContent/uploadFolder/파일이름
	// 서버에서 실행되면, 이클립스 프로젝트가 아니라, 톰캣 서버에서 실행되는 동일한 위치에 파일이 업로드 된다
	// 실행되는 위치는 application.getRealPath() 메서드로 구할수 있으며, 이는 cpath와 동일하다
	// 업로드된 파일의 이름만 데이터베이스에 저장해둔다면, 지금까지 업로드한 모든 파일의 목록을 출력하는것도 가능하다
	pageContext.setAttribute("name", mp.getParameter("name"));
%>
<h2>${name }</h2>
<img src="${pageContext.request.contextPath }/${savePath}/${fileName }">

</body>
</html>












