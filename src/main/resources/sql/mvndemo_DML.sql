--게시판 Sample Data
truncate TABLE TIBERO.TBL_BOARD;
INSERT INTO TIBERO.TBL_BOARD 
(ID, USER_ID, WRITER, TITLE, CONTENT, BOARD_TYPE,READ_PERMISSION, WRITE_DT, MODIFY_DT, DELYN) VALUES 
 (01, 01, 'WRITER 01', 'TITLE 01', 'CONTENT 01','N', 'A', sysdate, sysdate, 'N')
,(02, 02, 'WRITER 02', 'TITLE 02', 'CONTENT 02','N', 'M',sysdate, sysdate, 'N')
,(03, 03, 'WRITER 03', 'TITLE 03', 'CONTENT 03','N', 'P', sysdate, sysdate, 'N')
,(04, 04, 'WRITER 04', 'TITLE 04', 'CONTENT 04','N', 'U', sysdate, sysdate, 'N')
,(05, 05, 'WRITER 05', 'TITLE 05', 'CONTENT 05','N', 'U',sysdate, sysdate, 'N')
,(06, 06, 'WRITER 06', 'TITLE 06', 'CONTENT 06','N', 'U',sysdate, sysdate, 'N')
,(07, 07, 'WRITER 07', 'TITLE 07', 'CONTENT 07','N','U',sysdate, sysdate, 'N')
,(08, 08, 'WRITER 08', 'TITLE 08', 'CONTENT 08','N','U',sysdate, sysdate, 'N')
,(09, 09, 'WRITER 09', 'TITLE 09', 'CONTENT 09','N','U',sysdate, sysdate, 'N')
,(10, 10, 'WRITER 10', 'TITLE 10', 'CONTENT 10','N','U',sysdate, sysdate, 'N')
,(11, 11, 'WRITER 11', 'TITLE 11', 'CONTENT 11','N','U',sysdate, sysdate, 'N')
,(12, 12, 'WRITER 12', 'TITLE 12', 'CONTENT 12','N','U',sysdate, sysdate, 'N')
,(13, 13, 'WRITER 13', 'TITLE 13', 'CONTENT 13','N','U',sysdate, sysdate, 'N')
,(14, 14, 'WRITER 14', 'TITLE 14', 'CONTENT 14','N','U',sysdate, sysdate, 'N')
,(15, 15, 'WRITER 15', 'TITLE 15', 'CONTENT 15','N','U',sysdate, sysdate, 'N')
,(16, 16, 'WRITER 16', 'TITLE 16', 'CONTENT 16','N','U',sysdate, sysdate, 'N')
,(17, 17, 'WRITER 17', 'TITLE 17', 'CONTENT 17','N','U',sysdate, sysdate, 'N')
,(18, 18, 'WRITER 18', 'TITLE 18', 'CONTENT 18','N','U',sysdate, sysdate, 'N')
,(19, 19, 'WRITER 19', 'TITLE 19', 'CONTENT 19','N','U',sysdate, sysdate, 'N')
,(20, 20, 'WRITER 20', 'TITLE 20', 'CONTENT 20','N','U',sysdate, sysdate, 'N')
,(21, 21, 'WRITER 21', 'TITLE 21', 'CONTENT 21','N','U',sysdate, sysdate, 'N')
,(22, 22, 'WRITER 22', 'TITLE 22', 'CONTENT 22','N','U',sysdate, sysdate, 'N')
,(23, 23, 'WRITER 23', 'TITLE 23', 'CONTENT 23','N','U',sysdate, sysdate, 'N')
,(24, 24, 'WRITER 24', 'TITLE 24', 'CONTENT 24','N','U',sysdate, sysdate, 'N')
,(25, 25, 'WRITER 25', 'TITLE 25', 'CONTENT 25','N','U',sysdate, sysdate, 'N')
,(26, 26, 'WRITER 26', 'TITLE 26', 'CONTENT 26','N','U',sysdate, sysdate, 'N')
,(27, 27, 'WRITER 27', 'TITLE 27', 'CONTENT 27','N','U',sysdate, sysdate, 'N')
,(28, 28, 'WRITER 28', 'TITLE 28', 'CONTENT 28','N','U',sysdate, sysdate, 'N')
,(29, 29, 'WRITER 29', 'TITLE 29', 'CONTENT 29','N','U',sysdate, sysdate, 'N')
,(30, 30, 'WRITER 30', 'TITLE 30', 'CONTENT 30','N','U',sysdate, sysdate, 'N')
,(31, 31, 'WRITER 31', 'TITLE 31', 'CONTENT 31','N','U',sysdate, sysdate, 'N')
,(32, 32, 'WRITER 32', 'TITLE 32', 'CONTENT 32','N','U',sysdate, sysdate, 'N')
,(33, 33, 'WRITER 33', 'TITLE 33', 'CONTENT 33','N','U',sysdate, sysdate, 'N')
,(34, 34, 'WRITER 34', 'TITLE 34', 'CONTENT 34','N','U',sysdate, sysdate, 'N')
,(35, 35, 'WRITER 35', 'TITLE 35', 'CONTENT 35','N','U',sysdate, sysdate, 'N')
,(36, 36, 'WRITER 36', 'TITLE 36', 'CONTENT 36','N','U',sysdate, sysdate, 'N')
,(37, 37, 'WRITER 37', 'TITLE 37', 'CONTENT 37','N','U',sysdate, sysdate, 'N')
,(38, 38, 'WRITER 38', 'TITLE 38', 'CONTENT 38','N','U',sysdate, sysdate, 'N')
,(39, 39, 'WRITER 39', 'TITLE 39', 'CONTENT 39','N','U',sysdate, sysdate, 'N')
,(40, 40, 'WRITER 40', 'TITLE 40', 'CONTENT 40','N','U',sysdate, sysdate, 'N')
,(41, 41, 'WRITER 41', 'TITLE 41', 'CONTENT 41','N','U',sysdate, sysdate, 'N')
,(42, 42, 'WRITER 42', 'TITLE 42', 'CONTENT 42','N','U',sysdate, sysdate, 'N')
,(43, 43, 'WRITER 43', 'TITLE 43', 'CONTENT 43','N','U',sysdate, sysdate, 'N')
,(44, 44, 'WRITER 44', 'TITLE 44', 'CONTENT 44','N','U',sysdate, sysdate, 'N')
,(45, 45, 'WRITER 45', 'TITLE 45', 'CONTENT 45','N','U',sysdate, sysdate, 'N')
,(46, 46, 'WRITER 46', 'TITLE 46', 'CONTENT 46','N','U',sysdate, sysdate, 'N')
,(47, 47, 'WRITER 47', 'TITLE 47', 'CONTENT 47','N','U',sysdate, sysdate, 'N')
,(48, 48, 'WRITER 48', 'TITLE 48', 'CONTENT 48','N','U',sysdate, sysdate, 'N')
,(49, 49, 'WRITER 49', 'TITLE 49', 'CONTENT 49','N','U',sysdate, sysdate, 'N')
,(50, 50, 'WRITER 50', 'TITLE 50', 'CONTENT 50','N','U',sysdate, sysdate, 'N');

--사용자 계정 Sample Data
INSERT INTO tibero.TBL_USER (id,USER_ACCOUNT, USER_PW, USER_EM, USER_NM, ROLE, CREATE_DT, UPDATE_DT, DELYN) 
VALUES 
(TIBERO.tbl_user_seq.nextval,'admin', '1234', 'admin@naver.com', 'adminName', 'ADMIN', sysdate, sysdate, 'N'),
(TIBERO.tbl_user_seq.nextval,'test', '1234', 'test@naver.com', 'testName','USER', sysdate, sysdate, 'N');




