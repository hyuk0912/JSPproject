package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class IdSearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = "";
		DAO dao = new DAO();
		
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		
		if(user_name != null && user_phone != null &&
				user_name.trim().length() > 0 && user_phone.trim().length() > 0) {
			try {
				 
				user_id = dao.idSearch(user_name, user_phone);
				System.out.println("커맨드 user_id" + user_id);
				
			} catch (SQLException e) {
				
			}
		}
		
		request.setAttribute("result", user_id);
		System.out.println("리퀘스트 완료 아이디 찾기");
	}

}
