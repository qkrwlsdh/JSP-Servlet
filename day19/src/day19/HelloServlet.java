package day19;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 자바 서블릿은 자바 클래스를 이용하여 만드는 웹 프로그램이다
// Thread 와 마찬가지로, HttpServlet 클래스를 상속받으면 서블릿의 모든 기능을 가져온다

public class HelloServlet extends HttpServlet{
	// HTTP : GET / POST / PUT / DELETE / OPTIONS
	/*
	 * GET - 검색시 쿼리스트링 전송, select * from TABLE where COL=query;
	 * POST - insert into TABLE values (...);
	 * PUT - update TABLE set A=B where ...;
	 * DELETE - delete TABLE where ...;
	 */
	// 직렬화 (객체를 파일로 전송하기 위한 자바 클래스의 조건)에 의해 필요한 값
	private static final long serialVersionUID = 1L;
	private int num;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("doGet : " + ++num);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1> Hello, Servlet !! </h1>");
	}
	
	
}
