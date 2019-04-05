

--1.
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM EMP
WHERE JOB = 'salesman';
--==>> 조회 결과 없음

--○ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "1", UPPER('oRaCLe') "2", LOWER ('oRaCLe') "3", INITCAP('oRaCLe') "4"
FROM DUAL;
--==>>  관찰 :    oRaCLe	ORACLE	oracle	Oracle 
-- UPPER()는 모두 대문자로 변환하여 반환
-- LOWER()는 모두 소문자로 변환하여 반환
-- INITCAP() 는  첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환 

SELECT *
FROM EMP
WHERE EMPNO ='입력값';
--'입력값' 에 미리 설정해주자

SELECT *
FROM EMP
WHERE EMPNO=UPPER('입력값');

SELECT *
FROM EMP
WHERE EMPNO=UPPER('SaLSemAn');

SELECT *
FROM EMP
WHERE UPPER(JOB) = UPPER('SalEsmAn');

SELECT *
FROM EMP
WHERE LOWER(JOB) = LOWER('SalEsmAn');

SELECT *
FROM EMP
WHERE INITCAP(JOB) = INITCAP('SalEsmAn');

--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의 
-- 사원명, 직종명, 입사일 항목을 조회한다.
SELECT 사원명, 직종명, 입사일 
FROM TBL_EMP
WHERE 입사일이 1981년 9월 28일;

SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일" 
FROM TBL_EMP
WHERE 입사일이 1981년 9월 28일;

SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일" 
FROM TBL_EMP
WHERE HIREDATE='1981-09-28';
--             ------------ 날짜타입 아닌 문자타입
--==>> MARTIN	SALESMAN    	81/09/28
-- 결과는 조회되지만, 틀린 쿼리문이다. 
-- 문자 → 날짜 변환해야할 때 오라클도 자동형변환을 해줍니다만, 길이를 명시하지 않으면 각각 데이터에 의미가 없다.
-- 어떤 때는 자동형변환이 이뤄지지만, 어떤 때는 이뤄지지 않을 수 있다.
-- 자바는 일괄적으로 지원하는 데 비해, 오라클은 아니므로 자동형변환을 기대하지 맙시다.

--○ TO_DATE()
-- 문자열을 날짜타입으로 변환
-- 오라클에서 날짜는 크기비교가 가능하다. 
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');


--○ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)로 입사한 직원의 
-- 사원명, 직종명, 입사일 항목을 조회한다.


SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>  출력 : 
/*
MARTIN	SALESMAN	    81/09/28
SCOTT	ANALYST	    87/07/13
KING	    PRESIDENT	81/11/17
ADAMS	CLERK	    87/07/13
JAMES	CLERK	    81/12/03
FORD	    ANALYST	    81/12/03
MILLER	CLERK	    82/01/23
*/

--※ 오라클에서는 날짜 데이터의 크기비교가 가능하다.
--   오라클에서 날짜 데이터에 대한 크기 비교 시 
--   과거보다 미래를 더 큰 값으로 간주하여 처리한다.(정렬도 동일) 

--○ TBL_EMP 테이블에서 입사일이 1981년 4월 2일부터
--   1981년 9월 28일 사이에 입사한 직원들의 
--   사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)
-- 내가 풀이한 내용 
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP 
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') && HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD')
-- 오라클에서 이런 표현을 허용하지 않는다.

-- 함께 풀이한 내용 
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP 
WHERE HIREDATE TO_DATE('1981-04-02', 'YYYY-MM-DD') 이후
      HIREDATE TO_DATE('1981-09-28', 'YYYY-MM-DD') 이전;
      
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP 
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')
  AND HIREDATE  <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>  출력 :
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN    	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN    	81/09/08
*/




-- 2. 
--○ BETWEEN ⓐ AND ⓑ
-- 날짜타입 뿐 아니라, 숫자타입에도 적용하여 사용가능 
SELECT ENAME"사원명", JOB"직종명", HIREDATE"입사일"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
                   
-- 위와 같은 결과 반환됨
--==>>  출력 :
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	    81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN	    81/09/08
*/
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2000 AND 3000;
--==>>  출력 :
/*
7566	JONES	MANAGER	7839	81/04/02    	2975	    	20
7698	BLAKE	MANAGER	7839	81/05/01	2850	    	30
7782	    CLARK	MANAGER	7839	81/06/09	2450	    	10
7788	SCOTT	ANALYST	7566	87/07/13	3000		20
7902	    FORD	    ANALYST	7566	81/12/03	    3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
-- 틀린 쿼리문이 된다. SMITH, SCOTT은 조회안됨.
-- 사전식 배열을 적용한다. C...CA...CS 에서 끝나는 것.
-- S는 사전 뒷부분에 있어 조회되지 않는다.


SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
-- 아스키코드에서 보면 대문자 → 소문자 순으로 되어있다.
-- 대문자 C부터 소문자 s까지의 범위에서 조회된다.

--※ BETWEEN ⓐ AND ⓑ 는 날짜형, 숫자형, 문자형 데이터 모두에 적용된다.
--  단, 문자형일 경우 아스키코드 순서에 따르기 때문에
--  대문자가 앞쪽에 위치하고 소문자가 뒤쪽에 위치한다.
--  또한, BETWEEN ⓐ AND ⓑ는 쿼리문이 수행되는 시점에서
--  오라클 내부적으로는 부등호 연산자의 형태로 바뀌어 연산이 처리된다. 

-- ASCII()
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b')
FROM DUAL;
--==>>  출력 :    65  	66	97	98





--○ TBL_EMP 테이블에서 직종이 SALSEMAN 과 CLERK 인 사원의 
--  사원명, 직종명, 급여 항목을 조회한다.
--내가 풀이한 내용
SELECT ENAME"사원명", JOB"직종명", SAL"급여"
FROM TBL_EMP
WHERE JOB='SALSEMAN'
   OR JOB='CLERK'
-- 조건을 추가해도 가능하다. 
   OR JOB='MAAGER';

--함께 풀이한 내용
SELECT ENAME"사원명", JOB"직종명", SAL"급여"
FROM TBL_EMP
WHERE JOB IN ('SALSEMAN', 'CLERK');

SELECT ENAME"사원명", JOB"직종명", SAL"급여"
FROM TBL_EMP
WHERE JOB =ANY ('SALSEMAN', 'CLERK','MAAGER');  -- cf. 『ALL』

--※ 위의 3가지 유형의 쿼리문은 모두 같은 결과를 반환한다. 
-- 하지만, 맨 위의 쿼리문이 가장 빠르게 처리된다.
-- 물론, 메모리에 대한 내용이 아니라 CPU에 대한 내용이므로
-- 이 부분까지 감안하여 쿼리문의 내용을 구성하는 일은 많지 않다.
-- → 『IN』 과 『=ANY』는 같은 연산자 효과를 가진다.
--  모두 내부적으로는 『OR』구조로 변경되어 연산 처리된다.

--------------------------------------------------------------------

--○ 추가 실습 테이블 구성(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>>  출력 :    Table TBL_SAWON이(가) 생성되었습니다.


SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
--==>>  출력 :    
/*
이름       널? 유형           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAEM      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10) 
*/

--○ 데이터 입력(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '이원영', '8706241234567', TO_DATE('2001-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '나주영', '9405022234567', TO_DATE('2010-11-05', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '진윤비', '9710012234567', TO_DATE('1999-08-16', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '권홍비', '9504102234567', TO_DATE('1997-11-05', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '이비승', '7210101234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '조영우', '8004271234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '이하이', '0405062234567', TO_DATE('2010-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '소이현', '0506074234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '선동열', '0505053234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '선우선', '9505052234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '선우용녀', '7512122234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '남상현', '9302132234567', TO_DATE('2010-11-11', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '남궁선', '7202021234567', TO_DATE('1992-10-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '남이', '6912121234567', TO_DATE('1987-10-10', 'YYYY-MM-DD'), 4000);

DELETE 
FROM TBL_SAWON
WHERE SANAME ='남이';

--==>>  출력 :    1 행 이(가) 삽입되었습니다. * 14

SELECT *
FROM TBL_SAWON;
--==>>  출력 :    
/*
1001	이원영	8706241234567	01/01/03	3000
1002    	나주영	9405022234567	10/11/05	2000
1003	진윤비	9710012234567	99/08/16	5000
1004	권홍비	9504102234567	97/11/05	4000
1005	이비승	7210101234567	98/02/02	    2000
1006	조영우	8004271234567	98/02/02	    2000
1007	이하이	0405062234567	10/07/15	1000
1008	소이현	0506074234567	11/07/15	1000
1009	선동열	0505053234567	11/07/15	3000
1010	선우선	9505052234567	99/11/11	4000
1011	선우용녀	7512122234567	99/11/11	5000
1012	    남상현	9302132234567	10/11/11	3000
1013	남궁선	7202021234567	92/10/10	    2000
1014	남이  	6912121234567	81/10/10	4000
*/

--○커밋
COMMIT;
--커밋 완료.

--○ TBL_SAWON 테이블에서 이원영 사원의 정보를 모두 조회한다.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '이원영';
--==>>  출력 :    1001	이원영	8706241234567	01/01/03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '이원영';
--==>>  출력 :    1001	이원영	8706241234567	01/01/03	3000

-- LIKE : 동사 → 좋아하다
--        부사 → ~와 같이, ~처럼

--※ WILD CHARACTER → 『%』
--   『LIKE』 와 함께 사용되는 『%』는 모든 글자를 의미하고
--   『LIKE』 와 함께 사용되는 『_』는 아무 글자 1개를 의미한다. 

--○ TBL_SAWON 테이블에서 성씨가 『이』씨인 사원의 
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='이';
--==>>  출력 :    조회 결과 없음 

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='이__';
--==>>  출력 :    조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이';
--==>>  출력 :    조회 결과 없음

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이__';
--==>>  출력 : 
/*
이원영	8706241234567	3000
이비승	7210101234567	2000
이하이	0405062234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이%';
--==>>  출력 : 
/*
이원영	8706241234567	3000
이비승	7210101234567	2000
이하이	0405062234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남%';
--==>>  출력 : 
/*
남상현	9302132234567	3000
남궁선	7202021234567	2000
남이  	6912121234567	4000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남_';
--==>>  출력 :
-- 남이	6912121234567	4000


SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남__';
--==>>  출력 :
/*
남상현	9302132234567	3000
남궁선	7202021234567	2000
*/

--○ TBL_SAWON 테이블에서 이름의 마지막 글자가 『비』로 
--   끝나는 사원의 사원명, 주민번호, 입사일, 급여 항목을 조회한다.

SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__비';
--==>>  출력 :
/*
진윤비	9710012234567	99/08/16	5000
권홍비	9504102234567	97/11/05	4000
*/

--○ TBL_SAWON 테이블에서 이름의 마지막 글자가 『이』로 
--   끝나는 사원의 사원명, 주민번호, 입사일, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__이';
--==>>  출력 :
-- 이하이	0405062234567	10/07/15	1000
-- ↓
-- _ (언더바)를 사용하면 글자수를 명시하게 되는데 이렇게 출력되면 안된다. 
-- 1개가 아닌 모두를 조회하는 % 사용하기
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이';
--==>>  출력 :
/*
이하이	0405062234567	10/07/15	1000
남이	    6912121234567	87/10/10	4000
*/

--○ 데이터 추가 입력 
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '이이경', '8410141234567', TO_DATE('1997-10-10', 'YYYY-MM-DD'), 5000);
--==>>  출력 :    1 행 이(가) 삽입되었습니다.

--○ 커밋
COMMIT;
--커밋 완료.

--○ TBL_SAWON 테이블에서 사원 이름 안에 『이』라는 글자가 
--   하나라도 포함되어 있으면 그 사원의 
--   사원번호, 사원명, 입사일, 급여 항목을 조회한다.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이%';
--==>>  출력 :    
/*
1001	이원영	01/01/03	3000
1005	이비승	98/02/02    	2000
1007	이하이	10/07/15	1000
1008	소이현	11/07/15	1000
1014	남이	    87/10/10	4000
1015	이이경	97/10/10	5000
*/

--○ TBL_SAWON 테이블에서 사원 이름 안에 『이』라는 글자가 
--   두 번 포함되어 있으면 그 사원의 
--   사원번호, 사원명, 입사일, 급여 항목을 조회한다.
-- 내가 풀이한 내용
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '이%이%';
--==>>  출력 : 
/*
1007	이하이	10/07/15	1000
1015	이이경	97/10/10	5000
*/

-- 함께 풀이한 내용
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%이이%';  -- 『이』가 연속적으로 두 번 들어있는 데이터 조회 

--○ TBL_SAWON 테이블에서 성씨가 남씨인 사원의 
--   사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '남%';
--==>>  출력 :
/*
남상현	9302131234567	3000
남궁선	7202021234567	2000
남이	    6912121234567	4000
*/

-- 결과적으로 이 문제는 답이 없는 문제다. 해결할 수가 없다. 
-- 조회결과 '남궁선'이 있는데, 이 사람은 남씨 일수도, 남궁씨 일수도 있다.
-- 이를 알 수 없기에 이는 테이블 설계가 잘못된 것이라 볼 수 있다. 
-- 테이블을 설계할 때 성과 이름을 분리해서 입력 받아야 한다. 컬럼을 분리할 것.

--※ 데이터베이스 설계 시 성과 이름을 분리해서 처리해야 함
--   업무 계획이 있다면(지금 당장은 아니더라도) 테이블에서 성 컬럼과 
--   이름 컬럼의 분리하여 구성해야 한다.



--○ TBL_SAWON 테이블에서 여직원들의 사원명, 주민번호, 급여 항목을 조회한다.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' 
   OR JUBUN LIKE '______4______';
--==>>  출력 :    
/*
나주영	9405022234567	2000
진윤비	9710012234567	5000
권홍비	9504102234567	4000
이하이	0405062234567	1000
소이현	0506074234567	1000
선우선	9505052234567	4000
선우용녀	7512122234567	5000
*/


-- 함께 풀이한 내용
SELECT 사원명, 주민번호, 급여 
FROM TBL_SAWON
WHERE 여직원;

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE 여직원; -- 주민번호컬럼으로 판별
/*
WHERE 주민번호컬럼의 7번째 자리 1개가 2
      주민번호컬럼의 7번째 자리 1개가 4;
      
WHERE JUBUN LIKE '______2'
      JUBUN LIKE '______4';            -- 7자리 숫자를 의미하므로 조회되지 않는다. 
      
WHERE JUBUN LIKE '______2______'
      JUBUN LIKE '______4______';      -- 유효성 측면에서 보면 자리수로 설정해주는 게 더 낫다. 
      
WHERE JUBUN LIKE '______2%'
      JUBUN LIKE '______4%';           -- 이렇게도 가능함. 
*/

--○ 테이블 생성(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR(20)
, BINGO         VARCHAR(100)
);
--==>>  출력 :    Table TBL_WATCH이(가) 생성되었습니다.


--○ 데이터 입력
INSERT INTO TBL_WATCH VALUES ('금시계', '순금 99.99% 함유된 최고급 시계');
INSERT INTO TBL_WATCH VALUES ('은시계', '고객 만족도 99.99점을 획득한 시계');
--==>>  출력 :    1 행 이(가) 삽입되었습니다. * 2

--○ 커밋
COMMIT;
--==>>  출력 :    커밋 완료.

--○ TBL_WATCH 테이블의 BINGO 컬럼에
--   『99.99%』 라는 글자가 들어있는 행(레코드)의 정보를 조회한다.
-- 내가 풀이한 내용
SELECT *
FROM TBL_WATCH 
WHERE BINGO LIKE '%99.99%%%';

-- 함께 풀이한 내용
SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '99.99%';
--==>> 조회 결과 없음

SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99%%';
--==>>
/*
금시계	순금 99.99% 함유된 최고급 시계
은시계	고객 만족도 99.99점을 획득한 시계
*/

SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99\%%' ESCAPE '\';        -- 탈출시키는 것. 사용빈도가 높지 않은 특수문자를 사용하면 됩니다. 
--==>>  출력 :    금시계	순금 99.99% 함유된 최고급 시계


SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99$%%' ESCAPE '$';
--==>>  출력 :    금시계	순금 99.99% 함유된 최고급 시계


--※ ESCAPE 로 정한 문자의 다음 한 글자는 와일드캐릭터에서 탈출시켜라....
--   『ESCAPE '\'』
--   일반적으로 사용빈도가 낮은 특수문자(특수기호)를 사용한다.

--------------------------------------------------------------------------

--■■■ COMMIT / ROLLBACK ■■■-- 

SELECT *
FROM TBL_DEPT;
--==>>  출력 :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 데이터 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');
--==>>  출력 :    1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_DEPT;
--==>>  출력 :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부 	    서울
*/

-- 50   개발부     서울
-- 이 데이터는 TBL_DEPT 테이블이 저장되어 있는
-- 하드디스크상에 물리적으로 적용되어 저장된 것이 아니라
-- 메모리(RAM) 상에 입력된 것이다.

--○ 확인
SELECT *
FROM TBL_DEPT;

--○ 롤백 
ROLLBACK;
--==>> 롤백 완료.


--○ 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>  출력 :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH    	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
-- 50... 개발부... 서울... 에 대한 데이터가 소실되었음을 확인(존재하지 않음)

--○ 다시 입력
INSERT INTO TBL_DEPT VALUES(50, '개발부', '서울');

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 커밋 이후 다시 확인 
SELECT *
FROM TBL_DEPT;
--==>>  출력 :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 롤백 이후 다시 확인
SELECT *
FROM TBL_DEPT;
--==>>  출력 :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	개발부	서울
*/

--> 롤백(ROLLBACK)을 수행했음에도 불구하고 
-- 50번... 개발부... 서울... 의 데이터는 소실되지 않았음을 확인

--※ COMMIT 을 실행한 이후로 DML 구문(INSERT, UPDATE, DELETE)을 통해
--   변경된 데이터만 취소할 수 있는 것일 뿐...
--   DML 명령을 사용할 후 COMMIT 하고나서 ROLLBACK 을 실행해봐야
--   이전 상태로 되돌릴 수 없다. (아무런 소용이 없다.)

--○ 데이터 수정(TBL_DEPT)
                                -- 작성순서 
UPDATE TBL_DEPT                 -- ①
SET DNAME='연구부', LOC='인천'   -- ③
WHERE DEPTNO=50;                -- ② 변경하고자 하는 조건 
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_DEPT;
--==>>  출력 :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	연구부	    인천
*/


--○롤백
ROLLBACK;
--==>> 롤백 완료.

SELECT *
FROM TBL_DEPT;
--==>>  출력 :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/
--> 수정(UPDATE)을 수행하기 이전 상태로 복원되었음을 확인



--※UPDATE 쿼리문 구성 
/*
UPDATE 테이블 명 
SET 컬럼1 = '입력할 값'
WHERE 조건;
*/

UPDATE TBL_SAWON
SET JUBUN = '9302131234567' 
WHERE SANAME='남상현';
--==>>  출력 :    1 행 이(가) 업데이트되었습니다.



--○ 데이터 삭제(DELETE)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 50	개발부	서울

DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_DEPT;
--==>>  출력 :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

SELECT *
FROM TBL_DEPT;
--==>>  출력 :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH    	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	개발부	    서울
*/


-- DML 구문은 CTRL+S 여부를 판단해서 처리한다.
-- 그러나 AUTO COMMIT 되는 것.

/*
1. ABC 테이블 생성
2. ABC 테이블에 데이터 입력
3. 커밋
4. ABC 테이블의 데이터 삭제
5. ABC 테이블 생성 - AUTO COMMIT
*/


--------------------------------------------------------------
--■■■ 정렬(ORDER BY) 절 ■■■--

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP;
/*
SMITH	20	CLERK	          800	 9600
ALLEN	30	SALESMAN	    1600	    19500
WARD	    30	SALESMAN    	1250	        15500
JONES	20	MANAGER	    2975	        35700
MARTIN	30	SALESMAN	    1250	        16400
BLAKE	30	MANAGER	    2850	        34200
CLARK	10	MANAGER	    2450	        29400
SCOTT	20	ANALYST	    3000	    36000
KING	    10	PRESIDENT	5000	    60000
TURNER	30	SALESMAN    	1500	    18000
ADAMS	20	CLERK	    1100	    13200
JAMES	30	CLERK	          950	11400
FORD	    20	ANALYST	    3000	    36000
MILLER	10	CLERK	    1300	    15600
*/

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY COMM;
/*
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
WARD	    30	SALESMAN	1250	    15500
MARTIN	30	SALESMAN	1250	    16400
SCOTT	20	ANALYST	3000	36000
KING	    10	PRESIDENT5000	60000
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	 950	11400
FORD    	20	ANALYST	3000	36000
MILLER	10	CLERK	1300	15600
BLAKE	30	MANAGER	2850	    34200
JONES	20	MANAGER	2975	    35700
SMITH	20	CLERK	 800	 9600
CLARK	10	MANAGER	2450	    29400
*/


SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY COMM ASC; 

-- 오라클에서는 NULL 값을 가장 큰 값으로 간주하여 처리한다.

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY DEPTNO ASC;   -- ASC : 오름차순 → 생략가능-!!!


SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY DEPTNO DESC;   -- DESC : 내림차순 → 생략불가-!!!
/*
BLAKE	30	MANAGER	    2850	    34200
TURNER	30	SALESMAN	    1500	18000
ALLEN	30	SALESMAN	    1600	19500
MARTIN	30	SALESMAN	    1250    	16400
WARD    	30	SALESMAN	    1250	    15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	3    5700
SMITH	20	CLERK	     800     9600
ADAMS	20	CLERK	    1100	13200
FORD	    20	ANALYST	    3000	36000
KING	    10	PRESIDENT    5000   60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450    	29400
*/


SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY 연봉 DESC;

-- ORDER BY 절보다 SELECT 절이 먼저 처리되기 때문에
-- 컬럼명 대신 SELECT 절에서 사용한 ALIAS(별칭) 을
-- ORDER BY 절에서 사용해도 문제가 발생하지 않는다. (가능하다.)

SELECT ENAME"사원명", DEPTNO"부서번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY 부서 번호 DESC;
--==>> 에러 발생


SELECT *
FROM TBL_EMP;


SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY "부서 번호" DESC;

/*
BLAKE	30	MANAGER	    2850 	34200
TURNER	30	SALESMAN    	1500	18000
ALLEN	30	SALESMAN	    1600	19500
MARTIN	30	SALESMAN	    1250	    16400
WARD	    30	SALESMAN    	1250	    15500
JAMES	30	CLERK	     950	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	    35700
SMITH	20	CLERK	     800	 9600
ADAMS	20	CLERK	    1100	13200
FORD	    20	ANALYST	    3000	36000
KING	    10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	    29400
*/


SELECT ENAME"사원명", DEPTNO"부서 번호", JOB"직종", SAL"급여"
     , SAL*12+NVL(COMM, 0)"연봉" 
FROM TBL_EMP
ORDER BY 2;         -- 생략하면 오름차순을 뜻함
-- ORDER BY의 2는 SELECT의 DEPTNO를 기준으로 2번째를 뜻함. 
--> TBL_EMP 테이블이 갖고 있는 테이블의 고유한 컬럼 순서가 아니라
-- SELECT 처리 되는 두 번째 컬럼(즉, DEPTNO)을 기준으로 정렬되는 것을 확인
-- ASC 생략된 상태 → 오름차순 정렬되는 것을 확인

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4;      -- DEPTNO 기준 1차 정렬, SAL 기준 2차 정렬 ... ASC 
--1차 정렬은 DEPTNO, 2차 정렬을 SAL 로 해달라.
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/



SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;
-- 1) DEPTNO(부서번호) 기준 오름차순 정렬
-- 2) JOB(직종명) 기준 오름차순 정렬
-- 3) SAL(급여) 기준 내림차순 정렬
-- (3차 정렬 수행)
--==>>
/*
MILLER	10	CLERK	1300
CLARK	10	MANAGER	2450
KING	    10	PRESIDENT	5000
SCOTT	20	ANALYST	3000
FORD	    20	ANALYST	3000
ADAMS	20	CLERK	1100
SMITH	20	CLERK	800
JONES	20	MANAGER	2975
JAMES	30	CLERK	950
BLAKE	30	MANAGER	2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	    30	SALESMAN	1250
*/



------------------------------------------------------------------------------
-- 14:00
--○ CONCAT()
-- 문자열 결함하는 함수 
SELECT '전훈의' || '이지혜' "①"
     , CONCAT('전훈의', '이지혜') "②"
FROM DUAL;
--==>> 전훈의이지혜	전훈의이지혜

SELECT ENAME||JOB"①"
    , CONCAT(ENAME, JOB) "②"
FROM TBL_EMP;
/*
SMITHCLERK	SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	ADAMSCLERK
JAMESCLERK	JAMESCLERK
FORDANALYST	FORDANALYST
MILLERCLERK	MILLERCLERK
*/

-- CONCAT()은 문자열 결합 함수이지만, 두 가지 조건만 결합할 수 있다.
SELECT ENAME || JOB || DEPTNO "①"
     , CONCAT(ENAME, JOB, DEPTNO)"②"
FROM TBL_EMP;
-- 에러발생
--> 2개의 문자열을 결합시켜주는 기능을 가진 함수.
-- 오로지 2개만 결합시킬수 있다. 


FROM TBL_EMP
--> 내부적인 형 변환이 일어나며 결합을 수행하게 된다.
-- CONCAT()은 문자열과 문자열을 결합시켜주는 함수이지만
-- 내부적으로는 숫자나 날짜를 문자타입으로 바꾸어주는 과정이 포함되어 있다.


---------------------------------------------------------------------------
/*
obj.substring()
---
↓
문자열.substring(n, m);
                n부터 m-1까지... (0부터 시작하는 인덱스 기준)
                자바는 둘다 인덱스임 
*/

--○ SUBSTR() / SUBSTRB()
--   -----     -------
--  갯수기반  바이트기반    → 자바의 substring 과 오라클의 substring 을 잘 구분해서 기억해둘 것. (헷갈립니다)

-- 문자열 추출 함수 

SELECT ENAME"①"
     , SUBSTR(ENAME, 1, 2)"②"
     , SUBSTR(ENAME, 2, 2)"③"
     , SUBSTR(ENAME, 3, 2)"④"
     , SUBSTR(ENAME, 2)"⑤"
FROM TBL_EMP;
-->> 문자열을 추출하는 기능을 가진 함수
--   자바가 0부터 시작했던 것과 달리, 오라클은 1부터 시작한다. 
--   첫 번째 파라미터 값은 대상 문자열(추출의 대상) 
--   두 번째 파라미터 값은 추출을 시작하는 위치(단, 인덱스는 1부터 시작) 
--   세 번째 파라미터 값은 추출할 문자열의 갯수(생략시... 시작위치부터 끝까지)
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/

--○ TBL_SAWON 테이블에서 성별이 남성인 사원만
-- 사원번호, 사원명, 주민번호, 급여 항목을 조회한다.
-- 단, SUBSTR() 함수를 사용할 수 있도록 하며
-- 급여 기준으로 내림차순 정렬을 수행할 수 있도록 한다.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1' 
   OR SUBSTR(JUBUN, 7, 1) = '3'
ORDER BY SAL DESC; 
-- 오라클의 자동형변환 규칙에 기대지말고, 명시해줍시다. 
--==>>  출력 :
/*
1015	이이경	8410141234567	5000
1014	남이	    6912121234567	4000
1001	이원영	8706241234567	3000
1009	선동열	0505053234567	3000
1012	    남상현	9302131234567	3000
1013	남궁선	7202021234567	2000
1005	이비승	7210101234567	2000
1006	조영우	8004271234567	2000
*/
-- 확인 
SELECT *
FROM TBL_SAWON;

-- IN 이나 =ANY 를 사용해도 된다. 
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3')
ORDER BY SAL DESC; 
/*
1015	이이경	8410141234567	5000
1014	남이  	6912121234567	4000
1001	이원영	8706241234567	3000
1009	선동열	0505053234567	3000
1012	    남상현	9302131234567	3000
1013	남궁선	7202021234567	2000
1005	이비승	7210101234567	2000
1006	조영우	8004271234567	2000
*/

SELECT *
FROM TBL_SAWON;

--○ LENGTH() / LENGTHB()
--   -------   ---------
-- 문자갯수기반 바이트기반
-- 바이트 기반은 한글일 경우 매우 처리하기 곤란해진다.

SELECT ENAME"①"
     , LENGTH(ENAME)"②"
     , LENGTHB(ENAME)"③"
FROM TBL_EMP;
-->> LENGTH()는 글자 수를 반환, LENGTHB()는 바이트 수를 반환
--==>>  출력 : 
/*
SMITH	5	5
ALLEN	5	5
WARD    	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	    4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD    	4	4
MILLER	6	6
*/

SELECT '이원영'"①"
     , LENGTH('이원영')"②"
     , LENGTHB('이원영')"③"
FROM DUAL;
--==>> 이원영	3	9

SELECT *
FROM NLS_DATABASE_PARAMETERS;

--○ INSTR()
-- 위치값을 반환하는 함수 
SELECT 'ORACLE ORAHOME BIORA'"①"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1)"②"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2)"③"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1)"④"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2)"⑤"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2)"⑥"
FROM DUAL;
--> 첫 번째 파라미터 값에 해당하는 문자열에서... (대상 문자열)
--  두 번째 파라미터 값을 통해 넘겨준 문자열이 등장하는 위치를 찾아라-!!!
--  세 번째 파라미터 값을 찾기 시작하라.(즉, 스캔을 시작하는) 위치
--  네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정 (1은 생략가능) → 예시의 ⑤에 해당.(④, ⑤는 같다)

SELECT '나의오라클 집으로오라 합니다'"①"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 1)"②"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 2)"③"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 10)"④"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 11)"⑤"
                                                  ---
--                                        찾기 시작하는 위치 
FROM DUAL;
-- 마지막 파라미처(네 번째 파라미터) 값을 생략한 형태로 사용-!!! → 1 
--==>> 출력 :     나의오라클 집으로오라 합니다	    3	3	10	0



--○ REVERSE()
--  문자열 반전 
SELECT 'ORACLE'"①"
     , REVERSE('ORACLE')"②"
     , REVERSE('오라클')"③"
FROM DUAL;
--==>> 출력 :     ORACLE	    ELCARO	???




--○ 실습 대상 테이블 생성(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> 출력 :     Table TBL_FILES이(가) 생성되었습니다.

--○ 실습 데이터 입력
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20190328_01_SCOTT.SQL');
--==>> 1 행 이(가) 삽입되었습니다. * 8

--○ 커밋
COMMIT;
--==>> 커밋 완료.

SELECT FILENO"파일번호", FILENAME"파일이름"
FROM TBL_FILES;

/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20190328_01_SCOTT.SQL
*/

/*
파일번호 파일명
------- -----------------------------
    1	SALES.DOC
    2	PANMAE.XXLS
    3	RESEARCH.PPT
    4	STUDY.HWP
    5	SQL.TXT
    6	TEST.PNG
    7	SPRING.JPG
    8	20190328_01_SCOTT.SQL
*/
--○ TBL_FILES 테이블을 대상으로 위와 같이 조회될 수 있도록
--  쿼리문을 구성한다. 
-- 내가 풀이한 내용
SELECT *
FROM TBL_FILES;
SELECT FILENAME
, SUBSTR(FILENAME, LENGTH(FILENAME) - INSTR(REVERSE(FILENAME), '\', '1')+2)
--, SUBSTR(REVERSE(FILENAME), 1, 10)
--, LENGTH(FILENAME) 
--, SUBSTR(FILENAME, 5)
FROM TBL_FILES;

-- 함께 풀이한 내용
SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(FILENAME, 16, 9)"파일명"
FROM TBL_FILES
WHERE FILENO=1;
--==>> 출력 :      1  	C:\AAA\BBB\CCC\SALES.DOC	    SALES.DOC
--수식 구조를 다르게 해주어야 함을 인지하자.

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(FILENAME, 네번째\위치+1, 9)"파일명"
FROM TBL_FILES
WHERE FILENO=1;

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(FILENAME, 두번째\위치+1, 9)"파일명"
FROM TBL_FILES
WHERE FILENO=2;
--'\'의 위치를 일반적인 규칙으로 찾을 수 없는 구조이다.
--REVERSE() 로 뒤집으면? 
--'처음등장하는\의 위치'로 표현가능해진다.

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , REVERSE(FILENAME)"거꾸로된파일명"
FROM TBL_FILES;
--'처음등장하는\의 위치'로 

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(거꾸로된파일명, 추출시작위치, 추출갯수) REVERSE(FILENAME)"거꾸로된파일명"
FROM TBL_FILES;

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(REVERSE(FILENAME), 1, 최초''가 등장하는 위치 -1) REVERSE(FILENAME)"거꾸로된파일명"
FROM TBL_FILES;

    -- 최초'\'가 등장하는 위치
    INSTR(REVERSE(FILENAME), '\', 1);           -- 마지막 매개변수 1 생략

SELECT FILENO"파일번호", FILENAME"경로포함파일명"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1)"거꾸로된파일명"
FROM TBL_FILES;


SELECT FILENO"파일번호"
     ,REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1))"파일명"
FROM TBL_FILES;
--==>> 출력:
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20190328_01_SCOTT.SQL
*/



--○ LPAD()
--> Byte 공간을 확보하여 왼쪽부터 문자로 채우는 기능을 가진 함수
-- 처리되는 순서를 잘 기억해둡시다. 

SELECT 'ORACLE'"①"
     , LPAD('ORACLE', 10, '*')"②"
--          -------   --  -- 
--                    ①
FROM DUAL;
--==>> 출력 :
-- ORACLE	****ORACLE

-- 1) 10Byte 공간을 확보한다.                   → 두 번째 파라미터 값에 의해
-- 2) 확보한 공간에 'ORACLE'문자열을 담는다.     → 첫 번째 파라미터 값에 의해
-- 3) 남아있는 BytE 공간을 왼쪽부터 세 번째 파라미터 값으로 채운다.
-- 4) 이렇게 구성된 최종 결과값을 반환한다. 



--○ RPAD()
--> Byte 공간을 확보하여 오른쪽부터 문자로 채우는 기능을 가진 함수
-- 처리되는 순서를 잘 기억해둡시다. 

SELECT 'ORACLE'"①"
     , RPAD('ORACLE', 10, '*')"②"
--          -------   --  -- 
--                    ①
FROM DUAL;
--==>> 출력 :
-- ORACLE	ORACLE****
-- 1) 10Byte 공간을 확보한다.                   → 두 번째 파라미터 값에 의해
-- 2) 확보한 공간에 'ORACLE'문자열을 담는다.     → 첫 번째 파라미터 값에 의해
-- 3) 남아있는 BytE 공간을 오른쪽부터 세 번째 파라미터 값으로 채운다.
-- 4) 이렇게 구성된 최종 결과값을 반환한다. 


--○ LTRIM()
-- 손톱깍기와 같은 원리 
-- 1) 남은 것을 반환한다. 
-- 2) 'ORA' 완성형이 아니라 O R A 이렇게 따로 있는 것이라 하나씩 잘라냄.
-- 대소문자 역시 구분하여 조건과 같지 않으면, 더 이상 잘라내지 않음. 공백도 역시 잘라내지 못함.
-- 3) 자르다가 뒷부분을 파낼 순 없음.
-- ▶'공백제거'함수로 많이 활용됨
-- ex. 아이디 입력시 공백이 있을 수 있음 
--     → APP 에서 DB로 넘어올 때 공백을 넣었을 경우에, 공백이 있는 채로 DB에 사용할 수 없기 때문에 공백을 제거해 줌.
SELECT 'ORAORAORACLEORACLE' "①"                -- 오라 오라 오라클 오라클
    , LTRIM('ORAORAORACLEORACLE', 'ORA')"②"    
    , LTRIM('AAAORAORAORACLEORACLE', 'ORA')"③"
    , LTRIM('ORAoRAORACLEORACLE', 'ORA')"④"
    , LTRIM('ORA ORAORACLEORACLE', 'ORA')"⑤"
    , LTRIM('ORA               ')"⑥"          -- 왼쪽 공백 제거 함수로 활용 (두 번째 파라미터 값 생략, 없음)
FROM DUAL;
/*
ORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	 
 ORAORACLEORACLE
*/
--> 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
-- 왼쪽부터 연속적으로 두 번째 파라미터 값에서 지정한 글자와 같은 글자가 등장할 경우 
-- 이를 제거한 결과값을 반환한다.
-- 단, 완성형으로 처리하지 않는다.
--==>> 출력 :

SELECT LTRIM('이김신이김신이이신신김이신이이김김이신박이김신','이김신')"TEST"
FROM DUAL;
--==>> 출력 : 박이김신


--○ RTRIM()
-- 손톱깍기와 같은 원리 
-- 1) 남은 것을 반환한다. 
-- 2) 'ORA' 완성형이 아니라 O R A 이렇게 따로 있는 것이라 하나씩 잘라냄.
-- 대소문자 역시 구분하여 조건과 같지 않으면, 더 이상 잘라내지 않음. 공백도 역시 잘라내지 못함.
-- 3) 자르다가 뒷부분을 파낼 순 없음.
-- ▶'공백제거'함수로 많이 활용됨
-- ex. 아이디 입력시 공백이 있을 수 있음 
--     → APP 에서 DB로 넘어올 때 공백을 넣었을 경우에, 공백이 있는 채로 DB에 사용할 수 없기 때문에 공백을 제거해 줌.
SELECT 'ORAORAORACLEORACLE' "①"                -- 오라 오라 오라클 오라클
    , RTRIM('ORAORAORACLEORACLE', 'ORA')"②"    
    , RTRIM('AAAORAORAORACLEORACLE', 'ORA')"③"
    , RTRIM('ORAoRAORACLEORACLE', 'ORA')"④"
    , RTRIM('ORA ORAORACLEORACLE', 'ORA')"⑤"
    , RTRIM('ORA                ')"⑥"          -- 오른쪽 공백 제거 함수로 활용 (두 번째 파라미터 값 생략, 없음)
FROM DUAL; 
/*
ORAORAORACLEORACLE	
ORAORAORACLEORACLE	
AAAORAORAORACLEORACLE	
ORAoRAORACLEORACLE	
ORA ORAORACLEORACLE	
ORA
*/


--○ TRANSLATE()
-- 1:1 로 바꾸어준다.
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                               -
                , 'abcdefghijklmnopqrstuvwxyz')
                               -
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-6575-2297'
                , '0123456789'
                , '영일이삼사오육칠팔구')
FROM DUAL;
--==>> 영일영-육오칠오-이이구칠


--○ REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '오라')
FROM DUAL;
--==>> MY 오라CLE 오라HOME

