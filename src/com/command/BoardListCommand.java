package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;


public class BoardListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 의상
		
		DAO dao = new DAO();  // DAO 객체 생성
		//BoardDTO[] arr = null;
		BoardDTO[] arr2 = null;
		int board_champion = 0;



		int curPage = 1;   // 현재 페이지 (디폴트 1 page)
		int cnt = 0;   // 글 목록 전체의 개수

		
		// 페이징 관련 세팅 값들
		int writePages = 10;    // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
		int pageRows = 8;   // 한 '페이지'에 몇개의 글을 리스트 할것인가? 
		int totalPage = 0; //총 몇 '페이지' 분량인가? 
		int board_likeCnt = 0;
		

		try {
			
			// 현재 몇 페이지인지 parameter 받아오기 + 검증
			String pageParam = request.getParameter("page");
			if(pageParam != null && !pageParam.trim().equals("")){
				try{ 
					// 1이상의 자연수 이어야 한다
					int p = Integer.parseInt(pageParam);
					if(p > 0) curPage = p;
				} catch(NumberFormatException e){
					// page parameter 오류는 별도의 exception 처리 안함 
				}
			} // end if
		
			board_champion = Integer.parseInt(request.getParameter("board_champion"));
			//arr = dao.select(board_champion);  // 트랜잭션 수행

			cnt = dao.count_all(board_champion);	//전체 글 갯수
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows); //총 몇 페이지 분량인가?
			int fromRow = (curPage - 1) * pageRows + 1;	// 몇번째 row 부터?
			
			arr2 = dao.select_from_row(board_champion, fromRow, pageRows);
			

			
			System.out.println("리스트board_champion : " + board_champion);
			System.out.println("리스트 전체 : " + cnt);
			//System.out.println("리스트 arr : " + arr);
			System.out.println("리스트 arr2 : " + arr2);
			
			// "list" 란  name 으로 request 에 arr 을 저장
			// request 가 컨트롤러에 전달될것이다.
			//request.setAttribute("list", arr);
			request.setAttribute("list2", arr2);
			request.setAttribute("board_champion", board_champion);

			request.setAttribute("totalPage", totalPage);
			request.setAttribute("curPage", curPage);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


}
