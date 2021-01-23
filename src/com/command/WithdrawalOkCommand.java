package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

public class WithdrawalOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		DAO dao = new DAO();
		
		//parameter
		HttpSession session= request.getSession();
		
		String user_id = (String) session.getAttribute("user_id");
		
		try {
			cnt = dao.user_delete(user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);
		
	}

}
