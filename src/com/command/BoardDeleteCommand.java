package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class BoardDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
			int cnt = 0;
			DAO dao = new DAO();
			
			HttpSession session = request.getSession();
			int board_id = Integer.parseInt(request.getParameter("board_id"));
			int board_champion = Integer.parseInt(request.getParameter("board_champion"));
			String user_id = (String)session.getAttribute("user_id");
			String board_writer = (String)request.getParameter("board_writer");
			
			try {
				if(user_id.equals(board_writer)) {
				cnt = dao.delete(board_id, board_champion);
				}else {
					cnt = 2;	//자기 아이디가 아닐 때
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", cnt);
			request.setAttribute("board_champion", board_champion);
			
		}




}
