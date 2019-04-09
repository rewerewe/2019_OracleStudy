SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 생성한 함수(FN_GENDER(매개변수))가 제대로 작동하는지의 여부 확인

SELECT NAME, SSN, FN_GENDER(SSN)
FROM TBL_INSA;

--○ 생성한 함수(FN_GENDER(매개변수))가 제대로 작동하는지의 여부 확인
SELECT FN_GENDER('870103-2234567')"함수호출결과" 
FROM DUAL;
--==>> 여자


SELECT FN_POWME(10, 3)"결과"
FROM DUAL;
--==>> 1000


SELECT FN_POWTO(10, 3)"결과"
FROM DUAL;
--==>> 1000

SELECT FN_POWTO(2, 8)"결과"
FROM DUAL;
--==>> 256

SELECT NAME, BASICPAY, SUDANG, FN_PAY(BASICPAY, SUDANG) "급여"
FROM TBL_INSA;

SELECT FN_WORKYEAR(HIREDATE)
FROM TBL_INSA;



SELECT FN_WORKYEAR(IBSADATE) "연차"
FROM TBL_INSA;
