package dto;

public class LikeDTO {

	private int like_id;	
	private int user_uid;	
	private int board_id;	
	
	
	public LikeDTO() {
		super();
	}


	public LikeDTO(int like_id, int user_uid, int board_id) {
		super();
		this.like_id = like_id;
		this.user_uid = user_uid;
		this.board_id = board_id;
	}


	
	
	public int getLike_id() {
		return like_id;
	}


	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}


	public int getUser_uid() {
		return user_uid;
	}


	public void setUser_uid(int user_uid) {
		this.user_uid = user_uid;
	}


	public int getBoard_id() {
		return board_id;
	}


	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	
	
}
