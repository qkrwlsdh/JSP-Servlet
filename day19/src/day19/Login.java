package day19;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member2.MemberDAO;
import member2.MemberDTO;

public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberDAO dao = MemberDAO.getInstance();

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("로그인 시도 !");
		super.init(config);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("../login.jsp").forward(req, resp);
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("userid");
		String pw = req.getParameter("userpw");
		MemberDTO user = new MemberDTO();
		user.setUserid(id);
		user.setUserpw(pw);
		
		MemberDTO login = dao.selectOne(user);
		HttpSession hs = req.getSession();
		hs.setAttribute("login", login);
//		req.setAttribute("login", login);	// 세션x
		req.getRequestDispatcher("../result.jsp").forward(req, resp);
		super.doPost(req, resp);
	}

	@Override
	public void destroy() {
		System.out.println("종료 !!");
		super.destroy();
	}


	
}
