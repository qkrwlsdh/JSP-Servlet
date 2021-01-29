package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexActionImpl implements CommandAction {

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "index";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return doGet(request, response);
	}

}
