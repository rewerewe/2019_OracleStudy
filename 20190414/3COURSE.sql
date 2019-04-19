-- 과정
CREATE TABLE COURSE
(
   ID NUMBER NOT NULL
 , NAME VARCHAR(100)
 , STT_DATE VARCHAR(8) DEFAULT '20180101' NOT NULL
 , END_DATE VARCHAR(8) DEFAULT '99991231' NOT NULL
)
;

COMMENT ON TABLE COURSE IS '과정';

COMMENT ON COLUMN COURSE.ID IS '과정ID';
COMMENT ON COLUMN COURSE.NAME IS '과정명';
COMMENT ON COLUMN COURSE.STT_DATE IS '과정기간 시작';
COMMENT ON COLUMN COURSE.END_DATE IS '과정기간 종료';


Insert into COURSE (ID,NAME,STT_DATE,END_DATE) values (1,'JAVA를 활용한 웹 응용 SW 개발자 양성 과정','20190211','20190718');

COMMIT;