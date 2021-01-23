package dto;

public class ReplyDTO {
	   
	private int reply_id;	
	private String reply_writer;
	private String reply_content;
	private String reply_regDate;
	private int board_id;
	
	
	public ReplyDTO() {
		super();
		System.out.println("WriteDTO() 객체 생성");
	}
	
	
	//매개변수 생성자
	
	public ReplyDTO(int reply_id, String reply_writer, String reply_content, String reply_regDate, int board_id) {
		super();
		this.reply_id = reply_id;
		this.reply_writer = reply_writer;
		this.reply_content = reply_content;
		this.reply_regDate = reply_regDate;
		this.board_id = board_id;
	}

	
	
	//Getter Setter

	public int getReply_id() {
		return reply_id;
	}


	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}


	public String getReply_writer() {
		return reply_writer;
	}


	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public String getReply_regDate() {
		return reply_regDate;
	}


	public void setReply_regDate(String reply_regDate) {
		this.reply_regDate = reply_regDate;
	}


	public int getBoard_id() {
		return board_id;
	}


	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	
	
	
	
}
