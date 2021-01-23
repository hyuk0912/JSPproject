package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import dto.BoardDTO;


public class BoardUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		System.out.println("수정하기 커멘드 진입");
		DAO dao = new DAO();
		BoardDTO[] arr = null;
		HttpSession session= request.getSession();
		
		
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		
		try {
			arr = dao.selectByboard_id(board_id, board_champion);  // 읽어오기
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}

	}



}
