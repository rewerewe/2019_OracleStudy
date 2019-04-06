--■■■ having ■■■--

--○ EMP 테이블에서 부서번호가 20, 30인 부서를 대상으로 
-- 부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.

SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL) < 10000          
GROUP BY DEPTNO;


SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL) < 10000          -- 'group function is not allowed here'
GROUP BY DEPTNO;
--==>> 에러발생 
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
9행, 5열에서 오류 발생
*/

/*
WHERE에 쓸 수 없는 그룹함수들은 HAVING 절에 써야한다. 
이런 경우 사용할 수 있는 게 HAVING 조건 절 
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400


SELECT DEPTNO, SUM(SAL)
FROM EMP 
GROUP BY DEPTNO
HAVING DEPTNO IN (20, 30)       -- 일반 조건은 WHERE 조건절로 쓰는게 더 낫다. 
   AND SUM(SAL) < 10000;
   
/*
    30	9400
*/

--------------------------------------------------------------------------------
--■■■ 중첩 그룹합수 / 분석함수 ■■■--

-- 그룹 함수 2 LEVEL까지 중첩해서 사용할 수 있다.
-- 이마저도 MSSQL은 불가능 하다
SELECT MAX(SUM(SAL))        -- 이것이 2레벨 중첩해서 쓴 것. 
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK() 
-- ORACLE 9i부터 적용, MSSQL 2005부터 적용 

-- 오라클 11g 사용하고 있지만, 현업에서는 이전버전을 사용하고 있을 것이다.
-- 버전 업그레이드를 바로 적용하는 회사는 드물다. 아니, 현실적으로 어렵다.
-- 그럼 이전 버전의 오라클을 사용할 경우 순위, 서열은 어떻게 할까?

-- 하위 버전에서는 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
-- 이를 대체하여 연산을 수행할 수 있는 방법을 알고 있어야 한다.

-- 예를 들어, 급여의 순위를 구하고자 한다면,
-- 해당 사원의 급여보다 더 큰 값이 몇 개인지 확인한 후 
-- 확인한 숫자에 +1 을 추가 연산해주면, 그것이 곧 등수가 된다.

-- 스미스 사원의 급여 등수는?
SELECT ENAME, SAL
FROM EMP;

SELECT COUNT(*) 
FROM EMP
WHERE SAL > 800;
--==>> 13 + 1 = 14 → SMITH 의 급여등수
-- 급여가 800보다 많은 사람이 13명이다. 여기에 1을 더해주면?

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;
--==>> 7 → ALLEN 의 급여등수   


/*
상관성 QUERY 개념을 알고 있어야 한다.

※ 서브 상관 쿼리 (상관 서브 쿼리)

    메인 쿼리에 있는 테이블의 컬럼이
    서브 쿼리의 조건절(WHERE절, HAVING절)에 사용되는 경우
    우리는 이 쿼리문을 서브 상관 쿼리라고 부른다. 

*/

--1) 
SELECT ENAME "사원명", SAL "급여", 1 "급여등수"
FROM EMP;

--2)
SELECT ENAME "사원명", SAL "급여", (1)"급여등수"
FROM EMP;

--3)
SELECT ENAME "사원명", SAL "급여"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 -- 서브 쿼리는 E2이라 붙이면,
        WHERE SAL > 800)"급여등수"
FROM EMP E1; -- 테이블 별칭 E1 이라 붙이고, 

--4)
SELECT ENAME "사원명", SAL "급여"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL)"급여등수"
FROM EMP E1;
/*
    SMITH	800	    14
    ALLEN	1600	7
    WARD	    1250    	10
    JONES	2975    	4
    MARTIN	1250	    10
    BLAKE	2850	    5
    CLARK	2450	    6
    SCOTT	3000	2
    KING    	5000	1
    TURNER	1500	8
    ADAMS	1100	12
    JAMES	950	    13
    FORD	    3000	2
    MILLER	1300	9
*/

--5)
SELECT ENAME "사원명", SAL "급여"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL)"급여등수"
FROM EMP E1
ORDER BY 3;
/*
    KING    	5000	1
    FORD	    3000	2
    SCOTT	3000	2
    JONES	2975	    4
    BLAKE	2850	    5
    CLARK	2450	    6
    ALLEN	1600	7
    TURNER	1500	8
    MILLER	1300	9
    WARD	    1250    10
    MARTIN	1250	    10
    ADAMS	1100	12
    JAMES	950	    13
    SMITH	800	    14
*/


--실습 문제
--○ EMP 테이블을 대상으로 
-- 사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
-- 단, RANK() 함수를 사용하지 않고, 상관 서브 쿼리를 활용할 수 있도록 한다.

DESC EMP;

SELECT ENAME "사원명", SAL "급여", DEPTNO "부서번호"
     , (SELECT COUNT (*) + 1
        FROM EMP E2
        WHERE E1.DEPTNO = E2.DEPTNO AND E1.SAL > E2.SAL)"부서내급여등수"
     , (SELECT COUNT (*) + 1
        FROM EMP E2
        WHERE E1.SAL > E2.SAL)"전체급여등수"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL;
/*
    MILLER	1300	10	1	6
    CLARK	2450	    10	2	9
    KING	    5000	10	3	14
    SMITH	800	    20	1	1
    ADAMS	1100	20	2	3
    JONES	2975	    20	3	11
    SCOTT	3000	20	4	12
    FORD	    3000	20	4	12
    JAMES	950	    30	1	2
    MARTIN	1250	    30	2	4
    WARD	    1250	    30	2	4
    TURNER	1500	30	4	7
    ALLEN	1600	30	5	8
    BLAKE	2850	    30	6	10
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ EMP 테이블을 대상으로 다음과 같이 조회할 수 있도록 한다.
/*
-------------------------------------------------------------
 사원명    부서번호    입사일     급여      부서내입사별급여누적
-------------------------------------------------------------
 CLARK	    10	    1981-06-09	 2450       
 KING	    10	    1981-11-17	 5000
 MILLER	    10	    1982-01-23	 1300
 SMITH	    20	    1980-12-17	 800
 JONES	    20	    1981-04-02	 2975
 FORD	    20	    1981-12-03	 3000
 SCOTT	    20	    1987-07-13	 3000
 ADAMS	    20	    1987-07-13	 1100
 ALLEN	    30	    1981-02-20	 1600
 WARD	    30	    1981-02-22	 1250
 BLAKE	    30	    1981-05-01	 2850
 TURNER	    30	    1981-09-08	 1500
 MARTIN	    30	    1981-09-28	 1250
 JAMES	    30	    1981-12-03	 950
*/

-- 내가 풀이한 내용 
SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
     , (SELECT SUM(E2.SAL)     
        FROM EMP E2
        WHERE E1.DEPTNO = E2.DEPTNO AND E1.HIREDATE >= E2.HIREDATE)"부서내입사별급여누적"
FROM EMP E1
ORDER BY DEPTNO, HIREDATE;

-------------------------------------------------------------------------------------------- 10:00

-- 함께 풀이한 내용 
SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
     , (SELECT SUM(E2.SAL)     --급여의 합계를 구하기 위한 SUM()
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO 
          AND E2.HIREDATE <= E1.HIREDATE)"부서내입사별급여누적"
FROM EMP E1
ORDER BY 2, 3;
/*
 CLARK	10	1981-06-09	2450	    2450
 KING	10	1981-11-17	5000	7450
 MILLER	10	1982-01-23	1300	8750
 SMITH	20	1980-12-17	800	    800
 JONES	20	1981-04-02	2975	    3775
 FORD	20	1981-12-03	3000	6775
 SCOTT	20	1987-07-13	3000	10875
 ADAMS	20	1987-07-13	1100	10875
 ALLEN	30	1981-02-20	1600	1600
 WARD	30	1981-02-22	1250	    2850
 BLAKE	30	1981-05-01	2850	    5700
 TURNER	30	1981-09-08	1500	7200
 MARTIN	30	1981-09-28	1250    	8450
 JAMES	30	1981-12-03	950	    9400
*/

--○ TBL_EMP 테이블을 기반으로 입사한 사원의 수가 제일 많았을 때의
--  입사년월과 인원수를 조회할 수 있는 쿼리문을 구성한다.
/*
    -------------------------------
        입사년월        인원수 
    -------------------------------
        2019-04           5
    -------------------------------
*/

-- 내가 풀이한 내용
SELECT MAX(T.입사년월) "입사년월", MAX(T.인원수) 
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
         , COUNT(*) "인원수"
    FROM TBL_EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T;

--------------------------------------------------------------------------------------------- 11:00

-- 함께 풀이한 내용
--1) 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
, COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
1981-05	1
1981-12	2
1982-01	1
1981-09	2
2019-04	5
1981-02	2
1981-11	1
1980-12	1
1981-04	1
1987-07	2
1981-06	1
*/

--2) 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
, COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5;
--==>> 2019-04	5

--3) 
SELECT COUNT(*)
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
    1
    2
    1
    2
    5
    2
    1
    1
    1
    2
    1
*/
--4)
SELECT MAX(COUNT(*))
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 5


--5)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
, COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM TBL_EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 2019-04	5

--6)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"입사년월"
, COUNT(*) "인원수"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
/*
    1981-12	2
    1981-09	2
    1981-02	2
    1987-07	2
*/

---------------------------------------------------------------------------------------------

--■■■ ROW_NUMBER() ■■■--

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "테스트"
     , ENAME "사원명", SAL "급여", HIREDATE "입사일"
FROM EMP;
/*
테스트  사원명   급여     입사일 
 1	    KING	    5000	1981-11-17
 2	    FORD    	3000	1981-12-03
 3	    SCOTT	3000	1987-07-13
 4	    JONES	2975	    1981-04-02
 5	    BLAKE	2850	    1981-05-01
 6	    CLARK	2450	    1981-06-09
 7	    ALLEN	1600	1981-02-20
 8	    TURNER	1500	1981-09-08
 9	    MILLER	1300	1982-01-23
 10	    WARD	    1250	    1981-02-22
 11	    MARTIN	1250	    1981-09-28
 12	    ADAMS	1100	1987-07-13
 13	    JAMES	950	    1981-12-03
 14	    SMITH	800	    1980-12-17
*/

/*
    게시판의 게시물 번호를 SEQUENCE 나 INDENTIFY 를 사용하게 되면
                        ------- ex.은행의 번호표 
        아래 예시처럼 동명이인 성적관리 할 때, 고유한 값을 가져 원할한 처리가 가능해진다. 
    게시물을 삭제했을 경우, 삭제한 게시물의 자리에 다음 번호를 가진
    게시물이 등록된 상황이 발생하게 된다.
    이는 보안 측면에서나... 미관상... 바람직하지 않는 상황일 수 있기 때문에
    ROW_NUMBER() 의 사용을 고려해볼 수 있다.
    관리의 목적으로 사용할 때에는 SEQUENCE 나 INDENTIFY 를 사용하지만
    단순히 게시물을 목록화하여 사용자에게 리스트 형식으로 보여줄 때에는 
    사용하지 않는 것이 좋다. 
    
    해당하는 컬럼의 고유한 값이 있어야 작업하는데 편리하다. 
*/

--※ 관찰
CREATE TABLE TBL_AAA
( NO    NUMBER
, NAME  VARCHAR2(30)
, GRADE CHAR(10)
);
--==>> Table TBL_AAA이(가) 생성되었습니다.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(1, '이지혜', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(2, '이기승', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(3, '윤희진', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(4, '권홍비', 'C');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(5, '권홍비', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(6, '이기승', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(7, '이기승', 'A');
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_AAA;

--(Ⅹ)
UPDATE TBL_AAA
SET GRADE='C'
WHERE NAME = '이기승';

--(Ⅹ)
UPDATE TBL_AAA
SET GRADE='C'
WHERE GRADE = 'A';

DELETE
FROM TBL_AAA
WHERE NO=6;
-- 특정 행을 지정해야 정확한 처리가 가능하다. 

--○ SEQUENCE (시쿼스 : 주문번호)
--   → 사전적 의미 : 1.(일련의) 연속적인 사건들   2.(사건, 행동 등의) 순서 
--   시퀀스를 생성하여 사용하면, 데이터가 겹칠 일을 없다. 

CREATE SEQUENCE SEQ_BOARD       -- 시퀀스 생성 기본 구문(MSSQL 의 IDENTIFY 와 동일한 개념)
START WITH 1                    -- 시작값
INCREMENT BY 1                  -- 증가값
NOMAXVALUE                      -- 최대값 제한 없음
NOCACHE;                        -- 캐시 사용 안함(없음) → 건드릴 때마다 1씩 발행하겠다. 
                                -- 캐시를 확보해두고 미리 번호표를 발행해두는 것
                                -- 캐시 사용 한다면 → 미리 번호표를 10씩 확보해두고 나눠주는 개념 (트래픽이 많을 경우 사용한다) 
                                -- ADMIN 파트를 건드리지 않은이상 캐시까지 신경쓰지 않아도 됩니다. 
--==>> Sequence SEQ_BOARD이(가) 생성되었습니다.



--○ 테이블 생성(TBL_BOARD)
CREATE TABLE TBL_BOARD               -- TBL_BORAD 이름의 테이블생성 → 게시판
( NO            NUMBER               -- 게시물 번호          Ⅹ
, TITLE         VARCHAR2(50)         -- 게시물 제목          ○
, CONTENTS      VARCHAR2(2000)       -- 게시물 내용          ○
, NAME          VARCHAR2(20)         -- 게시물 작성자        △ (어떻게 구성했느냐에 따라 다르다)
, PW            VARCHAR2(20)         -- 게시물 패스워드      △
, CREATED       DATE DEFAULT SYSDATE -- 게시물 작성일        Ⅹ
);
--==>> Table TBL_BOARD이(가) 생성되었습니다.
-- 사용자가 게시판에 게시물에 작성하면, 어플리케이션이 알아서 사용자가 작성한 게시물을 프로세스를 통해 감지한다.

ALTER TABLE TBL_BOARD ADD COLUMN TILTE VARCHAR2(50);

--○ 데이터 입력 → 게시판에 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '앗싸~1등', '내가 1등 이지롱', '전훈의', 'JAVA006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '건강관리', '다들 건강 챙깁시다', '유진석', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오늘은', '점심 뭐 먹지....', '최보라', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오늘은', '미세먼지 없냐?', '정임혜', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '공부하고 싶은데', '미세먼지 없냐?', '정임혜', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '질문있습니다', '쉬었다 하면 안되나요', '남상현', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '질문있습니다', '생각나면 다시 질문할게요', '한승원', 'JAVA006$', DEFAULT);

--------------------------------------------------------------------------------------------------------12:00

--○ 확인
SELECT *
FROM TBL_BOARD;


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=4;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '졸려요', '전 그냥 잘래요' , '윤희진', 'JAVA006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BOARD;


--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=2;
--==>> 1 행 이(가) 삭제되었습니다.
/*
    1	앗싸~1등	내가 1등 이지롱	전훈의	JAVA006$	2019-04-02
    3	오늘은	점심 뭐 먹지....	최보라	JAVA006$	2019-04-02
    5	공부하고 싶은데	미세먼지 없냐?	정임혜	JAVA006$	2019-04-02
    6	질문있습니다	쉬었다 하면 안되나요	남상현	JAVA006$	2019-04-02
    7	질문있습니다	생각나면 다시 질문할게요	한승원	JAVA006$	2019-04-02
    8	졸려요	전 그냥 잘래요	윤희진	JAVA006$	2019-04-02
*/


--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 행 이(가) 삭제되었습니다.
/*
    1	앗싸~1등	내가 1등 이지롱	전훈의	JAVA006$	2019-04-02
    3	오늘은	점심 뭐 먹지....	최보라	JAVA006$	2019-04-02
    5	공부하고 싶은데	미세먼지 없냐?	정임혜	JAVA006$	2019-04-02
    6	질문있습니다	쉬었다 하면 안되나요	남상현	JAVA006$	2019-04-02
    7	질문있습니다	생각나면 다시 질문할게요	한승원	JAVA006$	2019-04-02
*/

--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '저는요', '잘 지내고 있습니다.', '이원영', 'JAVA006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

COMMIT;

SELECT *
FROM TBL_BOARD;
/*
    1	앗싸~1등	        내가 1등 이지롱	        전훈의	JAVA006$	2019-04-02
    3	오늘은	        점심 뭐 먹지....	        최보라	JAVA006$	2019-04-02
    5	공부하고 싶은데	미세먼지 없냐?	        정임혜	JAVA006$	2019-04-02
    6	질문있습니다	    쉬었다 하면 안되나요	    남상현	JAVA006$	2019-04-02
    7	질문있습니다	    생각나면 다시 질문할게요	한승원	JAVA006$	2019-04-02
    9	저는요	        잘 지내고 있습니다.	    이원영	JAVA006$	2019-04-02
*/

-- 해당 게시판의 시퀀스 번호를 직접 노출시키지 않습니다. 
-- 노출되도록 쿼리문을 작성하면 안됩니다. (보안성에 의거)

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "글번호"
    ,  TITLE "제목", NAME "작성자", CREATED "작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
-- 일반적인 게시판의 형태로 조회됨. 
게시물의 고유한 글번호 형식으로 보여짐
/*
    6	저는요	        이원영	2019-04-02
    5	질문있습니다	    한승원	2019-04-02
    4	질문있습니다	    남상현	2019-04-02
    3	공부하고 싶은데	정임혜	2019-04-02
    2	오늘은	        최보라	2019-04-02
    1	앗싸~1등	        전훈의	2019-04-02
*/


--○ 게시물 작성
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '오빠', '저 맘에 안들죠', '김선아', 'JAVA006$', DEFAULT);
--==>> 1 행 이(가) 삽입되었습니다.

/*
1	앗싸~1등	내가 1등 이지롱	전훈의	JAVA006$	2019-04-02
3	오늘은	점심 뭐 먹지....	최보라	JAVA006$	2019-04-02
5	공부하고 싶은데	미세먼지 없냐?	정임혜	JAVA006$	2019-04-02
6	질문있습니다	쉬었다 하면 안되나요	남상현	JAVA006$	2019-04-02
7	질문있습니다	생각나면 다시 질문할게요	한승원	JAVA006$	2019-04-02
9	저는요	잘 지내고 있습니다.	이원영	JAVA006$	2019-04-02
10	오빠	저 맘에 안들죠	김선아	JAVA006$	2019-04-02
*/
SELECT *
FROM TBL_BOARD;

--○ 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>> 1 행 이(가) 삭제되었습니다.
/*
    1	앗싸~1등	내가 1등 이지롱	전훈의	JAVA006$	2019-04-02
    3	오늘은	점심 뭐 먹지....	최보라	JAVA006$	2019-04-02
    5	공부하고 싶은데	미세먼지 없냐?	정임혜	JAVA006$	2019-04-02
    6	질문있습니다	쉬었다 하면 안되나요	남상현	JAVA006$	2019-04-02
    9	저는요	잘 지내고 있습니다.	이원영	JAVA006$	2019-04-02
    10	오빠	저 맘에 안들죠	김선아	JAVA006$	2019-04-02
*/

COMMIT;


SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "글번호"
    ,  TITLE "제목", NAME "작성자", CREATED "작성일"
FROM TBL_BOARD
ORDER BY 4 DESC;
/*
    6	오빠	김선아	2019-04-02
    5	저는요	이원영	2019-04-02
    4	질문있습니다	남상현	2019-04-02
    3	공부하고 싶은데	정임혜	2019-04-02
    2	오늘은	최보라	2019-04-02
    1	앗싸~1등	전훈의	2019-04-02
*/


------------------------------------------------------------------------------------------------------------------------

--■■■ JOIN(조인) ■■■--

--1. SQL 1992 CODE
SELECT *
FROM EMP, DEPT;
--==>> 수학에서 말하는 데카르트 곱(Catersian Product)
-- 두 테이블을 합친(결함한) 모든 경우의 수 
-- 조회된 결과에서 의미를 찾을 수 없으며, 모든 경우를 다 보여준다. 


--▶ Equi join : 서로 정확히 일치하는 데이터들끼리 연결시키는 결합
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- Equi Join 시 『(+)』 를 활용한 결합 방법


-- 결합대상이 없는 경우, 조회되지 않는다 (Ⅹ)
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> 총 14건의 데이터가 결합되어 조회된 상황
-- 즉, 부서번호를 갖지 못한 사원들(S)은 모두 누락~!!!
/*
    7369	SMITH	CLERK	7902	1980-12-17	800		20	20	RESEARCH	DALLAS
    7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30	30	SALES	CHICAGO
    7521    	WARD	SALESMAN	7698	1981-02-22	1250	500	30	30	SALES	CHICAGO
    7566	JONES	MANAGER	7839	1981-04-02	2975		20	20	RESEARCH	DALLAS
    7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30	30	SALES	CHICAGO
    7698	BLAKE	MANAGER	7839	1981-05-01	2850		30	30	SALES	CHICAGO
    7782	    CLARK	MANAGER	7839	1981-06-09	2450		10	10	ACCOUNTING	NEW YORK
    7788	SCOTT	ANALYST	7566	1987-07-13	3000		20	20	RESEARCH	DALLAS
    7839	KING	PRESIDENT		1981-11-17	5000		10	10	ACCOUNTING	NEW YORK
    7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30	30	SALES	CHICAGO
    7876	ADAMS	CLERK	7788	1987-07-13	1100		20	20	RESEARCH	DALLAS
    7900	JAMES	CLERK	7698	1981-12-03	950		30	30	SALES	CHICAGO
    7902	    FORD	ANALYST	7566	1981-12-03	3000		20	20	RESEARCH	DALLAS
    7934	MILLER	CLERK	7782	1982-01-23	1300		10	10	ACCOUNTING	NEW YORK
*/

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

-- (+) 기호로 결합대상이 없는 경우도 조회에 포함시킨다. 


SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--   --------- 메모리에 다 올린 후, 값을 비교한다. (+) 기호는 없지만 주인공.
--==>> 총 19건의 데이터가 결합되어 조회됨
-- 즉, 부서번호를 갖지 못한 사원들도 모두 조회된 상황


SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>> 총 16건의 데이터가 결합되어 조회됨
-- 즉, 부서에 소속된 사원이 아무도 없는 부서도 모두 조회된 상황

--※ (+)가 없는 쪽 데이블의 데이터를 모두 메모리에 적재한 후 
--   (+)가 있는 쪽 테이블의 데이터를 하나하나 확인하여 결합시키는 형태로 
--   JOIN이 이루어진다. 

--(Ⅹ) 
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
-- 위와 같은 이유로 이러한 형식의 JOIN 구문은 존재하지 않는다. 



--▶ Non Equi join : 숫자가 정확하기 일치하진 않지만, 범위 안에 적합한 데이터들끼리 연결시키는 결합
SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;

SELECT *
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


--2. SQL 1999 CODE → 가장 눈에 띄는 항목은 『JOIN』 키워드 등장, → JOIN 유형 
--                    결합 조건은 『WHERE』 대신 『ON 』 사용
-- CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--※ INNER JOIN 시 INNER 는 생략 가능
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO= D.DEPTNO;


SELECT *
FROM EMP E JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- OUTER JOIN
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- 혼란을 초래할 수 있음을 감지, (+)가 붙어 있는게 아니라. 주인공 방향을 지정해준다. 

--※ 방향이 지정된 쪽 테이블(→ LEFT)의 데이터를 모두 메모리에 적재한 후
--   방향이 지정되지 않은 쪽 테이블들의 데이터를 각각 확인하여 결합시키는 형태로 
--  JOING이 이루어진다.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO; 

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO; 
--부서 번호를 갖지 못한 레코드까지 전부 조회됨

--※ OUTER JOIN 에서 OUTER 는 생략 가능
-- 아래 세 구문 모두 OUTER JOIN 이다. 
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);


-- 아래와 같이 방향성이 없으면 INNER JOIN 
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

------------------------------------------------------

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- 이 결과에서 직종이 CLERK 인 사원들만 조회

SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
--이렇게 쿼리문을 구성해도 조회하는 데는 문제가 없다.


SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
-- 하지만, 이와 같이 구성하여 조회할 수 있도록 권장한다.
-- 조건을 명시해줄 때만 WHERE을 쓰자. 
------------------------------------------------------

--○ EMP 테이블과 DEPT 테이블에서 
--   직종이 MAMAGER 와 CLERK 인 사원들만 
--   부서번호, 부서명, 사원명, 직종명, 급여 항목을 조회한다. 
--   -------  ------  ------  -----  -----
--    DEPTNO   DNAME   ENAME   JOB    SAL
--   -------  ------  ------  -----  -----
--    E, D      D        E      E      E
--(1) 두 테이블이 연결고리 컬럼을 찾아야 한다. 
--(2) 오라클은 관계되는 두 테이블의 명시한 컬럼을 다 찾아간다.
--(3) 그렇기 때문에 소속 테이블을 명시해주어야 한다. 
--(4) 중복된 컬럼은...? 
--(5) 오라클에서...MSSQL에서도... 아니 관계형 데이터베이스에서 바람직한 관계는 1대 다 이다.
-- 각 컬럼명 앞에 소속 테이블을 명시한 이유는? 오라클에서 JOIN할 때 테이블 모두를 확인하기 때문에 
-- 퍼포먼스 향상을 위해서 입니다. 

--(Ⅹ)
SELECT DEPTNO, DNAME, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> 에러발생
/*
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
*Cause:    
*Action:
823행, 8열에서 오류 발생
*/
--> 두 테이블 간 중복되는 컬럼에 대한 소속 테이블을 
-- 정해줘야(명시해 줘야) 한다. 

--(○)
SELECT DNAME, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>>
/*
두 테이블 간 중복되는 컬럼이 존재하지 않는 조회 구문은
에러 발생하지 않는다.
  DNAME     ENAME     JOB       SAL
------------------------------------
 RESEARCH	SMITH	CLERK	    800
 SALES	    ALLEN	SALESMAN	    1600
 SALES	    WARD	    SALESMAN	    1250
 RESEARCH	JONES	MANAGER	    2975
 SALES	    MARTIN	SALESMAN    	1250
 SALES	    BLAKE	MANAGER	    2850
 ACCOUNTING	CLARK	MANAGER	    2450
 RESEARCH	SCOTT	ANALYST	    3000
 ACCOUNTING	KING	    PRESIDENT	5000
 SALES	    TURNER	SALESMAN    	1500
 RESEARCH	ADAMS	CLERK	    1100
 SALES	    JAMES	CLERK	    950
 RESEARCH	FORD    	ANALYST	    3000
 ACCOUNTING	MILLER	CLERK	    1300
*/

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL 
-- SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
/*
두 테이블 간 중복된 컬럼에 대해 소속 테이블을 명시하는 경우
부서(DEPT), 사원(EMP) 중 어떤 테이블을 지정해도 
쿼리문 수행에 대한 결과 반환에 문제가 없다.

※ 하지만,
두 테이블 간 중복되는 컬럼에 대해 소속 테이블을 명시하는 경우
부모 테이블의 컬럼을 참조할 수 있도록 해야 한다.
 DEPTNO DNAME       ENAME       JOB     SAL
----------------------------------------------
 20	    RESEARCH	    SMITH	    CLERK	    800
 30	    SALES	    ALLEN	    SALESMAN	    1600
 30	    SALES	    WARD	        SALESMAN    	1250
 20	    RESEARCH	    JONES	    MANAGER	    2975
 30	    SALES	    MARTIN	    SALESMAN	    1250
 30	    SALES	    BLAKE	    MANAGER	    2850
 10	    ACCOUNTING	CLARK	    MANAGER	    2450
 20	    RESEARCH	    SCOTT	    ANALYST	    3000
 10	    ACCOUNTING	KING	        PRESIDENT	5000
 30	    SALES	    TURNER	    SALESMAN	    1500
 20	    RESEARCH	    ADAMS	    CLERK	    1100
 30	    SALES	    JAMES	    CLERK	    950
 20	    RESEARCH	    FORD	        ANALYST	    3000
 10	    ACCOUNTING	MILLER	    CLERK	    1300
*/


SELECT *
FROM DEPT; -- 부모 테이블

SELECT *
FROM EMP;  -- 자식 테이블

--※ 부모 자식 테이블 관계를 명확히 정리할 수 있도록 한다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
ON E.DEPTNO = D.DEPTNO;
--> 두 테이블 간 중복된 컬럼이 아니더라도,
-- 소속 테이블을 명시할 수 있도록 권장한다. 


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- 부모 컬럼을 명시
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 총 14건 조회됨
/*
DEPTNO DNAME    ENAME   JOB     SAL 
-------------------------------------
10	ACCOUNTING	MILLER	CLERK	1300
10	ACCOUNTING	KING	PRESIDENT	5000
10	ACCOUNTING	CLARK	MANAGER	2450
20	RESEARCH	FORD	ANALYST	3000
20	RESEARCH	ADAMS	CLERK	1100
20	RESEARCH	SCOTT	ANALYST	3000
20	RESEARCH	JONES	MANAGER	2975
20	RESEARCH	SMITH	CLERK	800
30	SALES	JAMES	CLERK	950
30	SALES	TURNER	SALESMAN	1500
30	SALES	BLAKE	MANAGER	2850
30	SALES	MARTIN	SALESMAN	1250
30	SALES	WARD	SALESMAN	1250
30	SALES	ALLEN	SALESMAN	1600
*/

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- 자식 컬럼을 명시
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


------------

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- 부모 컬럼을 명시
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 15건 조회

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- 자식 컬럼을 명시
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 15건 조회
/*
부서번호 잘 안나옴.
DEPTNO DNAME ENAME JOB SAL
--------------------------------
20	RESEARCH	SMITH	CLERK	800
30	SALES	ALLEN	SALESMAN	1600
30	SALES	WARD	SALESMAN	1250
20	RESEARCH	JONES	MANAGER	2975
30	SALES	MARTIN	SALESMAN	1250
30	SALES	BLAKE	MANAGER	2850
10	ACCOUNTING	CLARK	MANAGER	2450
20	RESEARCH	SCOTT	ANALYST	3000
10	ACCOUNTING	KING	PRESIDENT	5000
30	SALES	TURNER	SALESMAN	1500
20	RESEARCH	ADAMS	CLERK	1100
30	SALES	JAMES	CLERK	950
20	RESEARCH	FORD	ANALYST	3000
10	ACCOUNTING	MILLER	CLERK	1300
	OPERATIONS			

*/

-- 내가 풀이한 내용 
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'MANAGER' OR JOB = 'CLERK';


-----------------------------

--○ SELF JOIN (자기 조인)
-- EMP 테이블의 정보를 다음과 같이 조회할 수 있도록 한다.

/*
      E       E      E         E         E           E
    EMPNO   ENAME   JOB       MGR       
                             EMPNO      ENAME       JOB
---------------------------------------------------------------
  사원번호  사원명  직종명  관리자번호  관리자명  관리자직종명 
---------------------------------------------------------------
    7369    SMITH   CLERK     7902       FORD     ANALYST
                            :
    ENP      EMP     EMP     EMP
    ----------------------------- (1)
                             EMP         EMP        EMP
                          ------------------------------- (2)
---------------------------------------------------------------
*/

SELECT *
FROM EMP;
/*
7369	SMITH	CLERK	7902	    1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521    	WARD	    SALESMAN	7698	1981-02-22	1250    	500	    30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782    	CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		    20
7839	KING	    PRESIDENT		1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD	    ANALYST	7566	1981-12-03	3000		    20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/


SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명", E1.MGR "관리자번호", E2.ENAME "관리자명", E2.JOB "관리자직종명" 
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

--내가 풀이한 내용
/*
7902    	FORD    	ANALYST	    7566	JONES	MANAGER
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7844	TURNER	SALESMAN	    7698	BLAKE	MANAGER
7654	MARTIN	SALESMAN	    7698	BLAKE	MANAGER
7521	    WARD	    SALESMAN	    7698	BLAKE	MANAGER
7499	ALLEN	SALESMAN	    7698	BLAKE	MANAGER
7934	MILLER	CLERK	    7782    	CLARK	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7782	    CLARK	MANAGER	    7839	KING	    PRESIDENT
7698	BLAKE	MANAGER	    7839	KING	    PRESIDENT
7566	JONES	MANAGER	    7839	KING	    PRESIDENT
7369	SMITH	CLERK	7   902	    FORD	    ANALYST
7839	KING	    PRESIDENT			
*/데이터베이스 스키마 서비스 접속



-- 함께 풀이한 내용

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;


SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;


SELECT E1.EMPNO "사원번호", E1.ENAME "사원명", E1.JOB "직종명"
     , E2.EMPNO "관리자번호", E2.ENAME "관리자명", E2.JOB "관리자직종명"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--==>> 13개만 조회된다. 
--==>> LEFT JOIN 하게 되면 14개 (그러니까 KING까지) 조회된다. 

