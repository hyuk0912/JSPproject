package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int board_champion = Integer.parseInt(request.getParameter("board_champion"));
		
		System.out.println("라이트board_champion : " + board_champion);

		
		request.setAttribute("board_champion", board_champion);
		
	}



}
