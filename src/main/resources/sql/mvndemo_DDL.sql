--게시판
DROP TABLE tbl_board
CREATE TABLE tbl_board
(
    id              NUMBER                 NOT NULL,
    user_id         NUMBER                 NOT NULL,
    writer          VARCHAR(50)            NOT NULL,
    title           VARCHAR(50)            NOT NULL,
    content         VARCHAR(225)           NOT NULL,
    view_cnt        NUMBER(10) DEFAULT 0   NOT NULL,
    reply_cnt       NUMBER(10) DEFAULT 0   NOT NULL,
    read_permission CHAR(1)    DEFAULT 'U' NOT NULL,
    board_type      CHAR(1)    DEFAULT 'Q' NOT NULL,
    write_dt        TIMESTAMP(6)           NOT NULL,
    modify_dt       TIMESTAMP(6)           NOT NULL,
    del_yn          CHAR(1)    DEFAULT 'N' NOT NULL,
    CONSTRAINT pk_tbl_board PRIMARY KEY (id)
)
/

CREATE SEQUENCE tbl_board_seq
    START WITH 1
    INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER tbl_board_ai_trg
    BEFORE INSERT
    ON tbl_board
    REFERENCING new AS new
    FOR EACH ROW
BEGIN
    SELECT tbl_board_seq.nextval
    INTO :new.id
    FROM dual;
END;
/

--DROP TRIGGER TBL_BOARD_AI_TRG;
/

--DROP SEQUENCE TBL_BOARD_SEQ;
/

COMMENT ON TABLE tbl_board IS '게시판'
/

COMMENT ON COLUMN tbl_board.id IS '글 index'
/

COMMENT ON COLUMN tbl_board.user_id IS '글 작성자 index'
/

COMMENT ON COLUMN tbl_board.writer IS '글 작성자'
/

COMMENT ON COLUMN tbl_board.title IS '글 제목'
/

COMMENT ON COLUMN tbl_board.content IS '글 내용'
/

COMMENT ON COLUMN tbl_board.view_cnt IS '글 조회수'
/

COMMENT ON COLUMN tbl_board.reply_cnt IS '글 댓글수'
/

COMMENT ON COLUMN tbl_board.board_type IS '글 타입(공지사항: N, QnA: Q)'
/

COMMENT ON COLUMN tbl_board.write_dt IS '글 등록일'
/

COMMENT ON COLUMN tbl_board.modify_dt IS '글 수정일'
/

COMMENT ON COLUMN tbl_board.del_yn IS '글 삭제 여부'
/

CREATE UNIQUE INDEX
    on TBL_BOARD(ID)
/

--사용자 계정
DROP TABLE tbl_user
CREATE TABLE tbl_user
(
    id           NUMBER                      NOT NULL,
    user_account VARCHAR2(255)               NOT NULL,
    user_pw      VARCHAR2(255)               NOT NULL,
    user_email     VARCHAR2(255)               NOT NULL,
    user_nm      VARCHAR2(255)               NOT NULL,
    role         VARCHAR2(10) DEFAULT 'USER' NOT NULL,
    create_dt    TIMESTAMP(6)                NOT NULL,
    update_dt    TIMESTAMP(6)                NOT NULL,
    del_yn       CHAR(1)      DEFAULT 'N'    NOT NULL,
    CONSTRAINT pk_tbl_user PRIMARY KEY (id)
)
/

CREATE SEQUENCE tbl_user_seq
    START WITH 1
    INCREMENT BY 1;
/

--CREATE OR REPLACE TRIGGER TBL_USER_AI_TRG
--BEFORE INSERT ON TBL_USER
--REFERENCING NEW AS NEW FOR EACH ROW 
--BEGIN 
--    SELECT TBL_USER_SEQ.NEXTVAL
--    INTO :NEW.ID
--    FROM DUAL;
--END;
/

--DROP TRIGGER TBL_USER_AI_TRG;
/

--DROP SEQUENCE TBL_USER_SEQ;
/

COMMENT ON TABLE tbl_user IS '계정'
/

COMMENT ON COLUMN tbl_user.id IS '사용자 index'
/

CREATE UNIQUE INDEX uq_tbl_user_1
    ON tbl_user (user_account)
/

--파일
CREATE TABLE tbl_file
(
    id        NUMBER       NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    create_dt TIMESTAMP(6) NOT NULL,
    update_dt TIMESTAMP(6) NOT NULL
)