package vo;

public class VO {

   public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
   public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
   public static final String USERID = "goldspoon";
   public static final String USERPW = "1234";

   
   public static final String SQL_WRITE_INSERT = 
         "INSERT INTO tb_board"
         + "(board_id, board_title, board_content, board_regDate, board_viewCnt, board_likeCnt, board_replyCnt, board_champion, board_writer) " 
         + "VALUES"
         + "(SEQ_tb_board_board_id.NEXTVAL, ?, ?, SYSDATE, 0, 0, 0, ?, ?)";
   
   
   public static final String SQL_WRITE_SELECT = 
         "SELECT * FROM tb_board WHERE board_champion = ? ORDER BY board_likeCnt DESC";
   
   
   public static final String SQL_WRITE_SELECT_BY_NO = 

         "SELECT * FROM tb_board WHERE board_id=? and board_champion=?";

   public static final String SQL_WRITE_INC_VIEWCNT = 
         "UPDATE tb_board SET board_viewCnt = board_viewCnt + 1 WHERE board_id = ? and board_champion=?";
   
   
   public static final String SQL_USER_SIGNUP = 
            "INSERT INTO TB_USER"
            + "(user_uid, user_id, user_pw, user_name, user_email, user_phone, user_profileImage) " 
            + "VALUES"
            + "(SEQ_tb_user_user_uid.NEXTVAL, ?, ?, ?, ?, ?, 'defaultProfile2.png')";



   public static final String SQL_WRITE_UPDATE = 
         "UPDATE TB_BOARD SET board_title = ?, board_content = ? WHERE board_id = ? and board_champion=?";


   public static final String SQL_USER_LOGIN = 

         "SELECT user_pw FROM TB_USER WHERE user_id=?";


   public static final String SQL_WRITE_DELETE =

         "DELETE FROM TB_BOARD WHERE board_id=? and board_champion = ?";   //챔피언 넘버 추가

   //--------------------------댓글 쿼리
   public static final String SQL_REPLY_INSERT = 
            "INSERT INTO tb_reply"
            + "(reply_id, reply_writer, reply_content, reply_regDate, board_id) " 
            + "VALUES"
            + "(SEQ_tb_reply_reply_id.NEXTVAL, ?, ?, SYSDATE, ?)";

   public static final String SQL_MYPAGE_SELECT = 

         "SELECT * FROM TB_USER WHERE USER_ID=?";   // 마이페이지 열었을때 회원가입정보 가져오기

   
   public static final String SQL_MYPAGE_UPDATE = 
         
            "UPDATE TB_USER SET USER_PW = ?, USER_EMAIL = ?, USER_PHONE = ? WHERE USER_ID = ?";
   

   public static final String SQL_REPLY_SELECT = 
            "SELECT * FROM tb_reply WHERE board_id = ? ORDER BY reply_regDate DESC";


   public static final String SQL_REPLY_DELETE =

         "DELETE FROM tb_reply WHERE reply_id=?";
   
   
   public static final String SQL_REPLY_UPDATE = 
            "UPDATE tb_reply SET  reply_content = ? WHERE reply_id = ?";
   
   
   //아이디 찾기
   public static final String SQL_ID_SEARCH = 
         "SELECT USER_ID FROM TB_USER WHERE USER_NAME =? AND USER_PHONE=?";
   
   //비번찾기
   public static final String SQL_PW_SEARCH = 
         "SELECT USER_PW FROM TB_USER WHERE USER_ID =? AND USER_NAME=? AND USER_EMAIL=?";
   
   
   public static final String SQL_PROFILEIMAGE_UPLOAD = 
         
         "UPDATE TB_USER SET USER_PROFILEIMAGE=? WHERE USER_ID = ?";
   
   public static final String SQL_USER_DELETE = 

         "DELETE FROM TB_USER WHERE USER_ID = ?";

   
   public static final String SQL_USER_GET_UID = 

         "SELECT USER_UID FROM TB_USER WHERE USER_ID = ?";
   
   public static final String SQL_WRITE_SELECT_FROM_ROW = 
         "SELECT * FROM " + 
         "(SELECT ROWNUM AS RNUM, T.* FROM (SELECT * FROM tb_board WHERE board_champion = ? ORDER BY board_likeCnt DESC, board_id DESC) T) " + 
         "WHERE RNUM >= ? AND RNUM < ?";
   
   public static final String SQL_WRITE_COUNT_ALL =
         "SELECT COUNT(*) FROM TB_BOARD WHERE BOARD_CHAMPION = ?";
   
   public static final String SQL_LIKE_INSERT = 
            "INSERT INTO tb_like"
            + "(like_id, user_uid, board_id) " 
            + "VALUES"
            + "(SEQ_tb_like_like_id.NEXTVAL, ?, ?)";
   
   
   public static final String SQL_LIKE_SELECT = 
            "SELECT like_id FROM tb_like WHERE user_uid = ? AND board_id= ?";
   
   
   public static final String SQL_LIKE_DELETE = 
           "DELETE FROM tb_like WHERE user_uid = ? AND board_id= ?";
   
   public static final String SQL_UPDATE_VIEWCNT = 
            "UPDATE tb_board SET board_viewCnt = board_viewCnt - 1 WHERE board_id = ?";
   
   public static final String SQL_LIKECNT_SELECT = 
         "SELECT * FROM tb_like WHERE board_id = ?";
   
   public static final String SQL_LIKECNT_UPDATE =
         "UPDATE TB_BOARD SET board_likeCnt = ? WHERE BOARD_ID = ?";

   
   public static final String SQL_UPDATE_REPLYCNT = 
           "UPDATE tb_board SET board_replyCnt = ? WHERE board_id = ?";

   //아이디 유효성 검사
   public static final String SQL_JOIN_USERID = 
		   "SELECT * FROM TB_USER WHERE user_id = ?";


   
   public static final String SQL_REPLYCNT_SELECT =
	       "SELECT COUNT(*) FROM tb_reply WHERE BOARD_ID = ?";

   public static final String SQL_JOIN_USEREMAIL = 
		   "SELECT * FROM TB_USER WHERE user_email = ?";
   
   public static final String SQL_JOIN_USERPHONE = 

		   "SELECT * FROM TB_USER WHERE user_phone = ?";

   
}