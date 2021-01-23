package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;


public class BoardUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 지연	
		int cnt = 0;
		DAO dao = new DAO();
		
		//parameter
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		
		if(board_title != null && board_title.trim().length() > 0) {
			try {
				cnt = dao.update(board_title,board_content,board_id,board_champion);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}



}
