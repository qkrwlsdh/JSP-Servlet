package com.itbank.action;

import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.model.Hash;
import com.itbank.model.MemberDAO;
import com.itbank.model.MemberDTO;

public class RenewPwActionImpl implements CommandAction {

	private MemberDAO dao = MemberDAO.getInstance();
	
	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "renew";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		MemberDTO user = new MemberDTO();
//		user.setUserid(request.getParameter("userid"));
//		user.setUsername(request.getParameter("username"));
//		user.setEmail(request.getParameter("email"));
//		
//		int dto = dao.renewPw(user);
//		request.setAttribute("renew", dto);
//		
//		return "login";
		
		Enumeration<String> names = request.getParameterNames();
		MemberDTO dto = new MemberDTO();
		
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			String value = request.getParameter(name);
			switch(name) {
				case "userid": dto.setUserid(value); break;
				case "username": dto.setUsername(value); break;
				case "email": dto.setEmail(value); break;
			}
		}
		String newPassword = UUID.randomUUID().toString().replace("-", "").substring(0, 12);
		dto.setUserpw(Hash.getHash(newPassword));
		int row = dao.updatePassword(dto);
		
		if(row == 1) {
			request.setAttribute("row", 1);
			request.setAttribute("password", newPassword);
		}
		
		return "renewPasswordResult";
	}

}
