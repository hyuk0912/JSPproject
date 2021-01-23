package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

public class UserSignUpCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int idcnt = 0;
		int emailcnt = 0;
		int phonecnt = 0;
		int bean = 0;
		DAO dao = new DAO();

		//회원정보 값 받아오기
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		String user_phone = request.getParameter("user_phone");

		System.out.println("user_id : " + user_id + " , " +
				"user_pw : " + user_pw + " , " +
				"user_name : "+ user_name + " , " +
				"user_email : " + user_email + " ," +
				"user_phone : " + user_phone);

	
	
		if(user_id != null && user_pw != null && user_name != null && user_email != null && user_phone != null &&
				user_id.trim().length() > 0 && user_pw.trim().length() > 0 && user_name.trim().length() > 0
				 && user_email.trim().length() > 0 && user_phone.trim().length() > 0) {
			try {
				idcnt = dao.joinIdChk( user_id);
				emailcnt = dao.joinEmailChk(user_email);
				phonecnt = dao.joinPhoneChk(user_phone);
				
				System.out.println(idcnt);
				System.out.println(emailcnt);
				System.out.println(phonecnt);
				
				if(idcnt == 0) {
					
				}else if(emailcnt == 0) {
					
				}else if(phonecnt == 0) {
					
				}else {
					cnt = dao.signUp(user_id, user_pw, user_name, user_email, user_phone);
				}
				
//				if(idcnt == 1 && emailcnt == 1 && phonecnt ==1) {
//					cnt = dao.signUp(user_id, user_pw, user_name, user_email, user_phone);
//				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else { 
			bean = 1;
			idcnt = 1;
			emailcnt = 1;
			phonecnt = 1;
		}

		request.setAttribute("result", cnt); //signupOK 결과값 request
		request.setAttribute("idcnt", idcnt); 
		request.setAttribute("emailcnt", emailcnt);
		request.setAttribute("phonecnt", phonecnt); 
		request.setAttribute("bean", bean); 

	}

}
