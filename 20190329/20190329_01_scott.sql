SELECT USER
FROM DUAL;

 
--○ ROUND() 반올림을 처리해주는 함수
SELECT 48.678 "①", ROUND(48.678, 2) "②"      -- 소수점 이하 둘째자리까지 표현(세째자리에서 반올림)
                  , ROUND(48.674, 2) "③"
                  , ROUND(48.674, 1) "④"
                  , ROUND(48.674, 0) "⑤"       -- 정수부분만 표현해라.
                  , ROUND(48.674) "⑥"          -- 두번째 파라미터 값이 0일 경우 생략 가능
                  , ROUND(48.674, -1) "⑦"
                  , ROUND(48.674, -2) "⑧"
                  , ROUND(48.674, -3) "⑨"
FROM DUAL;
--==>> 48.678   48.68   48.67   48.7   49   49   50   0   0


--○ TRUNC() 절삭을 처리해주는 함수
SELECT 48.678
        , TRUNC(48.678, 2) ""
        , TRUNC(48.674, 2) ""
        , TRUNC(48.678, 1) ""
        , TRUNC(48.678, 0) ""
        , TRUNC(48.678) ""
        , TRUNC(48.678, -1) ""
        , TRUNC(48.678, -2) ""
        , TRUNC(48.678, -3) ""
FROM DUAL;


--○ MOD() 나머지를 반환하는 함수
SELECT MOD(5, 2)
FROM DUAL;
-- 5를 2로 나눈 나머지 결과값 반환
--==>> 1

--○ POWER() 제곱의 결과를 반환하는 함수
SELECT POWER(5,3)
FROM DUAL;
-- 5의 3승을 결과값으로 반환
--==>> 125


--○ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2)
FROM DUAL;
-- 루드 2에 대한 결과값 반환
--==>> 1.41421356237309504880168872420969807857


--○ LOG() 로그 함수
-- (※ 오라클은 상용로그만 지원하는 반면, MSSQL은 상용로그, 자연로그 모두 지원한다)
SELECT LOG(10,100), LOG(10, 20) 
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--○ 삼각함수 
-- 싸인, 코싸인, 탄젠트 결과값을 반환한다.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>> 
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/


--○ 삼각함수의 역함수 (범위 : -1 ~ 1)
-- 어싸인, 어코싸인, 어탄젠트 결과값을 반환한다.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;

/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805
0.4636476090008061162142562314612144020295
*/


--○ SIGN()   서명, 부호, 특징
-- 연산 결과값이 양수가 1.0이면 0, 음수이면 -1을 반환한다.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
-- 매출이나 수지와 관련하여 적자 및 흑자의 개념을 나타낼 때 주로 사용한다. 
/*
    1	0	-1
*/


--○ ASCII(), CHR() → 서로 상응하는 개념의 함수 
SELECT ASCII('A'), CHR(65)
FROM DUAL;
-- ASCII() : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- CHR()   : 매개변수로 넘겨받은 숫자를 아스키코드 값으로 취하는 문자를 반환한다.
/*
    65	A   
*/





----------------------------------------------------------------------------------

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>  Session이(가) 변경되었습니다.

--※ 날짜의 연산의 기본단위는 'DAY(일수)' 입니다. [CHECK]
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
/*
    2019-03-29 09:29:14     -- 현재
    2019-03-30 09:29:14	    -- 1일 후 
    2019-03-27 09:29:14	    -- 2일 전
    2019-02-28 09:29:14     -- 29일 전 
*/


--○ 시간단위 연산
SELECT SYSDATE, SYSDATE + 1/24, SYSDATE - 2/24
FROM DUAL;

/*
    2019-03-29 09:31:17	    -- 현재
    2019-03-29 10:31:17	    -- 1시간 후 
    2019-03-29 07:31:17     -- 2시간 전
*/

--○ 현재 시간과... 현재 시간 기분 1일 2시간 3분 4초 후를 조회한다.
/*
--------------------------------------------
        현재시간             연산 후 시간
--------------------------------------------
 2019-03-29 09:30:48    2019-03-30 11:33:52
--------------------------------------------
*/

--SELECT SYSDATE"현재시간", SYSDATE+1 +2/24 + 3/1440 + 4/86400 "연산 후 시간"
SELECT SYSDATE"현재시간", SYSDATE+1 +2/24 + 3/(24*60) + 4(24*60*60)"연산 후 시간"
FROM DUAL;

-- 방법1.
SELECT SYSDATE"현재 시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"연산 후 시간"  
FROM DUAL;
/*

    2019-03-29 09:41:19	    2019-03-30 11:44:23
*/

-- 방법2.
SELECT SYSDATE"현재 시간"
     , SYSDATE + ( (24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60)"연산 후 시간"
--                     1일         2시간      3분    4초 
FROM DUAL;
/*
          현재 시간              연산 후 시간 
    2019-03-29 09:44:35	    2019-03-30 11:47:39
*/



--○ 날짜 - 날짜 = 일수 
-- ex) (2019-07-18) - (2019-03-29)
--       수료일          현재일
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD') - TO_DATE('2019-03-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 111

--V------------------------------------------------------------------------------------------------------9


SELECT TO_DATE('2019-13-29', 'YYYY-MM-DD')
FROM DUAL;
-- 지정한 월에 대한 부적합 에러 
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/


--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 진행할 때 
-- 내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.



--○ ADD_MONTHS() 개월 수를 더해 주는 함수 
SELECT SYSDATE "1"
, ADD_MONTHS(SYSDATE, 2) "2"
, ADD_MONTHS(SYSDATE, 3) "3"
, ADD_MONTHS(SYSDATE, -2) "4"
, ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
-- 월을 더하고 빼기 
/*
    2019-03-29 10:06:18     --현재
    2019-05-29 10:06:18	    -- 2개월 후 
    2019-06-29 10:06:18	    -- 3개월 후 
    2019-01-29 10:06:18	    -- 2개월 전
    2018-12-29 10:06:18     -- 3개월 전
*/



--※ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  Session이(가) 변경되었습니다.



--○ MONTHS_BETWEEN()
-- '월 수' 반환. 개월 수의 차이를 반환하는 함수 
-- 첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;
--==>>  201.949151359020310633213859020310633214

--※ 결과값의 부호가 『-』로 반환되었을 경우에는
-- 첫 번째 인자값에 해당하는 날짜보다
-- 두 번째 인자값에 해당하는 날짜가 『미래』라는 의미로 확인할 수 있다.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18', 'YYYY-MM-DD'))
FROM DUAL;
--==>>  -3.63143593189964157706093189964157706093



--○ NEXT_DAY()
-- 첫 번째 인자값을 기준 날짜로 돌아오는 가장 빠른 요일 반환
SELECT NEXT_DAY(SYSDATE, '토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>>  2019-03-30	2019-04-01

--※ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> 
Session이(가) 변경되었습니다.

--○ 세션 설정 변경한 이후 위의 쿼리문을 다시 한번 조회
SELECT NEXT_DAY(SYSDATE, '토'), NEXT_DAY(SYSDATE, '월')
FROM DUAL;
--==>> 에러 발생 
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2019-03-30	2019-04-01

--○ 추가 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE ='KOREAN';
--==>> Session이(가) 변경되었습니다.



--○ LAST_DAY()
-- 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2019-03-31

SELECT LAST_DAY(TO_DATE('2019-02-01', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 2019-02-28

--○ 오늘부로, 김정규님이 군대에 또 끌려(?)간다.
--   복무 기간은 22개월로 한다.

-- 1. 전역 일자를 구한다.

-- 2. 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면 
--    정규가 몇 끼를 먹어야 집에 보내줄까.

SELECT ADD_MONTHS(SYSDATE, 22)"전역일자"
FROM DUAL;
/*  
    1.
    전역일자
    2021-01-29
*/

SELECT (TO_DATE('2021-01-29', 'YYYY-MM-DD') - TO_DATE('2019-03-29', 'YYYY-MM-DD') * 3)"정규가 먹어야하는 끼니"
FROM DUAL;
/*
    복무기간 * 3
    --------
    (전역일자 - 현재일자)
    
    (전역일자 - 현재일자) * 3 
*/

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3
FROM DUAL; 
--==>> 2016

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

/*
--○ 현재 날짜 및 시각으로부터, 수료일(2019-07-18 18:00:00) 까지
--   남은 기간을 다음과 같은 형태로 조회할 수 있도록 한다.

---------------------------------------------------------------------------
      현재시간      |        수료일         |     일 |   시간 |   분 |  초 |
---------------------------------------------------------------------------
2019-03-29 10:33:27 |  2019-07-18 18:00:00 |    110 |     7  |  26  |  33 |
---------------------------------------------------------------------------
*/

-- 내가 풀이한 내용 
-- TO_CHAR 로 변환, 날짜타입 아닌 문자타입   
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "현재시간"                      -- 문자타입
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"                  -- 날짜타입
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) "일"        -- 숫자타입
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') -
     TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))  "시분초"
     
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') -          --  트렁크(소수점-트렁크)
     TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) *24) "시"  -- 트렁크 
    
FROM DUAL;    
    
    
    
 /*    
     -- TO_DATE - TO_DATE = 일 
     --, TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24 "시간(24)"
     --  -TRUNC(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))/24*60 "시간(24)"
     ,TRUNC((TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24) 
     - TRUNC(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24 "시(24)"
     
     
     --,(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))) * (24*60) "분(24*60)" 
     --,TRUNC((TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24*60*60)/ "초(24*60*60)"
     
     --, TO_DATE(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))"시간"  
     --, TO_CHAR(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') + (2/24))"시간"
     --, "분"
     --, "초"    
*/

--V------------------------------------------------------------------------------------------------------10
-- 삽질의 시간....
/*

SELECT SYSDATE"현재 시간"
     , SYSDATE + ( (24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60)"연산 후 시간"
--                     1일         2시간      3분    4초 
*/


--V------------------------------------------------------------------------------------------------------11
-- 함께 풀이한 내용 
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

-- 『1일 2시간 3분 4초』를... 초로 환산하면?
SELECT (1일) + (2시간) + (3분) + (4초)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)"초로 환산"
FROM DUAL;
--==>> 93784

-- 『93784』초를 다시 일, 시간, 분, 초로 환산하면...
SELECT 
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 1	2	3	4



-- 수료일까지 남은 기간 확인(날짜 기준)    → 단위 : 일수 
SELECT 수료일자 - 현재일자 
FROM DUAL;


-- 수료일자 
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2019-07-18 18:00:00  → 날짜 형식



-- 수요일까지 남은 일수 
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 111.238287037037037037037037037037037037     일



-- 수료일까지 남은 기간 확인(날짜 기준)    → 단위 : 초
SELECT 수료일까지남은일수 * 하루를 구성하는 전체 초
FROM DUAL;


SELECT 수료일까지남은일수 * (24*60*60)    -- (24*60*60) : 1일을 구성하는 전체 초 
FROM DUAL;


SELECT ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60)    -- (24*60*60) : 1일을 구성하는 전체 초 
FROM DUAL;
--==>> 9610811.00000000000000000000000000000001


SELECT TRUNC(TRUNC(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60)/60)/24)"일"
     , MOD(TRUNC(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60)/60), 24)"시"
     , MOD(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60), 60)"분"
     , TRUNC(MOD(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) , 60))"초"
FROM DUAL;
--==>> 111	5	36	7

/*
쪼개서 구성했던 것을 합쳐 놓으면.... 됩니다.
괄호때문에 삽질하지 않아도 된다. 이러면 안된다....
*/


/*
--○ 문제
-- 본인이 태어나서 현재까지 얼마만큼의 일, 시간, 분, 초를 살고 있는지 조회한다.

---------------------------------------------------------------------------
     현재 시각      |      태어난 시각      |     일 |   시간 |   분 |  초 |
---------------------------------------------------------------------------
2019-03-29 10:33:27 |  1987-11-03 05:30:10 |  XXXX  |   XXX  |  XXX | XXX |
---------------------------------------------------------------------------

*/

SELECT SYSDATE"현재 시각"
FROM DUAL;



-- 1일 5시 30분 10초를 초로 계산
SELECT (1일) + (5시) + (30분) + (10초)
FROM DUAL;

SELECT (1*24*60*60) + (5*60*60) + (30*60) + (10)
FROM DUAL;
--==>> 106210


-- 95410를 1일 5시 30분 10초로 변환
SELECT
     MOD(TRUNC(TRUNC(106210/60)/60), 24)"시"
     , MOD(TRUNC(106210/60), 60)"분"
     , MOD(106210
     
     , 60)"초"
FROM DUAL;



-- 날짜 형식 세선 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.



--※ 날짜 데이터를 대상으로 반올림, 절삭을 수행할 수 있다.

--○ 날짜 반올림
SELECT SYSDATE "1"                       -- 2019-03-29 : 기본 현재 날짜 
     , ROUND(SYSDATE, 'YEAR') "2"        -- 2019-01-01 : 년도까지 유효한 데이터(상반기, 하반기 기준)	
     , ROUND(SYSDATE, 'MONTH') "3"       -- 2019-04-01 : 월까지 유효한 데이터(15일 기준)
     , ROUND(SYSDATE, 'DD') "4"          -- 2019-03-30 : 날짜까지 유효한 데이터(정오 기준)
     , ROUND(SYSDATE, 'DAY') "5"         -- 2019-03-31 : 날짜까지 유효한 데이터(수요일 기준)
FROM DUAL;

--==>> 2019-03-29	2019-01-01	2019-04-01	2019-03-30	2019-03-31


--○ 날짜 절삭
SELECT SYSDATE "1"                       -- 2019-03-29 : 기본 현재 날짜 
     , TRUNC(SYSDATE, 'YEAR') "2"        -- 2019-01-01 : 년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "3"       -- 2019-03-01 : 월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "4"          -- 2019-03-29 : 날짜까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "5"         -- 2019-03-24 : 날짜까지 유효한 데이터 
FROM DUAL;


---------------------------------------------------------------------------------------------------

--■■■ 변환 함수 ■■■--

-- TO_CHAR()    : 숫자, 날짜 데이터를 문자 타입으로 변환시켜주는 함수                 숫자, 날짜 → 문자 
-- TO_DATE()    : 문자 데이터(날짜 형식 취하는)를 날짜 타입으로 변환시켜주는 함수           문자 → 날짜
-- TO_NUMBER()  : 문자 데이터(숫자 형식 취하는)를 숫자 타입으로 변환시켜주는 함수           문자 → 숫자

--※ 날짜나 통화 형식이 맞지 않을 경우
--   세션 설정값을 통해 설정할 수 있도록 한다.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';           -- 언어팩 설정
--==>>  Session이(가) 변경되었습니다.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';       -- 데이터 언어팩 설정
--==>>  Session이(가) 변경되었습니다.

ALTER SESSION SET MLS_CURRENCY = '\'; --통화 기록 설정 ?

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')       -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')             -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')             -- TWENTY NINETEEN
     , TO_CHAR(SYSDATE, 'MM')               -- 03
     , TO_CHAR(SYSDATE, 'MONTH')            -- 3월
     , TO_CHAR(SYSDATE, 'MON')              -- 3월
     , TO_CHAR(SYSDATE, 'DD')               -- 29
     , TO_CHAR(SYSDATE, 'DAY')              -- 금요일
     , TO_CHAR(SYSDATE, 'DY')               -- 금
     , TO_CHAR(SYSDATE, 'HH24')             -- 14
     , TO_CHAR(SYSDATE, 'HH')               -- 02
     , TO_CHAR(SYSDATE, 'HH AM')            -- 02 오후
     , TO_CHAR(SYSDATE, 'HH PM')            -- 02 오후 
     , TO_CHAR(SYSDATE, 'MI')               -- 
     , TO_CHAR(SYSDATE, 'SS')               -- 
     , TO_CHAR(SYSDATE, 'SSSSS')            -- 51547 → 금일 흘러온 전체 초
     , TO_CHAR(SYSDATE, 'Q')                -- 분기

FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>>  4	4
--문자는 좌측정렬 

SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>>  04	4
--숫자는 우측정렬

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>> 2019
--날짜는 좌측정렬
-- 문자타입은 숫자타입으로 변환해두어야 연산이 가능하다.



--○ EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')         --2019              → 연도를 추출하여 문자타입으로.   
, TO_CHAR(SYSDATE, 'MM')                --03                →                문자타입으로.
, TO_CHAR(SYSDATE, 'DD')                --29                →                문자타입으로.
, EXTRACT(YEAR FROM SYSDATE)            --         2019     → 연도를 추출하여 숫자타입으로. 
, EXTRACT(MONTH FROM SYSDATE)           --            3     →                숫자타입으로.
, EXTRACT(DAY FROM SYSDATE)             --           29     →                숫자타입으로.
FROM DUAL;
--> 년, 월, 일 이하 다른 것은 불가


--○ TO_CHAR() 활용 → 형식 맞춤 표기 결과값 변환 

SELECT 60000                            --          60000
     , TO_CHAR(60000)                        --60000
     , TO_CHAR(60000, '999,999')             --  60,000
     , TO_CHAR(60000, '$99,999')             -- $60,000
     , LTRIM(TO_CHAR(60000, 'L99,999'))      --          ￦60,000 : 문자타입임에도 우측정렬인 이유?
--                                            ---------- 통화기호를 넣을 수 있는 자리 공백을 두는 것. 그래서 LTRIM()함수와 같이 쓴다.
                                             --￦60,000
FROM DUAL;


--○ 날짜 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>  Session이(가) 변경되었습니다.


--○ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE"현재시간"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"1일2시간3분4초 후"
FROM DUAL;
/*
        현재시간              1일2시간3분4초 후
    2019-03-29 14:47:09	    2019-03-30 16:50:13
*/



--○ 현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "현재 시간"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')"연산 결과" 
                    ------------------       ----------
--                  YM = YEAR + MONTH   /  DS = DAY + S는 시간 전체 
--                  → 1년 2개월의 간격     → 3일 4시간:5분:6초의 간격 
FROM DUAL;


--V------------------------------------------------------------------------------------15:00

--○ CASE 구문(조건문, 분기문)
/*
CASE
WHEN
THEN
ELSE
END
-- 생략불가. 다 써야 합니다.
-- STATEMENT 문장. 
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요' END "결과 확인"
FROM DUAL;
--==>> 5+2=7


SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2는 몰라요' END "결과 확인"
FROM DUAL;
--==>> 5+2는 몰라요


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'         -- IF...ELSE 구문과 비슷함. 
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라'
        END "결과 확인"
FROM DUAL;
-- TRUE 인지, FALSE 인지 확인하는 것 
--==>> 1+1=2


--○ DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=3', 3, '5-3=2', '5-2는 몰라') "결과 확인"
FROM DUAL;
-- 함수 안에 매개변수를 넣는 것, 매개변수의 갯수 제한은 없다. 순서를 잘 맞춰 사용해야 합니다. 
--==>>  5-3=2


--○ CASE WHEN THEN ELSE END 구문활용

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
       ------------- 
--     참일 경우, 다음 문장 안보고 종료    
            ELSE '5와 2는 비교불가'
        END "결과 확인"
FROM DUAL;
-- 모든 경우를 다 확인해보고 TRUE 이면 THEN 값을 반환하고 종료하는 것
--==>> 5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '지혜만세'
            WHEN 5>2 OR 2=3 THEN '기승만세'         -- T OR F 이면 T
            ELSE '희진만세'
        END "결과 확인"
FROM DUAL;
--==>> 지혜만세


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>> 훈의만세


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '훈의만세'
            WHEN 5<2 AND 2=3 THEN '진석만세'
            ELSE '보라만세'
        END "결과 확인"
FROM DUAL;
--==>> 보라만세


/*
--○ 문제
    TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회한다.
    사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일
    , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스
    
    단, 현재나이는 한국나이 계산법에 따라 연산을 수행한다.
    또한, 정년퇴직일은 해당 직원의 나이가 한국나이로 60세가 되는 해(년도)의 
    그 직원의 입사 월, 일로 연산을 수행한다.
    
    그리고 보너스는 1000일 이상 2000일 미만 근무한 사원은
    그 사원의 원래 급여 기준 30% 지급.
    
    2000일 이상 근무한 사원은
    그 사원의 원래 급여 기준 50%를 지급할 수 있도록 처리한다.
    (태어나면서 1살인 경우) 
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  Session이(가) 변경되었습니다.

SELECT *
FROM TBL_SAWON;

SELECT SANO"사원번호"
     , SANAME"사원명"
     , JUBUN"주민번호"
     , CASE WHEN (JUBUN LIKE '______2______' OR JUBUN LIKE '______4______') THEN '여자'
            WHEN (JUBUN LIKE '______1______' OR JUBUN LIKE '______3______') THEN '남자'
            ELSE '판독불가'
        END"성별"
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))+1)
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))+1)
            ELSE 0
        END"현재나이" 
     , HIREDATE"입사일"
/*
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2)))
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2)))
            ELSE 0  -- 숫자로 연산
        END "현재~정년남은연도"        
*/    
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))
            ELSE '없음'  -- CONCAT()이라 문자로 결합
        END"정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"

     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TRUNC(TO_DATE(CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))) - SYSDATE)
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TRUNC(TO_DATE(CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))) - SYSDATE)
            ELSE 0  -- CONCAT()이라 문자로 결합
        END"남은일수"
    
     , SAL"급여"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE) >= 1000 AND TRUNC(SYSDATE - HIREDATE) < 2000 THEN TO_NUMBER(SAL * 0.3)
            WHEN TRUNC(SYSDATE - HIREDATE) >= 2000 THEN TO_NUMBER(SAL * 0.5)
            ELSE 0
        END"보너스"
     
FROM TBL_SAWON;



--V--------------------------------------------------------------------------------14:00

-- 함께 풀이한 내용 
-- TBL_SAWON 테이블에 존재하는 사원들의
-- 입사일(HIREDATE) 컬럼에서 월, 일만 조회하기
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM'), TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;


SELECT *
FROM TBL_SAWON;
--     사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 급여 
--                               ----   -------
--     (정년퇴직일, 근무일수, 남은일수, 보너스)

/*
SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호"
     , CASE WHEN 주민번호 7번째자리 1개가 1 또는 3 THEN '남자'
            WHEN 주민번호 7번째자리 1개가 2 또는 4 THEN '여자'
            ELSE '성별확인불가'
        END"성별"
FROM TBL_SAWON;
*/

SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인불가'
        END"성별"
FROM TBL_SAWON;

------------------------------------------------------------ 성별까지 확인

SELECT SANO"사원번호", SANAME"사원명", JUBUN"주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인불가'
        END"성별"
/*        
--      현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 생 / 2000년대 생)
     , CASE WHEN 1900년대 생이라면...
            THEN 현재년도 - (주민번호 앞 두자리) + 1899)
            WHEN 2000년대 생이라면....
            THEN 현재년도 - (주민번호 앞 두자리) + 2000)
            ELSE 0      -- WHEN~THEN 절이 숫자 타입이기 때문에 '나이 확인 불가' 이렇게 쓸 수 없다. 
            
*/            
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0      -- WHEN~THEN 절이 숫자 타입이기 때문에 '나이 확인 불가' 이렇게 쓸 수 없다. 
            END "현재나이"
FROM TBL_SAWON;



------------------------------------------------------------ 현재 나이까지 확인

UPDATE TBL_SAWON
SET JUBUN = '0405064234567'
WHERE SANAME = '이하이';
--==>> 1 행 이(가) 업데이트되었습니다.





