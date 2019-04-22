SET SERVEROUTPUT ON;

-- 전체 테이블 및 컬럼 조회 구문
SELECT *
FROM USER_TAB_COLUMNS;
/*
TABLE_NAME                     COLUMN_NAME                    DATA_TYPE                                                                                                  DAT DATA_TYPE_OWNER                DATA_LENGTH DATA_PRECISION DATA_SCALE N  COLUMN_ID DEFAULT_LENGTH DATA_DEFAULT                                                                     NUM_DISTINCT LOW_VALUE                                                        HIGH_VALUE                                                          DENSITY  NUM_NULLS NUM_BUCKETS LAST_ANALYZED               SAMPLE_SIZE CHARACTER_SET_NAME                           CHAR_COL_DECL_LENGTH GLO USE AVG_COL_LEN CHAR_LENGTH C V80 DAT HISTOGRAM      
------------------------------ ------------------------------ ---------------------------------------------------------------------------------------------------------- --- ------------------------------ ----------- -------------- ---------- - ---------- -------------- -------------------------------------------------------------------------------- ------------ ---------------------------------------------------------------- ---------------------------------------------------------------- ---------- ---------- ----------- --------------------------- ----------- -------------------------------------------- -------------------- --- --- ----------- ----------- - --- --- ---------------
TBL_ADMIN                      ADMIN_ID                       VARCHAR2                                                                                                                                               10                           N          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_ADMIN                      ADMIN_NAME                     VARCHAR2                                                                                                                                               20                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
TBL_ADMIN                      ADMIN_SSN                      VARCHAR2                                                                                                                                                7                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         7 NO  NO                        7 B NO  YES NONE           
TBL_ADMIN                      ADMIN_CODE                     VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_BAEJUM                     SUB_CODE                       VARCHAR2                                                                                                                                               10                           N          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_BAEJUM                     BAEJUM_AT                      NUMBER                                                                                                                                                 22                           N          4              3 0                                                                                                                                                                                                                                                                                                                                                                           NO  NO                        0   NO  YES NONE           
TBL_BAEJUM                     BAEJUM_PR                      NUMBER                                                                                                                                                 22                           N          3              3 0                                                                                                                                                                                                                                                                                                                                                                           NO  NO                        0   NO  YES NONE           
TBL_BAEJUM                     BAEJUM_WR                      NUMBER                                                                                                                                                 22                           N          2              3 0                                                                                                                                                                                                                                                                                                                                                                           NO  NO                        0   NO  YES NONE           
TBL_BAEJUM                     BAEJUM_CODE                    VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_BOOK                       BOOK_WRITER                    VARCHAR2                                                                                                                                               40                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        40 NO  NO                       10 C NO  YES NONE           
TBL_BOOK                       BOOK_NAME                      VARCHAR2                                                                                                                                              120                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                       30 C NO  YES NONE           
TBL_BOOK                       BOOK_CODE                      VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_CLASS                      CLASS_NAME                     VARCHAR2                                                                                                                                               20                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
TBL_CLASS                      CLASS_CODE                     VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_COURSE                     COURSE_NAME                    VARCHAR2                                                                                                                                              160                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
TBL_COURSE                     COU_NAME_CODE                  VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_GIVEUP                     GIVEUP_START                   DATE                                                                                                                                                    7                           N          2                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_GIVEUP                     SUGANG_CODE                    VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_OPENCOURSE                 TEACHER_CODE                   VARCHAR2                                                                                                                                               10                           N          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_OPENCOURSE                 COU_END                        DATE                                                                                                                                                    7                           N          5                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_OPENCOURSE                 COU_START                      DATE                                                                                                                                                    7                           N          4                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_OPENCOURSE                 CLASS_CODE                     VARCHAR2                                                                                                                                               10                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_OPENCOURSE                 COU_NAME_CODE                  VARCHAR2                                                                                                                                               10                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_OPENCOURSE                 OPEN_C_CODE                    VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SCORE                      SUGANG_CODE                    VARCHAR2                                                                                                                                               10                           N          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SCORE                      SUB_CODE                       VARCHAR2                                                                                                                                               10                           N          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SCORE                      SCORE_AT                       NUMBER                                                                                                                                                 22              3          0 Y          4                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SCORE                      SCORE_PR                       NUMBER                                                                                                                                                 22              3          0 Y          3                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SCORE                      SCORE_WR                       NUMBER                                                                                                                                                 22              3          0 Y          2                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SCORE                      SCORE_CODE                     VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_STATIC_SUBJECT             SUB_NAME                       VARCHAR2                                                                                                                                              160                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
TBL_STATIC_SUBJECT             SUB_NAME_CODE                  VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_STUDENTS                   STUDENT_ID                     VARCHAR2      
TBL_STUDENTS                   STUDENT_SSN                    VARCHAR2                                                                                                                                                7                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         7 NO  NO                        7 B NO  YES NONE           
TBL_STUDENTS                   STUDENT_NAME                   VARCHAR2                                                                                                                                               20                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
TBL_STUDENTS                   STUDENT_CODE                   VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUBJECT                    BOOK_CODE                      VARCHAR2                                                                                                                                               10                           N          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUBJECT                    OPEN_C_CODE                    VARCHAR2                                                                                                                                               10                           N          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUBJECT                    SUB_END                        DATE                                                                                                                                                    7                           N          4                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SUBJECT                    SUB_START                      DATE                                                                                                                                                    7                           N          3                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SUBJECT                    SUB_NAME_CODE                  VARCHAR2                                                                                                                                               10                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUBJECT                    SUB_CODE                       VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUGANG                     GIVEUP_YN                      NUMBER                                                                                                                                                 22              1          0 Y          4                                                                                                                                                                                                                                                                                                                                                                                            NO  NO                        0   NO  YES NONE           
TBL_SUGANG                     STUDENT_CODE                   VARCHAR2      
TBL_SUGANG                     OPEN_C_CODE                    VARCHAR2                                                                                                                                               10                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_SUGANG                     SUGANG_CODE                    VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_TEACHERS                   TEACHER_ID                     VARCHAR2                                                                                                                                               10                           N          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
TBL_TEACHERS                   TEACHER_SSN                    VARCHAR2                                                                                                                                                7                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         7 NO  NO                        7 B NO  YES NONE           
TBL_TEACHERS                   TEACHER_NAME                   VARCHAR2                                                                                                                                               20                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
TBL_TEACHERS                   TEACHER_CODE                   VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
VIEW_ADMIN_COURSE              교수자명                       VARCHAR2                                                                                                                                               24                           Y          7                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        24 NO  NO                        6 C NO  YES NONE           
VIEW_ADMIN_COURSE              교재명                         VARCHAR2                                                                                                                                              120                           Y          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                       30 C NO  YES NONE           
VIEW_ADMIN_COURSE              과목끝                         VARCHAR2                                                                                                                                               18                           Y          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_COURSE              과목시작                       VARCHAR2                                                                                                                                               18                           Y          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_COURSE              배정된과목명                   VARCHAR2 
VIEW_ADMIN_COURSE              강의실                         VARCHAR2                                                                                                                                               24                           Y          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        24 NO  NO                        6 C NO  YES NONE           
VIEW_ADMIN_COURSE              과정명                         VARCHAR2                                                                                                                                              160                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_STUDENT             중탈여부                       VARCHAR2                                                                                                                                               18                           Y          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_STUDENT             수강과목총점                   VARCHAR2                                                                                                                                               40                           Y          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        40 NO  NO                       40 B NO  YES NONE           
VIEW_ADMIN_STUDENT             수강과목                       VARCHAR2                                                                                                                                              160                           Y          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_STUDENT             수강과정                       VARCHAR2                                                                                                                                              160                           Y          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_STUDENT             학생이름                       VARCHAR2                                                                                                                                               20                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
VIEW_ADMIN_SUBJECT             교수자명                       VARCHAR2                                                                                                                                               24                           Y          7                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        24 NO  NO                        6 C NO  YES NONE           
VIEW_ADMIN_SUBJECT             교재명                         VARCHAR2                                                                                                                                              120                           Y          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                       30 C NO  YES NONE           
VIEW_ADMIN_SUBJECT             과목끝                         VARCHAR2                                                                                                                                               18                           Y          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_SUBJECT             과목시작                       VARCHAR2 
VIEW_ADMIN_SUBJECT             배정된과목명                   VARCHAR2                                                                                                                                              160                           Y          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_SUBJECT             강의실                         VARCHAR2                                                                                                                                               24                           Y          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        24 NO  NO                        6 C NO  YES NONE           
VIEW_ADMIN_SUBJECT             과정명                         VARCHAR2                                                                                                                                              160                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_TEACHERS            강의진행여부                   VARCHAR2                                                                                                                                               18                           Y          7                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_TEACHERS            강의실                         VARCHAR2                                                                                                                                               24                           Y          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        24 NO  NO                        6 C NO  YES NONE           
VIEW_ADMIN_TEACHERS            교재명                         VARCHAR2                                                                                                                                              120                           Y          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                       30 C NO  YES NONE           
VIEW_ADMIN_TEACHERS            과목종료                       VARCHAR2                                                                                                                                               18                           Y          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_TEACHERS            과목시작                       VARCHAR2                                                                                                                                               18                           Y          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        18 NO  NO                       18 B NO  YES NONE           
VIEW_ADMIN_TEACHERS            배정된과목명                   VARCHAR2                                                                                                                                              160                           Y          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       160 NO  NO                       40 C NO  YES NONE           
VIEW_ADMIN_TEACHERS            교수자명                       VARCHAR2                                                                                                                                               20                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
VIEW_BOOK                      BOOK_WRITER                    VARCHAR2     
VIEW_BOOK                      BOOK_NAME                      VARCHAR2                                                                                                                                              120                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                       30 C NO  YES NONE           
VIEW_BOOK                      BOOK_CODE                      VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
VIEW_CLASS                     CLASS_NAME                     VARCHAR2                                                                                                                                               20                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        20 NO  NO                        5 C NO  YES NONE           
VIEW_CLASS                     CLASS_CODE                     VARCHAR2                                                                                                                                               10                           N          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        10 NO  NO                       10 B NO  YES NONE           
VIEW_CONSTCHECK                DELETE_RULE                    VARCHAR2                                                                                                                                                9                           Y          7                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         9 NO  NO                        9 B NO  YES NONE           
VIEW_CONSTCHECK                SERACH_CONDITION               LONG                                                                                                                                                    0                           Y          6                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         0 NO  NO                        0   NO  YES NONE           
VIEW_CONSTCHECK                COLUMN_NAME                    VARCHAR2                                                                                                                                             4000                           Y          5                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                      4000 NO  NO                     4000 B NO  YES NONE           
VIEW_CONSTCHECK                CONSTRAINT_TYPE                VARCHAR2                                                                                                                                                1                           Y          4                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                         1 NO  NO                        1 B NO  YES NONE           
VIEW_CONSTCHECK                TABLE_NAMEF                    VARCHAR2                                                                                                                                               30                           N          3                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        30 NO  NO                       30 B NO  YES NONE           
VIEW_CONSTCHECK                CONSTRAINT_NAME                VARCHAR2                                                                                                                                               30                           N          2                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                        30 NO  NO                       30 B NO  YES NONE           
VIEW_CONSTCHECK                OWNER                          VARCHAR2                                                                                                                                              120                           Y          1                                                                                                                                                                                                                                                                                                                          CHAR_CS                                                       120 NO  NO                      120 B NO  YES NONE           

*/

--○ team004로 생성된 뷰 확인 
--▶ 관리자 : 등록된 모든 강사 정보 조회하는 뷰 생성
SELECT *
FROM VIEW_ADMIN_TEACHERS
;
/*
교수자명  배정된과목명                                   과목시작     과목종료     교재명                            강의실    강의진행여부
----- ---------------------------------------- -------- -------- ------------------------------ ------ ------
김찬희 JSP                                      19/05/15 19/07/19 생활코딩! 자바 프로그래밍 입문 B강의실 강의중
김찬희 SERVELET                                 19/07/20 19/08/15 JSP 2.3 웹프로그래밍           B강의실 강의중
김찬희 PYTHON                                   19/03/15 19/05/14 Do it! 점프 투 파이썬          B강의실 강의중
김호진 해당사항없음                             해당사항없음 해당사항없음 해당사항없음                   해당사항없음 해당사항없음
김호진 SPRING                                   19/05/15 19/07/19 코드로 배우는 스프링 웹프로젝트 A강의실 강의중
김호진 ORACLE                                   19/03/15 19/05/14 쉽게 배우는 오라클 SQL과 PL/SQL A강의실 강의중
김호진 JAVA                                     19/02/11 19/03/14 편하게 읽는 자바 프로그래밍    A강의실 강의중
윤희진 해당사항없음                             해당사항없음 해당사항없음 해당사항없음                   해당사항없음 해당사항없음
전훈의 해당사항없음                             해당사항없음 해당사항없음 해당사항없음                   해당사항없음 해당사항없음
한승원 해당사항없음                             해당사항없음 해당사항없음 해당사항없음                   해당사항없음 해당사항없음

10개 행이 선택되었습니다. 
*/


--▶ 관리자 : 등록된 모든 과정 정보 조회하는 뷰 생성
SELECT *
FROM VIEW_ADMIN_COURSE
;
/*

과정명                                        강의실    배정된과목명         과목시작     과목끝      교재명                            교수자명  
----------------------------------------      ------ --------------------- -------- -------- ------------------------------ ------
Framework기반의 빅데이터활용 응용프로그래머과정	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음
JAVA기반의 스마트 웹 앱콘텐츠 양성과정	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	ORACLE	19/03/15	19/05/14	쉽게 배우는 오라클 SQL과 PL/SQL	김호진
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	SPRING	19/05/15	19/07/19	코드로 배우는 스프링 웹프로젝트	김호진
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	JAVA	19/02/11	19/03/14	편하게 읽는 자바 프로그래밍	김호진
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	SERVELET	19/07/20	19/08/15	JSP 2.3 웹프로그래밍	김찬희
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	JSP	19/05/15	19/07/19	생활코딩! 자바 프로그래밍 입문	김찬희
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	PYTHON	19/03/15	19/05/14	Do it! 점프 투 파이썬 	김찬희
8개 행이 선택되었습니다. 

*/

--▶ 관리자 : 등록된 모든 과목 정보 조회하는 뷰 생성
SELECT *
FROM VIEW_ADMIN_SUBJECT
;
/*
Framework기반의 빅데이터활용 응용프로그래머과정	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음
JAVA기반의 스마트 웹 앱콘텐츠 양성과정	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음	해당사항없음
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	ORACLE	19/03/15	19/05/14	쉽게 배우는 오라클 SQL과 PL/SQL	김호진
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	SPRING	19/05/15	19/07/19	코드로 배우는 스프링 웹프로젝트	김호진
JAVA를 활용한 웹 응용SW개발자 양성과정	A강의실	JAVA	19/02/11	19/03/14	편하게 읽는 자바 프로그래밍	김호진
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	SERVELET	19/07/20	19/08/15	JSP 2.3 웹프로그래밍	김찬희
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	JSP	19/05/15	19/07/19	생활코딩! 자바 프로그래밍 입문	김찬희
파이썬과 자바를 연계한 머신러닝 활용개발자 과정	B강의실	PYTHON	19/03/15	19/05/14	Do it! 점프 투 파이썬 	김찬희
*/


--▶관리자 : 등록된 모든 학생 정보 조회하는 뷰 생성
SELECT *
FROM VIEW_ADMIN_STUDENT
;
/*
김정규	JAVA를 활용한 웹 응용SW개발자 양성과정	SPRING	295	수강중
김정규	JAVA를 활용한 웹 응용SW개발자 양성과정	ORACLE	290	수강중
김정규	JAVA를 활용한 웹 응용SW개발자 양성과정	JAVA	250	수강중
조현우	JAVA를 활용한 웹 응용SW개발자 양성과정	SPRING	290	수강중
조현우	JAVA를 활용한 웹 응용SW개발자 양성과정	ORACLE	280	수강중
조현우	JAVA를 활용한 웹 응용SW개발자 양성과정	JAVA	285	수강중
진윤비	JAVA를 활용한 웹 응용SW개발자 양성과정	SPRING	300	수강중
진윤비	JAVA를 활용한 웹 응용SW개발자 양성과정	ORACLE	285	수강중
진윤비	JAVA를 활용한 웹 응용SW개발자 양성과정	JAVA	290	수강중
김성희	JAVA를 활용한 웹 응용SW개발자 양성과정	SPRING	265	수강중
김성희	JAVA를 활용한 웹 응용SW개발자 양성과정	ORACLE	300	수강중
김성희	JAVA를 활용한 웹 응용SW개발자 양성과정	JAVA	280	수강중
정임혜	JAVA를 활용한 웹 응용SW개발자 양성과정	SPRING	290	수강중
정임혜	JAVA를 활용한 웹 응용SW개발자 양성과정	ORACLE	300	수강중
정임혜	JAVA를 활용한 웹 응용SW개발자 양성과정	JAVA	285	수강중
임나래	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	SERVELET	300	수강중
임나래	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	JSP	    275	수강중
임나래	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	PYTHON	295	수강중
최보라	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	SERVELET	300	수강중
최보라	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	JSP	    270	수강중
최보라	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	PYTHON	300	수강중
유진석	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	SERVELET	295	수강중
유진석	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	JSP	    280	수강중
유진석	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	PYTHON	280	수강중
김선아	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	SERVELET	270	수강중
김선아	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	JSP	    260	수강중
김선아	파이썬과 자바를 연계한 머신러닝 활용개발자 과정	PYTHON	270	수강중
이기승	해당사항없음	해당사항없음	해당사항없음	해당사항없음
김경환	해당사항없음	해당사항없음	해당사항없음	해당사항없음
이승희	해당사항없음	해당사항없음	해당사항없음	해당사항없음
최은상	해당사항없음	해당사항없음	해당사항없음	해당사항없음
이원영	해당사항없음	해당사항없음	해당사항없음	해당사항없음
권홍비	해당사항없음	해당사항없음	해당사항없음	해당사항없음
곽한얼	해당사항없음	해당사항없음	해당사항없음	해당사항없음
*/


--▶ 등록된 모든 교재 정보 출력하는 뷰 생성
SELECT *
FROM VIEW_BOOK
;
/*BO1001	편하게 읽는 자바 프로그래밍	박용우
BO1002	쉽게 배우는 오라클 SQL과 PL/SQL	서진수
BO1003	코드로 배우는 스프링 웹프로젝트	구멍가게 코딩단
BO1004	Do it! 점프 투 파이썬 	박응용
BO1005	생활코딩! 자바 프로그래밍 입문	이고잉
BO1006	JSP 2.3 웹프로그래밍	최범균
BO1007	풀스택 개발자를 위한 MEAN 스택 입문	애덤 브레츠
*/

--▶ 등록된 모든 강의실 정보 출력하는 뷰 생성
SELECT *
FROM VIEW_CLASS
;
/*
CL1001	A강의실
CL1002	B강의실
CL1003	C강의실
CL1004	D강의실
CL1005	E강의실
*/


--○ 생성된 프로시저 확인
--▶ 강사 : 본인의 강사코드를 입력해 수강된 학생들의 목록을 보여주는 프로시저 생성     예) PRC_TEACHERS_VIEW('강사코드');
EXEC PRC_TEACHERS_VIEW('T1001');
/*
김정규
조현우
진윤비
김성희
정임혜
*/

--▶ 강사 : 테이블간에 같은 주민번호 존재 여부 확인 프로시저     예 PRC_TEACHERS_I('강사이름', '주민번호뒷7자리')
EXEC PRC_TEACHERS_I('김호진', '9089929');
SELECT *
FROM TBL_TEACHERS;
/*
T1001	김호진	1234567	TEA1001
T1002	김찬희	1234568	TEA1002
T1003	전훈의	1234561	TEA1003
T1004	한승원	1234562	TEA1004
T1005	윤희진	2234561	TEA1005
T0000	미정  	미정	    TEA0000
T1006	김호진	9089929	TEA1006
*/

--▶ 학생 : 테이블간에 같은 주민번호 존재 여부 확인 프로시저     예) PRC_STUDENTS_I('학생이름', '주민번호뒷7자리')
EXEC PRC_STUDENTS_I('이원영', '1234456');
SELECT *
FROM TBL_STUDENTS;
/*
S1001	김정규	1234569	STU1001
S1002	조현우	1234570	STU1002
S1003	진윤비	2234569	STU1003
S1004	김성희	2234570	STU1004
S1005	정임혜	2234571	STU1005
S1006	임나래	2234511	STU1006
S1007	김경환	1234517	STU1007
S1008	최보라	2234521	STU1008
S1009	유진석	1234527	STU1009
S1010	김선아	2234531	STU1010
S1011	이기승	1234537	STU1011
S1012	곽한얼	1234547	STU1012
S1013	이승희	2234541	STU1013
S1014	권홍비	2234551	STU1014
S1015	최은상	1234557	STU1015
S1016	이원영	1234456	STU1016
*/

--▶ 관리자 : 테이블간에 같은 주민번호 존재 여부 확인 프로시저     예) PRC_ADMIN_I('관리자이름', '주민번호 뒷 7자리')
EXEC PRC_ADMIN_I('이지혜', '2245677');
SELECT *
FROM TBL_ADMIN;
/*
A1001	2234567	나주영	ADM1001
A1002	2245678	정유진	ADM1002
A1003	2245677	이지혜	ADM1003
*/

--▶ 학생 : 학생ID 입력시, 학생이 수강한 과목의 성적을 출력 프로시저     예) PRC_STUDENT_SCORE(학생ID-STUDENT_ID)
EXEC PRC_STUDENT_SCORE('STU1003');
/*
학생이름 : 김정규, 과정명 : JAVA를 활용한 웹 응용SW개발자 양성과정, 과목명 : JAVA, 과목교육기간(시작연월일) : 19/02/11, 과목교육기간(종료월일) : 19/03/14, 교재명 : 편하게 읽는 자바 프로그래밍 [ 출결 : 35 / 필기 : 20 / 실기 : 24 / 총점 : 79 ] , 등수 : 1
*/

--▶ 학생 : 로그인 하면 수강을 끝낸 과목 출력 프로시저     예) PRC_STUSUB_VIEW(학생ID-STUDENT_ID)
EXEC PRC_STUSUB_VIEW('STU1003')
SELECT *
FROM TBL_STUDENTS;
/*
    JAVA
*/


--▶ 학생 : 본인의 중도탈락여부 확인 프로시저     예) PRC_GIVEUP_P(학생코드-STUDENT_CODE)
EXEC PRC_GIVEUP_P('S1001');
SELECT *
FROM TBL_STUDENTS;


--▶ 강사 : 본인이 강의한 과정 수강한 학생의 성적 목록 출력 프로시저     예) PRC_SCORE_P(강사코드-TEACHER_CODE)
EXEC PRC_SCORE_P('T1003');
SELECT *
FROM TBL_TEACHERS;

--▶ 관리자/강사 : 과목명 수정 프로시저     예) PRC_STATIC_SUBJECT_U(과목명코드, 과목명, 교재코드)
EXEC PRC_STATIC_SUBJECT_U('SU1008', '정보처리기사 필기', 'BO0000');
SELECT *
FROM TBL_STATIC_SUBJECT;

SELECT *
FROM TBL_BOOK;

--▶ 관리자 : 수강테이블에 중도탈락 확인여부 수정하는 프로시저     예) PRC_SUGANG_U(수강코드)
EXEC PRC_SUGANG_U('SI1004');
SELECT *
FROM TBL_SUGANG;

--▶ 관리자 : 입력된 학생의 정보를 수정하는 프로시저     예) PRC_STUDENTS_U(학생코드, 학생이름, 학생SSN)
EXEC PRC_STUDENTS_U('S1002', '조현우', '4567889');
SELECT *
FROM TBL_STUDENTS;
/*
S1002	조현우	4567889	STU1002
*/


--▶ 관리자 : 입력된 강사의 정보를 수정하는 프로시저     예) PRC_TEACHERS_U(강사코드, 강사이름, 강사SSN, 강사ID)
EXEC PRC_TEACHERS_U('T1004', '한승원', '1234599','TEA1004');
SELECT *
FROM TBL_TEACHERS;
/*
T1004	한승원	1234562	TEA1004
▼
T1004	한승원	1234599	TEA1004
*/


--▶ 관리자 : 교재 정보 삭제     예) PRC_BOOK_D(교재코드)
EXEC PRC_BOOK_D('BO1007');
SELECT *
FROM TBL_BOOK;
/*
BO1001	편하게 읽는 자바 프로그래밍	박용우
BO1002	쉽게 배우는 오라클 SQL과 PL/SQL	서진수
BO1003	코드로 배우는 스프링 웹프로젝트	구멍가게 코딩단
BO1004	Do it! 점프 투 파이썬 	박응용
BO1005	생활코딩! 자바 프로그래밍 입문	이고잉
BO1006	JSP 2.3 웹프로그래밍	최범균
BO1007	풀스택 개발자를 위한 MEAN 스택 입문	애덤 브레츠
BO0000	미정                              	미정

▼

BO1001	편하게 읽는 자바 프로그래밍	박용우
BO1002	쉽게 배우는 오라클 SQL과 PL/SQL	서진수
BO1003	코드로 배우는 스프링 웹프로젝트	구멍가게 코딩단
BO1004	Do it! 점프 투 파이썬 	박응용
BO1005	생활코딩! 자바 프로그래밍 입문	이고잉
BO1006	JSP 2.3 웹프로그래밍	최범균
BO0000	미정	                            미정
*/

--▶ 관리자 : 강사 정보 삭제     예) PRC_TEACHERS_D(강사ID)
EXEC PRC_TEACHERS_D('TEA1004');
SELECT *
FROM TBL_TEACHERS;
/*
T1001	김호진	1234567	TEA1001
T1002	김찬희	1234568	TEA1002
T1003	전훈의	1234561	TEA1003
T1004	한승원	1234599	TEA1004
T1005	윤희진	2234561	TEA1005
T0000	미정	미정	TEA0000
T1006	김호진	9089929	TEA1006

▼   
T1001	김호진	1234567	TEA1001
T1002	김찬희	1234568	TEA1002
T1003	전훈의	1234561	TEA1003
T1005	윤희진	2234561	TEA1005
T0000	미정	미정	TEA0000
T1006	김호진	9089929	TEA1006
*/

--▶ 관리자 : 정적과목 정보 삭제     예) PRC_STATIC_SUBJECT_D(과목명코드)
EXEC PRC_STATIC_SUBJECT_D('SU1007');
SELECT *
FROM TBL_STATIC_SUBJECT;
/*
SU1001	JAVA
SU1002	ORACLE
SU1003	SPRING
SU1004	PYTHON
SU1005	JSP
SU1006	SERVELET
SU1007	FRONT-END
▼
SU1001	JAVA
SU1002	ORACLE
SU1003	SPRING
SU1004	PYTHON
SU1005	JSP
SU1006	SERVELET
*/

--▶ 관리자 : 정적과목 정보 삭제     예) PRC_STUDENTS_D(학생코드)
EXEC PRC_STUDENTS_D('S1016');
SELECT *
FROM TBL_STUDENTS;
/*
S1001	김정규	1234569	STU1001
S1002	조현우	4567889	STU1002
S1003	진윤비	2234569	STU1003
S1004	김성희	2234570	STU1004
S1005	정임혜	2234571	STU1005
S1006	임나래	2234511	STU1006
S1007	김경환	1234517	STU1007
S1008	최보라	2234521	STU1008
S1009	유진석	1234527	STU1009
S1010	김선아	2234531	STU1010
S1011	이기승	1234537	STU1011
S1012	곽한얼	1234547	STU1012
S1013	이승희	2234541	STU1013
S1014	권홍비	2234551	STU1014
S1015	최은상	1234557	STU1015
S1016	이원영	1234456	STU1016
▼
S1001	김정규	1234569	STU1001
S1002	조현우	4567889	STU1002
S1003	진윤비	2234569	STU1003
S1004	김성희	2234570	STU1004
S1005	정임혜	2234571	STU1005
S1006	임나래	2234511	STU1006
S1007	김경환	1234517	STU1007
S1008	최보라	2234521	STU1008
S1009	유진석	1234527	STU1009
S1010	김선아	2234531	STU1010
S1011	이기승	1234537	STU1011
S1012	곽한얼	1234547	STU1012
S1013	이승희	2234541	STU1013
S1014	권홍비	2234551	STU1014
S1015	최은상	1234557	STU1015
*/

--▶ 관리자 : 강의실 정보 삭제     예) PRC_CLASS_D(강의실명)
EXEC PRC_CLASS_D('E강의실');
SELECT *
FROM TBL_CLASS;
/*
CL1001	A강의실
CL1002	B강의실
CL1003	C강의실
CL1004	D강의실
CL1005	E강의실
CL0000	미정
▼
CL1001	A강의실
CL1002	B강의실
CL1003	C강의실
CL1004	D강의실
CL0000	미정
*/

--▶ 관리자 : 강의실 정보 삭제     예) PRC_COURSE_D(과정명코드)
EXEC PRC_COURSE_D('CO1002');
SELECT *
FROM TBL_COURSE;
/*
CO1001	JAVA를 활용한 웹 응용SW개발자 양성과정
CO1002	파이썬과 자바를 연계한 머신러닝 활용개발자 과정
CO1003	Framework기반의 빅데이터활용 응용프로그래머과정
CO1004	JAVA기반의 스마트 웹 앱콘텐츠 양성과정
▼
EXEC PRC_COURSE_D('CO1004');
COU_NAME_CODE : CO1001, COURSE_NAME : JAVA를 활용한 웹 응용SW개발자 양성과정
COU_NAME_CODE : CO1002, COURSE_NAME : 파이썬과 자바를 연계한 머신러닝 활용개발자 과정
COU_NAME_CODE : CO1003, COURSE_NAME : Framework기반의 빅데이터활용 응용프로그래머과정
▼
COU_NAME_CODE : CO1001, COURSE_NAME : JAVA를 활용한 웹 응용SW개발자 양성과정
COU_NAME_CODE : CO1003, COURSE_NAME : Framework기반의 빅데이터활용 응용프로그래머과정
*/

