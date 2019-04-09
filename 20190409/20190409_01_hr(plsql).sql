/*
    ○ %TYPE
    
    1. 특정 테이블에 포함되어 있는 컬럼의 자료형을 참조하는 데이터타입
    
    2. 형식 및 구조 
    
        변수명 테이블명.컬럼명%TYPE [ := 초기값 ];

    실제로 그 타입과 같은 값만 담을 수 있는 변수 선언이 아니라.
    타입이 무엇인지 몰라도 담을 수 있는 변수 선언.
*/

SELECT FIRST_NAME
FROM EMPLOYEES;

DESC EMPLOYEES;

SET SERVEROUTPUT ON;

--○ HR.EMPLOYEES 테이블의 특정 데이터를 변수에 저장

DECLARE
    --VNAME VARCHAR2(2);
    VNAME   EMPLOYEES.FIRST_NAME%TYPE;  -- VARCHAR2(20)
BEGIN
    SELECT FIRST_NAME INTO VNAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(VNAME);
END;
--==>> 출력 
-- PL/SQL 프로시저가 성공적으로 완료되었습니다.

/*

    ○ %ROWTYPE
    
    1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러 개의 컬럼)
    
    2. 형식 및 구조
        
        변수명 테이블명%ROWTYPE;
*/

DESC EMPLOYEES;

--○ HR.EMPLOYEES 테이블의 데이터 여러개를 변수에 저장

DECLARE
    --VNAME   VARCHAR2(20);
    --VPHONE  VARCHAR2(20);
    --VMAIL   VARCHAR2(25);
    VNAME   EMPLOYEES.FIRST_NAME%TYPE;
    VPHONE  EMPLOYEES.PHONE_NUMBER%TYPE;
    VMAIL   EMPLOYEES.EMAIL%TYPE;
    
    VEMP    EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
      INTO VEMP.FIRST_NAME, VEMP.PHONE_NUMBER, VEMP.EMAIL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID=103;
     
     DBMS_OUTPUT.PUT_LINE(VEMP.FIRST_NAME || '-' || VEMP.PHONE_NUMBER || 
                            '-' || VEMP.EMAIL);
END;

-- PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ HR.EMPLOYEES 테이블의 여러명 데이터, 여러개 변수에 저장 

DESC EMPLOYEES;

DECLARE
    VEMP EMPLOYEES%ROWTYPE;
BEGIN
    SELECT
      INTO
      FROM
     WHERE
END;
/*

*/
--> 여러 개의 행(ROWS) 정보를 얻어와 담으려고 하면
--  변수에 저장하는 것 자체가 불가능한 상황...

-- 불가 
