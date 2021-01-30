package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

public class FindActionImpl implements CommandAction {
	
	private MemberDAO dao = MemberDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "find";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		MemberDTO user = new MemberDTO();
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		
		MemberDTO dto = dao.findId(user);
		request.setAttribute("find", dto);
		
		return "login";
	}

}
