--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

-- DBMS_OUTPUT 켜기
SET SERVEROUTPUT ON;

-- 프로시저 생성

--○ TBL_BOOK 데이터 삭제 위한 프로시저(PRC_BOOK_D) 생성
CREATE OR REPLACE PROCEDURE PRC_BOOK_D
( V_BOOK_CODE   IN TBL_BOOK.BOOK_CODE%TYPE
)
IS
    V_COUNT      NUMBER;       -- 입력받은 값이 테이블에 있는지 확인용 변수
    USER_DEFINE_ERROR EXCEPTION;           
BEGIN
    -- 예외처리 할 상황
    -- TBL_BOOK에 입력받은 값을 코드로 가지는 데이터가 있는지 확인
    SELECT COUNT(BOOK_CODE) INTO V_COUNT
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE; 
    -- 입력받은 값이 테이블에 없는 상황인 경우
    IF (V_COUNT = 0)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- TBL_SUBJECT와의 참조관계 삭제 → '미정' 데이터 사용
    -- UPDATE(TBL_SUBJECT)
    UPDATE TBL_SUBJECT
    SET BOOK_CODE='BO'||'0000'
    WHERE BOOK_CODE=V_BOOK_CODE;
    
    -- 참조관계가 없어진 TBL_BOOK의 데이터 삭제
    -- DELETE(TBL_BOOK)
    DELETE 
    FROM TBL_BOOK
    WHERE BOOK_CODE=V_BOOK_CODE;
    
    COMMIT;
    
    -- 테이블에 없는 값을 입력했을 경우 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '잘못된 코드를 입력하셨습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK; 
END;


--------------------------------------------------------------------------------------------------------------------------------
--○ (TBL_TEACHERS)를 업데이트 프로시저 생성
--○ PRC_TEACHERS_U작성
CREATE OR REPLACE PROCEDURE PRC_TEACHERS_U
(
    V_TEACHER_CODE IN TBL_TEACHERS.TEACHER_CODE%TYPE        -- 강사코드를 받을 매개변수
,   V_TEACHER_NAME IN TBL_TEACHERS.TEACHER_NAME%TYPE        -- 강사이름을 받을 매개변수
,   V_TEACHER_SSN IN TBL_TEACHERS.TEACHER_SSN%TYPE          -- 강사주민번호 뒷자리를 받을 매개변수
,   V_TEACHER_ID IN TBL_TEACHERS.TEACHER_ID%TYPE            -- 강사아이디를 받을 매개변수
)
IS
    V_T_CODE TBL_TEACHERS.TEACHER_CODE%TYPE;        -- 강사코드를 담을 변수선언
    USER_DEFINE_ERROR EXCEPTION;                    -- 예외처리 변수
BEGIN
    
    -- 2. V_T_CODE를 가져오는 쿼리문
    SELECT COUNT(TEACHER_CODE) INTO  V_T_CODE
    FROM TBL_TEACHERS
    WHERE TEACHER_CODE = V_TEACHER_CODE;
    
    -- 3. V_TEACHER_CODE를 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    IF(V_T_CODE = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    

    --1. TEACHER_CODE를 활용해서 강사의 정보 모두 UPDATE
    UPDATE TBL_TEACHERS
    SET TEACHER_NAME = V_TEACHER_NAME, TEACHER_SSN = V_TEACHER_SSN, TEACHER_ID = V_TEACHER_ID
    WHERE TEACHER_CODE = V_TEACHER_CODE;
    
    --커밋
    COMMIT;
    
    -- 4. 예외 메세지 발생
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--------------------------------------------------------------------------------------------------------------------------------
--○ (TBL_TEACHERS)를 삭제 프로시저 생성
--○ PRC_TEACHERS_D 작성 
CREATE OR REPLACE PROCEDURE PRC_TEACHERS_D
(
    V_TEACHER_ID IN TBL_TEACHERS.TEACHER_ID%TYPE  -- 강사의 주민번호 뒷자리를 받을 매개변수
)
IS
    V_T_ID NUMBER;                             -- 강사의 주민번호를 담을 변수 선언
    V_T_CODE TBL_TEACHERS.TEACHER_CODE%TYPE;    -- 강사의 코드를 담을 변수 선언
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    --강사의 주민번호를 쿼리문을 통해 COUNT해옴 → V_T_SSN에 저장
    SELECT COUNT(TEACHER_ID) INTO V_T_ID
    FROM TBL_TEACHERS
    WHERE TEACHER_ID = V_TEACHER_ID;
    
    --예외처리를 위한 IF문 → COUNT(TEACHER_SSN) = 0 이다 라는것은 입력된 강사의 정보가 존재하지 않는다.
    IF(V_T_ID = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    --V_T_CODE를 쿼리문을 통해 가져옴
    SELECT TEACHER_CODE INTO V_T_CODE
    FROM TBL_TEACHERS
    WHERE TEACHER_ID = V_TEACHER_ID;
    
    
    --2. TBL_OPENCOURSE를 '미정'으로 UPDATE
    UPDATE TBL_OPENCOURSE
    SET TEACHER_CODE = 'T0000'
    WHERE TEACHER_CODE = V_T_CODE;
    
    --3. TBL_TEACHER 'N_TEACHER_SSN' 삭제
    DELETE 
    FROM TBL_TEACHERS
    WHERE TEACHER_ID = V_TEACHER_ID;
    
    --커밋
    COMMIT;   
    
    --예외처리 발생및 ROLLBACK
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


----------------------------------------------------------------------------------------------------------------------------------------------------------
--○ 교수자 → 본인의 강사코드를 입력해 수강된 학생들의 목록을 보여주는 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_TEACHERS_VIEW
(
    V_TEACHER_CODE IN TBL_TEACHERS.TEACHER_CODE%TYPE    -- 강사코드를 입력받기 위한 매개변수
)
IS
    USER_DEFINE_ERROR EXCEPTION;                --EXCEPTION을 활용하기 위한 변수 선언
    V_TEACHER_C NUMBER;                         --강사코드를 가져오기 위한 변수 선언
    V_STUDENTS TBL_STUDENTS.STUDENT_NAME%TYPE;  --학생 목록을 가져오기 위한 변수 선언
    
    -- 커서 이용을 위한 커서변수 선언(→ 커서 정의)
    -- 커서 커서변수명 
    CURSOR CUR_STU_SELECT
    IS
    SELECT STUDENT_NAME         -- 매개변수로 입력받은 강사의 코드를 이용해 수강들은 학생들 목록 출력하기 위한 SELECT 문
    FROM TBL_STUDENTS
    WHERE STUDENT_CODE IN (SELECT STUDENT_CODE 
                           FROM TBL_SUGANG
                           WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE 
                                                 FROM TBL_OPENCOURSE
                                                 WHERE TEACHER_CODE = (SELECT TEACHER_CODE
                                                                       FROM TBL_TEACHERS
                                                                       WHERE TEACHER_CODE = V_TEACHER_CODE)) AND GIVEUP_YN IS NULL);
    
BEGIN
    -- V_TEACHER_C를 가져오는 쿼리문
    SELECT COUNT(TEACHER_CODE) INTO  V_TEACHER_C
    FROM TBL_TEACHERS
    WHERE TEACHER_CODE = V_TEACHER_CODE;
    
    -- V_TEACHER_CODEE를 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    IF(V_TEACHER_C = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 커서 오픈
    OPEN CUR_STU_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한행 한행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_STU_SELECT INTO V_STUDENTS;
        
        EXIT WHEN CUR_STU_SELECT%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_STUDENTS);
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_STU_SELECT;    
    
    COMMIT;
    
    
     -- 예외 메세지 발생
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--------------------------------------------------------------------------------------------------------------------------------
 --○ TBL_STATIC_SUBJECT 정적과목 과목명 삭제 프로시져
CREATE OR REPLACE PROCEDURE PRC_STATIC_SUBJECT_D  
(
    V_SUB_NAME_CODE IN TBL_STATIC_SUBJECT.SUB_NAME_CODE%TYPE   --삭제할 과목 코드
)
IS
    V1_SUB_NAME_CODE NUMBER(5);
    USER_DEFINE_ERROR EXCEPTION;
    --V2_SUB_NAME_CODE NUMBER(1);
    USER_DEFINE_ERROR2 EXCEPTION;
BEGIN          
    --개설된 과목 테이블에 에 V_SUB_NAME_CODE의 갯수를 변수에 담기
    SELECT COUNT(SUB_NAME_CODE) INTO V1_SUB_NAME_CODE   
    FROM TBL_SUBJECT
    WHERE SUB_NAME_CODE = V_SUB_NAME_CODE;

    --개설된 과목 테이블에 에 과목명코드가 0보다 크다면 참조하고있는 상황이므로 예외발생
    IF(V1_SUB_NAME_CODE>0)                              
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF(V1_SUB_NAME_CODE = 1)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    -- V_TEACHER_CODEE를 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    /*
    IF(V1_SUB_NAME_CODE = 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    */

    DELETE 
    FROM TBL_STATIC_SUBJECT
    WHERE SUB_NAME_CODE = V_SUB_NAME_CODE;

    COMMIT;

    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002,'개설된 과정은 삭제하실 수 없습니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20001, '잘못된 코드를 입력하셨습니다.');
        WHEN OTHERS
            THEN ROLLBACK;          
END;

--------------------------------------------------------------------------------------------------------------------------------
--○ TBL_STATIC_SUBJECT 정적과목 과목명 수정 프로시져 생성
CREATE OR REPLACE PROCEDURE PRC_STATIC_SUBJECT_U
(  
    V_SUB_NAME_CODE IN TBL_STATIC_SUBJECT.SUB_NAME_CODE%TYPE  --과목코드
    ,V_SUB_NAME     IN TBL_STATIC_SUBJECT.SUB_NAME%TYPE   --과목이름
    ,V_BOOK_CODE    IN TBL_BOOK.BOOK_CODE%TYPE  --교재코드
)
IS
    V1_BOOK_CODE        NUMBER(5);
    V1_SUB_NAME_CODE    NUMBER(5);
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
BEGIN
    
    SELECT COUNT(BOOK_CODE) INTO V1_BOOK_CODE               --교재테이블에서 BOOK_CODE의 갯수를 담아준다. 
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    IF( V1_BOOK_CODE != 1 )                                  --교재테이블에서 BOOK_CODE가 존재하지 않는다면 예외발생
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT COUNT(SUB_NAME_CODE) INTO V1_SUB_NAME_CODE   --개설된 과목 테이블에 에 V_SUB_NAME_CODE의 갯수를 변수에 담기
    FROM TBL_SUBJECT
    WHERE SUB_NAME_CODE = V_SUB_NAME_CODE;
    
     IF(V1_SUB_NAME_CODE>0)                              --개설된 과목 테이블에 에 과목명코드가 0보다 크다면 참조하고있는 상황이므로 예외발생
    THEN RAISE USER_DEFINE_ERROR2;
    END IF;
       
    UPDATE TBL_STATIC_SUBJECT
    SET SUB_NAME = V_SUB_NAME
    WHERE SUB_NAME_CODE = V_SUB_NAME_CODE;
    
    UPDATE TBL_SUBJECT
    SET BOOK_CODE = V_BOOK_CODE
    WHERE SUB_NAME_CODE = V_SUB_NAME_CODE;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20003,'선택된 과정은 수정하실 수 없습니다.');
            ROLLBACK;
        WHEN OTHERS
           THEN ROLLBACK;     
        
END;


--------------------------------------------------------------------------------------------------------------------------------
--○수강테이블에 중도탈락 확인여부 업데이트 및 중도포기자 테이블 데이터 입력
CREATE OR REPLACE PROCEDURE PRC_SUGANG_U
(
    V_SUGANG_CODE TBL_SUGANG.SUGANG_CODE%TYPE       --수강코드 매개변수 입력
)
IS
    USER_DEFINE_ERROR EXCEPTION;                     --예외처리
    V1_SUGANG_CODE NUMBER(5);                       --수강테이블에 수강번호가 있는지 확인하기 위한 변수
BEGIN
    --수강테이블에 있는 수강번호의 존재여부 확인
    SELECT COUNT(SUGANG_CODE) INTO V1_SUGANG_CODE   
    FROM TBL_SUGANG
    WHERE SUGANG_CODE = V_SUGANG_CODE;
    
    --없다면 예외처리
    IF(V1_SUGANG_CODE != 1 )                        
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    UPDATE TBL_SUGANG
    SET GIVEUP_YN = 1
    WHERE SUGANG_CODE = V_SUGANG_CODE;
    
    INSERT INTO TBL_GIVEUP(GIVEUP_START,SUGANG_CODE) VALUES (SYSDATE,V_SUGANG_CODE); 
    
    COMMIT;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR 
         THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
        ROLLBACK;
    WHEN OTHERS
         THEN ROLLBACK;
      
END;


--------------------------------------------------------------------------------------------------------------------------------
-- 강사의 과정을 수강한 학생의 성적 목록 출력하는 프로시저 생성
-- (중도탈락자 : 중도탈락 전 수강한 성적만 포함 → 중도탈락여부 표시)
CREATE OR REPLACE PROCEDURE PRC_SCORE_P
(
    V_TEACHER_CODE IN TBL_TEACHERS.TEACHER_CODE%TYPE
)
IS
    
    V_SUB_START TBL_SUBJECT.SUB_START%TYPE;             --과목기간 시작을 담을 변수
    V_SUB_END TBL_SUBJECT.SUB_END%TYPE;                 --과목기간 끝을 담을 변수
    V_BOOK_NAME TBL_BOOK.BOOK_NAME%TYPE;                --교재명을 담을 변수
    V_STUDENT_NAME TBL_STUDENTS.STUDENT_NAME%TYPE;      --학생명을 담을 변수
    V_SUB_NAME TBL_STATIC_SUBJECT.SUB_NAME%TYPE;        --과목명을 담을 변수
    V_SCORE_WR TBL_SCORE.SCORE_WR%TYPE;                 --필기 점수를 담을 변수
    V_SCORE_PR TBL_SCORE.SCORE_PR%TYPE;                 --실기 점수를 담을 변수
    V_SCORE_AT TBL_SCORE.SCORE_AT%TYPE;                 --출결 점수를 담을 변수
    V_RANK NUMBER(5);                                   --등수를 담을 변수
    USER_DEFINE_ERROR EXCEPTION;                        --유저 에러 변수
    V1_TEACHER_CODE NUMBER(1);                          --존재하는 강사코드인지 확인여부 담을 변수
    
    CURSOR CUR_INSA_SELECT                              --커서 변수 선언
    IS
    SELECT CD.SUB_NAME,CD.SUB_START,CD.SUB_END,CD.BOOK_NAME,ST.STUDENT_NAME
    ,AB.SCORE_WR,AB.SCORE_PR,AB.SCORE_AT,RANK() OVER(PARTITION BY AB.sub_code ORDER BY AB.SCORE_WR + AB.SCORE_PR + AB.SCORE_AT) --커서를 통해 변수로 담아줄 데이터값들을 조회
    FROM 
    (((SELECT *
    FROM  TBL_SCORE
    WHERE SUGANG_CODE IN (SELECT SUGANG_CODE
    FROM TBL_SUGANG
    WHERE GIVEUP_YN IS NULL AND OPEN_C_CODE = (SELECT OPEN_C_CODE FROM TBL_OPENCOURSE WHERE TEACHER_CODE = V_TEACHER_CODE)))AB JOIN (SELECT *
                                          FROM ((TBL_SUBJECT S JOIN TBL_BOOK B
                                           ON S.BOOK_CODE = B.BOOK_CODE) JOIN TBL_STATIC_SUBJECT SS
                                           ON S.SUB_NAME_CODE = SS.SUB_NAME_CODE))CD
                                           ON CD.SUB_CODE = AB.SUB_CODE) JOIN TBL_SUGANG SU
                                           ON SU.SUGANG_CODE = AB.SUGANG_CODE) JOIN TBL_STUDENTS ST
                                           ON SU.STUDENT_CODE = ST.STUDENT_CODE;

BEGIN
        
         SELECT COUNT(TEACHER_CODE) INTO V1_TEACHER_CODE
         FROM TBL_TEACHERS
         WHERE TEACHER_CODE = V_TEACHER_CODE;
         
         IF(V1_TEACHER_CODE!=1) 
         THEN RAISE USER_DEFINE_ERROR;
         END IF;

        OPEN CUR_INSA_SELECT;       --선언한 커서를 열어준다.
    
        --커서 오픈 시 흩어져나오는 데이터들 처리(잡아내기)
        LOOP                        --반복구문
        -- 한 행 한 행 끄집어내서 가져오는 행위 → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_SUB_NAME,V_SUB_START,V_SUB_END,V_BOOK_NAME,V_STUDENT_NAME,V_SCORE_WR,V_SCORE_PR,V_SCORE_AT,V_RANK; --커서를 통해서 던져주는 값들을 각 변수에 담아준다.
        
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND; --더이상 담아줄 데이터값이 없을때 반복문 종료
        
        --출력
        DBMS_OUTPUT.PUT_LINE('학생명 : ' || V_SUB_NAME ||','|| '과목시작 : ' || V_SUB_START ||','|| '과목끝 : '|| V_SUB_END ||','|| '교재명 : '|| V_BOOK_NAME||',' 
        || '학생명 : '|| V_STUDENT_NAME ||','|| '필기점수 : '|| V_SCORE_WR ||','|| '실기점수 : '|| V_SCORE_PR ||','|| '출석점수 : '|| V_SCORE_AT ||','|| '과목별등수 : '|| V_RANK); 
        
        END LOOP;  
        
        COMMIT;
  
        EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                     ROLLBACK;
            WHEN OTHERS
                THEN ROLLBACK;  
END;



--------------------------------------------------------------------------------------------------------------------------------
-- ○ TBL_STUDENTS에 입력된 학생의 정보를 삭제하는 PROCEDURE 
-- ○ 입력된 학생의 정보를 삭제하는 PROCEDURE 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_D
(
    V_STUDENT_CODE    IN TBL_STUDENTS.STUDENT_CODE%TYPE
)
IS  
    V_S_CODE TBL_STUDENTS.STUDENT_CODE%TYPE;        
    USER_DEFINE_ERROR EXCEPTION;                    
BEGIN
    
    -- 2. V_T_CODE를 가져오는 쿼리문
    SELECT COUNT(STUDENT_CODE) INTO  V_S_CODE
    FROM TBL_STUDENTS
    WHERE STUDENT_CODE = V_STUDENT_CODE;

    -- 3. V_STUDENT_CODE를 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    IF(V_S_CODE = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    --1. STUDENT_CODE를 활용해서 학생의 정보 모두 DELETE
    DELETE
    FROM TBL_SCORE
    WHERE SUGANG_CODE = (SELECT SUGANG_CODE
                         FROM TBL_SUGANG
                         WHERE STUDENT_CODE = V_STUDENT_CODE);
    
    DELETE
    FROM TBL_GIVEUP
    WHERE SUGANG_CODE = (SELECT SUGANG_CODE
                         FROM TBL_SUGANG
                         WHERE STUDENT_CODE = V_STUDENT_CODE);
                      
    DELETE
    FROM TBL_SUGANG
    WHERE STUDENT_CODE = V_STUDENT_CODE;
    
    DELETE
    FROM TBL_STUDENTS
    WHERE STUDENT_CODE = V_STUDENT_CODE;    

    COMMIT;


    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;



--------------------------------------------------------------------------------------------------------------------------------
-- ○ TBL_STUDENTS 입력된 학생의 정보를 수정하는 PROCEDURE 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_U
(
    V_STUDENT_CODE IN TBL_STUDENTS.STUDENT_CODE%TYPE        
,   V_STUDENT_NAME IN TBL_STUDENTS.STUDENT_NAME%TYPE        
,   V_STUDENT_SSN IN TBL_STUDENTS.STUDENT_SSN%TYPE                     
)
IS
    V_S_CODE TBL_STUDENTS.STUDENT_CODE%TYPE;        
    USER_DEFINE_ERROR EXCEPTION;                    
BEGIN
    
    -- 2. V_T_CODE를 가져오는 쿼리문
    SELECT COUNT(STUDENT_CODE) INTO  V_S_CODE
    FROM TBL_STUDENTS
    WHERE STUDENT_CODE = V_STUDENT_CODE;
    
    -- 3. V_TEACHER_CODE를 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    IF(V_S_CODE = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    

    --1. TEACHER_CODE를 활용해서 강사의 정보 모두 UPDATE
    UPDATE TBL_STUDENTS
    SET STUDENT_NAME = V_STUDENT_NAME, STUDENT_SSN = V_STUDENT_SSN
    WHERE STUDENT_CODE = V_STUDENT_CODE;
    
    --커밋
    COMMIT;
    
    -- 4. 예외 메세지 발생
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;



--------------------------------------------------------------------------------------------------------------------------------
--학생 자신의 중도탈락여부 확인하는 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_GIVEUP_P
(
    V_STUDENT_CODE TBL_STUDENTS.STUDENT_CODE%TYPE
)
IS
    V_GIVEUP_START TBL_GIVEUP.GIVEUP_START%TYPE;
    V_GIVEUP_YN TBL_SUGANG.GIVEUP_YN%TYPE;
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT GIVEUP_YN INTO V_GIVEUP_YN
    FROM TBL_STUDENTS S JOIN TBL_SUGANG SU
    ON S.STUDENT_CODE = SU.STUDENT_CODE AND S.STUDENT_CODE = V_STUDENT_CODE;
    
    IF(V_GIVEUP_YN IS NULL)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT GIVEUP_START INTO V_GIVEUP_START
    FROM TBL_GIVEUP 
    WHERE SUGANG_CODE = (SELECT SUGANG_CODE
                        FROM TBL_SUGANG
                        WHERE STUDENT_CODE = V_STUDENT_CODE);
    
    IF(V_GIVEUP_YN IS NOT NULL)
       THEN 
            DBMS_OUTPUT.PUT_LINE('중도 탈락자입니다. 중도포기 시기는'||V_GIVEUP_START||'입니다.');
    END IF;
    
    COMMIT;
    
    EXCEPTION
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
        ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
END;


--------------------------------------------------------------------------------------------------------------------------------
-- TBL_CLASS 데이터 삭제 프로시저
CREATE OR REPLACE PROCEDURE PRC_CLASS_D
(
        V_CLASS_NAME IN TBL_CLASS.CLASS_NAME%TYPE
)
IS
        V_NAME_COUNT      NUMBER;
        USER_DEFINE_ERROR EXCEPTION; 
BEGIN

    SELECT COUNT(CLASS_NAME) INTO V_NAME_COUNT
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME; 

    IF (V_NAME_COUNT = 0)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;


    UPDATE TBL_OPENCOURSE
    SET CLASS_CODE = 'CL0000'
    WHERE OPEN_C_CODE = (SELECT OPEN_C_CODE
                         FROM TBL_CLASS
                         WHERE CLASS_NAME = V_CLASS_NAME);
    DELETE
    FROM TBL_CLASS
    WHERE CLASS_NAME = V_CLASS_NAME;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '잘못된 코드를 입력하셨습니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;



--------------------------------------------------------------------------------------------------------------------------------


-- 학생로그인 하면 수강을 끝낸 과목 출력하는 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_STUSUB_VIEW          
(
  V_STUDENT_ID  IN TBL_STUDENTS.STUDENT_ID%TYPE      -- 학생로그인 할때 사용된 아이디 매개변수로 사용
)
IS
    V_SUB_NAME         TBL_STATIC_SUBJECT.SUB_NAME%TYPE;         -- 커서문에서 뽑아내 담을 V_SUB_NAME 변수 선언
    V_STUDENT_CODE     TBL_STUDENTS.STUDENT_CODE%TYPE;
    V_CODE_COUNT       NUMBER;
    USER_DEFINE_ERROR   EXCEPTION;
    
    CURSOR CUR_STUSUB                                    -- CUR_STUSUB 커서 생성
    IS
    
    SELECT SUB_NAME
    FROM TBL_STATIC_SUBJECT
    WHERE SUB_NAME_CODE IN (SELECT SUB_NAME_CODE
                             FROM TBL_SUBJECT
                             WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                                FROM TBL_SUGANG
                                                WHERE STUDENT_CODE IN (SELECT STUDENT_CODE
                                                                      FROM TBL_STUDENTS
                                                                      WHERE STUDENT_ID = V_STUDENT_ID)) AND (SUB_END < SYSDATE));                                                                            
BEGIN
    
    -- 수강하고 있지 않은 경우 에러 처리를 위한 변수 저장
    SELECT STUDENT_CODE INTO V_STUDENT_CODE
    FROM TBL_STUDENTS
    WHERE STUDENT_ID = V_STUDENT_ID;
    
    SELECT COUNT(STUDENT_CODE) INTO V_CODE_COUNT
    FROM TBL_SUGANG
    WHERE STUDENT_CODE = V_STUDENT_CODE;

    IF (V_CODE_COUNT = 0)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 커서 오픈
    OPEN CUR_STUSUB;--CUR_STU_SELECT;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한행 한행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_STUSUB INTO V_SUB_NAME;
        
        EXIT WHEN CUR_STUSUB%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_SUB_NAME);
    END LOOP;
    -- 커서 클로즈
    CLOSE CUR_STUSUB;

    COMMIT;

    EXCEPTION   -- 수강하고있지 않을 경우 EROOR 처리
    WHEN USER_DEFINE_ERROR
        THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
            ROLLBACK;
    WHEN OTHERS
        THEN ROLLBACK;
    
END;


--------------------------------------------------------------------------------------------------------------------------------
-- 테이블간에 같은 주민번호 존재 여부 확인하는 프로시저 생성
-- 강사

CREATE OR REPLACE PROCEDURE PRC_TEACHERS_I
( 
  V_TEACHER_NAME   IN TBL_TEACHERS.TEACHER_NAME%TYPE
, V_TEACHER_SSN     IN TBL_TEACHERS.TEACHER_SSN%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    USER_DEFINE_ERROR3  EXCEPTION;
    V_SSN_COUNT         NUMBER;

BEGIN

    SELECT COUNT(STUDENT_SSN) INTO V_SSN_COUNT
    FROM(
    SELECT STUDENT_SSN
    FROM TBL_STUDENTS
    UNION 
    SELECT TEACHER_SSN
    FROM TBL_TEACHERS
    UNION 
    SELECT ADMIN_SSN
    FROM TBL_ADMIN)
    WHERE STUDENT_SSN = V_TEACHER_SSN;

    IF (LENGTH(V_TEACHER_SSN) > 7)
    THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    IF (LENGTH(V_TEACHER_SSN) < 7)
    THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    
    IF (V_SSN_COUNT >= 1)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    INSERT INTO TBL_TEACHERS(TEACHER_CODE,TEACHER_NAME,TEACHER_SSN,TEACHER_ID)
    VALUES ('T'||SEQ_T_CODE.NEXTVAL,V_TEACHER_NAME,V_TEACHER_SSN,'TEA'||SEQ_TEA_CODE.NEXTVAL);
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, '중복된 주민번호가 이미 존재합니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20006, '주민번호가 7자리를 넘었습니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20007, '주민번호가 7자리보다 적습니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;  
            
            
    COMMIT;
END;


--------------------------------------------------------------------------------------------------------------------------------
-- 테이블간에 같은 주민번호 존재 여부 확인하는 프로시저 생성
-- 학생
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_I
( 
  V_STUDENT_NAME    IN TBL_STUDENTS.STUDENT_NAME%TYPE
, V_STUDENT_SSN     IN TBL_STUDENTS.STUDENT_SSN%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    USER_DEFINE_ERROR3  EXCEPTION;
    V_SSN_COUNT         NUMBER;

BEGIN

    SELECT COUNT(STUDENT_SSN) INTO V_SSN_COUNT
    FROM(
    SELECT STUDENT_SSN
    FROM TBL_STUDENTS
    UNION 
    SELECT TEACHER_SSN
    FROM TBL_TEACHERS
    UNION 
    SELECT ADMIN_SSN
    FROM TBL_ADMIN)
    WHERE STUDENT_SSN = V_STUDENT_SSN;

    IF (LENGTH(V_STUDENT_SSN) > 7)
    THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    IF (LENGTH(V_STUDENT_SSN) < 7)
    THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    IF (V_SSN_COUNT >= 1)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO TBL_STUDENTS(STUDENT_CODE,STUDENT_NAME,STUDENT_SSN,STUDENT_ID)
    VALUES ('S'||SEQ_S_CODE.NEXTVAL,V_STUDENT_NAME,V_STUDENT_SSN,'STU'||SEQ_STU_CODE.NEXTVAL);
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '중복된 주민번호가 이미 존재합니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20005, '주민번호가 7자리를 넘었습니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20006, '주민번호가 7자리보다 적습니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;  

END;

--------------------------------------------------------------------------------------------------------------------------------
-- 테이블간에 같은 주민번호 존재 여부 확인하는 프로시저 생성
--관리자
CREATE OR REPLACE PROCEDURE PRC_ADMIN_I
( 
  V_ADMIN_NAME   IN TBL_ADMIN.ADMIN_NAME%TYPE
, V_ADMIN_SSN    IN TBL_ADMIN.ADMIN_SSN%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
    USER_DEFINE_ERROR3  EXCEPTION;
    V_SSN_COUNT         NUMBER;

BEGIN

    SELECT COUNT(STUDENT_SSN) INTO V_SSN_COUNT
    FROM(
    SELECT STUDENT_SSN
    FROM TBL_STUDENTS
    UNION 
    SELECT TEACHER_SSN
    FROM TBL_TEACHERS
    UNION 
    SELECT ADMIN_SSN
    FROM TBL_ADMIN)
    WHERE STUDENT_SSN = V_ADMIN_SSN;

    IF (LENGTH(V_ADMIN_SSN) > 7)
    THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    IF (LENGTH(V_ADMIN_SSN) < 7)
    THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    IF (V_SSN_COUNT >= 1)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    
    
    INSERT INTO TBL_ADMIN(ADMIN_CODE,ADMIN_SSN,ADMIN_NAME,ADMIN_ID)
    VALUES ('A'||SEQ_A_CODE.NEXTVAL,V_ADMIN_SSN,V_ADMIN_NAME,'ADM'||SEQ_ADM_CODE.NEXTVAL); --관리자 데이터 삽입
            
    COMMIT;  
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '중복된 주민번호가 이미 존재합니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20005, '주민번호가 7자리를 넘었습니다.');
            ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20006, '주민번호가 7자리보다 적습니다.');
            ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;  

END;

--------------------------------------------------------------------------------------------------------------------------------
-- 학생ID 입력시 학생이 수강한 과목의 성적을 출력하는 프로시저 생성 -- 정임혜
CREATE OR REPLACE PROCEDURE PRC_STUDENT_SCORE
(
    V_STUDENT_ID        IN TBL_STUDENTS.STUDENT_ID%TYPE
)
IS  
    --EXCEPTION을 활용하기 위한 변수 선언
    USER_DEFINE_ERROR   EXCEPTION;       
    
    --쿼리문에 필요한 변수 선언 : CURSOR에서 꺼낸 데이터 담기 
    V_STUDENT_NAME      TBL_STUDENTS.STUDENT_NAME%TYPE;
    V_COURSE_NAME       TBL_COURSE.COURSE_NAME%TYPE;
    V_SUB_NAME          TBL_STATIC_SUBJECT.SUB_NAME%TYPE;
    V_SUB_START         TBL_SUBJECT.SUB_START%TYPE;
    V_SUB_END           TBL_SUBJECT.SUB_END%TYPE;
    V_BOOK_NAME         TBL_BOOK.BOOK_NAME%TYPE;
    V_SCORE_AT          TBL_SCORE.SCORE_AT%TYPE;
    V_SCORE_WR          TBL_SCORE.SCORE_WR%TYPE;
    V_SCORE_PR          TBL_SCORE.SCORE_PR%TYPE;
    V_TOT               NUMBER(3);    
    V_RANK              NUMBER;
    
    V_STUDENT_ID_C      TBL_STUDENTS.STUDENT_ID%TYPE;
    
    -- 커서 변수 선언 
    CURSOR CUR_STUDENT_SCORE 
    IS
    SELECT T2.STUDENT_NAME                              -- "학생이름"            -- AS 이하는 요구분석서에서 출력되어야 하는 컬럼이름을 구분한 것. (삭제 가능)
         , T4.COURSE_NAME                               -- "과정이름"
         , T6.SUB_NAME                                  -- "과목이름"
         , T5.SUB_START                                 -- "과목기간(시작연월일)"
         , T5.SUB_END                                   -- "과목기간(종료연월일)"
         , T7.BOOK_NAME                                 -- "교재이름"
         , (T8.SCORE_AT * T9.BAEJUM_AT)   AS V_SCORE_AT -- "출결"                --*** TBL_BAEJUM 의 컬럼명 이름 확인 (현재 BAEJUM_AT 으로 생성, 테스트 되었음)
         , (T8.SCORE_WR * T9.BAEJUM_WR)   AS V_SCORE_WR -- "필기"
         , (T8.SCORE_PR * T9.BAEJUM_PR)   AS V_SCORE_PR -- "실기"
         , ((T8.SCORE_AT * T9.BAEJUM_AT) + (T8.SCORE_WR * T9.BAEJUM_WR) + (T8.SCORE_PR * T9.BAEJUM_PR)) AS V_TOT -- "총점"
         , RANK() OVER(ORDER BY (T8.SCORE_AT + T8.SCORE_WR + T8.SCORE_PR) DESC) AS V_RANK -- "등수"
    FROM TBL_SUGANG T1, TBL_STUDENTS T2, TBL_OPENCOURSE T3, TBL_COURSE T4, TBL_SUBJECT T5, TBL_STATIC_SUBJECT T6, TBL_BOOK T7, TBL_SCORE T8, TBL_BAEJUM T9
    WHERE 1=1
    AND T1.STUDENT_CODE  = T2.STUDENT_CODE           --학생코드로 학생이름 가져오기
    AND T1.OPEN_C_CODE   = T3.OPEN_C_CODE            --▶개설과정코드 = 수강 + 개설과정
    AND T3.COU_NAME_CODE = T4.COU_NAME_CODE          --과정명코드로 과정이름 가져오기
    AND T3.OPEN_C_CODE   = T5.OPEN_C_CODE            --▶개설과정코드 = 개설과정 + 개설된과목
    AND T5.SUB_NAME_CODE = T6.SUB_NAME_CODE          --과목명코드로 과목이름 가져오기
    AND T5.BOOK_CODE     = T7.BOOK_CODE              --교재코드로 교재이름 가져오기 
    AND T5.SUB_CODE      = T8.SUB_CODE               --▶개설과목코드 = 개설된과목 + 성적
    AND T5.SUB_CODE      = T9.SUB_CODE               --▶개설과목코드 = 개설된과목 + 배점 → (성적 * 배점) 하기위해
    AND T1.SUGANG_CODE   = T8.SUGANG_CODE            --** 수강코드로 수강T 과 성적T를 연결 (제일 중요했음) 
    AND T5.SUB_END       < SYSDATE                   --과목기간이 지난 데이터만 출력
    AND T2.STUDENT_ID    = V_STUDENT_ID;             -- 프로시저 매개변수로 입력받은 학생ID 와 맞는 학생
        
BEGIN
    -- V_TEACHER_C를 가져오는 쿼리문
    SELECT COUNT(STUDENT_ID) INTO V_STUDENT_ID_C
    FROM TBL_STUDENTS
    WHERE STUDENT_ID = V_STUDENT_ID;
    
    -- 프로시저 호출시 매개변수로 V_STUDENT_ID 입력했을때 존재하지 않는 정보를 입력시 예외발생..
    IF(V_STUDENT_ID_C = 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- 커서 오픈 
    OPEN CUR_STUDENT_SCORE;
    
    -- 커서 오픈 시 쏟아져나오는 데이터들 처리(잡아내기)
    LOOP
        -- 한행 한행 끄집어내어 가져오는 행위 → 『FETCH』        
        FETCH CUR_STUDENT_SCORE INTO V_STUDENT_NAME, V_COURSE_NAME, V_SUB_NAME, V_SUB_START, V_SUB_END, V_BOOK_NAME, V_SCORE_AT, V_SCORE_WR, V_SCORE_PR, V_TOT, V_RANK;
        EXIT WHEN CUR_STUDENT_SCORE%NOTFOUND;
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE('학생이름 : ' || V_STUDENT_NAME || ', 과정명 : ' ||  V_COURSE_NAME || ', 과목명 : ' || V_SUB_NAME || ', 과목교육기간(시작연월일) : ' || V_SUB_START ||
        ', 과목교육기간(종료월일) : ' || V_SUB_END || ', 교재명 : ' || V_BOOK_NAME || ' [ 출결 : ' || V_SCORE_AT || ' / 필기 : ' || V_SCORE_WR || ' / 실기 : ' || V_SCORE_PR || ' / 총점 : ' || V_TOT || ' ] , 등수 : ' || V_RANK);
            
    END LOOP;
    
    -- 커서 클로즈
    CLOSE CUR_STUDENT_SCORE;
    
    COMMIT;  
    
    -- 예외 메시지 출력 
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;

/*
SET SERVEROUTPUT ON;

EXEC PRC_STUDENT_SCORE('STU1005');
*/


----------------------------------------------------------------------------------------------------------------------------------------------------------
-- TBL_COURSE 데이터 삭제 프로시저 생성 -- 정임혜
CREATE OR REPLACE PROCEDURE PRC_COURSE_D 
(
    V_COU_NAME_CODE     IN TBL_COURSE.COU_NAME_CODE%TYPE
)
IS
    -- 과정 시작일을 담기 위한 변수 선언 
    USER_DEFINE_ERROR   EXCEPTION;                     -- 공통 예외 변수
    V1_COU_NAME_CODE    NUMBER(1);                     -- 예외처리에 필요한 변수선언 
    V_COURSE_IS         NUMBER;                        -- 개강전,후를 분기하기 위한 변수 
    V_RESULT_CODE       VARCHAR(100);                  -- 출력용 1
    V_RESULT_NAME       VARCHAR(100);                  -- 출력용 2
    CURSOR CUR_COURSE IS
    SELECT COU_NAME_CODE AS V_RESULT_CODE
          , COURSE_NAME AS V_RESULT_NAME
      FROM TBL_COURSE
    ;
BEGIN

    SELECT COUNT(COU_NAME_CODE) INTO V1_COU_NAME_CODE
    FROM TBL_COURSE
    WHERE COU_NAME_CODE = V_COU_NAME_CODE;

    IF (V1_COU_NAME_CODE < 1)
    THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 개설 과정 테이블의 과정 시작일 V_COURSE_IS 변수에 담기
    SELECT COUNT(*) INTO V_COURSE_IS           -- 0 아니면 1이 있을 것이다. 
    FROM TBL_OPENCOURSE
    WHERE COU_NAME_CODE = V_COU_NAME_CODE;
            
    -- 1. 과정 개강 전이거나 과정이 끝난 이후 이면 
    IF (V_COURSE_IS = 0)
        THEN  
        --  (1) 과정 테이블의 과정 데이터가 삭제된다.
            DELETE
            FROM TBL_COURSE
            WHERE COU_NAME_CODE = V_COU_NAME_CODE;
    
    -- 2. 과정 개강 후
    ELSE    
        --  (1) 연관된 테이블의 데이터를 삭제하면,    
            --① 5레벨의 GIVEUP의 SUGANG_CODE ▶ 삭제 (자식)
            DELETE
            FROM TBL_GIVEUP
            WHERE SUGANG_CODE IN (SELECT SUGANG_CODE
                                   FROM TBL_SUGANG
                                  WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                                         FROM TBL_OPENCOURSE
                                                        WHERE COU_NAME_CODE = V_COU_NAME_CODE));
                                                        
            --② 5레벨의 SCORE의 SUB_CODE ▶ 삭제 (자식)
            DELETE
            FROM TBL_SCORE 
            WHERE SUB_CODE IN (SELECT SUB_CODE
                                FROM TBL_SUBJECT 
                               WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                                      FROM TBL_OPENCOURSE
                                                     WHERE COU_NAME_CODE = V_COU_NAME_CODE));
            
            --③ 5레벨의 BAEJUM의 SUB_CODE ▶ 삭제 (자식)                                         
            DELETE
            FROM TBL_BAEJUM
            WHERE SUB_CODE IN (SELECT SUB_CODE
                                FROM TBL_SUBJECT 
                               WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                                      FROM TBL_OPENCOURSE
                                                     WHERE COU_NAME_CODE = V_COU_NAME_CODE));
                                                     
            --④ 4레벨의 SUGANG의 OPEN_C_CODE ▶ 삭제 (자식)
            DELETE
            FROM TBL_SUGANG
            WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                   FROM TBL_OPENCOURSE
                                  WHERE COU_NAME_CODE = V_COU_NAME_CODE);


            --⑤ 3레벨의 SUBJECT의 OPEN_C_CODE ▶ 삭제 (자식)
            DELETE
            FROM TBL_SUBJECT
            WHERE OPEN_C_CODE IN (SELECT OPEN_C_CODE
                                   FROM TBL_OPENCOURSE
                                  WHERE COU_NAME_CODE = V_COU_NAME_CODE);
         
            
            --⑥ 2레벨의 OPENCOURSE의 OPEN_C_CODE ▶ 삭제 (부모)
            DELETE
            FROM TBL_OPENCOURSE
            WHERE COU_NAME_CODE = V_COU_NAME_CODE;
        
        
        -- (2) 과정 테이블의 과정 데이터가 삭제된다. 
        
            --⑦ 1레벨의 COURSE의 특정 과정(V_COU_NAME_CODE)이 삭제된다.=폐강된다
            DELETE
            FROM TBL_COURSE
            WHERE COU_NAME_CODE = V_COU_NAME_CODE;
    END IF;    
    
    COMMIT;

    
    OPEN CUR_COURSE;
    LOOP
        FETCH CUR_COURSE INTO V_RESULT_CODE, V_RESULT_NAME;
        EXIT WHEN CUR_COURSE%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('COU_NAME_CODE : ' || V_RESULT_CODE || ', COURSE_NAME : ' || V_RESULT_NAME);
    END LOOP;
    CLOSE CUR_COURSE;


    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001,'잘못된 코드를 입력하셨습니다.'); -- 해당 코드가 코스에 존재하지 않습니다.
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------
-- 뷰 생성

-- 관리자가 등록된 모든 강사 정보 조회하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_ADMIN_TEACHERS -- 강사관리 뷰 생성
AS
SELECT TEA.TEACHER_NAME"교수자명", 	NVL(SS.SUB_NAME,'해당사항없음')"배정된과목명", NVL(TO_CHAR(SU.SUB_START),'해당사항없음')"과목시작", NVL(TO_CHAR(SU.SUB_END),'해당사항없음')"과목종료", NVL(BK.BOOK_NAME,'해당사항없음')"교재명", NVL(CL.CLASS_NAME,'해당사항없음')"강의실", 
        CASE WHEN SYSDATE < OPEN.COU_START THEN '강의예정' 
             WHEN SYSDATE > OPEN.COU_END THEN '강의종료' 
             WHEN SYSDATE > OPEN.COU_START AND SYSDATE < OPEN.COU_END THEN '강의중'
             ELSE '해당사항없음' 
        END"강의진행여부"
FROM TBL_TEACHERS TEA, TBL_STATIC_SUBJECT SS, TBL_SUBJECT SU, TBL_OPENCOURSE OPEN, TBL_BOOK BK, TBL_CLASS CL
WHERE TEA.TEACHER_CODE = OPEN.TEACHER_CODE(+)
  AND OPEN.OPEN_C_CODE = SU.OPEN_C_CODE(+)
  AND SU.SUB_NAME_CODE = SS.SUB_NAME_CODE(+)
  AND SS.SUB_NAME_CODE(+) = SU.SUB_NAME_CODE
  AND SU.BOOK_CODE = BK.BOOK_CODE(+)
  AND BK.BOOK_CODE(+) = SU.BOOK_CODE
  AND SU.OPEN_C_CODE(+) = OPEN.OPEN_C_CODE
  AND OPEN.CLASS_CODE = CL.CLASS_CODE(+)
  AND TEA.TEACHER_NAME != '미정'
ORDER BY 1;

--------------------------------------------------------------------------------------------------------------------------------
-- 관리자가 등록된 모든 과정 정보 조회하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_ADMIN_COURSE
AS
SELECT CU.COURSE_NAME"과정명",NVL(CL.CLASS_NAME,'해당사항없음')"강의실",  NVL(SS.SUB_NAME,'해당사항없음')"배정된과목명", NVL(TO_CHAR(SUB.SUB_START),'해당사항없음')"과목시작",NVL(TO_CHAR(SUB.SUB_END),'해당사항없음')"과목끝",  NVL(BK.BOOK_NAME,'해당사항없음')"교재명", NVL(TEA.TEACHER_NAME,'해당사항없음')"교수자명"
FROM TBL_COURSE CU, TBL_CLASS CL, TBL_SUBJECT SUB,TBL_STATIC_SUBJECT SS, TBL_BOOK BK, TBL_TEACHERS TEA, TBL_OPENCOURSE OPEN
WHERE CU.COU_NAME_CODE = OPEN.COU_NAME_CODE(+)
  AND OPEN.CLASS_CODE = CL.CLASS_CODE(+)
  AND CL.CLASS_CODE(+) = OPEN.CLASS_CODE
  AND OPEN.OPEN_C_CODE = SUB.OPEN_C_CODE(+)
  AND SUB.SUB_NAME_CODE = SS.SUB_NAME_CODE(+)
  AND SS.SUB_NAME_CODE(+) = SUB.SUB_NAME_CODE
  AND SUB.BOOK_CODE = BK.BOOK_CODE(+)
  AND BK.BOOK_CODE(+) = SUB.BOOK_CODE
  AND SUB.OPEN_C_CODE(+) = OPEN.OPEN_C_CODE
  AND OPEN.TEACHER_CODE = TEA.TEACHER_CODE(+)
ORDER BY 1;

SELECT *
FROM TBL_COURSE;

--------------------------------------------------------------------------------------------------------------------------------
-- 관리자가 등록된 모든 과목 정보 조회하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_ADMIN_SUBJECT
AS
SELECT CU.COURSE_NAME"과정명",NVL(CL.CLASS_NAME,'해당사항없음')"강의실",  NVL(SS.SUB_NAME,'해당사항없음')"배정된과목명", NVL(TO_CHAR(SUB.SUB_START),'해당사항없음')"과목시작",NVL(TO_CHAR(SUB.SUB_END),'해당사항없음')"과목끝",  NVL(BK.BOOK_NAME,'해당사항없음')"교재명", NVL(TEA.TEACHER_NAME,'해당사항없음')"교수자명"
FROM TBL_COURSE CU, TBL_CLASS CL, TBL_SUBJECT SUB,TBL_STATIC_SUBJECT SS, TBL_BOOK BK, TBL_TEACHERS TEA, TBL_OPENCOURSE OPEN
WHERE CU.COU_NAME_CODE = OPEN.COU_NAME_CODE(+)
  AND OPEN.CLASS_CODE = CL.CLASS_CODE(+)
  AND CL.CLASS_CODE(+) = OPEN.CLASS_CODE
  AND OPEN.OPEN_C_CODE = SUB.OPEN_C_CODE(+)
  AND SUB.SUB_NAME_CODE = SS.SUB_NAME_CODE(+)
  AND SS.SUB_NAME_CODE(+) = SUB.SUB_NAME_CODE
  AND SUB.BOOK_CODE = BK.BOOK_CODE(+)
  AND BK.BOOK_CODE(+) = SUB.BOOK_CODE
  AND SUB.OPEN_C_CODE(+) = OPEN.OPEN_C_CODE
  AND OPEN.TEACHER_CODE = TEA.TEACHER_CODE(+)
ORDER BY 1;

------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 관리자가 등록된 모든 학생 정보 조회하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_ADMIN_STUDENT
AS
SELECT STU.STUDENT_NAME"학생이름", NVL(COU.COURSE_NAME,'해당사항없음')"수강과정", NVL(SS.SUB_NAME,'해당사항없음')"수강과목",NVL(TO_CHAR(SC.SCORE_WR + SC.SCORE_PR + SC.SCORE_AT),'해당사항없음')"수강과목총점"
        , CASE WHEN SU.GIVEUP_YN = 1 THEN '중도탈락' 
               WHEN SS.SUB_NAME IS NULL THEN '해당사항없음'
               ELSE '수강중'  
               END "중탈여부"
FROM (((((TBL_SCORE SC JOIN TBL_SUGANG SU
ON SC.SUGANG_CODE = SU.SUGANG_CODE) JOIN TBL_SUBJECT S
ON S.SUB_CODE = SC.SUB_CODE) JOIN TBL_OPENCOURSE OP
ON S.OPEN_C_CODE = OP.OPEN_C_CODE)JOIN TBL_COURSE COU
ON OP.COU_NAME_CODE = COU.COU_NAME_CODE)) JOIN TBL_STATIC_SUBJECT SS
ON S.SUB_NAME_CODE = SS.SUB_NAME_CODE
RIGHT JOIN  TBL_STUDENTS STU
ON STU.STUDENT_CODE = SU.STUDENT_CODE;
  
--------------------------------------------------------------------------------------------------------------------------------
-- 등록된 모든 교재 정보 출력하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_BOOK
AS
SELECT *
FROM TBL_BOOK
WHERE BOOK_CODE != 'BO0000';

--------------------------------------------------------------------------------------------------------------------------------
-- 등록된 모든 강의실 정보 출력하는 뷰 생성
CREATE OR REPLACE VIEW VIEW_CLASS
AS
SELECT *
FROM TBL_CLASS
WHERE CLASS_CODE != 'CL0000';


