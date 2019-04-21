-----------------------------------------------------------------------------------------------------------------------------4팀
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

--○ 테이블 생성

-- 관리자 테이블 (TBL_ADMIN) 생성 
CREATE TABLE TBL_ADMIN
    ( ADMIN_CODE    VARCHAR2(10)                                                                    --관리자 코드(PK)
, ADMIN_SSN     VARCHAR2(7)       CONSTRAINT ADMIN_ADMIN_SSN_NN NOT NULL                          --관리자 비밀번호(주민번호뒷자리)
, ADMIN_NAME    VARCHAR2(5 CHAR)  CONSTRAINT ADMIN_ADMIN_NAME_NN NOT NULL                        --관리자 이름
, ADMIN_ID      VARCHAR2(10)      CONSTRAINT ADMIN_ADMIN_ID_NN NOT NULL                           --관리ID
                                , CONSTRAINT ADMIN_ADMIN_CODE_PK PRIMARY KEY(ADMIN_CODE)
                                , CONSTRAINT ADMIN_ADMIN_SSN_UK UNIQUE(ADMIN_SSN)
);

-- 강사 테이블 (TBL_TEACHERS) 생성
CREATE TABLE TBL_TEACHERS
( TEACHER_CODE     VARCHAR2(10)                                                                        -- 강사코드 컬럼
, TEACHER_NAME     VARCHAR2(5 CHAR)  CONSTRAINT TEACHERS_TEACHER_NAME_NN NOT NULL                   -- 강사이름 컬럼
, TEACHER_SSN      VARCHAR2(7)      CONSTRAINT TEACHERS_TEACHER_SSN_NN NOT NULL                     -- 강사주민번호뒷자리 컬럼
, TEACHER_ID       VARCHAR2(10)     CONSTRAINT TEACHERS_TEACHER_ID_NN NOT NULL                      -- 강사ID 컬럼   
,                                   CONSTRAINT TEACHERS_TEACHER_CODE_PK PRIMARY KEY(TEACHER_CODE)   -- 강사코드 기본키설정
,                                   CONSTRAINT TEACHERS_TEACHER_SSN_UK UNIQUE(TEACHER_SSN)           -- 강사주민번호 유니크키설정
);

-- 학생 테이블 (TBL_STUDENTS) 생성 
CREATE TABLE TBL_STUDENTS
( STUDENT_CODE    VARCHAR2(10)                                                                      -- 학생코드
, STUDENT_NAME    VARCHAR2(5 CHAR) CONSTRAINT STUDENTS_STUDENT_NAME_NN NOT NULL                  -- 학생이름     (NOT NULL)
, STUDENT_SSN     VARCHAR2(7)      CONSTRAINT STUDENTS_STUDENT_SSN_NN NOT NULL                    -- 학생주민번호 (NOT NULL)     
, STUDENT_ID      VARCHAR2(10)     CONSTRAINT STUDENTS_STUDENT_ID_NN NOT NULL                     -- 학생ID      (NOT NULL)
,                                 CONSTRAINT STUDENTS_STUDENT_CODE_PK PRIMARY KEY(STUDENT_CODE)   -- PK 제약조건 : 학생코드  
,                                 CONSTRAINT STUDENTS_STUDENT_SSN_UK UNIQUE (STUDENT_SSN)          -- UK 제약조건 : 학생ID   
);

-- 과정 테이블 (TBL_COURSE) 생성
CREATE TABLE TBL_COURSE 
( COU_NAME_CODE VARCHAR2(10)      CONSTRAINT COURSE_COU_NAME_CODE_PK PRIMARY KEY
, COURSE_NAME VARCHAR2(40 CHAR)   CONSTRAINT COURSE_COURSE_NAME_NN NOT NULL
);

-- 정적과목 테이블 (TBL_STATIC_SUBJECT) 생성
CREATE TABLE TBL_STATIC_SUBJECT 
( SUB_NAME_CODE   VARCHAR2(10)  -- 과목명코드 (P.K)
, SUB_NAME        VARCHAR2(40 CHAR)  CONSTRAINT SSUB_SUB_NAME_NN   NOT NULL                    -- 과목이름
,                                   CONSTRAINT SSUB_SUB_NAME_CODE_PK PRIMARY KEY(SUB_NAME_CODE) -- SSUB_SUB_NAME_CODE_PK P.K 생성 
);

-- 개설과목 테이블 (TBL_SUBJECT) 생성
CREATE TABLE TBL_SUBJECT
( SUB_CODE      VARCHAR2(10)    CONSTRAINT SUBJECT_SUB_CODE_PK PRIMARY KEY                      --개설과목코드 제약조건명 및 기본키설정
, SUB_NAME_CODE VARCHAR2(10)    CONSTRAINT SUBJECT_SUB_NAME_CODE_NN NOT NULL                    --개설과목명코드 제약조건명 및 기본키 설정
, SUB_START     DATE            CONSTRAINT SUBJECT_SUB_START_NN NOT NULL                        --과목시작 제약조건명 및 기본키 설정
, SUB_END       DATE            CONSTRAINT SUBJECT_SUB_END_NN NOT NULL                          --과목종료 제약조건명 및 기본키 설정
, OPEN_C_CODE   VARCHAR2(10)    CONSTRAINT SUBJECT_DAM_C_CODE_NN NOT NULL                       --개설과정코드 제약조건명 및 기본키 설정
, BOOK_CODE     VARCHAR2(10)    CONSTRAINT SUBJECT_BOOK_CODE_NN NOT NULL                        --교재코드 제약조건명 및 기본키 설정
);

-- 개설된과정테이블(TBL_OPENCOURSE) 생성
CREATE TABLE TBL_OPENCOURSE
( OPEN_C_CODE     VARCHAR2(10)                                                                        -- 개설과정코드컬럼
, COU_NAME_CODE   VARCHAR2(10)  CONSTRAINT OPENCOURSE_COU_NAME_CODE_NN NOT NULL                     -- 개설과정명코드 컬럼
, CLASS_CODE      VARCHAR2(10)  CONSTRAINT OPENCOURSE_CLASS_CODE_NN NOT NULL                        -- 강의실코드 컬럼
, COU_START       DATE          CONSTRAINT OPENCOURSE_COU_START_NN NOT NULL                         -- 과정시작컬럼
, COU_END         DATE          CONSTRAINT OPENCOURSE_COU_END_NN NOT NULL                           -- 과정종료컬럼
, TEACHER_CODE    VARCHAR2(10)  CONSTRAINT OPENCOURSE_TEACHER_CODE_NN NOT NULL                      -- 강사코드 컬럼
,                               CONSTRAINT OPENCOURSE_OPEN_C_CODE_PK PRIMARY KEY(OPEN_C_CODE)        -- 개설과정코드 기본키설정
);

-- 교재 테이블 (TBL_BOOK) 생성
CREATE TABLE TBL_BOOK 
( BOOK_CODE   VARCHAR2(10)      CONSTRAINT BOOK_BOOK_CODE_PK PRIMARY KEY                        -- 교재코드 제약조건명 및 기본키설정
, BOOK_NAME   VARCHAR2(30 CHAR) CONSTRAINT BOOK_BOOK_NAME_NN NOT NULL                           -- 교재이름 제약조건명 및 NOT NULL제약 설정
, BOOK_WRITER VARCHAR2(10 CHAR) CONSTRAINT BOOK_BOOK_WRITER_NN NOT NULL                         --저자  제약조건명 및 NOT NULL제약 설정
);

-- 강의실 테이블 (TBL_CLASS) 생성 
CREATE TABLE TBL_CLASS -- 강의실 테이블 생성
( CLASS_CODE  VARCHAR2(10) -- 강의실코드 (P.K)
, CLASS_NAME  VARCHAR2(5 CHAR)  CONSTRAINT CLASS_CLASS_NAME_NN NOT NULL                        -- 강의실이름
,                               CONSTRAINT CLASS_CLASS_CODE_PK PRIMARY KEY(CLASS_CODE)          -- CLASS_CLASS_CODE_PK P.K 생성
);

-- 수강신청 테이블 (TBL_SUGANG) 생성
CREATE TABLE TBL_SUGANG
( SUGANG_CODE      VARCHAR2(10) 		                -- 수강코드    (NOT NULL)
, OPEN_C_CODE      VARCHAR2(10)  CONSTRAINT SUGANG_OPEN_C_CODE_NN NOT NULL                      -- 개설과정코드 (NOT NULL)
, STUDENT_CODE     VARCHAR2(10)  CONSTRAINT SUGANG_STUDENT_CODE_NN NOT NULL                     -- 학생코드     (NOT NULL)
, GIVEUP_YN        NUMBER(1)
,                               CONSTRAINT SUGANG_SUGANG_CODE_PK PRIMARY KEY(SUGANG_CODE)       -- PK 제약조건 : 수강코드
);

-- 중도포기자 테이블 (TBL_GIVEUP) 생성
CREATE TABLE TBL_GIVEUP
( SUGANG_CODE  VARCHAR2(10)     CONSTRAINT GIVEUP_SUGANG_CODE_PK PRIMARY KEY 
, GIVEUP_START DATE             CONSTRAINT GIVEUP_GIVEUP_START_NN NOT NULL
);

-- 성적 테이블(TBL_SCORE) 생성
CREATE TABLE TBL_SCORE
( SCORE_CODE    VARCHAR2(10)                                                                              -- 성적코드 컬럼
, SCORE_WR      NUMBER(3)    CONSTRAINT SCORE_SCORE_WR_CH CHECK (SCORE_WR BETWEEN 0 AND 100)           -- 필기 컬럼
, SCORE_PR      NUMBER(3)    CONSTRAINT SCORE_SCORE_PR_CH CHECK (SCORE_PR BETWEEN 0 AND 100)           -- 실기 컬럼
, SCORE_AT      NUMBER(3)    CONSTRAINT SCORE_SCORE_AT_CH CHECK (SCORE_AT BETWEEN 0 AND 100)           -- 출결 컬럼   
, SUB_CODE      VARCHAR2(10)  CONSTRAINT SCORE_SUB_CODE_NN NOT NULL                                    -- 개설과목코드 컬럼
, SUGANG_CODE   VARCHAR2(10)  CONSTRAINT SCORE_SUGANG_CODE_NN NOT NULL  
,                            CONSTRAINT SCORE_SCORE_CODE_PK PRIMARY KEY(SCORE_CODE)                     -- 성적코드 기본키설정
);

-- 배점 테이블 (TBL_BAEJUM) 생성
CREATE TABLE TBL_BAEJUM
( BAEJUM_CODE    VARCHAR2(10)     -- 배점코드(P.K)
, BAEJUM_WR      NUMBER DEFAULT 0  CONSTRAINT BAEJUM_BAEJUM_WR_NN NOT NULL                     -- 필기배점 디폴트 0
, BAEJUM_PR      NUMBER DEFAULT 0  CONSTRAINT BAEJUM_BAEJUM_PR_NN NOT NULL                     -- 실기배점 디폴트 0
, BAEJUM_AT      NUMBER DEFAULT 0  CONSTRAINT BAEJUM_BAEJUM_AT_NN NOT NULL                     -- 실기배점 디폴트 0
, SUB_CODE       VARCHAR2(10)      CONSTRAINT BAEJUM_SUB_CODE_NN   NOT NULL                     -- 개설과목코드(F.K)
,                                  CONSTRAINT BAEJUM_BAEJUM_CODE_PK PRIMARY KEY(BAEJUM_CODE)
);

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

--○ FK 제약조건 추가
ALTER TABLE TBL_SUBJECT
ADD CONSTRAINT SUBJECT_SUB_NAME_CODE_FK FOREIGN KEY(SUB_NAME_CODE) REFERENCES TBL_STATIC_SUBJECT(SUB_NAME_CODE);
-- 개설된 과정테이블에 SUB_NAME_CODE 에 제약조건 추가
ALTER TABLE TBL_SUBJECT
ADD CONSTRAINT SUBJECT_OPEN_C_CODE_FK FOREIGN KEY (OPEN_C_CODE) REFERENCES TBL_OPENCOURSE(OPEN_C_CODE);
-- 개설된 과정테이블에 OPEN_C_CODE 에 제약조건 추가
ALTER TABLE TBL_SUBJECT
ADD CONSTRAINT SUBJECT_BOOK_CODE_FK FOREIGN KEY (BOOK_CODE) REFERENCES TBL_BOOK(BOOK_CODE);
-- 개설된 과정테이블에 BOOK_CODE 에 제약조건 추가


ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_COU_NAME_CODE_FK FOREIGN KEY(COU_NAME_CODE) REFERENCES TBL_COURSE(COU_NAME_CODE);
-- 개설된 과정테이블에 COU_NAME_CODE 에 제약조건 추가
ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_CLASS_CODE_FK FOREIGN KEY(CLASS_CODE) REFERENCES TBL_CLASS(CLASS_CODE);
-- 개설된 과정테이블에 CLASS_CODE 에 제약조건 추가
ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_TEACHER_CODE_FK FOREIGN KEY(TEACHER_CODE) REFERENCES TBL_TEACHERS(TEACHER_CODE);
-- 개설된 과정테이블에 TEACHER_CODE 에 제약조건 추가


ALTER TABLE TBL_SUGANG
ADD CONSTRAINT SUGANG_OPNE_C_CODE_FK FOREIGN KEY(OPEN_C_CODE) REFERENCES TBL_OPENCOURSE(OPEN_C_CODE);
-- 수강테이블에 OPEN_C_CODE 에 제약조건 추가
ALTER TABLE TBL_SUGANG
ADD CONSTRAINT SUGANG_STUDENT_CODE_FK FOREIGN KEY(STUDENT_CODE) REFERENCES TBL_STUDENTS(STUDENT_CODE);
-- 수강테이블에 STUDENT_CODE 에 제약조건 추가


ALTER TABLE TBL_GIVEUP
ADD CONSTRAINT GIVEUP_SUGANG_CODE_FK FOREIGN KEY(SUGANG_CODE) REFERENCES TBL_SUGANG(SUGANG_CODE);
-- 중도포기테이블에 SUGANG_CODE 에 F.K 제약조건 추가


ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SUGANG_CODE_FK FOREIGN KEY(SUGANG_CODE) REFERENCES TBL_SUGANG(SUGANG_CODE);
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SUB_CODE_FK FOREIGN KEY(SUB_CODE) REFERENCES TBL_SUBJECT(SUB_CODE);
-- 점수테이블에 SUBJECT_CODE 에 F.K 제약조건 추가


ALTER TABLE TBL_BAEJUM
ADD CONSTRAINT BAEJUM_SUB_CODE_FK FOREIGN KEY(SUB_CODE) REFERENCES TBL_SUBJECT(SUB_CODE);  
-- 배점테이블에 SUB_CODE에 F.K 제약조건 추가



--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--○ 제약조건 확인 뷰 생성
CREATE OR REPLACE VIEW VIEW_CONSTCHECK  
AS
SELECT UC.OWNER OWNER
       ,UC.CONSTRAINT_NAME CONSTRAINT_NAME
       ,UC.TABLE_NAME TABLE_NAMEF
       ,UC.CONSTRAINT_TYPE CONSTRAINT_TYPE
       ,UCC.COLUMN_NAME COLUMN_NAME
       ,UC.SEARCH_CONDITION SERACH_CONDITION
       ,UC.DELETE_RULE DELETE_RULE
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;



--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--○ 테이블 및 컬럼레벨 코멘트 추가
-- TBL_ADMIN 관리자 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_ADMIN IS '관리자테이블';
COMMENT ON COLUMN TBL_ADMIN.ADMIN_CODE IS '관리자코드';
COMMENT ON COLUMN TBL_ADMIN.ADMIN_SSN IS '관리자주민번호뒷자리(UK)';
COMMENT ON COLUMN TBL_ADMIN.ADMIN_NAME IS '관리자이름';
COMMENT ON COLUMN TBL_ADMIN.ADMIN_ID IS '관리자ID';

-- TBL_TEACHERS 강사 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_TEACHERS IS '강사테이블';
COMMENT ON COLUMN TBL_TEACHERS.TEACHER_CODE IS '강사코드';
COMMENT ON COLUMN TBL_TEACHERS.TEACHER_NAME IS '강사명';
COMMENT ON COLUMN TBL_TEACHERS.TEACHER_SSN IS '강사주민번호뒷자리(UK)';
COMMENT ON COLUMN TBL_TEACHERS.TEACHER_ID IS '강사ID';

-- TBL_STUDENTS 학생 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_STUDENTS IS '학생테이블';
COMMENT ON COLUMN TBL_STUDENTS.STUDENT_CODE IS '학생코드(PK)';
COMMENT ON COLUMN TBL_STUDENTS.STUDENT_NAME IS '학생이름';
COMMENT ON COLUMN TBL_STUDENTS.STUDENT_SSN IS '학생주민번호뒷자리(UK)';
COMMENT ON COLUMN TBL_STUDENTS.STUDENT_ID IS '학생ID';


-- TBL_STATIC_SUBJECT 정적과목 테이블에 코멘트 추가
COMMENT ON TABLE TBL_STATIC_SUBJECT IS '정적인과목테이블';          
COMMENT ON COLUMN TBL_STATIC_SUBJECT.SUB_NAME_CODE IS '과목명코드(PK)'; 
COMMENT ON COLUMN TBL_STATIC_SUBJECT.SUB_NAME IS '과목이름';

-- TBL_OPENCOURSE 과정 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_OPENCOURSE IS '개설된과정테이블';
COMMENT ON COLUMN TBL_OPENCOURSE.OPEN_C_CODE IS '개설과정코드(PK)';
COMMENT ON COLUMN TBL_OPENCOURSE.COU_NAME_CODE IS '개설과정명코드(범례)';
COMMENT ON COLUMN TBL_OPENCOURSE.CLASS_CODE IS '강의실코드';
COMMENT ON COLUMN TBL_OPENCOURSE.COU_START IS '과정기간(시작연월일)';
COMMENT ON COLUMN TBL_OPENCOURSE.COU_END IS '과정기간(종료연월일)';
COMMENT ON COLUMN TBL_OPENCOURSE.TEACHER_CODE IS '강사코드';

--TBL_COURSE 과정 테이블에 코멘트 추가
COMMENT ON TABLE TBL_COURSE IS '정적과정테이블';
COMMENT ON COLUMN TBL_COURSE.COU_NAME_CODE IS '과정명코드(PK)';
COMMENT ON COLUMN TBL_COURSE.COURSE_NAME IS '과정명';

-- TBL_SUBJECT 과목 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_SUBJECT IS '개설된과목테이블';  
COMMENT ON COLUMN TBL_SUBJECT.SUB_CODE IS '개설과목코드(PK)';
COMMENT ON COLUMN TBL_SUBJECT.SUB_NAME_CODE IS '개설과목명코드(범례)';
COMMENT ON COLUMN TBL_SUBJECT.SUB_START IS '과목시작';
COMMENT ON COLUMN TBL_SUBJECT.SUB_END IS '과목종료';
COMMENT ON COLUMN TBL_SUBJECT.OPEN_C_CODE IS '개설과정코드';
COMMENT ON COLUMN TBL_SUBJECT.BOOK_CODE IS '교재코드';

-- TBL_BOOK 교재 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_BOOK IS '교재테이블'; 
COMMENT ON COLUMN TBL_BOOK.BOOK_CODE IS '교재코드(PK)';
COMMENT ON COLUMN TBL_BOOK.BOOK_NAME IS '교재명';
COMMENT ON COLUMN TBL_BOOK.BOOK_WRITER IS '저자';

-- TBL_CLASS 강의실 테이블에 코멘트 추가
COMMENT ON TABLE TBL_CLASS IS '강의실테이블';              
COMMENT ON COLUMN TBL_CLASS.CLASS_CODE IS '강의실코드(PK)';  
COMMENT ON COLUMN TBL_CLASS.CLASS_NAME IS '강의실명';     

-- TBL_SUGANG 수강과정 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_SUGANG IS '수강과정테이블';
COMMENT ON COLUMN TBL_SUGANG.SUGANG_CODE IS '수강코드(PK)';
COMMENT ON COLUMN TBL_SUGANG.OPEN_C_CODE IS '개설과정코드';
COMMENT ON COLUMN TBL_SUGANG.STUDENT_CODE IS '학생코드';
COMMENT ON COLUMN TBL_SUGANG.GIVEUP_YN IS '중도탈락여부';

-- TBL_GIVEUP 수강포기 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_GIVEUP IS '중도탈락자모임테이블';
COMMENT ON COLUMN TBL_GIVEUP.GIVEUP_START IS '중도탈락시기';
COMMENT ON COLUMN TBL_GIVEUP.SUGANG_CODE IS '수강코드(PK)';

-- TBL_SCORE 성적 테이블에 코멘트 추가 
COMMENT ON TABLE TBL_SCORE IS '성적테이블';
COMMENT ON COLUMN TBL_SCORE.SCORE_CODE IS '성적코드(PK)';
COMMENT ON COLUMN TBL_SCORE.SCORE_WR IS '필기원점수';
COMMENT ON COLUMN TBL_SCORE.SCORE_PR IS '실기원점수';
COMMENT ON COLUMN TBL_SCORE.SCORE_AT IS '출결원점수';
COMMENT ON COLUMN TBL_SCORE.SUB_CODE IS '개설과목코드';
COMMENT ON COLUMN TBL_SCORE.SUGANG_CODE IS '수강코드';

-- TBL_BAEJUM 배점 테이블에 코멘트 추가
COMMENT ON TABLE TBL_BAEJUM IS '배점테이블';             
COMMENT ON COLUMN TBL_BAEJUM.BAEJUM_CODE IS '배점코드(PK)'; 
COMMENT ON COLUMN TBL_BAEJUM.BAEJUM_WR IS '필기배점';          
COMMENT ON COLUMN TBL_BAEJUM.BAEJUM_PR IS '실기배점';      
COMMENT ON COLUMN TBL_BAEJUM.BAEJUM_AT IS '출결배점';         
COMMENT ON COLUMN TBL_BAEJUM.SUB_CODE IS '개설과목코드';

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- 시퀀스 생성

-- 관리자코드 시퀀스 생성 
CREATE SEQUENCE SEQ_A_CODE 
START WITH 1000            -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

-- 강사코드 시퀀스 생성
CREATE SEQUENCE SEQ_T_CODE  
START WITH 1000            -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

-- 학생코드 시퀀스 생성 
CREATE SEQUENCE SEQ_S_CODE
START WITH 1000            -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--수강코드 시퀀스 생성
CREATE SEQUENCE SEQ_SI_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--과정명코드 시퀀스 생성
CREATE SEQUENCE SEQ_CO_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--과목명코드 시퀀스 생성
CREATE SEQUENCE SEQ_SU_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--성적코드 시퀀스 생성
CREATE SEQUENCE SEQ_SC_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                  -- 최대값 제한 없음
NOCACHE;

--개설과정코드 시퀀스 생성
CREATE SEQUENCE SEQ_OP_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--개설과목코드 시퀀스 생성
CREATE SEQUENCE SEQ_OS_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--강의실코드 시퀀스 생성
CREATE SEQUENCE SEQ_CL_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--교재코드 시퀀스 생성
CREATE SEQUENCE SEQ_BO_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--배점코드 시퀀스 생성
CREATE SEQUENCE SEQ_BJ_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--관리자ID 시퀀스 생성
CREATE SEQUENCE SEQ_ADM_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--강사ID 시퀀스 생성
CREATE SEQUENCE SEQ_TEA_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;

--학생ID 시퀀스 생성
CREATE SEQUENCE SEQ_STU_CODE  
START WITH 1000             -- 시작값
NOMAXVALUE                 -- 최대값 제한 없음
NOCACHE;


--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
--데이터 삽입

----------------------------------------------------------------------------------------------------------① 
--○ ①TBL_ADMIN 데이터 삽입 →  관리자 2명
INSERT INTO TBL_ADMIN(ADMIN_CODE,ADMIN_SSN,ADMIN_NAME,ADMIN_ID) VALUES ('A'||SEQ_A_CODE.NEXTVAL,'2234567','나주영','ADM'||SEQ_ADM_CODE.NEXTVAL); 
INSERT INTO TBL_ADMIN(ADMIN_CODE,ADMIN_SSN,ADMIN_NAME,ADMIN_ID) VALUES ('A'||SEQ_A_CODE.NEXTVAL,'2245678','정유진','ADM'||SEQ_ADM_CODE.NEXTVAL); 

--○ ①TBL_TEACHERS 예시 데이터 삽입 →  강사 5명
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES ('T'||SEQ_T_CODE.NEXTVAL,'김호진','1234567','TEA'||SEQ_TEA_CODE.NEXTVAL);
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES ('T'||SEQ_T_CODE.NEXTVAL,'김찬희','1234568','TEA'||SEQ_TEA_CODE.NEXTVAL);
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES ('T'||SEQ_T_CODE.NEXTVAL,'전훈의','1234561','TEA'||SEQ_TEA_CODE.NEXTVAL);
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES ('T'||SEQ_T_CODE.NEXTVAL,'한승원','1234562','TEA'||SEQ_TEA_CODE.NEXTVAL);
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES ('T'||SEQ_T_CODE.NEXTVAL,'윤희진','2234561','TEA'||SEQ_TEA_CODE.NEXTVAL);
-- 미정 

--○ ①TBL_STUDENTS 예시 데이터 삽입 →  학생 15명 
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'김정규','1234569','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'조현우','1234570','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'진윤비','2234569','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'김성희','2234570','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'정임혜','2234571','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'임나래','2234511','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'김경환','1234517','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'최보라','2234521','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'유진석','1234527','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'김선아','2234531','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'이기승','1234537','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'곽한얼','1234547','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'이승희','2234541','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'권홍비','2234551','STU'||SEQ_STU_CODE.NEXTVAL);
INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID) VALUES ('S'||SEQ_S_CODE.NEXTVAL,'최은상','1234557','STU'||SEQ_STU_CODE.NEXTVAL);

--○ ①TBL_BOOK 예시 데이터 삽입 →  교재 6권
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'편하게 읽는 자바 프로그래밍','박용우');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'쉽게 배우는 오라클 SQL과 PL/SQL','서진수');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'코드로 배우는 스프링 웹프로젝트','구멍가게 코딩단');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'Do it! 점프 투 파이썬 ','박응용');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'생활코딩! 자바 프로그래밍 입문','이고잉');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'JSP 2.3 웹프로그래밍','최범균');
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||SEQ_BO_CODE.NEXTVAL,'풀스택 개발자를 위한 MEAN 스택 입문','애덤 브레츠');
-- 미정

--○ ①TBL_COURSE 예시 데이터 삽입 →  정적과정 4개
INSERT INTO TBL_COURSE(COU_NAME_CODE,COURSE_NAME) VALUES ('CO'||SEQ_CO_CODE.NEXTVAL,'JAVA를 활용한 웹 응용SW개발자 양성과정');
INSERT INTO TBL_COURSE(COU_NAME_CODE,COURSE_NAME) VALUES ('CO'||SEQ_CO_CODE.NEXTVAL,'파이썬과 자바를 연계한 머신러닝 활용개발자 과정');
INSERT INTO TBL_COURSE(COU_NAME_CODE,COURSE_NAME) VALUES ('CO'||SEQ_CO_CODE.NEXTVAL,'Framework기반의 빅데이터활용 응용프로그래머과정');
INSERT INTO TBL_COURSE(COU_NAME_CODE,COURSE_NAME) VALUES ('CO'||SEQ_CO_CODE.NEXTVAL,'JAVA기반의 스마트 웹 앱콘텐츠 양성과정');


--○ ①TBL_STATIC_SUBJECT 예시 데이터 삽입 → 정적과목 7개 
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'JAVA');   
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'ORACLE');
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'SPRING');
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'PYTHON');
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'JSP');
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'SERVELET');
INSERT INTO TBL_STATIC_SUBJECT(SUB_NAME_CODE,SUB_NAME) VALUES ('SU'||SEQ_SU_CODE.NEXTVAL,'FRONT-END');



--○ ①TBL_CLASS 예시 데이터 삽입 →  강의실 5곳
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES ('CL'||SEQ_CL_CODE.NEXTVAL,'A강의실');
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES ('CL'||SEQ_CL_CODE.NEXTVAL,'B강의실');
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES ('CL'||SEQ_CL_CODE.NEXTVAL,'C강의실');
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES ('CL'||SEQ_CL_CODE.NEXTVAL,'D강의실');
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES ('CL'||SEQ_CL_CODE.NEXTVAL,'E강의실');
-- 미정추가

----------------------------------------------------------------------------------------------------------②	
--○ ②TBL_OPENCOURSE 예시 데이터 삽입 
--      → INSERT 가 코드대로 되었다면 개설된 과정 2개이며, 
-- 시퀀스로 부여받은 과정코드는  CO1000과 CO1001 이다. 
-- CO1000 - JAVA를 활용한 웹 응용SW개발자 양성과정
-- CO1001 - 파이썬과 자바를 연계한 머신러닝 활용개발자 과정

INSERT INTO TBL_OPENCOURSE(OPEN_C_CODE,COU_NAME_CODE,CLASS_CODE,COU_START,COU_END,TEACHER_CODE) 
VALUES ('OP'||SEQ_OP_CODE.NEXTVAL,'CO1001','CL1001',TO_DATE('2019-02-11','YYYY-MM-DD'),TO_DATE('2019-07-19','YYYY-MM-DD'),'T1001');
INSERT INTO TBL_OPENCOURSE(OPEN_C_CODE,COU_NAME_CODE,CLASS_CODE,COU_START,COU_END,TEACHER_CODE) 
VALUES ('OP'||SEQ_OP_CODE.NEXTVAL,'CO1002','CL1002',TO_DATE('2019-03-15','YYYY-MM-DD'),TO_DATE('2019-08-15','YYYY-MM-DD'),'T1002');

----------------------------------------------------------------------------------------------------------③	

--○ ③TBL_SUBJECT 예시 데이터 삽입 
--       →  개설된 과정 2개이며, 각각  그 과정에 배정된 과목은 각각 3과목이다. 
--	   JAVA를 활용한 웹 응용SW개발자 양성과정 (JAVA, ORACLE, SPRING)
-- (1) JAVA
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1001',TO_DATE('2019-02-11','YYYY-MM-DD'),TO_DATE('2019-03-14','YYYY-MM-DD'),'OP1001','BO1001');
-- (2) ORACLE
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1002',TO_DATE('2019-03-15','YYYY-MM-DD'),TO_DATE('2019-05-14','YYYY-MM-DD'),'OP1001','BO1002');
-- (3) SPRING
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1003',TO_DATE('2019-05-15','YYYY-MM-DD'),TO_DATE('2019-07-19','YYYY-MM-DD'),'OP1001','BO1003');


--	파이썬과 자바를 연계한 머신러닝 활용개발자 과정(ORACLE, SPRING,PYTHON)
-- (1) ORACLE
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1004',TO_DATE('2019-03-15','YYYY-MM-DD'),TO_DATE('2019-05-14','YYYY-MM-DD'),'OP1002','BO1004');
-- (2) SPRING
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1005',TO_DATE('2019-05-15','YYYY-MM-DD'),TO_DATE('2019-07-19','YYYY-MM-DD'),'OP1002','BO1005');
-- (3) PYTHON
INSERT INTO TBL_SUBJECT(SUB_CODE,SUB_NAME_CODE,SUB_START,SUB_END,OPEN_C_CODE,BOOK_CODE) 
VALUES('OS'||SEQ_OS_CODE.NEXTVAL,'SU1006',TO_DATE('2019-07-20','YYYY-MM-DD'),TO_DATE('2019-08-15','YYYY-MM-DD'),'OP1002','BO1006');

COMMIT;


----------------------------------------------------------------------------------------------------------④

--○ ④TBL_SUGANG 예시 데이터 삽입 
--        → 각 과정별 수강생은 5명씩, 총 10명이다. 
--  중도포기자는 2명이며, 학생코드 'S1010'와  'S1011' 이다. 
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1001');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1002');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1003');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1004');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1005');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1006');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1007');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1008');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1009');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1010');
--중도포기자
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1001','S1011');
INSERT INTO TBL_SUGANG(SUGANG_CODE,OPEN_C_CODE,STUDENT_CODE) VALUES('SI'||SEQ_SI_CODE.NEXTVAL,'OP1002','S1012');

----------------------------------------------------------------------------------------------------------⑤

--○ ⑤TBL_GIVEUP 예시 데이터 삽입 
-- 	→ 중도포기자는 2명이며, 수강코드는 ‘SI1010’ 와 ‘SI1011’ 이다.  
INSERT INTO TBL_GIVEUP(GIVEUP_START,SUGANG_CODE) VALUES (TO_DATE('2019-03-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SI1011');
INSERT INTO TBL_GIVEUP(GIVEUP_START,SUGANG_CODE) VALUES (TO_DATE('2019-05-16 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SI1012');

--○ ⑤TBL_BAEJUM 예시 데이터 삽입 
--    → 개설된 과목은 6개 이므로, 배점 데이터는 6개이다. 
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.2,0.3,0.5,'OS1001');
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.2,0.3,0.5,'OS1002');
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.1,0.4,0.5,'OS1003');
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.2,0.3,0.4,'OS1004');
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.1,0.4,0.5,'OS1005');
INSERT INTO TBL_BAEJUM(BAEJUM_CODE,BAEJUM_WR,BAEJUM_PR,BAEJUM_AT,SUB_CODE) VALUES ('BO'||SEQ_BJ_CODE.NEXTVAL,0.2,0.3,0.5,'OS1006');

--○ ⑤TBL_SCORE 예시 데이터 삽입 
--     → 9명의 성적 입력 
--      ▶ 프로시저로 학생성적 입력할 경우 수강코드 'SI1007'로 테스트 할 것 

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,80, 70,'OS1001','SI1001');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,90,100,'OS1002','SI1001');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,95,100,'OS1003','SI1001');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 90,95,100,'OS1001','SI1002');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,90, 90,'OS1002','SI1002');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 95,95,100,'OS1003','SI1002');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100, 90,'OS1001','SI1003');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 90, 95,100,'OS1002','SI1003');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1003','SI1003');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 80,100,100,'OS1001','SI1004');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1002','SI1004');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 95, 90, 80,'OS1003','SI1004');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100, 90, 95,'OS1001','SI1005');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1002','SI1005');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100, 95, 95,'OS1003','SI1005');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100, 95,100,'OS1004','SI1006');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 95,100, 80,'OS1005','SI1006');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1006','SI1006');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1004','SI1008');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 90, 80,100,'OS1005','SI1008');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100,100,'OS1006','SI1008');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 85, 95,100,'OS1004','SI1009');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100, 80,'OS1005','SI1009');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL, 95,100,100,'OS1006','SI1009');

INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100, 70,100,'OS1004','SI1010');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100, 60,100,'OS1005','SI1010');
INSERT INTO TBL_SCORE(SCORE_CODE,SCORE_WR,SCORE_PR,SCORE_AT,SUB_CODE,SUGANG_CODE) VALUES ('SC'||SEQ_SC_CODE.NEXTVAL,100,100, 70,'OS1006','SI1010');


-- 미정데이터 삽입
--○ TBL_BOOK에 미정 데이터 입력
INSERT INTO TBL_BOOK(BOOK_CODE,BOOK_NAME,BOOK_WRITER) VALUES ('BO'||'0000','미정','미정');
-- TBL_TEACHERS에 미정 데이터 입력
INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID) VALUES('T'||'0000','미정','미정','TEA'||'0000');
-- TBL_CLASS에 미정 데이터 입력
INSERT INTO TBL_CLASS(CLASS_CODE,CLASS_NAME) VALUES('CL'||'0000','미정');


-- 수강포기자 데이터 수정
UPDATE TBL_SUGANG
SET GIVEUP_YN = 1
WHERE 1=1
AND SUGANG_CODE IN (
SELECT SUGANG_CODE
FROM TBL_GIVEUP
)
;

COMMIT;



--(1)
SELECT *
FROM TBL_ADMIN;

SELECT *
FROM TBL_TEACHERS;

SELECT *
FROM TBL_STUDENTS;

SELECT *
FROM TBL_BOOK;

SELECT *
FROM TBL_COURSE; 

SELECT *
FROM TBL_CLASS;

SELECT *
FROM TBL_STATIC_SUBJECT;

--(2)
SELECT *
FROM TBL_OPENCOURSE;

--(3)
SELECT *
FROM TBL_SUBJECT;

--(4)
SELECT *
FROM TBL_SUGANG;

--(5)
SELECT *
FROM TBL_SCORE;

SELECT *
FROM TBL_GIVEUP;  

SELECT *
FROM TBL_BAEJUM;