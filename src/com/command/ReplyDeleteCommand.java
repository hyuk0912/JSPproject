package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class ReplyDeleteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		DAO dao = new DAO();
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		int reply_id = Integer.parseInt(request.getParameter("reply_id"));
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		
		try {
			cnt = dao.reply_delete(reply_id);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("board_id", board_id);
		request.setAttribute("board_champion", board_champion);
	}

}
