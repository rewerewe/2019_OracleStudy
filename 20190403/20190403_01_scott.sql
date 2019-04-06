-- 1. 20190403_01_scott.sql 입니다. 

SELECT USER
FROM DUAL;
--==>> SCOTT

--■■■ UNION / UNION ALL ■■■--

--○ 실습 테이블 생성 (TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- 주문 테이블 생성
( JUNO        NUMBER                -- 주문 번호 
, JECODE      VARCHAR2(30)          -- 주문된 제품 코드
, JUSU        NUMBER                -- 주문 수량
, JUDAY       DATE DEFAULT SYSDATE  -- 주문 일자 
);
--==>> Table TBL_JUMUN이(가) 생성되었습니다.
--> 고객의 주문이 발생했을 경우,
--  주문내용에 대한 데이터가 입력될 수 있는 테이블 

--○ 데이터 입력 → 고객의 주문발생 / 접수
INSERT INTO TBL_JUMUN VALUES
(1, '홈런볼', 20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '꼬깔콘', 10, TO_DATE('2001-11-01 09:23:24', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '나쵸', 30, TO_DATE('2001-11-02 12:00:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '포카칩', 10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '웨하스', 10, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, '웨하스', 12, TO_DATE('2001-11-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, '홈런볼', 50, TO_DATE('2001-11-06 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '포카칩', 40, TO_DATE('2001-11-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, '꼬깔콘', 10, TO_DATE('2001-11-13 09:14:03', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '꿀꽈배기', 20, TO_DATE('2001-11-13 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));

-- 1 행 이(가) 삽입되었습니다. * 10

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;

/*

      JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 홈런볼                                 20 2001-11-01 09:00:10
         2 꼬깔콘                                 10 2001-11-01 09:23:24
         3 나쵸                                   30 2001-11-02 12:00:11
         4 포카칩                                 10 2001-11-02 15:16:17
         5 웨하스                                 10 2001-11-03 10:22:33
         6 웨하스                                 12 2001-11-04 16:00:00
         7 홈런볼                                 50 2001-11-06 11:11:11
         8 포카칩                                 40 2001-11-10 19:00:00
         9 꼬깔콘                                 10 2001-11-13 09:14:03
        10 꿀꽈배기                               20 2001-11-13 14:20:00
        
*/

--○ 커밋
COMMIT;
--==>>커밋 완료.

--○ 데이터 추가 입력 → 2001년부터 시작된 주문이 현재(2019년)까지 계속 발생했다는 가정.
INSERT INTO TBL_JUMUN VALUES(98765, '홈런볼', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98766, '뽀빠이', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98767, '포테토칩', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98768, '웨하스', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98769, '웨하스', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98770, '꼬깔콘', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98771, '홈런볼', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98772, '초코송이', 10, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98773, '홈런볼', 30, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_JUMUN VALUES(98774, '초코칩', 20, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_JUMUN;

/*
      JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 홈런볼                                 20 2001-11-01 09:00:10
         2 꼬깔콘                                 10 2001-11-01 09:23:24
         3 나쵸                                   30 2001-11-02 12:00:11
         4 포카칩                                 10 2001-11-02 15:16:17
         5 웨하스                                 10 2001-11-03 10:22:33
         6 웨하스                                 12 2001-11-04 16:00:00
         7 홈런볼                                 50 2001-11-06 11:11:11
         8 포카칩                                 40 2001-11-10 19:00:00
         9 꼬깔콘                                 10 2001-11-13 09:14:03
        10 꿀꽈배기                               20 2001-11-13 14:20:00
              :                                          :
     98765 홈런볼                                 10 2019-04-03 09:25:11
     98766 뽀빠이                                 20 2019-04-03 09:25:51
     98767 포테토칩                               30 2019-04-03 09:26:29
     98768 웨하스                                 10 2019-04-03 09:27:18
     98769 웨하스                                 20 2019-04-03 09:27:49
     98770 꼬깔콘                                 20 2019-04-03 09:28:28
     98771 홈런볼                                 20 2019-04-03 09:29:03
     98772 초코송이                               10 2019-04-03 09:29:51
     98773 홈런볼                                 30 2019-04-03 09:30:32
     98774 초코칩                                 20 2019-04-03 09:31:16

*/

-- 과자 종류(상품)를 파악하려면 제품 테이블(제품 코드)이 존재할 것이다.
--                            ---------------------  한번 작성되면 잘 변하지 않는다. = 데이터가 유지되는 테이블 
-- 반면, 주문내역 테이블은 시시각각 변한다. (주문 취소 하더라도, 삭제하지 않는다)      =  데이터가 계속 쌓이는 테이블 
-- 데이터가 계속 쌓이는 테이블은 모든 주문내역을 메모리에 퍼 올려야 하는 문제가 생긴다.
-- 그럼 누적 데이터가 많은 테이블은 그대로 두고, 새로운 테이블에 저장할 수 있으면 좋은데 그럴려면 프로그램 다 뜯어야 함.개발 새로해야함.
-- 그래서 연도별로 데이터를 잘라서 백업 테이블로 옮겨 데이터를 따로 저장해두는 방식으로 현업에서 많이 쓰인다.  


------------------------------------------------------------------------------------------------------------10:00

--※ 과자 쇼핑몰 운영중...
--   TBL_JUMUN 테이블이 너무 무거워진 상황.
--   어플리케이션과의 연동으로 인해 주문내역을 다른 테이블에
--   저장될 수 있도록 만드는 것은 불가능한 상황.
--   기존의 모든 데이터를 덮어놓고 지우는 것도 불가는한 상황.
--   → 결과적으로, 현재까지 누적된 주문데이터 중
--      금일 발생한 주문내역을 제외하고 나멈지를 다른 테이블(TBL_JUMUNBACKUP)로 
--      데이터 이관을 수행할 계획


DESC TBL_JUMUN;

--○ 오늘 주문건을 제외한 주문내역 조회
SELECT * 
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--WHERE EXTRACT(YEAR FROM JUDAY) < 2019;

--○ 위의 조회 결과로 TBL_JUMUNBACKUP 테이블 생성
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT * 
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.

SELECT *
FROM TBL_JUMUNBACKUP;

/*
1	홈런볼	20	2001-11-01 09:00:10
2	꼬깔콘	10	2001-11-01 09:23:24
3	나쵸	    30	2001-11-02 12:00:11
4	포카칩	10	2001-11-02 15:16:17
5	웨하스	10	2001-11-03 10:22:33
6	웨하스	12	2001-11-04 16:00:00
7	홈런볼	50	2001-11-06 11:11:11
8	포카칩	40	2001-11-10 19:00:00
9	꼬깔콘	10	2001-11-13 09:14:03
10	꿀꽈배기	20	2001-11-13 14:20:00
*/
-->> TBL_JUMUN 테이블의 데이터들 중
--   금일 주문내역 이외의 데이터는 모두 TBL_JUMUNBACKUP에 백업을 마친 상태.

--○ TBL_JUMUN 테이블의 데이터들 중
--   백업을 마친 데이터들 삭제 → 금일 주문이 아닌 데이터들을 제거

--○ 삭제
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- WHERE EXTRACT(YEAR FROM JUDAY) < 2019;
--==>> 10개 행 이(가) 삭제되었습니다.   → 98764 건의 데이터 삭제

-- 아직 상품발송이 완료되지 않은 금일 주문데이터를 제외하고 
-- 이전의 모든 주문 데이터들이 삭제된 상황이므로
-- 테이블은 행(레코드)의 갯수가 줄어들어 매우 가벼워진 상황.

--○ 확인
SELECT * 
FROM TBL_JUMUN;
/*
    98765	홈런볼	10	2019-04-03 09:25:11
    98766	뽀빠이	20	2019-04-03 09:25:51
    98767	포테토칩	30	2019-04-03 09:26:29
    98768	웨하스	10	2019-04-03 09:27:18
    98769	웨하스	20	2019-04-03 09:27:49
    98770	꼬깔콘	20	2019-04-03 09:28:28
    98771	홈런볼	20	2019-04-03 09:29:03
    98772	초코송이	10	2019-04-03 09:29:51
    98773	홈런볼	30	2019-04-03 09:30:32
    98774	초코칩	20	2019-04-03 09:31:16
*/

--○ 커밋 
COMMIT;
--==>> 커밋 완료.


/*
    그런데, 지금까지 주문받은 내역에 대한 정보를
    제품별 총 주문량으로 나타내어야 할 상황이 발생했다.
    그렇다면, TBL_JUMUNBACKUP 테이블의 레코드(행)과
    TBL_JUMUN 테이블의 레코드(행)을 합쳐서 하나의 테이블을
    조회하는 것 같은 결과를 확인할 수 있는 쿼리문을 구성해야 한다.
    
    컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN 을 사용하지만
    레코드(행)과 레코드(행)을 결합하고자 하는 경우 UNION과 UNION ALL 을 사용한다. 
*/

-- JOIN : 세로 컬럼끼리 옆으로 결합하여 조회하는 구조 
-- UNION / UNION ALL : 가로 행끼리 위아래로 결합하여 조회하는 구조 

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;

--> UNION 과 UNION ALL 의 차이가 없다.

-- 테이블 순서를 바꿔보았다. 

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

/*
--> UNION 은 첫번째컬럼을 기준으로 정렬하는 기능이 포함되어 있다.
  ※ UNION은 항상 결과물의 첫 번째 컬럼을 기준으로 오름차순 정렬을 수행한다. → UNION 정렬을 하기 때문에 의도치 않게 부하가 많이 발생한다. 
                                                                                 중복된 값을 제거한다. 
     UNION ALL 은 결합된 순서대로 조회한 결과를 반환한다 (정렬 없음) → UNION ALL (사용자가 지정한 대로)이 많이 쓰인다. 
     이로 인해 UNION 이 부하가 더 크다. 
     또한, UNION 은 결과물에서 중복된 행이 존재할 경우
     중복을 제거하고 1개 행만 조회된 결과를 반환한다.
*/

-------------------------------------------------------------------------------------------------------------- 11:00 

--○ 지금까지 주문받은 모든 데이터를 통해
--   제품별 총 주문량을 조회하는 쿼리문을 구성한다

/*
----------------------------------------
        제품코드        총 주문량    
----------------------------------------
         ....              XX
         ....             XXX
         ....              XX
----------------------------------------
*/

SELECT JECODE "제품코드", SUM(JUSU) "총 주문량"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;

-->> UNION 으로 조회하면, 중복값을 제거하기 때문에 UNION 을 쓰면 안되는 케이스이다. 
-- 이 문제를 해결하는 과정에서 UNION 을 사용해서는 안된다.
-- → JECODE 와 JUSU 를 조회하는 과정에서 중복되는 행을 제거하는 상황 발생-!!!

SELECT *
FROM TBL_JUMUN;


--○ INTERSECT / MINUS (→ 교집합 / 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서 
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
SELECT JECODE, JUSU
FROM TBL_JUMUN;

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
-- 위, 아래 동시에 존재하는 데이터 웨하스 10 , 홈런볼 20 반환
/*
웨하스	10
홈런볼	20
*/

------------------------------------------------------------------------------------------------------ 12:00

--○ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서 
--   제품코드와 주문량의 값이 똑같은 행의 정보를
--   주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회한다.


    SELECT "주문번호", "제품코드", "주문수량", "주문일자"
    FROM TBL_JUMUN J JOIN TBL_JUMUNBACKUP JB
    ON J.JECODE = JB.JECODE
    INTERSECT
    SELECT I.JECODE "제품코드", I.JUSU "주문수량"
    FROM 
    (
        SELECT JECODE, JUSU
        FROM TBL_JUMUNBACKUP
        INTERSECT
        SELECT JECODE, JUSU 
        FROM TBL_JUMUN
    ) I ;



SELECT J.JUNO "주문번호", J.JECODE "제품코드", J.JUSU "주문수량", J.JUDAY"주문일자"
    FROM
    (
        SELECT JECODE, JUSU
        FROM TBL_JUMUNBACKUP
        INTERSECT
        SELECT JECODE, JUSU 
        FROM TBL_JUMUN
            
    ) I JOIN TBL_JUMUN J
ON J.JECODE = JB.JECODE AND J.JUSU = JB.JUSU;


-- 함께 풀이한 내용

-- 방법 1.

SELECT T2.JUNO "주문번호", T1.JECODE "제품코드", T1.JUSU "주문수량", T2.JUDAY "주문일자"
FROM
(  
 -- 결합된 데이터(조회할 칼럼의 데이터가 없다)   SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN 
(
-- 조회할 칼럼의 데이터(결합된 데이터가 없다)
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;

-- 방법2
-- 인라인 뷰로 묶은 조건은 명시하기 위해서 구성했다. 
SELECT T. *
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--(1) (Ⅹ)순서대로 연산처리 되서 4가지 조건을 만족하는 데이터는 모두 조회된다. 
--WHERE JECODE='홈런볼' OR JECODE='웨하스'
--  AND JUSU= 20 OR JUSU=10;
--(2)
--WHERE JECODE || JUSU IN ('홈런볼20', '웨하스10');
--(3)
--WHERE CONCAT(JECODE, JUSU) IN ('홈런볼20', '웨하스10');
--(4)
WHERE CONCAT(JECODE, JUSU) =ANY ('홈런볼20', '웨하스10');

--    :
--    :
-- 정리하면 

SELECT T. *
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU) =ANY (SELECT CONCAT(JECODE, JUSU)
                                     FROM TBL_JUMUNBACKUP
                                     INTERSECT
                                     SELECT CONCAT(JECODE, JUSU)
                                     FROM TBL_JUMUN);
 

-- 교집합된 데이터 
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
-->> ('웨하스', '10', '홈런볼', '20')
/*
웨하스10
홈런볼20
*/
-->> CONCAT 을 씌어 ('웨하스10', '홈런볼20') 으로 만들어 줌. 


--○ MIUNS : 차집합

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT                -- 두 테이블에서 겹치는 부분
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
웨하스	10
홈런볼	20
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS                   -- 두 테이블에서 겹치는 부분을 빼고 나머지 부분
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
꼬깔콘	10
꿀꽈배기	20
나쵸  	30
웨하스	12
포카칩	10
포카칩	40
홈런볼	50
*/

/*
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/

--------- 설명은 하지만, 이렇게 쓰이는 경우는 없습니다.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 1992 코드 중 NATURAL JOIN 이 있다.
-- 결합할 두 테이블 사이에 NATURAL JOIN 을 써주면 된다.
-- 오라클이 찾아서 알아서 해줌. 
-- → 쿼리문 작성에는 쉽고, 간결하나 퍼포먼스면에서 월등히 떨어진다. (오라클은 두 테이블 다 보기 때문에)
--(Ⅹ) 이렇게는 안써요
SELECT DEPTNO,  DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;

--(Ⅹ) 이렇게는 안써요
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);

------------------------------------------------------ JOIN 끝.
-- 1) PARSING 순서 6가지
-- 2) JOIN 을 많이 쓰게 될거예요
-- 3) 정규화, 정규형 (DBA에게 중요하다) → 제대로 파악하지 못하면 프로젝트 못함
--          < 기획 >            < 코딩 >
--  업무분석,요구사항, 계획  /               / 
--  중요도:         DB설계    >    코드작성

