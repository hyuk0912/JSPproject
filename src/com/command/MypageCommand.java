package com.command;

import java.sql.SQLException;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

import dto.BoardDTO;
import dto.UserDTO;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session= request.getSession();
		DAO dao = new DAO();
		UserDTO[] arr = null;
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		System.out.println(user_id);
		try {
			arr = dao.selectByuser_id(user_id);  // 읽어오기
			request.setAttribute("list", arr);
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
