-- 사용자(관리자/교수/학생)
CREATE TABLE USR 
(
   ID VARCHAR(10) NOT NULL
 , PW VARCHAR2(7) NOT NULL 
 , NAME VARCHAR2(10) NOT NULL
 , U_STAT NUMBER DEFAULT 1 NOT NULL
 , U_AUTH NUMBER DEFAULT 2 NOT NULL
);

COMMENT ON TABLE USR IS '성적처리시스템_사용자';
COMMENT ON COLUMN USR.ID IS '사용자ID=학번';
COMMENT ON COLUMN USR.PW IS '사용자비밀번호=민번 뒷자리';
COMMENT ON COLUMN USR.NAME IS '사용자명';
COMMENT ON COLUMN USR.U_STAT IS '사용자상태 ex)1:사용중=재학중, 2:사용중지=중도탈락';
COMMENT ON COLUMN USR.U_AUTH IS '사용자권한 ex)0:관리자, 1:교수, 2:학생';


Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_A001','1234567','관리자',1,0);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_B001','1234567','김호진',1,1);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_B004','2234567','정임혜',1,1);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C001','1234567','조현우',0,2);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C002','1234567','김정규',1,2);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C003','2234567','나주영',1,2);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C004','2234567','정임혜',1,2);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C005','2234567','진윤비',1,2);
Insert into USR (ID,PW,NAME,U_STAT,U_AUTH) values ('SIST_C006','2234567','김성희',1,2);

COMMIT;