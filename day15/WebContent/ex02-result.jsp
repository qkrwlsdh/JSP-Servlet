<%@page import="day15.ImageDTO"%>
<%@page import="day15.ImageDAO"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-result.jsp</title>
</head>
<body>

<h1>ex02-result.jsp</h1>
<hr>
<%!
	final String uploadPath = "/uploadFolder";
	final int uploadFileSizeLimit = 10 * 1024 * 1024;
	final String encType = "UTF-8";
%>
<%
	request.setCharacterEncoding("UTF-8");

	String uploadFilePath = application.getRealPath(uploadPath);
// 	Runtime.getRuntime().exec("open" + uploadFilePath);
	try {
		
		MultipartRequest mp = new MultipartRequest(
					request,
					uploadFilePath,
					uploadFileSizeLimit,
					encType,
					new DefaultFileRenamePolicy()
				);
		String fileName = mp.getFilesystemName("uploadFile");
		if(fileName == null) {
			System.out.println("파일 업로드 실패");
		}
		else {
			File f1 = mp.getFile("uploadFile");		// <input type="file" name="uploadFile">
			// 업로드한 파일을 객체로 가져와서
			
			String extName = fileName.substring(fileName.lastIndexOf("."));
			// 확장자를 따로 분리하여 extName에 넣어두고
			
			String f2Name = UUID.randomUUID().toString().replaceAll("-", "") + extName;
			// 새로 변경할 이름은 랜덤형식의 UUID에서 -를 제거하고, 뒤에 확장자를 붙여서 만든다
			
			File f2 = new File(uploadFilePath, f2Name);
			// 파일이 업로드 되는 경로와 파일이름을 지정하여 바꿀 파일 이름으로 객체를 생성하고
			
			f1.renameTo(f2);
			// 사용자가 업로드한 파일의 이름을 변경한다
			
			ImageDAO dao = ImageDAO.getInstance();
			ImageDTO dto = new ImageDTO();
			dto.setOriginalFileName(fileName);
			dto.setStoredFileName(f2Name);
			int row = dao.insertImage(dto);
			pageContext.setAttribute("row", row);
			// 만들어낸 정보를 dto에 담아서 dao에게 전달하면서 insert 메서드를 호출
			
			System.out.println("파일 이름 : " + fileName);
			System.out.println(f1);
			System.out.println(f2Name);
		}
	}catch(Exception e) {
		System.out.println("예외 발생 : " + e);
		e.printStackTrace();
	}
%>
<script>
	const row = ${row };
	alert(row == 1 ? '업로드 성공 !!' : '업로드 실패...');
	location.replace('ex02-form.jsp');
</script>


</body>
</html>





