package day19;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * 1) HttpServlet 클래스를 상속받는다
 * 2) 오버라이딩 할 메서드를 작성한다 (doGet, doPost)
 * 3) 자바코드로 처리하고 나서, response에 보낼 메시지를 만들어낸다
 */

public class NowServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
	// 멤버 필드를 선언하는 작업은 선언부에 해당

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// import는 jsp에서 페이지 디렉티브에 해당
		Date date = new Date();
		
		// doGet, doPost, service 메서드에서 작성하는 내용은 스크립틀릿에 해당
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();		// 응답에 문자열을 출력하는 객체
		String now = sdf.format(date);
		
		out.print("<!DOCTYPE html>"
				+ "<h1>ex02 - NowServlet</h1>"
				+ "<hr>");
		out.print("<h1>" + now + "</h1>");
		// out.print() 로 출력하는건 내장 객체 out과 동일하며, 표현식으로도 처리 가능
		
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
	}

	
}
