package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class LikeCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int viewCntRs = 0;
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		

		int user_uid = (Integer)session.getAttribute("user_uid");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_likeCnt = 0;
		int likeCntResult = 0;
		
			try {
				cnt = dao.like_insert(user_uid, board_id);
				viewCntRs = dao.viewCnt_update(board_id);
				board_likeCnt = dao.likeCnt_select(board_id);
				likeCntResult = dao.likeCnt_update(board_likeCnt, board_id);
				System.out.println("user_uid : " + user_uid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		request.setAttribute("likeResult", cnt);
		
	}

}
