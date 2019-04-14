-- 성적
CREATE TABLE SCORE
(
   STUDENT_ID VARCHAR(10) NOT NULL
 , SUBJECT_ID NUMBER NOT NULL
 , STUDENT_SCORE_TOTAL NUMBER(3)
 , STUDENT_RANK NUMBER(2)
 , STUDENT_GIVEUP_YN NUMBER DEFAULT 1 NOT NULL
)
;

COMMENT ON TABLE SCORE IS '성적';
COMMENT ON COLUMN SCORE.STUDENT_ID IS '학생ID, 부모키:USR.ID';
COMMENT ON COLUMN SCORE.SUBJECT_ID IS '과목ID, 부모키:SUBJECT.ID';
COMMENT ON COLUMN SCORE.STUDENT_SCORE_TOTAL IS '학생총점';
COMMENT ON COLUMN SCORE.STUDENT_RANK IS '학생등수';
COMMENT ON COLUMN SCORE.STUDENT_GIVEUP_YN IS '학생중도탈락여부 ex)1:재학, 2:탈락, 부모키:USR.U_AUTH';


Insert into SCORE (STUDENT_ID,SUBJECT_ID,STUDENT_SCORE_TOTAL,STUDENT_RANK,STUDENT_GIVEUP_YN) values ('SIST_C001',1,90,2,2);
Insert into SCORE (STUDENT_ID,SUBJECT_ID,STUDENT_SCORE_TOTAL,STUDENT_RANK,STUDENT_GIVEUP_YN) values ('SIST_C002',1,80,3,1);
Insert into SCORE (STUDENT_ID,SUBJECT_ID,STUDENT_SCORE_TOTAL,STUDENT_RANK,STUDENT_GIVEUP_YN) values ('SIST_C002',2,90,2,1);
Insert into SCORE (STUDENT_ID,SUBJECT_ID,STUDENT_SCORE_TOTAL,STUDENT_RANK,STUDENT_GIVEUP_YN) values ('SIST_C004',1,100,1,1);
Insert into SCORE (STUDENT_ID,SUBJECT_ID,STUDENT_SCORE_TOTAL,STUDENT_RANK,STUDENT_GIVEUP_YN) values ('SIST_C004',2,100,1,1);

COMMIT;