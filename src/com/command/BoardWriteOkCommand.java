package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class BoardWriteOkCommand implements Command {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		
		//입력한 값 (parameter) 받아오기
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		HttpSession session = request.getSession();
		

		String board_writer = (String)session.getAttribute("user_id");
		
		System.out.println("board_title : "+board_title +" , board_content : " + board_content);
		
		//유효성 체크
		if(board_title != null && board_content != null &&
				board_title.trim().length() > 0 && board_content.trim().length() > 0) {
			try {
				cnt = dao.insert(board_title, board_content, board_champion, board_writer);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//end if
		
		request.setAttribute("result", cnt);
		request.setAttribute("board_champion", board_champion);
	}


}
