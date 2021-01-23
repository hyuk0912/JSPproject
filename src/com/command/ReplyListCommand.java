package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.ReplyDTO;

public class ReplyListCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		DAO dao = new DAO();  // DAO 객체 생성
		ReplyDTO[] arr = null;
		int board_id = 0;
		
		try {
			
			board_id = Integer.parseInt(request.getParameter("board_id"));
			arr = dao.reply_list(board_id);  // 트랜잭션 수행
			
			
			System.out.println("리스트board_id : " + board_id);
			
			// "list" 란  name 으로 request 에 arr 을 저장
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("list", arr);
			request.setAttribute("board_id", board_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}



}
