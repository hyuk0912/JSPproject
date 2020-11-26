
/* Drop Tables */

DROP TABLE COMMENTINFO CASCADE CONSTRAINTS;
DROP TABLE COMMUNITYINFO CASCADE CONSTRAINTS;
DROP TABLE CHAMPION CASCADE CONSTRAINTS;
DROP TABLE GAMEINFO CASCADE CONSTRAINTS;
DROP TABLE USERINFO CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE CHAMPION
(
	-- 챔피언 고유 번호
	champion_uid number NOT NULL,
	-- 챔피언 이름
	champion_name varchar2(20) UNIQUE,
	-- 챔피언 정보
	champion_info varchar2(200),
	PRIMARY KEY (champion_uid)
);


CREATE TABLE COMMENTINFO
(
	-- 댓글 고유 번호
	comment_uid number NOT NULL,
	-- 댓글 작성자
	comment_name varchar2(20) UNIQUE,
	-- 댓글 내용
	comment_content varchar2(200),
	-- 댓글 작성 시간
	comment_regdate date DEFAULT sysdate NOT NULL,
	-- 게시판 고유 번호
	community_uid number NOT NULL,
	PRIMARY KEY (comment_uid)
);


CREATE TABLE COMMUNITYINFO
(
	-- 게시판 고유 번호
	community_uid number NOT NULL,
	-- 게시판 제목
	community_title varchar2(50) NOT NULL,
	-- 게시판 내용
	community_content varchar2(200),
	-- 게시판 작성자
	community_name varchar2(20) NOT NULL,
	-- 게시글 추천수
	community_recommendCnt number,
	-- 게시글 조회수
	community_viewCnt number,
	-- 게시글 작성시간
	community_regdate date DEFAULT sysdate,
	-- 챔피언 고유 번호
	champion_uid number NOT NULL,
	PRIMARY KEY (community_uid)
);


CREATE TABLE GAMEINFO
(
	-- 게임 고유 번호
	game_uid number NOT NULL,
	-- 게임 아이디
	game_id varchar2(20) NOT NULL,
	-- 소환사 레벨
	game_level number,
	-- 소환사 티어1
	game_firstTier varchar2(20),
	-- 게임 소환사 티어2
	game_secondTier number,
	-- 일반 게임 전적
	game_gamelistNormal varchar2(200),
	-- 랭크 게임 전적
	game_gamelistRank varchar2(200),
	PRIMARY KEY (game_uid)
);


CREATE TABLE USERINFO
(
	-- 회원 고유 번호
	user_uid number DEFAULT 1 NOT NULL,
	-- 회원 id
	user_id varchar2(20) UNIQUE,
	-- 회원 비밀번호
	user_pw varchar2(20),
	-- 회원 실명 이름
	user_name varchar2(20),
	-- 회원 이메일
	user_email varchar2(30),
	-- 회원 휴대전화 번호
	user_phone varchar2(50),
	-- 회원 프로필 사진
	user_photo varchar2(50),
	PRIMARY KEY (user_uid)
);



/* Create Foreign Keys */

ALTER TABLE COMMUNITYINFO
	ADD FOREIGN KEY (community_uid)
	REFERENCES CHAMPION (champion_uid)
;


ALTER TABLE COMMENTINFO
	ADD FOREIGN KEY (comment_uid)
	REFERENCES COMMUNITYINFO (community_uid)
;

SELECT * FROM COMMENTINFO;
SELECT * FROM COMMUNITYINFO;


/* Comments */

COMMENT ON COLUMN CHAMPION.champion_uid IS '챔피언 고유 번호';
COMMENT ON COLUMN CHAMPION.champion_name IS '챔피언 이름';
COMMENT ON COLUMN CHAMPION.champion_info IS '챔피언 정보';
COMMENT ON COLUMN COMMENTINFO.comment_uid IS '댓글 고유 번호';
COMMENT ON COLUMN COMMENTINFO.comment_name IS '댓글 작성자';
COMMENT ON COLUMN COMMENTINFO.comment_content IS '댓글 내용';
COMMENT ON COLUMN COMMENTINFO.comment_regdate IS '댓글 작성 시간';
COMMENT ON COLUMN COMMENTINFO.community_uid IS '게시판 고유 번호';
COMMENT ON COLUMN COMMUNITYINFO.community_uid IS '게시판 고유 번호';
COMMENT ON COLUMN COMMUNITYINFO.community_title IS '게시판 제목';
COMMENT ON COLUMN COMMUNITYINFO.community_content IS '게시판 내용';
COMMENT ON COLUMN COMMUNITYINFO.community_name IS '게시판 작성자';
COMMENT ON COLUMN COMMUNITYINFO.community_recommendCnt IS '게시글 추천수';
COMMENT ON COLUMN COMMUNITYINFO.community_viewCnt IS '게시글 조회수';
COMMENT ON COLUMN COMMUNITYINFO.community_regdate IS '게시글 작성시간';
COMMENT ON COLUMN COMMUNITYINFO.champion_uid IS '챔피언 고유 번호';
COMMENT ON COLUMN GAMEINFO.game_uid IS '게임 고유 번호';
COMMENT ON COLUMN GAMEINFO.game_id IS '게임 아이디';
COMMENT ON COLUMN GAMEINFO.game_level IS '소환사 레벨';
COMMENT ON COLUMN GAMEINFO.game_firstTier IS '소환사 티어1';
COMMENT ON COLUMN GAMEINFO.game_secondTier IS '게임 소환사 티어2';
COMMENT ON COLUMN GAMEINFO.game_gamelistNormal IS '일반 게임 전적';
COMMENT ON COLUMN GAMEINFO.game_gamelistRank IS '랭크 게임 전적';
COMMENT ON COLUMN USERINFO.user_uid IS '회원 고유 번호';
COMMENT ON COLUMN USERINFO.user_id IS '회원 id';
COMMENT ON COLUMN USERINFO.user_pw IS '회원 비밀번호';
COMMENT ON COLUMN USERINFO.user_name IS '회원 실명 이름';
COMMENT ON COLUMN USERINFO.user_email IS '회원 이메일';
COMMENT ON COLUMN USERINFO.user_phone IS '회원 휴대전화 번호';
COMMENT ON COLUMN USERINFO.user_photo IS '회원 프로필 사진';



WITH LIST AS
(
    SELECT A.TABLE_NAME,
           A.COLUMN_NAME,
           A.DATA_TYPE,
           A.DATA_LENGTH,
           A.NULLABLE,
           B.COMMENTS
    FROM   dba_tab_columns A,
           all_col_comments B
    WHERE  A.OWNER = B.OWNER
    AND    A.TABLE_NAME = B.TABLE_NAME
    AND    A.COLUMN_NAME = B.COLUMN_NAME
    AND    A.OWNER = 'GOLDSPOON'   -- DB명
),
PKLIST AS
(
    SELECT C.TABLE_NAME,
           C.COLUMN_NAME,
           C.POSITION
    FROM USER_CONS_COLUMNS C,
         USER_CONSTRAINTS S
    WHERE C.CONSTRAINT_NAME = S.CONSTRAINT_NAME
    AND S.CONSTRAINT_TYPE = 'P'
)
SELECT L.TABLE_NAME AS "테이블명",
       L.COLUMN_NAME AS "컬럼명",
       L.DATA_TYPE AS "데이터타입",
       L.DATA_LENGTH AS "길이",
       CASE WHEN P.POSITION < 99 THEN 'Y'
            ELSE ' '
       END AS "PK",
       L.NULLABLE AS "Null 여부",
       L.COMMENTS AS "Comments"
FROM LIST L,
     PKLIST P
WHERE L.TABLE_NAME = P.TABLE_NAME(+)
  AND L.COLUMN_NAME = P.COLUMN_NAME(+)
 ORDER BY L.TABLE_NAME,
          NVL(P.POSITION, 99)
;