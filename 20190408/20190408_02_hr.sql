SELECT USER
FROM DUAL;
--HR

--○ EMPLOYEES 테이블의 직원들 SALARY를 10% 인상한다.
--   단, 부서명이 'IT' 인 경우로 한정한다.
--   (결과 확인 후 ROLLBACK)

--내가 풀이한 내용
SELECT E.FIRST_NAME "성", E.LAST_NAME "이름", D.DEPARTMENT_ID "부서번호", D.DEPARTMENT_NAME "부서명", E.SALARY "인상전급여", E.SALARY * 1.1 "인상후급여" 
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT * 
FROM EMPLOYEES;


SELECT E.FIRST_NAME "성", E.LAST_NAME "이름",  E.SALARY "인상전급여" , D.DEPARTMENT_ID "부서번호", D.DEPARTMENT_NAME "부서명"
     , (
            SELECT E.SALARY * 1.1 "인상후급여"
            FROM DEPARTMENTS D
            WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ) 
FROM EMPLOYEES E;


SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';


-- 함께 풀이한 내용 
--(1)
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=60;

--(2) 오라클에서 자동으로 찾을 수 있도록 구문 수정 
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(DEPARTMENTS 테이블에서 IT부서의 부서ID);

--(3) 한글로 명시한 조건을 SQL 질의어로 변환 
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID
                     FROM DEPARTMENTS 
                     WHERE DEPARTMENT_NAME='IT');

--(4) UPDATE 실행
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID
                     FROM DEPARTMENTS 
                     WHERE DEPARTMENT_NAME='IT');

--==>> 5개 행 이(가) 업데이트되었습니다.

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID
                     FROM DEPARTMENTS 
                     WHERE DEPARTMENT_NAME='IT');
/*
Alexander	Hunold	9900	60
Bruce	Ernst	6600	60
David	Austin	5280	60
Valli	Pataballa	5280	60
Diana	Lorentz	4620	60
*/

ROLLBACK;
--==>> 롤백 완료.



--○ EMPLOYEES 테이블에서 JOB_TITLE 이 『Sales Manager』인 사원들의 
--   SALARY 를 해당 직무(직종)의 최고 급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당년도 제외) 입사자에 한하여 
--   적용할 수 있도록 처리한다.
--   (결과 확인 후 ROLLBACK)

-- 내가 풀이한 내용 
SELECT *
FROM JOBS
WHERE JOB_TITLE ='Sales Manager';
SELECT *
FROM EMPLOYEES;


SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY "급여", MAX_SALARY "변경후급여"
FROM EMPLOYEES 
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS 
                WHERE JOB_TITLE='Sales Manager');


UPDATE EMPLOYEES
SET SALARY = ( SELECT MAX_SALARY
               FROM JOBS
               WHERE JOB_ID = EMPLOYEES.JOB_ID);
--==>> 107개 행 이(가) 업데이트되었습니다.

ROLLBACK;
--==>> 롤백 완료.

SELECT *
FROM EMPLOYEES;



-- 함께 풀이한 내용 

SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = (Sales Manager 의 MAX_SALARY)
WHERE JOB_ID = (Sales Manager 의 JOB_ID)
        TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;

--(Sales Manager 의 MAX_SALARY)
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE='Sales Manager';
--==>> 20080

--(Sales Manager 의 JOB_ID)
SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE='Sales Manager';
--==> SA_MAN


UPDATE EMPLOYEES
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE='Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE='Sales Manager')
AND        TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
--==>> 3개 행 이(가) 업데이트되었습니다.

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE='Sales Manager')
AND        TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) <= 2005;
/*
John	    20080
Karen	20080
Alberto	20080
*/


--○ EMPLOYEES 테이블에서 SALARY를 
--   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
--   Finance → 10%
--   Executive → 15%
--   Accountion → 20%
--   나머지 0%
--   (결과 확인 후 ROLLBACK)


-- 내가 풀이한 내용 
--(1) DECODE 활용 
UPDATE EMPLOYEES
SET SALARY = DECODE(DEPARTMENT_ID, ( SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME='Finance' ), (SALARY * 1.1)                                   
                                 , ( SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME='Executive' ), (SALARY * 1.5)
                                 , ( SELECT DEPARTMENT_ID
                                     FROM DEPARTMENTS
                                     WHERE DEPARTMENT_NAME='Accounting' ), (SALARY * 2)
                                 , SALARY);
-- 107개 행 이(가) 업데이트되었습니다.
--WHERE DEPARTMENT_ID;

-- 확인 구문 ----------------------------------------------------------------------------------
SELECT SALARY "급여", DEPARTMENT_ID"부서번호", DECODE(DEPARTMENT_ID, '100', (SALARY * 1.1)                                   
                                                                  , '90' , (SALARY * 1.5)
                                                                  , '110', (SALARY * 2)
                                                                  , SALARY) "변경후급여"
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;


SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Finance';

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Executive';

SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Accounting';

--(2) CASE 문 활용
UPDATE EMPLOYEES 
SET SALARY = (CASE DEPARTMENT_ID WHEN ( SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME='Finance')
                    THEN SALARY * 1.1
                   WHEN ( SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME='Executive')
                    THEN SALARY * 1.5
                   WHEN ( SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME='Accounting')
                    THEN SALARY * 2
                   ELSE SALARY
                 END )

WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));




ROLLBACK;
--=>> 롤백 완료.
----------------------------------------------------------------------------------------------

-- 함께 풀이한 내용 
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM EMPLOYEES;
--(1)
----------------------------------------------------------------------------------------------
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Executive' 
                                        )
                                THEN SALARY * 1.5
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Accounting')
                                THEN SALARY * 2                               
                                ELSE SALARY
             END;
--==>> 107개 행 이(가) 업데이트되었습니다.

--('Finance'의 부서아이디)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME ='Finance' 

--('Executive'의 부서아이디)
SELECT DEPARTMEMT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME ='Executive' 

--('Accounting'의 부서아이디)
SELECT DEPARTMEMT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME ='Accounting'
----------------------------------------------------------------------------------------------

ROLLBACK;
--=>> 롤백 완료.

-- 아래와 같이 작성하면 결과는 출력되나, 107개 모든 행의 데이터가 메모리게 올라간다.
-- 그러므로 명시된 부서의 데이터만 골라서 적용할 수 있는 쿼리문을 작성하는 것이 메모리를 덜 사용할 수 있다. 
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Executive' 
                                        )
                                THEN SALARY * 1.5
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Accounting')
                                THEN SALARY * 2                               
                                ELSE SALARY
             END;
-- WHERE 절을 써서 조건을 지정해주자. 
WHERE DEPARTMENT_ID 

-- 그러나 사실 DEPARTMENTS 테이블의 DEPARTMENT_NAME 이어야 하므로. 
SELECT DEPARTMENT_ID
FROM DEPARTMENS
WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting');

-- 다시 실행시켜보자.

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Finance')
                                THEN SALARY * 1.1
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Executive' 
                                        )
                                THEN SALARY * 1.5
                                WHEN (SELECT DEPARTMENT_ID
                                        FROM DEPARTMENTS
                                        WHERE DEPARTMENT_NAME ='Accounting')
                                THEN SALARY * 2                               
                                ELSE SALARY
             END
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENS
                       WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));

--------------------------------------------------------------------------------------------------------- 실습 끝.


/*

    ■■■ DELETE ■■■
    
    1. 테이블에서 지정된 행(레코드)을 삭제하는 데 사용하는 구문.
    
    2. 형식 및 구조
    
        DELETE [FROM] 테이블명
        [WHERE 조건절];
        
*/

--(1) 
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;

--(2) 
DELETE 
FROM EMPLOYEES
WHERE EMPLOYEE_ID=198;
--==>> 1 행 이(가) 삭제되었습니다.

ROLLBACK;
--==>> 롤백 완료.


------------------------------------------------------------------------------DELETE 실습 문제 

--○ EMPLOYEES 테이블에서 직원들의 정보를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.

--※ 실제로는 EMPLOYEES 테이블의 데이터가 (삭제하고자 하는 대상)
--   다른 테이블(혹은 자기자신 테이블)에 의해 참조당하는 경우 
--   삭제되지 않을 수 있다는 사실을 염두해두어야 하며, 
--   그에 대한 이유도 알아야 한다. 

SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='IT';

DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');

--==>> 에러 발생
/*
    오류 보고 -
    ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/


-- 함께 풀이한 내용

DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (부서명이 'IT'의 부서번호);
                       
-- (부서명이 'IT'의 부서번호) 
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';


DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');

---------------------------------------------------------------------------------------------------------

/*
    ■■■ 뷰(VIEW) ■■■
    
    1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에 존재하는
       하나 이상의 테이블에서 사용자가 얻기 원하는 데이터들만을
       정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만 모아서 
       만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.
       
       가상의 테이블이랑 뷰가 실제로 존재하는 테이블(객체)이 아니라
                             ----------------------------------- 문장 자체를 뷰라고 볼 수 있다. 
       하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이며
       그 정보를 추출해내는 SQL 문장이라고 볼 수 있다.
       
       
    2. 형식 및 구조
    
        CREATE [OR RAPLACE] VIEW 뷰이름
        [(ALIAS[, ALIAS...])]
        AS
        서브쿼리(SUBQUERY)
        [WITH CHECK OPTION]     -- 체크하는 옵션을 확인할 수 있다. 
        [WITH READ ONLY];       -- 읽기 전용 뷰로 만든다. == 쓰기용 뷰를 만들 수도 있다는 말. 
        
        
*/

--○ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES이(가) 생성되었습니다.


-- 뷰가 생성되었으므로, 뷰 조회를 간단히 할 수 있따.
--○ 뷰(VIEW) 조회
SELECT *
FROM VIEW_EMPLOYEES;

--○ 뷰(VIEW) 구조 확인 
DESC VIEW_EMPLOYEES;
-- 테이블처럼 동일하게 확인 가능하다. 

/*
    이름              널?       유형           
    --------------- -------- ------------ 
    FIRST_NAME               VARCHAR2(20) 
    LAST_NAME       NOT NULL VARCHAR2(25) 
    DEPARTMENT_NAME          VARCHAR2(30) 
    CITY                     VARCHAR2(30) 
    COUNTRY_NAME             VARCHAR2(40) 
    REGION_NAME              VARCHAR2(25) 

*/



--★★★ 알아두면 유용한 TIP ★★★

--○ 뷰(VIEW) 소스 확인
SELECT VIEW_NAME, TEXT                 -- TEXT
FROM USER_VIEWS                         -- USER_VIEWS
WHERE VIEW_NAME='VIEW_EMPLOYEES';
                ---------------
-- 뷰 이름만 알고 있으면 소스 조회가 가능하다. 
-- TEXT 컬럼으로 뷰 소스를 바로 가져올 수 있다~~!!! 신기신기.
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
     , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+)"







        
        
        
        
        
        
        


*/






























