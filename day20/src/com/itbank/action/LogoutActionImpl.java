package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutActionImpl implements CommandAction {

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();

		session.invalidate();
		
		return "redirect:/";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return doGet(request, response);
	}

}
