package dto;

public class UserDTO {
	
	int user_uid;	//회원 고유 번호
	String user_id;	//회원 아이디
	String user_pw;	//회원 비밀번호
	String user_name;	//회원 이름
	String user_email;	//회원 이메일
	String user_phone; 	//회원 전화번호
	String user_profileImage;	//회원 프로필이미지
	
	public UserDTO() {
		super();
	}
	
	// 매개변수 받는 생성자
	public UserDTO(int uid, String id, String pw, String name, String email, String phone, String photo) {
		super();
		this.user_uid = uid;
		this.user_id = id;
		this.user_pw = pw;
		this.user_name = name;
		this.user_email = email;
		this.user_phone = phone;
		this.user_profileImage = photo;
		
		System.out.printf("WriteDTO(%d, %s, %s, %s, %s, %s, %s) 객체 생성", 
				uid, id, pw, name, email, phone, photo);
	}

	public int getuser_uid() {
		return user_uid;
	}

	public void setuser_no(int user_uid) {
		this.user_uid = user_uid;
	}

	public String getuser_id() {
		return user_id;
	}

	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getuser_pw() {
		return user_pw;
	}

	public void setuser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getuser_name() {
		return user_name;
	}

	public void setuser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getuser_email() {
		return user_email;
	}

	public void setuser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getuser_phone() {
		return user_phone;
	}

	public void setuser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getuser_profileImage() {
		return user_profileImage;
	}

	public void setuser_profileImage(String user_profileImage) {
		this.user_profileImage = user_profileImage;
	}

	
	
}
