package com.itbank.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itbank.board.BoardDAO;

public class BoardActionImpl implements CommandAction {
	
	private BoardDAO dao = BoardDAO.getInstance();

	@Override
	public String doGet(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String p = request.getParameter("page");
		int page = p != null ? Integer.parseInt(p) : 1;
		String type = request.getParameter("type");
		type = type == null ? "" : type;
		String word = request.getParameter("word");
		word = word == null ? "" : word;
		request.setAttribute("map", dao.selectAll(page, type, word));
		
		return "board";
	}

	@Override
	public String doPost(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return null;
	}

}
