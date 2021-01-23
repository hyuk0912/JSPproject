package com.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class HistoryMainCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		//input에서 입력한 값
		String search_id = request.getParameter("search_id");
		
		if(search_id != null)
			request.setAttribute("search_id", search_id);
			
		
	}
	
	
}
