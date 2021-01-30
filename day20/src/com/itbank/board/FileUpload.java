package com.itbank.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUpload {

	private MultipartRequest mp;
	private String uploadPath = "uploadFolder";
	private final int uploadFileSizeLimit = 10 * 1024 * 1024;
	private final String encType = "UTF-8";
	
	public BoardDTO getBoardDTO(HttpServletRequest request) {
		
		// request.getServletContext() == application 객체를 반환
		uploadPath = request.getServletContext().getRealPath(uploadPath);
		
		try {
			mp = new MultipartRequest(request, uploadPath, uploadFileSizeLimit, encType);
			// mp 객체를 생성한 시점에서 이미 파일은 업로드되어 있다
			BoardDTO dto = new BoardDTO();
			
			if(mp.getFilesystemName("uploadFile") != null) {	// 업로드 파일의 이름이 null이 아니면
				dto.setUploadfile(mp.getFile("uploadFile").getName());	// 파일이름을 dto에 세팅
			}
			dto.setContext(mp.getParameter("context"));	// request.getParameter(name) 대신
			dto.setIpaddr(mp.getParameter("ipaddr"));	// mp.getParameter(name)으로 문자열을 받아온다
			dto.setTitle(mp.getParameter("title"));		// 받아온 문자열을 dto 객체에 세팅
			dto.setWriter(Integer.parseInt(mp.getParameter("writer")));
			return dto;
			
		} catch(IOException e) {
			System.out.println("IOException : " + e);
			e.printStackTrace();
			return null;
		}
	}
}
