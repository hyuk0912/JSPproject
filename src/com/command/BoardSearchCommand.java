package com.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import dto.BoardDTO;

public class BoardSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		DAO dao = new DAO(); // DAO 객체 생성
		BoardDTO[] arr = null;
		int board_champion = 0;
		String searchKind = "";
		String searchText = "";

		int curPage = 1; // 현재 페이지 (디폴트 1 page)
		int cnt = 0; // 글 목록 전체의 개수

		// 페이징 관련 세팅 값들
		int writePages = 10; // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
		int pageRows = 8; // 한 '페이지'에 몇개의 글을 리스트 할것인가?
		int totalPage = 0; // 총 몇 '페이지' 분량인가?

		System.out.println("보드 서치 들어옴");

		// 현재 몇 페이지인지 parameter 받아오기 + 검증
		String pageParam = request.getParameter("page");
		System.out.println("페이지파람------------ 처음엔 null이 정상" + pageParam);
		if (pageParam != null && !pageParam.trim().equals("")) {
			try {
				// 1이상의 자연수 이어야 한다
				int p = Integer.parseInt(pageParam);
				if (p > 0)
					curPage = p;
			} catch (NumberFormatException e) {
				// page parameter 오류는 별도의 exception 처리 안함
			}
		} // end if

		try {
			board_champion = Integer.parseInt(request.getParameter("board_champion"));
			searchKind = request.getParameter("searchKind");
			searchText = request.getParameter("searchText");
			System.out.println("searchKind : " + searchKind);
			System.out.println("searchText : " + searchText);
			
			cnt = dao.search_count_all(board_champion, searchKind, searchText);
			
			totalPage = (int)Math.ceil(cnt / (double)pageRows); //총 몇 페이지 분량인가?
			int fromRow = (curPage - 1) * pageRows + 1;	// 몇번째 row 부터?
			
			arr = dao.searchSelect(board_champion, searchKind, searchText, fromRow, pageRows);
			
			System.out.println("서치 셀렉 완료");
			System.out.println(arr.toString());

		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("searchList", arr);
		request.setAttribute("board_champion", board_champion);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("searchText", searchText);
	}

}


