--○ 접속된 사용자 조회
SELECT USER
FROM DUAL;
--==>>  출력 :    SCOTT


--○ EMP 테이블에서 직종이 CLERK 인 사원들 중
--   20번 부서에서 근무하는 사원들의 
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.

FROM EMP
직종이 CLERK 부서번호가 20번


사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회
FROM EMP
직종이 CLERK 부서번호가 20번


SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP 
WHERE 직종이 CLERK 부서번호가 20번;


SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP 
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>  출력 :   
/*
7369	SMITH	CLERK	 800	20
7876	ADAMS	CLERK	1100	20
*/


--○ EMP 테이블에서 10번 부서에 근무하는 직원 중 
--   급여가 2500 이상인 사원들의
--   사원명, 직종명, 급여, 부서번호 항목을 조회한다. 

SELECT 사원명, 직종명, 급여, 부서번호
FROM EMP 
WHERE DEPT=10번 
GROUP BY SAL
HAVING 2500;


SELECT ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP 
WHERE 부서번호가 10번  급여가 2500 이상;


SELECT ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
FROM EMP 
WHERE DEPTNO=10 AND SAL>=2500;
--==>>  출력 : KING	PRESIDENT	5000	10


-- ○ 테이블 복사
-- 내부적으로 대상 테이블 안에 있는 데이터 내용만 복사하는 과정 

--※ EMP 테이블의 정보를 확인하여 
--   이와 똑같은 데이터가 들어있는 EMPCOPY테이블을 생성한다. (팀별로)
-- 팀별 풀이한 내용 
DESCRIBE EMP;
DESC EMP;
--==>>  출력 : 
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

/*
CREATE TABLE EMPCOPY AS
SELECT *
FROM EMP
*/

CREATE TABLE EMPCOPY
( EMPNO NUMBER(4) CONSTRAINT PK_EMPCOPY PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNOCOPY REFERENCES DEPT
);

SELECT *
FROM EMPCOPY;

INSERT INTO EMPCOPY
SELECT *
FROM EMP;


-- 함께 풀이한 내용 
SELECT *
FROM EMP;

CREATE TABLE EMP2
AS 
SELECT *
FROM EMP;
--==>>  출력 :    Table EMP2이(가) 생성되었습니다.

-- 복사한 테이블 확인
SELECT *
FROM EMP2;

--==>>  출력 :    원본 테이블 EMP를 복사하여 EMP2 를 만들어줌
/*
7369	SMITH	CLERK	7902	    80/12/17 	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20 	1600	300	    30
7521    	WARD	S   ALESMAN	7698	81/02/22	    1250	    500	    30
7566	JONES	MANAGER	7839	81/04/02    	2975		        20
7654	MARTIN	SALESMAN	7698	81/09/28	    1250    	1400    30
7698	BLAKE	MANAGER	7839	81/05/01	2850		        30
7782	    CLARK	MANAGER	7839	81/06/09	2450		        10
7788	SCOTT	ANALYST	7566	87/07/13	3000	    	20
7839	KING	    PRESIDENT		81/11/17	5000	    	10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
7876	ADAMS	CLERK	7788	87/07/13	1100		    20
7900	JAMES	CLERK	7698	81/12/03    	950		        30
7902    	FORD	    ANALYST	7566	81/12/03	    3000	    	20
7934	MILLER	CLERK	7782	    82/01/23	    1300		    10
*/

--※ 날짜 관련 세션 정보 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  출력 :    Session이(가) 변경되었습니다.


--○ 테이블 복사
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>  출력 :    Table TBL_EMP이(가) 생성되었습니다.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>>  출력 :    Table TBL_DEPT이(가) 생성되었습니다.

--○ 복사한 테이블 확인
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;


-- 테이블 자체에 주석이 없기 때문에, 테이블 정보를 알수 있는 방법은 
-- 코멘트 정보를 부여, 열람하는 쿼리문이 있다.
-- DBA가 아니더라도 잘 기록해두면 같이 일하는 사람이 편해집니다.

--○ 테이블 커멘트 정보 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  출력 : 
/*
DEPT	    TABLE	
EMP	        TABLE	
BONUS	    TABLE	
SALGRADE    	TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
EMPCOPY	    TABLE	
EMP2	        TABLE	
TBL_EMP	    TABLE	
TBL_DEPT    	TABLE	
*/

--○ 테이블의 커멘트 정보 입력
COMMENT ON TABLE TBL_EMP IS '사원정보';
Comment이(가) 생성되었습니다.

--○ 커멘트 정보 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  출력 : 
/*
TBL_DEPT	    TABLE	
TBL_EMP	    TABLE	사원정보
EMP2	        TABLE	
EMPCOPY 	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	    TABLE	
EMP	        TABLE	
DEPT	    TABLE	
*/

--○ 테이블 레벨의 커멘트 정보 입력(TBL_DEPT → 부서정보)
COMMENT ON TABLE TBL_DEPT IS '부서정보';
--==>>  출력 : Comment이(가) 생성되었습니다.


--○ 커멘트 정보 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  출력 : 
/*
TBL_DEPT	TABLE	부서정보
TBL_EMP	TABLE	사원정보
EMP2	TABLE	
EMPCOPY	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	TABLE	
BONUS	TABLE	
EMP	TABLE	
DEPT	TABLE	
*/

--○ 컬럼 레벨의 커멘트 정보 확인
-- 레코드 위아래, 컬럼 앞뒤 출력되는 순서는 무의미합니다. ORDER BY 로 조회하는 입맛대로 보게 됩니다.
-- 이름이 이상하게 나오는 건, DROP 쿼리문으로 일부 지웠던부분이 휴지통에 남아 있어서 그런거임.
-- → 휴지통 비우기 해주고 다시 조회해주자. 
SELECT *
FROM USER_COL_COMMENTS;
--==>>  출력 : 인출된 모든 행 
/*
EMP2	            EMPNO	
DEPT	        LOC	
BONUS	        COMM	
SALGRADE	        LOSAL	
EMPCOPY	        ENAME	
EMP2	            COMM	
TBL_EMP	        EMPNO	
EMP	            DEPTNO	
SALGRADE	        HISAL	
EMP	            EMPNO	
TBL_EMP	        DEPTNO	
DEPT	        DEPTNO	
DEPT	        DNAME	
EMPCOPY	        SAL	
TBL_EXAMPLE2	    NO	
EMPCOPY	        HIREDATE	
BONUS	        JOB	
TBL_EXAMPLE1   	NO	
EMP2            	DEPTNO	
EMP	            ENAME	
EMP	            JOB	
TBL_EXAMPLE2	    NAME	
TBL_EMP	        HIREDATE	
BONUS	        SAL	
EMP	            SAL	
TBL_EMP	        ENAME	
EMP2	            ENAME	
TBL_EMP	        COMM	
TBL_EMP	        JOB	
TBL_EXAMPLE1    	NAME	
EMP2            	SAL	
EMP2            	HIREDATE	
TBL_DEPT	        LOC	
EMPCOPY	        EMPNO	
EMPCOPY	        COMM	
EMP	            COMM	
EMP2	            JOB	
TBL_DEPT        	DEPTNO	
SALGRADE        	GRADE	
TBL_EXAMPLE1    	ADDR	
EMP2	            MGR	
TBL_EXAMPLE2    	ADDR	
EMP	            HIREDATE	
TBL_EMP	        MGR	
EMPCOPY	        MGR	
TBL_EMP	        SAL	
EMP	            MGR	
EMPCOPY	        JOB	
TBL_DEPT        	DNAME	
EMPCOPY	        DEPTNO	
BONUS	        ENAME	
*/

--※ 휴지통 비우기
PURGE RECYCLEBIN;
--==>>  출력 :    RECYCLEBIN이(가) 비워졌습니다.

--DB에서는 테이블 이름, 컬럼명 지정이 매우 중요합니다.


--○ 선택적 조회
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>  출력 :  
/*
TBL_DEPT    	DEPTNO	
TBL_DEPT	    DNAME	
TBL_DEPT    	LOC	
*/


--○ 테이블에 소속된(포함된) 컬럼 레벨의 커멘트 정보 입력(설정)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서번호';
--==>>  출력 :    Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서명';
--==>>  출력 :    Comment이(가) 생성되었습니다.
COMMENT ON COLUMN TBL_DEPT.LOC IS '부서위치';
-- Comment이(가) 생성되었습니다.

--○ 커멘트 정보가 입력된 테이블의 컬럼 레벨의 정보 확인
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME ='TBL_DEPT';
/*
TBL_DEPT	DEPTNO	부서번호
TBL_DEPT	DNAME	부서명
TBL_DEPT	LOC	부서위치
*/

DESC EMP;
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)     -- 사원번호 
ENAME             VARCHAR2(10) -- 사원명
JOB               VARCHAR2(9)  -- 직종명
MGR               NUMBER(4)    -- 관리자사원번호
HIREDATE          DATE         -- 입사일
SAL               NUMBER(7,2)  -- 급여
COMM              NUMBER(7,2)  -- 수당
DEPTNO            NUMBER(2)    -- 부서번호 
*/

--○ TBL_EMP 테이블에 소속된(포함된) 컬럼에 대한 커멘트 정보 입력(설정)
COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원번호';
COMMENT ON COLUMN TBL_EMP.ENAME IS '사원명';
COMMENT ON COLUMN TBL_EMP.JOB IS '직종명';
COMMENT ON COLUMN TBL_EMP.MGR IS '관리자사원번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN TBL_EMP.SAL IS '급여';
COMMENT ON COLUMN TBL_EMP.COMM IS '수당';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서번호';
--Comment이(가) 생성되었습니다.
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>  출력 :  
/*
TBL_EMP	EMPNO	사원번호
TBL_EMP	ENAME	사원명
TBL_EMP	JOB	    직종명
TBL_EMP	MGR	    관리자사원번호
TBL_EMP	HIREDATE	입사일
TBL_EMP	SAL	    급여
TBL_EMP	COMM	수당
TBL_EMP	DEPTNO	부서번호
*/


--■■■ 컬럼 구조의 추가 및 제거 ■■■--

SELECT *
FROM TBL_EMP;

--○ TBL_EMP 테이블에 주민등록번호 정보를 담을 수 있는 컬럼 추가
ALTER TABLE TBL_EMP 
ADD SSN CHAR(13);
--==>>  출력 :    Table TBL_EMP이(가) 변경되었습니다.
-- 맨 앞에 0이 들어올 가능성이 있는 숫자가 조합된 데이터라면
-- 숫자형이 아닌 문자형으로 데이터타입을 처리해야 한다.

SELECT 0012121234567
FROM DUAL;
--==>>  출력 :    12121234567 
-- 0 이 삭제됨. 주민번호 포맷이 아니게됨. 

SELECT '0012121234567'
FROM DUAL;
--==>>  출력 :    0012121234567

--○ 확인
SELECT *
FROM TBL_EMP;
--==>>  출력 :    
/*
    EMPNO      ENAME      JOB        MGR    HIREDATE     SAL       COMM       DEPTNO SSN          
---------- ---------- --------- ---------- ---------- ---------- ---------- ---------- 
      7369 SMITH      CLERK           7902 1980-12-17        800                20              
      7499 ALLEN      SALESMAN        7698 1981-02-20       1600    300         30              
      7521 WARD       SALESMAN        7698 1981-02-22       1250    500          30              
      7566 JONES      MANAGER         7839 1981-04-02       2975                 20              
      7654 MARTIN     SALESMAN        7698 1981-09-28       1250    1400         30              
      7698 BLAKE      MANAGER         7839 1981-05-01       2850                    30              
      7782 CLARK      MANAGER         7839 1981-06-09       2450                    10              
      7788 SCOTT      ANALYST         7566 1987-07-13       3000                    20              
      7839 KING       PRESIDENT            1981-11-17       5000                    10              
      7844 TURNER     SALESMAN        7698 1981-09-08       1500          0         30              
      7876 ADAMS      CLERK           7788 1987-07-13       1100                    20              
      7900 JAMES      CLERK           7698 1981-12-03        950                    30              
      7902 FORD       ANALYST         7566 1981-12-03       3000                    20              
      7934 MILLER     CLERK           7782 1982-01-23       1300                    10        
*/

DESC TBL_EMP;
--==>>  출력 :    
/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
EMPNO           NUMBER(4)    
ENAME           VARCHAR2(10) 
JOB             VARCHAR2(9)  
MGR             NUMBER(4)    
HIREDATE        DATE         
SAL             NUMBER(7,2)  
COMM            NUMBER(7,2)  
DEPTNO          NUMBER(2)    
SSN             CHAR(13)     
*/
--> ssn컬럼이 정상적으로 추가된 상황임을 확인


SELECT EMPNO, ENAME, SSN, HIREDATE, SAL, COMM
FROM TBL_EMP;
--> 테이블 내에서 컬럼의 순서는 구조적으로 의미 없음

--○ TBL_EMP 테이블에서 추가한 SSN(주민등록번호) 컬럼 제거 
-- 추가할 때는 컬럼을 명시하지 않지만, 제거할 때는 컬럼임을 명시해주어야 한다. 
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>>  출력 :    Table TBL_EMP이(가) 변경되었습니다.

--○확인 
SELECT *
FROM TBL_EMP;
/*
7369	SMITH	CLERK	7902	    1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521    	WARD	    SALESMAN	7698	1981-02-22	1250    	500 	30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782	    CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000	    	20
7839	KING	    PRESIDENT		1981-11-17	5000	    	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD    	ANALYST	7566	1981-12-03	3000	       	20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/

DESC TBL_EMP;
-- SSN COLUMN 삭제되었음.
--==>>  출력 :    
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
*/
--> SSN(주민등록번호) 컬럼이 정상적으로 제거되었음을 확인

DELETE
FROM TBL_EMP
WHERE ENAME='SMITH';
--==>>  출력 : 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT * 
FROM TBL_EMP;
--==>>  출력 :    SMITH 관련 데이터가 삭제되었음을 확인 
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	    WARD    	SALESMAN	7698	1981-02-22	1250	    500	    30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782	    CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		    20
7839	KING    	PRESIDENT		1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD    	ANALYST	7566	1981-12-03	3000		    20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/

DELETE TBL_EMP;     -- 권장하지 않음

DELETE
FROM TBL_EMP;       -- 권장
--==>>  출력 :    13개 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_EMP;
--> 테이블의 구조는 그대로 남아있는 상태에서 
--  데이터 모두 소실(삭제)된 상황임을 확인

DROP TABLE TBL_EMP;
--==>>  출력 :    Table TBL_EMP이(가) 삭제되었습니다.


--○ 확인
SELECT *
FROM TBL_EMP;
--==>>  출력 :    에러발생
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
519행, 6열에서 오류 발생
*/


--○ 테이블 다시 생성(복사)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>  출력 :    Table TBL_EMP이(가) 생성되었습니다.


-------------------------------------------------------------

--○ NULL 의 처리
-- NULL 은 값이 아닌 상태 
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>>  출력 :    2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2, 10+NULL, 10-NULL, 10*NULL, 10/NULL
FROM DUAL;
--==>> (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  


--※ 관찰 결과
-- NULL은 상태의 값을 의미하며 실제 존재하지 않는 값이기 때문에 
-- NULL이 연산에 포함될 경우, 결과는 무조건 NULL 이 된다. 

--○ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT 사원명, 직종명, 급여, 커미션
FROM TBL_EMP
WHERE 커미션이 NULL;

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE 커미션이 NULL;

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM=NULL;
--==>> 조회 결과 없음 ** 제일 경계해야 할 부분

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM=(null);
--==>> 조회 결과 없음 ** 대소문자 구분없음. (괄호)는 오라클도 똑같이 연산자우선순위로 연산됨.

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM='null';
--==>>  출력 :    에러 발생 
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

DESC TBL_EMP;
--> COMM 컬럼은 숫자형 데이터 타입을 취하고 있음을 확인
/*
    :
COMM        NUMBER(7,2) 
    :
*/


--※ NULL은 실제 존재하지 않는 값이기 대문에 일반적인 연산자를 활용하여 비교할 수 없다.
--   즉, 산술적인 비교 연산을 수행할 수 없다는 의미이다.
--   NULL을 대상으로 사용할 수 없는 연산자들....
--   >=, <=, >, <, 관계연산자 !=, ^=, <> 셋 모두 "같지않다"를 의미  


SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>  출력 :    
/*
SMITH	CLERK	    800	
JONES	MANAGER	    2975	
BLAKE	MANAGER	    2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	    PRESIDENT	5000	
ADAMS	CLERK	    1100	
JAMES	CLERK	    950	
FORD    	ANALYST	    3000	
MILLER	CLERK	    1300	
*/

--○ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의 
--   사원명, 직종명, 부서번호 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP 
WHERE DEPTNO != 20;     -- != 대신에 ^=, <> 써도 된다. 
-- WHERE DEPTNO = 10 OR DEPTNO = 30
-- WHERE DEPTNO IN (10, 30)
-- 이와같이 조건을 설정해도 되지만, 40번대..  50번대.. 사원번호가 추가되면 쓸수없는 정보가 되므로 주의.
-- 쿼리문은 단순 조회에 그치지 않고 추가적인 정보를 획득할 수 있어야 한다. 
-- ...? 컬럼화 시키면 안된다.

--==>>  출력 :    
/*
ALLEN	SALESMAN	    30
WARD    	SALESMAN	    30
MARTIN	SALESMAN	    30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	    PRESIDENT	10
TURNER	SALESMAN	    30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

--○ TBL_EMP 테이블의 전체 부서번호 조회 
SELECT ENAME "사원명", JOB "직종명", DEPTNO "부서번호"
FROM TBL_EMP;
--==>>  출력 : 
/*
SMITH	CLERK	    20
ALLEN	SALESMAN	    30
WARD    	SALESMAN	    30
JONES	MANAGER	    20
MARTIN	SALESMAN	    30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
SCOTT	ANALYST	    20
KING	    PRESIDENT	10
TURNER	SALESMAN	    30
ADAMS	CLERK	    20
JAMES	CLERK	    30
FORD    	ANALYST	    20
MILLER	CLERK	    10
*/


--○ TBL_EMP 테이블에서 커미션이 NULL 이 아닌 직원들의 
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--WHERE NOT COMM IS NULL;
--==>>  출력 : 
/*
ALLEN	SALESMAN    	1600	 300
WARD	    SALESMAN	    1250	     500
MARTIN	SALESMAN	    1250    	1400
TURNER	SALESMAN	    1500 	   0
*/

--○ TBL_EMP 테이블에서 모든 사원들의 
--  사원번호, 사원명, 급여, 커미션, 연봉 항목을 조회한다.
--  단, 급여(SAL)는 매월 지급한다.
--  또한, 수당(COMM)은 매년 지급한다.

SELECT EMPNO "사원번호", ENAME "사원명", SAL "급여", COMM "커미션" 
FROM TBL_EMP;























INSERT INTO EMP VALUES ();
DESCRIBE DEPT;





