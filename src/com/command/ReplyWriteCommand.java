package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class ReplyWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		int replyCnt = 0;
		int replyCntRs = 0;
		
		//입력한 값 (parameter) 받아오기
		String reply_writer = request.getParameter("reply_writer");
		String reply_content = request.getParameter("reply_content");
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		
		System.out.println("reply_writer : "+reply_writer +" , reply_content : " + reply_content + ", board_id" + board_id);
		
		//유효성 체크
		if(reply_writer != null && reply_content != null &&
				reply_writer.trim().length() > 0 && reply_content.trim().length() > 0) {
			try {

				cnt = dao.reply_insert(reply_writer, reply_content, board_id);
				replyCnt = dao.replyCnt_select(board_id);
				replyCntRs = dao.replyCnt_update(replyCnt, board_id);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("replyCnt", replyCnt);
	}



}
