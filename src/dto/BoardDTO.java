package dto;

public class BoardDTO {
	private int board_id; // 게시글 고유번호	
	private String board_writer; //작성자
	private String board_title; //제목
	private String board_content; //내용
	private String board_regDate; //게시글 등록일
	private int board_viewCnt; // 조회수
	private int board_likeCnt; // 조회수
	private int board_replyCnt; // 조회수
	private int board_champion; // 게시판 해당챔피언

	// 기본생성자
	public BoardDTO() {
		super();
		System.out.println("WriteDTO() 객체 생성");
	}



	// 매개변수 받는 생성자

	public BoardDTO(int board_id, String board_writer, String board_title, String board_content, String board_regDate,
			int board_viewCnt, int board_likeCnt, int board_replyCnt, int board_champion) {
		super();
		this.board_id = board_id;
		this.board_writer = board_writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_regDate = board_regDate;
		this.board_viewCnt = board_viewCnt;
		this.board_likeCnt = board_likeCnt;
		this.board_replyCnt = board_replyCnt;
		this.board_champion = board_champion;
	}




	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	
	public int getBoard_id() {
		return board_id;
	}
	
	
	
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	
	
	public String getBoard_writer() {
		return board_writer;
	}
	
	
	
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	
	
	
	public String getBoard_title() {
		return board_title;
	}
	
	
	
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	
	
	public String getBoard_content() {
		return board_content;
	}
	
	
	
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	
	
	
	public String getBoard_regDate() {
		return board_regDate;
	}
	
	
	
	public void setBoard_regDate(String board_regDate) {
		this.board_regDate = board_regDate;
	}
	
	
	
	public int getBoard_viewCnt() {
		return board_viewCnt;
	}
	
	
	
	public void setBoard_viewCnt(int board_viewCnt) {
		this.board_viewCnt = board_viewCnt;
	}
	
	
	
	public int getBoard_likeCnt() {
		return board_likeCnt;
	}
	
	
	
	public void setBoard_likeCnt(int board_likeCnt) {
		this.board_likeCnt = board_likeCnt;
	}
	
	
	
	public int getBoard_replyCnt() {
		return board_replyCnt;
	}
	
	
	
	public void setBoard_replyCnt(int board_replyCnt) {
		this.board_replyCnt = board_replyCnt;
	}
	
	
	
	public int getBoard_champion() {
		return board_champion;
	}
	
	
	
	public void setBoard_champion(int board_champion) {
		this.board_champion = board_champion;
	}

	
	

	// 개발할때 Class 의 toString() 오버라이딩 해주면
	// 디버깅이나 테스트 하기 좋다.
//	@Override
//	public String toString() {
//		return String.format("WriteDTO] %d : %s : %s : %s : %d : %s", 
//				board_id, board_title, board_content, board_viewCnt, board_regDate);
//	}

}
