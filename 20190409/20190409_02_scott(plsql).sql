SELECT USER
FROM DUAL;
--SCOTT

--○ SCOTT.TBL_INSA 테이블의 여러명의 데이터 여러개의 변수에 저장 
--   (반복문 활용) 실무에서는 커서를 쓰게 될 것이다. 지금은 커서를 사용할 수 없어 반복문을 사용한다.

SET SERVEROUTPUT ON;

DECLARE
    VINSA  TBL_INSA%ROWTYPE;
    VNUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN

    LOOP
        SELECT NAME, TEL, BUSEO INTO VINSA.NAME, VINSA.TEL, VINSA.BUSEO
        FROM TBL_INSA
        WHERE NUM=VNUM;
        
        DBMS_OUTPUT.PUT_LINE(VINSA.NAME || '-' || VINSA.TEL || '-'
                                || VINSA.BUSEO);
        EXIT WHEN VNUM >= 1060;
        
        VNUM := VNUM + 1;   --VNUM을 1만큼 증가
        
    END LOOP;

END;

-- 여러명의 데이터를 담을 수 없다. 담고 출력하고를 반복했을 뿐.

-----------------------------------------------------------------------------------------------------
/*
    ■■■ FUNCTION(함수) ■■■
    
    1. 함수란 하나 이상의 PL/SQL 문으로 구성된 서브루틴으로 
       코드를 다시 사용할 수 있도록 캡슐화 하는데 사용된다.
       오라클에서는 오라클에 정의된 기본 제공 함수를 사용하거나
       직접 스토어드 함수를 만들 수 있다 (→ 사용자 정의 함수)
       이 사용자 정의 함수는 시스템 함수터럼 쿼리에서 호출하거나
       저장 프로시저처럼 EXCUTE 문을 통해 실행할 수 있다.

    2. 형식 및 구조
    
        CREATE OR REPLACE FUNCTION 함수명
               ----------
              [ 생략가능 ]
        [(
            매개변수1   자료형
          , 매개변수2   자료형
        
        )]
        RETURN 데이터타입            → 자바에서 public int 
        IS
            -- 주요 변수 선언(지역 변수) 
            변수 변수타입;
        BEGIN
            -- 실행문
            ...
            연산;
            출력;
            RETURN (값);
            
            [EXCEPTION]
                -- 예외처리 구문;
        END;
        
    3. 한번 만들고 끝이 아니라. 필요할 때 만들어 쓰고, 수정해서 쓸 수 있는 것이 함수. 
*/

/*
    ※ 사용자 정의 함수(스토어드 함수)는
       IN 파라미터(입력 매개변수)만 사용할 수 있으며
       반드시 반환될 값의 데이터타입을 RETURN 문에 선언해야 하고,
       FUNCTION은 반드시 단일 값만 반환한다. 
*/

--○ TBL_INSA 테이블에서 주민등록번호를 가지고 성별을 조회한다.


SELECT NAME, SSN, DECODE(SUBSTR(SSN, 8, 1), '1', 남자, '2', 여자) "성별"; 
FROM TBL_INSA; 

--○ FUNCTION 생성
-- 함수명 : FN_GENDER( )
--                   --- SSN(주민등록번호) → 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
( 
    VSSN VARCHAR2     --매개변수 : 자릿수(길이) 지정안함
)
RETURN VARCHAR2       --반환 자료형 : 자릿수(길이) 지정안함 
IS
    -- 주요 변수 선언
    VRESULT VARCHAR2(20);
BEGIN
    -- 연산 및 처리
    IF ( SUBSTR(VSSN, 8, 1) IN ('1','3') )
        THEN VRESULT := '남자';
    ELSIF   ( SUBSTR(VSSN, 8, 1) IN ('2', '4') )
        THEN VRESULT := '여자';
    ELSE
        VRESULT := '성별확인불가';
    END IF;
    
    RETURN VRESULT;
END;

--==>> Function FN_GENDER이(가) 컴파일되었습니다.


--○ 임의의 정수 두개를 매개변수(입력 파라미터)로 넘겨받아
--   A 의 B 승 값을 반환하는 사용자 정의 함수를 작성한다.
--   함수명 : FN_POW()

/*
    사용 예)
    SELECT FN_POW(10, 3)
    FROM DUAL;
    --==>> 1000
*/
CREATE OR REPLACE FUNCTION FN_POWME
(
    NUM1    NUMBER
  , NUM2    NUMBER
)
RETURN  NUMBER
IS
    -- 주요변수선언
    VRESULT NUMBER := 1; 
    VNUM    NUMBER := NUM2;
BEGIN
    -- 연산 및 처리
    WHILE ( VNUM > 0 ) LOOP
       VRESULT := VRESULT * NUM1;
       VNUM := VNUM - 1;
    END LOOP;
    RETURN VRESULT;
END;
--==>> Function FN_POW이(가) 컴파일되었습니다.


-----------------------------------------------
-- 함께 풀이한 내용

CREATE OR REPLACE FUNCTION FN_POWTO (A NUMBER, B NUMBER)
RETURN NUMBER
IS 
    V_RESULT    NUMBER := 1;        -- 누적곱
    V_NUM       NUMBER;
BEGIN

    FOR V_NUM IN 1..B LOOP          -- 매개변수 B 
        V_RESULT := V_RESULT * A;   -- 매개변수 A
    END LOOP;

    RETURN V_RESULT;    
END;

--==>> Function FN_POW이(가) 컴파일되었습니다.

-----------------------------------------------

--○ TBL_INSA 테이블의 급여 계산 전용 함수를 정의한다.
--   급여는 (기본급 *12)+수당 기반으로 연산을 수행한다.
--   함수명 : FN_PAY(기본급, 수당)

-- 내가 풀이한 내용 
CREATE OR REPLACE FUNCTION FN_PAY 
( 
  BASICPAY  TBL_INSA.BASICPAY%TYPE
, SUDANG    TBL_INSA.SUDANG%TYPE
)
RETURN NUMBER
IS
    SALARY      NUMBER;
BEGIN
    SALARY := (BASICPAY * 12) + SUDANG;
    
    RETURN SALARY;
END;
--==>> Function FN_PAY이(가) 컴파일되었습니다.


DESC TBL_INSA;

-----------------------------------------------

--○ TBL_INSA 테이블의 입사일을 기준으로 
--   현재까지의 근무년수를 반환하는 함수를 정의한다.
--   단, 근무년수는 소수점 이하 한자리까지 계산한다.
--   함수명 : FN_WORKYEAR(입사일)

-- 내가 풀이한 내용

SELECT *
FROM TBL_INSA;

CREATE OR REPLACE FUNCTION FN_WORKYEAR
(   
    IBSADATE    DATE
)
RETURN NUMBER
IS 
    WORKYEAR    NUMBER;
BEGIN
    WORKYEAR := TRUNC(((SYSDATE - IBSADATE) / 365), 1);
                                                   -- 자릿수. 몫을 취하고 나머지는 버리는데, 나머지 중 1자리수는 남겨두고 버린다.
    RETURN WORKYEAR;                                               
    
END;
--==>> Function FN_WORKYEAR이(가) 컴파일되었습니다.


DESC TBL_INSA;
