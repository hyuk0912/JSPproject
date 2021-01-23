package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class LikeCancleCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		int viewCntRs = 0;
		int board_likeCnt = 0;
		int likeCntResult = 0;
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		
		

		int user_uid = (Integer)session.getAttribute("user_uid");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
			try {
				cnt = dao.like_delete(user_uid, board_id);
				viewCntRs = dao.viewCnt_update(board_id);
				System.out.println("2");
				board_likeCnt = dao.likeCnt_select(board_id);
				System.out.println("3");
				likeCntResult = dao.likeCnt_update(board_likeCnt, board_id);
				System.out.println("4");
				System.out.println("user_uid : " + user_uid);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		request.setAttribute("likeDeleteResult", cnt);
		
	}

}
