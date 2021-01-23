package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.*;
import dao.DAO;

public class LoginCommand implements Command{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      int cnt = 0;
      DAO dao = new DAO();
   
      //input에서 입력한 값
      String user_id = request.getParameter("user_id");
      String user_pw = request.getParameter("user_pw");
      int user_uid = 0;

      //빈칸일때 cnt =0임
      if(user_id != null && user_pw != null &&
            user_id.trim().length() > 0 && user_pw.trim().length() > 0) {
         try {
            if(user_pw.equals(dao.login(user_id))) {  
               user_uid = dao.getUser_uid(user_id);
               cnt = 1;
            }else {
               cnt = 0;
            }
         } catch (SQLException e) {
            cnt = 0;
         }
      }
      
      
      System.out.println("cnt : "+cnt);

      request.setAttribute("result", cnt);
      request.setAttribute("user_id", user_id);
      request.setAttribute("user_uid", user_uid);
   }


   
   

}