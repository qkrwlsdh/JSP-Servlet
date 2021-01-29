package com.itbank.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.action.CommandAction;

public class FrontController extends HttpServlet {
//	모든 요청을 받아서 처리하는 단 하나의 서블릿

	private static final long serialVersionUID = 1L;
	private Map<String, CommandAction> map = new HashMap<String, CommandAction>();
	private final String prefix = "WEB-INF/views/";
	private final String suffix = ".jsp";
	
	@Override	// 서블릿이 생성될 때의 초기 작동을 지정하는 메서드
	public void init() throws ServletException {
		
		String configFile = getInitParameter("configFile");
		Properties pro = new Properties();
		FileInputStream fis = null;
		
		
		try {
			String configFilePath = getServletContext().getRealPath(configFile);
			// 파라미터에 작성된 설정 파일의 경로를 가져와서
			
			fis = new FileInputStream(configFilePath);
			// 해당 경로에서 불러올 수 있는 스트림을 열고
			
			pro.load(fis);
			// 스트림을 통해서 내용을 pro객체로 불러온다
			
		} catch(IOException e) {	// 입출력 예외가 발생하면
			throw new ServletException(e);	// 서블릿 예외의 형태로 만들어서 상위로 전가한다
		} finally {
			if(fis != null) try { fis.close(); } catch(Exception e1) {}
		}
		
		// 설정파일을 Properties 형식으로 불러왔으니 설정의 내용을 읽어서 클래스를 준비시키자
		
		Iterator<Object> it = pro.keySet().iterator();
		// 설정 파일의 키(왼쪽값, 요청주소)만 추출하여 iterator로 저장해둔다
		
		while(it.hasNext()) {
			String command = (String) it.next();
			String handlerClassName = pro.getProperty(command);
			// 요청 주소에 따른 클래스 이름을 불러온다
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				// 클래스 이름을 이용하여 실제 클래스 정보를 불러온다
				
				CommandAction handlerInstance = (CommandAction)handlerClass.newInstance();
				// 클래스 정보를 바탕으로 기본생성자를 호출하여 객체를 가져온다
				
				map.put(command, handlerInstance);
				// 요청주소와 실행할 객체를 짝을 이루어서 map에 저장해둔다
				
				System.out.println("configFile : " + configFile);
				System.out.println("properties : " + pro);
				System.out.println("command : " + command);
				System.out.println("className : " + handlerClassName);
				System.out.println("class : " + handlerClass);
				System.out.println("instance : " + handlerInstance);
				System.out.println();
				
			}catch(ClassNotFoundException e) {	// 클래스를 못찾으면
				throw new ServletException(e);	// 서블릿 문제로 만들기
			}catch(InstantiationException e) {
				throw new ServletException(e);
			}catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	@Override	// GET, POST에 상관없이, 요청을 받으면 작동하는 메서드
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String command = request.getRequestURI();
		
		if(command.indexOf(request.getContextPath()) == 0) {	// contextPath로 시작하면
			command = command.substring(request.getContextPath().length());	// 그 부분 제외한 나머지만 저장
		}
		
		CommandAction action = map.get(command);
		
		String viewPage = null;
		try {
			switch(request.getMethod()) {
			case "GET": viewPage = action.doGet(request, response); break;
			case "POST": viewPage = action.doPost(request, response); break;
			default: response.sendRedirect(request.getContextPath());
			}
		} catch(Throwable e) {
			throw new ServletException(e);
		}
		
		if(viewPage != null) {
			viewPage = prefix + viewPage + suffix;
			RequestDispatcher rd = request.getRequestDispatcher(viewPage);
			System.out.println(command + " : " + request.getMethod());
			System.out.println(action.getClass().getSimpleName());
			System.out.println(viewPage + "\n");
			rd.forward(request, response);
		}
	}
	
	
}
