package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class PwSearchCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String user_pw = "";
		DAO dao = new DAO();
		
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		
		
		if(user_id != null && user_name != null && user_email != null &&
				user_id.trim().length() > 0 && user_name.trim().length()> 0 && user_email.trim().length() > 0) {
			try {
				 
				user_pw = dao.pwSearch(user_id, user_name,user_email);
				System.out.println("커맨드 user_pw" + user_pw);
				
			} catch (SQLException e) {
				
			}
		}
		
		request.setAttribute("user_pw", user_pw);
		System.out.println("request 비번 찾기");
	}
	
	}

