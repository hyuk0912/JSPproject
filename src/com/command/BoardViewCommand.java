package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import dto.BoardDTO;
import dto.LikeDTO;
import dto.ReplyDTO;
import dto.UserDTO;



public class BoardViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		DAO dao = new DAO();
		BoardDTO [] arr = null;
		ReplyDTO [] arr2 = null;
		int likeViewResult = 0;
		int board_likeCnt = 0;
		int like_insert = 0;
		int likeCntResult = 0;
		int replyCnt = 0;

		int user_uid;


		HttpSession session = request.getSession();
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));


		
		try {
			user_uid = (Integer)session.getAttribute("user_uid");
		} catch (Exception e) {
			user_uid=-1;
		}
		





System.out.println("board_id : " + board_id);

		
		try {
			arr = dao.readByboard_id(board_id, board_champion);
			arr2 = dao.reply_list(board_id);
			replyCnt = arr2.length;
			System.out.println("라이크뷰리절트----------------------------" + likeViewResult);
			board_likeCnt = dao.likeCnt_select(board_id);
			likeCntResult = dao.likeCnt_update(board_likeCnt, board_id);
			likeViewResult = dao.like_view(user_uid, board_id);

			
			
			
			System.out.println("뷰 user_uid"+ user_uid);
			
			

			request.setAttribute("list", arr);

			request.setAttribute("list2", arr2);
			request.setAttribute("likeViewResult", likeViewResult);

			request.setAttribute("user_uid", user_uid);
			request.setAttribute("replyCnt", replyCnt);
			request.setAttribute("board_likeCnt", board_likeCnt);




			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}
	

}
