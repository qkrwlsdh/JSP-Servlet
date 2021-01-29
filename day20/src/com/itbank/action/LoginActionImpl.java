package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

public class LoginActionImpl implements CommandAction {
	
	private MemberDAO dao = MemberDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "login";		// login.jsp를 찾아감
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDTO user = new MemberDTO();
		user.setUserid(request.getParameter("userid"));
		user.setUserpw(request.getParameter("userpw"));
		
		MemberDTO dto = dao.selectOne(user);
		HttpSession session = request.getSession();
		session.setAttribute("login", dto);
		request.setAttribute("loginFail", dto == null);
		
		return "index";
	}

}
