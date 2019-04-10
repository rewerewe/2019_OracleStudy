SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 생성된 프로시저(PRC_INSA_INSERT() ) 정상 작동 여부 확인 → 프로시저 호출
EXEC PRC_INSA_INSERT('김선아', '901212-2234567', SYSDATE, '서울', '010-5555-5555', '영업부', '대리', 1000000, 200000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_INSA_INSERT('한승원', '910101-1234567', SYSDATE, '인천', '010-1212-1212', '기획부', '대리', 1000000, 200000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_INSA
ORDER BY NUM;

------------------------------------------------------------------------------------
-- 본래 실무에서는 테이블명, 컬럼명을 한글로 선언하지 않는다.
-- 예외처리에서 혼동의 여지가 있어 이번 실습에 한해서
-- 이해를 돕고자 한글로 테이블명, 컬럼명을 선언한다.  

--○ 실습 테이블 생성 (TBL_상품)
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량      NUMBER DEFAULT 0
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
--==>> Table TBL_상품이(가) 생성되었습니다.
-- TBL_상품 테이블의 상품코드를 기본키(PK) 제약조건 설정

--○ 실습 테이블 생성(TBL_입고)
CREATE TABLE TBL_입고
( 입고번호      NUMBER
, 상품코드      VARCHAR(20)
, 입고일자      DATE DEFAULT SYSDATE
, 입고수량      NUMBER
, 입고단가      NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드) 
                REFERENCES TBL_상품(상품코드) 
);
--==>> Table TBL_입고이(가) 생성되었습니다.
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를 
-- 참조할 수 있도록 외래키(FK) 제약조건 설정

--○ TBL_상품 테이블에 상품데이터 입력

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('HOO1', '홈런볼', 1000);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H002', '새우깡', 900);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H003', '자갈치', 800);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H004', '감자깡', 900);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H005', '꼬깔콘', 1200);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H006', '포카칩', 1500);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('H007', '뽀빠이', 2000);
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C001', '초코칩', 1800);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C002', '다이제', 2500);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C003', '버터링', 1500);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C004', '에이스', 1700);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C005', '오레오', 1700);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('C006', '비인츠', 900);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
--==>> 1 행 이(가) 삽입되었습니다. * 7

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E001', '엠엔엠', 600);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E002', '부푸러', 900);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E003', '아폴로', 300);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E004', '쫀드기', 400);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E005', '비틀즈', 800);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E006', '마이쮸', 1100);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격)
VALUES ('E007', '트윅스', 1200);
--==>> 1 행 이(가) 삽입되었습니다. * 7

--○ 확인
SELECT *
FROM TBL_상품;

/*
HOO1    	홈런볼	1000	0
H002	    새우깡	900 	0
H003	    자갈치	800	    0
H004	    감자깡	900	    0
H005    	꼬깔콘	1200    	0
H006	    포카칩	1500	0
H007	    뽀빠이	2000	    0
C001	초코칩	1800	0
C002	    다이제	2500	    0
C003	버터링	1500	0
C004	에이스	1700	0
C005	오레오	1700	0
C006	비인츠	900	    0
C007	빠다코	2900	    0
E001	엠엔엠	600	    0
E002	    부푸러	900	    0
E003	아폴로	300	    0
E004	쫀드기	400	    0
E005	비틀즈	800	    0
E006	마이쮸	1100	0
E007	트윅스	1200	    0
*/

COMMIT;
--==>> 커밋 완료.

--○ 날짜 세션 변경 설정
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

------------------------------------------------------------

--○ TBL_상품, TBL_입고 테이블을 대상으로..
--   TBL_입고 테이블에 데이터입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단, 이 과정에서 입고번호는 자동 증가 처리한다. (시퀀스 사용 Ⅹ)

--   TBL_입고 테이블 구성 컬럼
--   → 입고번호, 상품코드, 입고일자, 입고수량, 입고단가
--   프로시저 명: PRC_입고_INSERT(상품코드, 입고수량, 입고단가)

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_입고;

EXEC PRC_입고_INSERT('H007', 10, 900); 
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

-- PRC_입고_INSERT 프로시저에 WHERE을 설정해주지 않아, 전체로 재고수량 10개 업데이트 됨.
EXEC PRC_입고_INSERT('H007', 0, 900); 

UPDATE TBL_상품
SET 재고수량 = 0;

DELETE
FROM TBL_입고
WHERE 입고번호=2;


--○ 생성한 프로시저(PRC_입고_INSERT() )가 제대로 작동하는지 여부 확인
SELECT *
FROM TBL_상품;
SELECT *
FROM TBL_입고;

EXEC PRC_입고_INSERT('H005', 200, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('C001', 50, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('C001', 20, 1600);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E001', 80, 500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E001', 200, 400);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('H007', 100, 1800);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E006', 50, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E006', 250, 900);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E006', 80, 900);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('E006', 80, 900);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('H002', 40, 800);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


/*
HOO1    	홈런볼	1000	0
H002	    새우깡	900	    40
H003	    자갈치	800 	0
H004    	감자깡	900 	0
H005	    꼬깔콘	1200    	200
H006	    포카칩	1500	0
H007    	뽀빠이	2000	    200
C001	초코칩	1800	70
C002	    다이제	2500	    0
C003	버터링	1500	0
C004	에이스	1700	0
C005	오레오	1700	0
C006	비인츠	900	    0
C007	빠다코	2900	    0
E001	엠엔엠	600	    280
E002    	부푸러	900	    0
E003	아폴로	300	    0
E004	쫀드기	400	    0
E005	비틀즈	800	    0
E006	마이쮸	1100	380
E007	트윅스	1200	    0
*/

UPDATE TBL_상품
SET 재고수량=0
WHERE 상품코드 ='H005';

------------------------- 데이터 모두 초기화 
TRUNCATE TABLE TBL_입고;
--==>> Table TBL_입고이(가) 잘렸습니다.

UPDATE TBL_상품
SET 재고수량=0;
--==>> 21개 행 이(가) 업데이트되었습니다.

COMMIT;
--==>> 커밋 완료.

---------------------------------------------

-- ■■■ 프로시저 내에서의 예외 처리 ■■■   

-- ○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( NUM   NUMBER
, NAME  VARCHAR(30)
, TEL   VARCHAR(60)
, CITY  VARCHAR(60)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 생성한 프로시저(PRC_MEMBER_INSERT()) 정상 작동여부 확인
EXEC PRC_MEMBER_INSERT('정임혜', '010-9496-4150', '서울');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_MEMBER_INSERT('이승희', '010-4444-4444', '대구');
/*
    명령의 193 행에서 시작하는 중 오류 발생 -
    BEGIN PRC_MEMBER_INSERT('이승희', '010-4444-4444', '대구'); END;
    오류 보고 -
    ▶ ORA-20001: 서울, 인천, 경기만 입력 가능합니다.ㅁ
    ORA-06512: at "SCOTT.PRC_MEMBER_INSERT", line 42
    ORA-06512: at line 1
*/

--○ 확인
SELECT *
FROM TBL_MEMBER;

---------------------------------------------------------------------------------------------------13:00

--○ 실습 테이블 생성(TBL_출고)
CREATE TABLE TBL_출고
( 출고번호  NUMBER
, 상품코드  VARCHAR(20)
, 출고일자  DATE DEFAULT SYSDATE
, 출고수량  NUMBER
, 출고단가  NUMBER
);
--==>> Table TBL_출고이(가) 생성되었습니다.


--○ TBL_출고 테이블의 출고번호에 PK 제약조건 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_출고번호_PK PRIMARY KEY(출고번호);
--==>> Table TBL_출고이(가) 변경되었습니다.

--○ TBL_출고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
--   참조할 수 있도록 외래키(FK) 제약조건 지정
ALTER TABLE TBL_출고
ADD CONSTRAINT 출고_상품코드_FK FOREIGN KEY(상품코드)
                    REFERENCES TBL_상품(상품코드);
--==>> Table TBL_출고이(가) 변경되었습니다.



--○ TBL_출고 테이블에 데이터 입력시(즉, 출고 이벤트 발생시)
--   TBL_상품 테이블의 재고수량이 변동되는 프로시저를 작성한다.
--   단, 출고번호는 입고번호와 마찬가지로 자동 증가.
--   또한, 출고 수량이 재고 수량보다 많은 경우...
--   출고 액션을 취소할 수 있도록 처리한다. (출고가 이루어지지 않도록...)
--   프로시저명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가);

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_출고;

--○ 생성된 프로시저(PRC_출고_INSERT()가 제대로 작동하는지의 여부 확인)
EXEC PRC_출고_INSERT('C001', 60, 1800);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--○ 생성된 프로시저(PRC_출고_INSERT()가 제대로 작동하는지의 여부 확인)
-- 재고수량 보다 많은 출고수량 설정
EXEC PRC_출고_INSERT('C001', 20, 1800);
--==>> 에러 발생, TBL_상품의 초코칩 재고수량도 변동 없음.
/*
    명령의 334 행에서 시작하는 중 오류 발생 -
    BEGIN PRC_출고_INSERT('C001', 20, 1800); END;
    오류 보고 -
    ORA-20002: 재고가 부족합니다
    ORA-06512: at "SCOTT.PRC_출고_INSERT", line 43
    ORA-06512: at line 1
*/

EXEC PRC_출고_INSERT('HOO1', 10, 1000);
/*
명령의 330 행에서 시작하는 중 오류 발생 -
BEGIN PRC_출고_INSERT('HOO1', 10, 1000); END;
오류 보고 -
▶ ORA-20001: 출고수량이 재고수량보다 많습니다. 수량을 다시 입력해주세요
ORA-06512: at "SCOTT.PRC_출고_INSERT", line 41
ORA-06512: at line 1
*/

EXEC PRC_출고_INSERT('H007', 10, 1000);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


------------------------- 데이터 모두 초기화
TRUNCATE TABLE TBL_출고;
--==>> Table TBL_출고이(가) 잘렸습니다.

UPDATE TBL_상품
SET 재고수량=0
WHERE 상품코드='HOO1';
--==>> 1 행 이(가) 업데이트되었습니다.

ROLLBACK;
-------------------------------------------

--○ TBL_출고 테이블에서 출고 수량을 수정(변경)하는 프로시저를 작성한다.
--   프로시저명 : PRC_출고_UPDATE(출고번호, 변경할 수량);

EXEC PRC_출고_UPDATE(3, 70);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--(1)
EXEC PRC_출고_UPDATE(4, 50);
--==>>  C004	에이스	1700	150

--(2)
EXEC PRC_출고_UPDATE(4, 200);
--==>>  C004	에이스	1700	0

--(3)
EXEC PRC_출고_UPDATE(4, 201);
/*
    명령의 382 행에서 시작하는 중 오류 발생 -
    BEGIN PRC_출고_UPDATE(4, 201); END;
    오류 보고 -
    ORA-20002: 재고가 부족합니다.
    ORA-06512: at "SCOTT.PRC_출고_UPDATE", line 56
    ORA-06512: at line 1
*/


SELECT *
FROM TBL_출고;

SELECT *
FROM TBL_상품;

SELECT *
FROM TBL_입고;

------------------------------------ 재고 초기화
--○ 실습 환경 구성
EXEC PRC_입고_INSERT('C004', 200, 1500);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_출고_INSERT('C004', 150, 1800);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

------------------------------------------------





























