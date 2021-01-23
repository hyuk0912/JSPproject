package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class ReplyUpdateCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DAO dao = new DAO();
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		String reply_content = request.getParameter("reply_content");
		int reply_id = Integer.parseInt(request.getParameter("reply_id"));
		
		if(reply_content != null && reply_content.trim().length() > 0) {
			try {
				cnt = dao.reply_update(reply_content, reply_id);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}
	
}
