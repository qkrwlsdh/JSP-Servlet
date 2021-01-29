package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {

	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable;
	
}
