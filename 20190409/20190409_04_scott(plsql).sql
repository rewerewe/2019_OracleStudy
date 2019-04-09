SELECT USER
FROM DUAL;
--==>> SCOTT

-------------------------------------------------------------------------

/*

    ※ 참고
    
    1. INSERT, UPDATE, DELETE, (MERGE)
        →  DML (Data Manipulation Language)
        COMMIT / ROLLBACK 이 필요하다. 
    
    2. CREATE, DROP, ALTER, (TRUNCATE)
        →  DDL (Data Definition Language)
        실행하면 자동으로 COMMIT 된다. 
  
    3. GRANT, REVOKE
        → DCL (DATA CONTROL LANGUAGE)
        실행하면 자동으로 COMMIT 된다.
        
    4. COMMIT, ROLLBACK 
        → TCL (TRANSACTION CONTROL LANGUAGE)
        
        정적 PL/SQL문 → DML문, TCL문만 사용가능 
        동적 PL/SQL문 → DML문, DDL문, DCL문, TCL문 사용 가능하다.
        
    ▶ 트랜잭션 Transaction
    
    (1) 통신사 할인-카드사 결제
        통신사에서 주는 포인트 차감되었지만,                        UPDATE   ○     Ⅹ
        결제내역에는 반영되지 않아 결제금에서 차감되지 않은 상황     UPDATE   ○     Ⅹ
        → 불가능한 상황                                                 COMMIT ROLLBACK
    
    (2) 타은행간 거래
        훈의(우리) - 상현(국민) 계좌이체 진행,
        100 만원       0   
         70 만원      30 만원 
        UPDATE수행   UPDATE수행
            ㄴ__________ 」       
    
        개별적인 업무지만, 묶어서 동일한 업무로 처리해야만 하는 것 → 트랜젝션 처리 개념. 
        
-----------------------------------------------------------------------------------

    ■■■ PROCEDURE (프로시저) ■■■

    1. PL/SQL에서 가장 대표적인 구조인 스토어드 프로시저는
       개발자가 자주 작성해야 하는 업무의 흐름을
       미리 작성하여 데이터베이스 내에 저장해 두었다가
       필요할 때마다 호출하여 실행할 수 있도록 처리해 주는 구문이다.
       
    2. 형식 및 구조
    
        CREATE [ OR REPLACE ] PROCEDURE 프로시저명
        [(
            매개변수 IN     데이터타입         -- 생닭
         ,  매개변수 OUT    데이터타입         -- 그릇
         ,  매개변수 INOUT  데이터타입         -- 그릇에 담긴 생닭
        )]
        IS
            [-- 주요 변수 선언;]
        BEGIN
            --실행구문;
            ...
            [EXCEPTION
                -- 예외 처리 구문;]
        END;
        
    ※ FUNCTION 과 비교했을 때,
       『RETURN 반환자료형』 부분이 존재하지 않으며,
       『RETURN』문 자체도 존재하지 않으며,
       프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
       IN, OUT, INOUT으로 구분된다.
       
    3. 실행(호출)
    
        EXEC[UTE] 프로시저명 [(인수1, 인수2, ...)];
       
        
    편의상 INSERT 프로시저, UPDATE 프로시저, DELETE 프로시저를 가장 많이 씁니다. 

*/

--------------------------------------------------------------------------------

--○ INSERT 쿼리 실행을 프로시저로 작성 (INSERT 프로시저)

-- 실습 테이블 생성(TBL_STUDENTS) : 이해를 돕기 위한 테이블입니다. 1:1 구조라 바람직한 테이블은 아니예요.

CREATE TABLE TBL_STUDENTS
( ID    VARCHAR2(10)
, NAME  VARCHAR2(40)
, TEL   VARCHAR2(20)
, ADDR  VARCHAR2(100)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.

-- 실습 테이블 생성(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PW PRIMARY KEY(ID)
);
--==>> Table TBL_IDPW이(가) 생성되었습니다.

-- 두 테이블 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman', '전훈의', '010-1111-1111', '제주도 서귀포시');

INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman', 'java006$');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_STUDENTS;
--==>> superman	전훈의	010-1111-1111	제주도 서귀포시

SELECT *
FROM TBL_IDPW;
--==>> superman	java006$


------------------------------------------------------------------------------12:00

--위의 업무를 프로시저 (INSERT 프로시저, 입력 프로시저)를 생성하게 되면 
EXEC PRC_STUDENTS_INSERT('batman', 'java006$', '남상현', '010-2222-2222', '서울')
-- 이와 같은 구문 한줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다. 

--프로시저 생성(작성)
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
(
    V_ID    IN TBL_IDPW.ID%TYPE
,   V_PW    IN TBL_IDPW.PW%TYPE
,   V_NAME  IN TBL_STUDENTS.NAME%TYPE
,   V_TEL   IN TBL_STUDENTS.TEL%TYPE
,   V_ADDR  IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW 테이블에 데이터 입력
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS 테이블에 데이터 입력
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT이(가) 컴파일되었습니다.



/*
    프로시저 테이블 삭제 ***
    DROP PROCEDURE 테이블명 
*/



--------------------------------------------------------------------------------


--○ 데이터 입력시 특정 항목의 데이터(학번, 이름, 국어점수, 수학점수)만 입력하면 
--   내부적으로 총점, 평균, 등급 항목이 함께 입력 처리될 수 있도록 하는 
--   프로시저를 생성한다.
--   프로시저명 : PRC_SUNGJUK_INSERT()

/*
    실행 예)
    
    EXEC PRC_SUNGJUK_INSERT(1, '이원영', 90, 80, 70);
    
    프로시저 호출로 처리된 결과)
    학번      이름      국어점수    영어점수    수학점수    총점      평균      등급
     1      이원영         90         80         70        240       80         B 
*/
SELECT *
FROM TBL_SUNGJUK;

DESC TBL_SUNGJUK;

-- 프로시저 생성
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN TBL_SUNGJUK.MAT%TYPE
)
IS 
    V_TOT     IN TBL_SUNGJUK.TOT%TYPE;
    V_AVG     IN TBL_SUNGJUK.AVG%TYPE;
    V_GRADE   IN TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    V_AVG := V_TOT / 3
    V_GRADE := CASE  WHEN V_AVG >= 90
                        THEN    V_GRADE = 'A'
                    WHEN V_AVG >= 80 
                        THEN    V_GRADE = 'B'
                    WHEN V_AVG >= 70 
                        THEN    V_GRADE = 'C'
                    WHEN V_AVG >= 60
                        THEN    V_GRADE = 'D'
                    ELSE 'F'
                END; 
                
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GREADE) 
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
END;

-- 함께 풀이한 내용
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
(
  V_HAKBUN   IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME    IN  TBL_SUNGJUK.NAME%TYPE
, V_KOR     IN  TBL_SUNGJUK.KOR%TYPE
, V_ENG     IN  TBL_SUNGJUK.ENG%TYPE
, V_MAT     IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    --INSERT 쿼리문을 수행하는데 필요한 주요 변수 선언
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    --아래의 쿼리문 실행을 위해서는 
    --선언한 변수들에 값을 담아내야 한다. 
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;

   

    --INSERT 쿼리문 실행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
END;

--==>>Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------


--○ TBL_SUNGJUK 테이블에서 
--   특정 학생의 점수(학번, 국어점수, 영어점수, 수학점수
--   데이터 수정 시 총점, 평균, 등급까지 수정하는 프로시저를 작성한다.
--   프로시저명 : PRC_SUNGJUK_UPDATE()
/*
    실행 예)
    EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);
    
    프로시저 호출로 처리된 결과)
    학번      이름      국어점수    영어점수    수학점수    총점      평균      등급
     1      이원영         50         50         50        150       50         F 

*/
-- 내가 풀이한 내용 
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN  IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE    
)
IS
    V_NAME  TBL_SUNGJUK.NAME%TYPE;
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF ( V_AVG >= 90 )
        THEN    V_GRADE := 'A';
    ELSIF ( V_AVG >= 80 )
        THEN    V_GRADE := 'B';
    ELSIF ( V_AVG >= 70 )
        THEN    V_GRADE := 'C';
    ELSIF ( V_AVG >= 60 )
        THEN    V_GRADE := 'D';
    ELSE 
        V_GRADE := 'F';
    END IF;
    
    

    
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES (V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.


        V_GRADE := (CASE V_AVG/10
                    WHEN 9 THEN 'A'
                    WHEN 8 THEN 'B'
                    WHEN 7 THEN 'C'
                    WHEN 6 THEN 'D'
                    ELSE 'F'
                END );
-- 함께 풀이한 내용
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
(  V_HAKBUN IN  TBL_SUNGJUK.HAKBUN%TYPE
,  V_KOR    IN  TBL_SUNGJUK.KOR%TYPE
,  V_ENG    IN  TBL_SUNGJUK.ENG%TYPE
,  V_MAT    IN  TBL_SUNGJUK.MAT%TYPE
)
IS
    --UPDATE 진행 시 필요한 데이터를 담을 주요 변수 선언
    V_TOT   TBL_SUNGJUK.TOT%TYPE;
    V_AVG   TBL_SUNGJUK.AVG%TYPE;
    V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF ( V_AVG >= 90 )
        THEN    V_GRADE := 'A';
    ELSIF ( V_AVG >= 80 )
        THEN    V_GRADE := 'B';
    ELSIF ( V_AVG >= 70 )
        THEN    V_GRADE := 'C';
    ELSIF ( V_AVG >= 60 )
        THEN    V_GRADE := 'D';
    ELSE 
        V_GRADE := 'F';
    END IF;
    
    -- UPDATE 쿼리문 수행
    UPDATE TBL_SUNGJUK
    SET KOR=V_KOR, ENG=V_ENG, MAT=V_MAT, TOT=V_TOT, AVG=V_AVG, GRADE=V_GRADE
    WHERE HAKBUN = V_HAKBUN;
   
    -- COMMIT
    COMMIT;
END;
--==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------


--○ TBL_STUDENTS 테이블에서 
--   전화번호와 주소 데이터를 수정하는(변경하는) 프로시저를 작성한다.
--   단, ID와 PW 가 일치하는 경우에만 수정을 진행할 수 있도록 한다.
--   프로시저명 : PRC_STUDENTS_UPDATE()
/*
    실행 예)
    ECEC PRC_STUDENTS_UPDATE('superman', 'java006$','010-9999-9999','경기')
    
    프로시저 호출로 처리된 결과 
    superman    전훈의     010-9999-9999   경기  
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN TBL_STUDENTS.ID%TYPE
, V_PW  IN TBL_IDPW.PW%TYPE
, V_TEL IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS    
BEGIN
    
    UPDATE TBL_STUDENTS 
    SET ID=V_ID, TEL=V_TEL, ADDR=V_ADDR
    WHERE ID = (SELECT ID
                  FROM TBL_IDPW
                 WHERE ID =V_ID
                   AND PW =V_PW);

    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.



CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID  IN TBL_IDPW.ID%TYPE
, V_PW  IN TBL_IDPW.PW%TYPE
, V_TEL IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE 쿼리문 구성
    UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
            FROM TBL_IDPW I JOIN TBL_STUDENTS S
            ON I.ID = S.ID ) T
    SET T.TEL=V_TEL, T.ADDR=V_ADDR
    WHERE T.ID=V_ID AND T.PW=V_PW;
    
    -- 커밋
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------

--○ TBL_INSA 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
-- NUM, NAME, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
-- 구조를 갖고 있는 대상 테이블에 데이터 입력 시
-- NUM 컬럼(사원번호)의 값은
-- 기존 부여된 사원번호 마지막 번호의 그 다음 번호를 자동으로 
-- 입력 처리할 수 있는 프로시저로 구성한다.
-- 프로시저명 : PRC_INSA_INSERT(NAME, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)

CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME     IN TBL_INSA.NAME%TYPE    
, V_SSN      IN TBL_INSA.SSN%TYPE
, V_IBSADATE IN TBL_INSA.IBSADATE%TYPE
, V_CITY     IN TBL_INSA.CITY%TYPE
, V_TEL      IN TBL_INSA.TEL%TYPE
, V_BUSEO    IN TBL_INSA.BUSEO%TYPE
, V_JIKWI    IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY IN TBL_INSA.BASICPAY%TYPE    
, V_SUDANG   IN TBL_INSA.SUDANG%TYPE
)
IS
    V_NUM   TBL_INSA.NUM%TYPE;
BEGIN
 
    SELECT MAX(NUM) INTO V_NUM FROM TBL_INSA;
    
    INSERT INTO TBL_INSA(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES (V_NUM+1, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
    
    COMMIT;
END;
--==>> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.

