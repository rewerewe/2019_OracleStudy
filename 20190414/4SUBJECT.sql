-- 과목
CREATE TABLE SUBJECT
(
   ID NUMBER NOT NULL
 , COURSE_ID NUMBER NOT NULL
 , TEACHER_ID VARCHAR(10) NOT NULL
 , NAME VARCHAR(10)
 , STT_DATE VARCHAR(8) DEFAULT '20190101' NOT NULL
 , END_DATE VARCHAR(8) DEFAULT '99991231' NOT NULL
 , BOOK_NAME VARCHAR(30)
 , ROOM_NAME VARCHAR(30)
 , STUDENT_SCORE_ATTD NUMBER(2) DEFAULT 20
 , STUDENT_SCORE_NOTE NUMBER(2) DEFAULT 40
 , STUDENT_SCORE_SKILL NUMBER(2) DEFAULT 40
)
;

COMMENT ON TABLE SUBJECT IS '과목';
COMMENT ON COLUMN SUBJECT.ID IS '과목ID';
COMMENT ON COLUMN SUBJECT.COURSE_ID IS '과정ID, 부모키:COURSE.ID';
COMMENT ON COLUMN SUBJECT.TEACHER_ID IS '교수ID, 부모키:USR.ID';
COMMENT ON COLUMN SUBJECT.NAME IS '과목명';
COMMENT ON COLUMN SUBJECT.STT_DATE IS '과목기간 시작';
COMMENT ON COLUMN SUBJECT.END_DATE IS '과목기간 종료';
COMMENT ON COLUMN SUBJECT.BOOK_NAME IS '교재명';
COMMENT ON COLUMN SUBJECT.ROOM_NAME IS '강의실명';
COMMENT ON COLUMN SUBJECT.STUDENT_SCORE_ATTD IS '학생 점수 출결';
COMMENT ON COLUMN SUBJECT.STUDENT_SCORE_NOTE IS '학생 점수 필기';
COMMENT ON COLUMN SUBJECT.STUDENT_SCORE_SKILL IS '학생 점수 실기';


Insert into SUBJECT (ID,COURSE_ID,TEACHER_ID,NAME,STT_DATE,END_DATE,BOOK_NAME,ROOM_NAME) values (1,1,'SIST_B001','JAVA','20190211','20190315','편하게 읽는 자바 프로그래밍', 'F강의실');
Insert into SUBJECT (ID,COURSE_ID,TEACHER_ID,NAME,STT_DATE,END_DATE,BOOK_NAME,ROOM_NAME) values (2,1,'SIST_B002','ORACLE','20190316','20190413','쉽게 배우는 오라클 SQL', 'F강의실');

COMMIT;