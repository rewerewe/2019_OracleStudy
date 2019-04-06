SELECT USER
FROM DUAL;
--==>> HR

/*

    [강사님 필기]

    ※ 참고
    
    1. 관계(Relationship, Relation)
        - 모든 엔트리(entry)는 단일값을 가진다.
        - 각 열(column)은 유일한 이름을 가지며 순서는 무의미하다.
        - 테이블의 모든 행(row = 튜플 = tuple)은 동일하지 않으며 순서는 무의미하다.
 
 
    2. 속성(Attribute)
        - 테이블의 열(Column)을 나타낸다.
                     -------
        - 자료의 이름을 가진 최소 논리적 단위 : 객체의 성질, 상태 기술
        - 일반 파일(file)의 항목 (아이템 = item = 필드 = field)에 해당한다.
                                         -----          -----
        - 엔티티(entity)의 특성과 상태를 기술
        - 속성(attribute) 의 이름은 모두 달라야 한다.
 
    
    3. 튜플 = tuple = 엔티티 = entity
      -----          -------
        - 테이블의 행(row)
                   -------
        - 연관된 몇 개의 속성으로 구성
        - 개념 정보 단위
        - 일반 파일(file)의 레코드(record)에 해당한다.
                                 --------
        - 튜플 변수(tuple variable)
        : 튜플을 가르키는 변수, 모든 튜플 집합을 도메인으로 하는 변수
 
        
    4. 도메인(domain) → 데이터타입으로 인지하면 쉽습니다.
        - 각 속성 (attribute)이 가질수 있도록 허용된 값들의 집합
        - 속성명과 도메인명이 반드시 동일할 필요는 없음
        - 모든 릴레이션에서 모든 속성들의 도메인은 원자적(atomic)이어야 함.
        - 원자적 도메인
          : 도메인의 원소가 더 이상 나누어질 수 없는 단일체일 때를 나타냄
          
          
    5. 릴레이션(Relation) → 관계와 같이 쓰이지만, 둘은 구분할 수 있다. 
        - 파일 시스템에서 파일과 같은 개념
        - 중복된 튜플(tuple = entity = 엔티티)을 포함하지 않는다.
          → 모두 상이함 (튜플의 유일성)
        - 릴레이션 = 튜플(엔티티 = entity)의 집합, 따라서 튜플의 순서는 무의미하다.
        - 속성(attribute)간에는 순서가 없다. (→ 컬럼의 순서는 무의미하다)
        
    자유자재로 이해하기 위해서, 같은 의미지만 다른 의미로 쓰이는 단어도 알아둘것 
    

*/

---------------------------------------------------------------------------------------------------------------------------

/*
    ■■■ 무결성(Integrity) ■■■
    
    1. 무결성에는 개체 무결성(Entity Intergrity)
                 참조 무결성(Relational Intergrity)
                 도메인 무결성(Domain Intergrity) 이 있다.
    
    2. 개체 무결성
       개체 무결성은 릴레이션에서 저장되는 튜플(tuple)의 
       유일성을 보장하기 위한 제약조건이다.
    
    3. 참조 무결성
       참조 무결성은 릴렐이션 간의 데이터 일관성을 
       보장하기 위한 제약조건이다.
       
    4. 도메인 무결성 데이터타입으로 이해하,)
       도메인 무결성은 허용 가능한 값의 범위를 
       지정하기 위한 제약조건이다.
    
    
    ▶ 개념적으로 당연히 필요한 것이므로 찬찬히 보세요.
    
    5. 제약조건의 종류 
       
        - PRIMARY KYE (PK:P) → 부모테이블의 참조받는 컬럼 → 기본키, 식별자 
          해당 컬럼의 값은 반드시 존재해야 하며, 유일해야 한다.
          (UNIQUE 와 NOT NULL 이 결합된 형태)
          
        - FOREIGN KYW (FK:F:R) → 자식테이블의 참조하는 컬럼 → 외부키, 외래키, 참조키
          해당 컬럼의 값은 참조되는 테이블의 컬럼 데이터들 중 하나와  
          일치하거나 NULL 을 가진다. (하나 이거나 NULL 이거나)
          
        - UNIQUE (UK:U) 
          테이블 내에서 해당 컬럼의 값은 항상 유일해야 한다. 
          (값이 고유해야한다. 나만있음. 원래는 UNIQUE KEY 라고 썼었어서 단축어가 UK 인것.)
          
        - NOT NULL (NN:CK:C)
          해당 컬럼은 NULL 을 포함할 수 없다. (제약조건 취급을 안하는 경우도 있다)
           
        - CHECK (CK:C)
          해당 컬럼에서 저장 가능한 데이터의 값의 범위나 조건을 지정한다.
          (추가적인 제약조건을 걸어서 NUMBET(3) 이어도 0 ~ 100으로 제한할 수 있다)
         
    어떻게 다뤄야 하는지 함께 알아보자.
*/

------------------------------------------------------------------------------------------------------------------------12:00

/*
    ■■■ PRIMARY KEY ■■■
    
    1. 테이블에 대한 기본 키를 생성한다.
    
    2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다.
                                        ---------------------- 단일 컬럼 OR 다중 컬럼일 수 있다, 는 말이다.                                     
       기본 카는 테이블 당 최대 하나만 존재한다.
       그러나 반드시 하나의 컬럼으로만 구성되는 것은 아니다.
       NULL 일 수 없고, 이미 테이블에 존재하고 있는 데이터를 
       다시 입력할 수 없도록 처리된다.
       UNIQUE INDEX 가 자동으로 생성된다.
       ------------ 색인기능
       (오라클이 자체적으로 만든다.) → INDEX가 있어 보다 빨리 찾을수 있게 된다. 메모리에 퍼 올리기전의 상태이기 때문에 ADMIN 파트의 이야기이다. 
       
       PRIMARY KEY가 설정되어있다는 말은, 조건절에서 많이 사용된다는 말이다.  
       조건 자체가 중복되지 않을거기 때문이다.(고유하기 때문에)
       찾을일이 많다. 
       
       
    3. 형식 및 구조
    
    ① 컬럼 레벨의 형식
    
        컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] PRIMARY KEY[(컬럼명, ...)]
        
    
    ② 테이블 레벨의 형식 (이렇게 사용하시길 권장합니다)
       ------------------------------------------------
        
        컬럼명 데이터타입,
        컬럼명 데이터타입,
        CONSTRAINT CONSTRAINT명 PRIMARY KEY(컬럼명, ...)
        --------- ------------               ▲    ▲  
         제약조건   제약조건이름            SINGLE COMPOSITE
        
        
        (Ⅹ) 데이터 입력할 때 아래와 같이 많이 쓰지만, 
        INSERT INTO TBL_INSA VALUES 
        (1001, '홍길동', '771212-1022432', TO_DATE('1998-10-11', 'YYYY-MM-DD'), '서울', '011-2356-4528', '기획부', '부장', 2610000, 200000)
        
        ▶ 아래와 같이 사용하는 것을 권장합니다.
        INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
        VALUES (1001, '홍길동', '771212-1022432', TO_DATE('1998-10-11', 'YYYY-MM-DD'), '서울', '011-2356-4528', '기획부', '부장', 2610000, 200000);
                                                ------------------------------------
                                                오라클 자동형변환 기대하지 말고 명시해줄 것.
        
    
    4. CONSTRAINT 추가 시 CONSTRAINT명 을 생략하면
       오라클 서버가 자동적으로 CONSTRAINT명 을 부여하게 된다.
       일반적으로 CONSTRAINT명은 『테이블명_컬럼명_CONSTRAINT약어』
       형식으로 기술한다. 

*/     
        

--○ PK 지정 실습 (① 컬럼 레벨의 형식)

CREATE TABLE TBL_TEST1
( COL1  NUMBER(5)       PRIMARY KEY
, COL2  VARCHAR(30)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.
        
--○ 데이터 입력
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (1, 'TEST');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (2, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (3, NULL);
INSERT INTO TBL_TEST1(COL1) VALUES (4);
-- 바로 위 구문과 같은 구문
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (2, 'ABCD');       -- 에러 발생 'unique constraint (HR.SYS_C007011) violated'
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (2, 'KKKK');       -- 에러 발생 'unique constraint (HR.SYS_C007011) violated'
                                                                                            ------------ 자동으로 부여된 제약조건이름
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (5, 'ABCD');
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (NULL, NULL);      -- 에러 발생
INSERT INTO TBL_TEST1(COL1, COL2) VALUES (NULL, 'STUDY');   -- 에러 발생 
INSERT INTO TBL_TEST1(COL2) VALUES ('STUDY');               -- 에러 발생 ' cannot insert NULL into ("HR"."TBL_TEST1"."COL1")'
-- 관찰해야 할 몇가지 내용들 
-- (1) 제약조건 위반과 관련된 에러일 경우 violated 키워드가 등장한다. 
-- (2) 우리는 UNIQUE 제약조건을 만들지 않았지만, PRIMARY KEY 는 UNIQUE + NOT NULL 이기때문에
--           --------------- 고유한 값을 가져야한다는 조건
--     오라클 오류발생 메시지로는 어디서, 어떻게 에러났는지 알기 어렵다. 거짓일 경우가 많다.
--     → 에러발생 시 어디를 봐야하는지 경험으로.. 시간으로 알게됩니다.        
SELECT *
FROM TBL_TEST1;    
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/
        
DESC TBL_TEST1;

/*

이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30) 
*/      
   
   
        
        
--○ 제약조건 확인
SELECT *
FROM USER_CONSTRAINTS;
        
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='TBL_TEST1';

/*
HR	SYS_C007011	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			19/04/04	HR	SYS_C007011		

--==>> COLUMN1 의 제약조건이 있음을 확인할 수 없음
*/


--○ 제약조건이 지정된 컬럼 확인(조회)
SELECT*
FROM USER_CONS_COLUMNS;
--==>> 
/*
HR	REGION_ID_NN	REGIONS	REGION_ID	
HR	REG_ID_PK	REGIONS	REGION_ID	1
HR	COUNTRY_ID_NN	COUNTRIES	COUNTRY_ID	
HR	COUNTRY_C_ID_PK	COUNTRIES	COUNTRY_ID	1
HR	COUNTR_REG_FK	COUNTRIES	REGION_ID	1
HR	LOC_ID_PK	LOCATIONS	LOCATION_ID	1
HR	LOC_CITY_NN	LOCATIONS	CITY	
HR	LOC_C_ID_FK	LOCATIONS	COUNTRY_ID	1
HR	DEPT_ID_PK	DEPARTMENTS	DEPARTMENT_ID	1
HR	DEPT_NAME_NN	DEPARTMENTS	DEPARTMENT_NAME	
HR	DEPT_MGR_FK	DEPARTMENTS	MANAGER_ID	1
HR	DEPT_LOC_FK	DEPARTMENTS	LOCATION_ID	1
HR	JOB_ID_PK	JOBS	JOB_ID	1
HR	JOB_TITLE_NN	JOBS	JOB_TITLE	
HR	EMP_EMP_ID_PK	EMPLOYEES	EMPLOYEE_ID	1
HR	EMP_LAST_NAME_NN	EMPLOYEES	LAST_NAME	
HR	EMP_EMAIL_NN	EMPLOYEES	EMAIL	
HR	EMP_EMAIL_UK	EMPLOYEES	EMAIL	1
HR	EMP_HIRE_DATE_NN	EMPLOYEES	HIRE_DATE	
HR	EMP_JOB_NN	EMPLOYEES	JOB_ID	
HR	EMP_JOB_FK	EMPLOYEES	JOB_ID	1
HR	EMP_SALARY_MIN	EMPLOYEES	SALARY	
HR	EMP_MANAGER_FK	EMPLOYEES	MANAGER_ID	1
HR	EMP_DEPT_FK	EMPLOYEES	DEPARTMENT_ID	1
HR	JHIST_EMPLOYEE_NN	JOB_HISTORY	EMPLOYEE_ID	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_EMP_FK	JOB_HISTORY	EMPLOYEE_ID	1
HR	JHIST_START_DATE_NN	JOB_HISTORY	START_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	START_DATE	
HR	JHIST_EMP_ID_ST_DATE_PK	JOB_HISTORY	START_DATE	2
HR	JHIST_END_DATE_NN	JOB_HISTORY	END_DATE	
HR	JHIST_DATE_INTERVAL	JOB_HISTORY	END_DATE	
HR	JHIST_JOB_NN	JOB_HISTORY	JOB_ID	
HR	JHIST_JOB_FK	JOB_HISTORY	JOB_ID	1
HR	JHIST_DEPT_FK	JOB_HISTORY	DEPARTMENT_ID	1
HR	SYS_C007011	TBL_TEST1	COL1	1
*/

SELECT *
FROM USER_CONS_COLUMNS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>>
/*
HR	SYS_C007011	TBL_TEST1	COL1	1
*/



--○ 제약조건이 설정된 소유주, 제약명, 테이블명, 제약종류, 컬럼명 항목 조회
-- 내가 풀이한 내용 
SELECT T.제약조건소유주
     , T.제약명
     , T.테이블명
     
     , T.컬럼명 
FROM
(
    SELECT OWNER AS 제약조건소유주
        , CONSTRAINT_NAME AS 제약명
        , TABLE_NAME AS 테이블명 
        , COLUMN_NAME AS 컬럼명
    FROM USER_CONS_COLUMNS
) T JOIN USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';


-- 함께 풀이한 내용 

SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
AND UC.TABLE_NAME = 'TBL_TEST1';
/*
    HR	SYS_C007011	TBL_TEST1	P	COL1
*/



----------------------------------------------------- 확인함. 
-- PK 지정 실습 (② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST2
( COL1      NUMBER(5)
, COL2      VARCHAR2(50)
, CONSTRAINT TEST2_COL1_PK PRIMARY KEY(COL1)
  ---------- ------------  -----------------
-- 제약조건   제약조건명     프라이머리를 (칼럼명)에 설정하겠다. 
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_TEST2(COL1, COL2) VALUES (1, 'TEST');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES (2, 'ABCD');
INSERT INTO TBL_TEST2(COL1, COL2) VALUES (3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES (4);
-- 바로 위 구문과 같은 구문
--INSERT INTO TBL_TEST2(COL1, COL2) VALUES (2, 'ABCD');       -- 에러 발생 'unique constraint (HR.TEST2_COL1_PK) violated'
--INSERT INTO TBL_TEST2(COL1, COL2) VALUES (2, 'KKKK');       -- 에러 발생 'unique constraint (HR.TEST2_COL1_PK) violated'
                                                                                            ------------ 자동으로 부여된 제약조건이름
INSERT INTO TBL_TEST2(COL1, COL2) VALUES (5, 'ABCD');
--INSERT INTO TBL_TEST2(COL1, COL2) VALUES (NULL, NULL);      -- 에러 발생
--INSERT INTO TBL_TEST2(COL1, COL2) VALUES (NULL, 'STUDY');   -- 에러 발생
--INSERT INTO TBL_TEST2(COL2) VALUES ('STUDY');               -- 에러 발생


COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST2;
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/


--○ 제약조건이 설정된 소유주, 제약명, 테이블명, 제약종류, 컬럼명 항목 조회
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME, UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
AND UC.TABLE_NAME = 'TBL_TEST2';
/*
HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
   -------------- 우리가 설정한대로 제약조건이름이 조회된다.
*/


--○ PK 지정 실습 (② 다중 컬럼 PK 지정 → 복합 프라이머리 키)
-- 컬럼 레벨로는 불가능. 프라이머리 제약조건을 두개를 만들겠다는 의미여서 안된다.

--(Ⅹ)
CREATE TABLE TBL_TEST2
( COL1  NUMBER(5)
, COL2  VARCHAR(30)
, CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);



CREATE TABLE TBL_TEST3
( COL1  NUMBER(5)
, COL2  VARCHAR(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1, COL2)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.


--데이터 입력
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
--INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);      --에러발생 'cannot insert NULL into ("HR"."TBL_TEST3"."COL2")'
--INSERT INTO TBL_TEST3(COL1) VALUES(4);                  --에러발생 'cannot insert NULL into ("HR"."TBL_TEST3"."COL2")'
--INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');    --에러발생 'unique constraint (HR.TEST2_COL1_PK) violated'
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2)(2, 'KKKK');
--INSERT INTO TBL_TEST3(COL1, COL2)(NULL, NULL);          --에러발생
--INSERT INTO TBL_TEST3(COL1, COL2)(NULL, 'STUDY');       --에러발생
--INSERT INTO TBL_TEST3(COL2) VALUES ('STUDY');           --에러발생
--중복을 따질 때, 복합키 두개각 모두 일치해야 중복키로 인식한다. 

COMMIT;
--==>> 커밋 완료.



--○ PK 지정 실습 (④ 테이블 생성 이후 제약조건 추가 → PK 지정)
-- 테이블 생성

CREATE TABLE TBL_TEST4
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
);
--==>> Table TBL_TEST4이(가) 생성되었습니다.

/*
    ※ 이미 만들어져 있는 테이블에 
       부여하려는 제약조건을 위반한 데이터가 포함되어 있을 경우 
       해당 테이블에 제약조건을 추가하는 것은 불가능하다.
       

    데이터가 미리 들어있을 수도 있다.
    이미 들어있는 데이터가 PRIMARY KEY 제약조건에 위반한다면
    PRIMARY KEY 제약조건 안걸린다. 
*/



-- 제약조건 추가 (기존 테이블의 구조적인 내용 변경) 
ALTER TABLE TBL_TEST4 
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4이(가) 변경되었습니다.
/*
    ALTER TABLE TBL_TEST4 
    ADD 테이블레벨 CONSTRAINT 구조 동일 
    
*/

--○ 데이터 입력
INSERT INTO TBL_TEST4(COL1, COL2) VALUES (1, 'TEST');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES (2, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES (3, NULL);
INSERT INTO TBL_TEST4(COL1) VALUES (4);
--INSERT INTO TBL_TEST4(COL1, COL2) VALUES (2, 'ABCD');      -- 에러 발생 'unique constraint (HR.SYS_C007011) violated'
--INSERT INTO TBL_TEST4(COL1, COL2) VALUES (2, 'KKKK');      -- 에러 발생 'unique constraint (HR.SYS_C007011) violated'                                                                                            ------------ 자동으로 부여된 제약조건이름
INSERT INTO TBL_TEST4(COL1, COL2) VALUES (5, 'ABCD');
--INSERT INTO TBL_TEST4(COL1, COL2) VALUES (NULL, NULL);      -- 에러 발생
--INSERT INTO TBL_TEST4(COL1, COL2) VALUES (NULL, 'STUDY');   -- 에러 발생 
--INSERT INTO TBL_TEST4(COL2) VALUES ('STUDY');               -- 에러 발생 

-- 중복을 따질때 2개 모두 일치해야 오류가 난다.


SELECT * 
FROM TBL_TEST4;
/*
    1	TEST
    2	ABCD
    3	
    4	
    5	ABCD
*/



--※ 제약조건 확인용 전용 뷰(VIEW) 생성

CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
, UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
, UC.TABLE_NAME "TABLE_NAME"
, UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
, UCC.COLUMN_NAME "COLUMN_NAME"
, UC.SEARCH_CONDITION "SEARCH_CONDITION"
, UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK이(가) 생성되었습니다.


--○ 생성된 뷰(VIEW)를 통한 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		(NULL)      (NULL)


--------------------------------------------------------------------------------------------------------15:00

/*
    ■■■ UNIQUE(UK:U) ■■■
    
    1. 테이블에서 지정한 컬럼의 데이터가 중복되지 않고 
       테이블 내에서 유일할 수 있도록 설정하는 제약조건,
       PRIMARY KEY 와 유사한 제약조건이지만, NULL 을 허용한다는 차이가 있다.
       내부적으로 PRIMARY KEY 와 마찬가지로 UNIQUE INDEX 가 자동 생성된다.
       하나의 테이블 내에서 UNIQUE 제약조건은 여러 번 설정하는 것이 가능하다.
       즉, 하나의 테이블에서 UNIQUE 제약조건을 여러 개 만드는 것이 가능하다는 것이다.
                                    -----------------------------------
    
       
    2. 형식 및 구조
        
        ① 컬럼 레벨의 형식
        
            컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] UNIQUE
        
        
        ② 테이블 레벨의 형식
        
            컬럼명 데이터타입,
            컬럼명 데이터타입,
            CONSTRAINT CONSTRAINT명 UNIQUE(컬럼명, ....)
    
*/

--○ UK 지정 실습 (① 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST5
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR(30)     UNIQUE
);
--==>> Table TBL_TEST5이(가) 생성되었습니다.


-- 제약조건 조회
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST5';
/*
    HR	SYS_C007015	TBL_TEST5	P	COL1	(NULL)      (NULL)	
    HR	SYS_C007016	TBL_TEST5	U	COL2		(NULL)      (NULL)
*/

-- 데이터 입력
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (1, 'TEST');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (2, 'ABCD');
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (3, NULL);         -- UNIQUE 는 NULL 허용함
INSERT INTO TBL_TEST5(COL1) VALUES (4)
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (4, 'ABCD');       -- 에러 발생. 중복허용 안함. 'SQL command not properly ended'
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (2, 'ABCD');       -- 에러 발생. 중복허용 안함. 'unique constraint (HR.SYS_C007015) violated'
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (NULL, NULL);      -- 에러 발생 'cannot insert NULL into ("HR"."TBL_TEST5"."COL1")'
INSERT INTO TBL_TEST5(COL1, COL2) VALUES (5, NULL);         -- UNIQUE NULL 허용. 중복된 값이 안된다. 그러나 NULL 은 값이 아니다. 

COMMIT;
--==>> 커밋 완료.
SELECT *
FROM TBL_TEST5;
/*
1	TEST
3	
4	
2	ABCD
5	
*/



--○ UK 지정 실습 (② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST6
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
-- 제약조건 설정완료
--==>> Table TBL_TEST6이(가) 생성되었습니다.
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
/*
    HR	TEST6_COL1_PK	TBL_TEST6	P	COL1	(NULL)      (NULL)	
    HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		(NULL)      (NULL)
*/


--○ UK 지정 실습 (③ 테이블 생성 이후 제약조건 추가 → UK 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_TEST7
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
);
--==>>Table TBL_TEST7이(가) 생성되었습니다.

--제약조건 확인 (조회)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
--==>> 조회 결과 없음


-- 제약 조건 추가
ALTER TABLE TBL_TEST7
ADD (CONSTRAINT TEST7_COL1_PK PRIMARY KEY(COL1)
  ,  CONSTRAINT TEST7_COL2_UK UNIQUE(COL2) );

--==>> Table TBL_TEST7이(가) 변경되었습니다.


--제약조건 재확인 (다시 조회)
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST7';
/*
    HR	TEST7_COL1_PK	TBL_TEST7	P	COL1	(NULL)      (NULL)	
    HR	TEST7_COL2_UK	TBL_TEST7	U	COL2		(NULL)      (NULL)
*/

---------------------------------------------------------------------------------
/*
    ■■■ CHECK(CK:C) ■■■
    
    1. 컬럼에서 허용가능한 데이터의 범위나 조건을 지정하기 위한 제약조건.
       컬럼에 입력되는 데이터를 검사하여 조건에 맞는 데이터만 입력될 수 있도록
       처리하며, 수정되는 데이터 또한 검사하여 조건에 맞는
       데이터로 수정되는 것만 허용하는 기능을 수행하게 한다.
       
    2. 형식 및 구조
        
        ① 컬럼 레벨의 형식
        
            컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] CHECK (컬럼 조건)
            
        ② 테이블 레벨의 형식
        
            컬럼명 데이터타입,
            컬럼명 데이터타입,
            CONSTRAINT CONSTRAINT명 CHECK (컬럼 조건)
*/

/*
    NUMBER 의 범위 확인 
    CREATE TABLE TLB_T
    ( COL1  NUMBER(99999999999)             -- numeric precision specifier is out of range (1 to 38)

    ※ NUMBER(38)    까지....
       CHAR(2000)    까지...
       
       NCHAR(1000)   까지...
       
*/


--○ CK 지정 실습 (① 컬럼 레벨의 형식)
-- 테이블 생성

CREATE TABLE TBL_TEST8
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR(30)
, COL3      NUMBER(3)       CHECK (COL3 BETWEEN 1 AND 100)
);                                  --------------------- BETWEEN 의 범위 설정 
--==>> Table TBL_TEST8이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES (1, '원영', 100);
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES (2, '선아', 101);      -- 에러 발생 'check constraint (HR.SYS_C007021) violated'
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES (3, '나래', -1);       -- 에러 발생 'check constraint (HR.SYS_C007021) violated'
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES (4, '주영', 80);

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST8;
/*
    1	원영	100
    4	주영	80
*/


--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST8';

/*
    HR	SYS_C007021	TBL_TEST8	C	COL3	COL3 BETWEEN 1 AND 100	→ CHECK 제약조건 확인 가능 
    HR	SYS_C007022	TBL_TEST8	P	COL1		
*/


--○ CK 지정 실습 (② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST9
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
, COL3      NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9이(가) 생성되었습니다.


-- 데이터 입력
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES (1, '원영', 100);
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES (2, '선아', 101);      -- 에러 발생 'check constraint (HR.SYS_C007021) violated'
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES (3, '나래', -1);       -- 에러 발생 'check constraint (HR.SYS_C007021) violated'
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES (4, '주영', 80);

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST9;
/*
    1	원영	100
    4	주영	80
*/

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST9';
--==>> 조회 결과 없음 

/*
    HR	TEST9_COL3_CK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
    HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/


--○ CK 지정 실습 (③ 테이블 생성 이후 제약조건 추가 → CK 제약조건 추가)
CREATE TABLE TBL_TEST10
( COL1   NUMBER(5)
, COL2   VARCHAR(30)
, COL3   NUMBER(3)
);
--==>>  Table TBL_TEST10이(가) 생성되었습니다.

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST10';
--==>> 조회 결과 없음 


--○ 제약조건 추가
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_CK CHECK (COL3 BETWEEN 0 AND 100));
--==>> Table TBL_TEST10이(가) 변경되었습니다.

--○ 제약조건 재확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME ='TBL_TEST10';
/*
    HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
    HR	TEST10_COL3_CK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/

--○ 제약조건 제거
ALTER TABLE 테이블명
DROP CONSTRAINT 제약조건명;



/*

    ○ 실습 문제
       다음과 같이 TBL_TESTMEMBER 테이블을 생성하여
       SSN 칼럼(주민번호 칼럼) 에서 
       데이터 입력시 성별이 유효한 데이터만 입력될 수 있도록
       체크 제약조건을 추가할 수 있도록 한다.
       → 주민번호 특정 자리에 입력 가능한 데이터로 1, 2, 3, 4 를 적용
       또한, SID 컬럼에는 PRIMARY KEY 제약조건을 설정할 수 있도록 한다.
       
*/

-- 테이블 생성
CREATE TABLE TBL_TESTMEMBER
( SID       NUMBER
, NAME      VARCHAR(30)
, SSN       CHAR(14)        -- 입력 형태 → 'YYMMDD-NNNNNNN'
, TEL       VARCHAR(40)
);
--==>> Table TBL_TESTMEMBER이(가) 생성되었습니다.

--내가 풀이한 내용

SELECT *
FROM TBL_TESTMEMBER;
--==>> 조회결과 없음

-- 제약조건 추가
ALTER TABLE TBL_TESTMEMBER
ADD ( CONSTRAINT TESTMEMBER_COL1_PK     PRIMARY KEY(COL1)
    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK (CASE WHEN TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1899 =< 1999 
                                                        THEN '1' AND '2'
                                                    WHEN TO_NUMBER(SUBSTR(SSN, 1, 2)) + 1999 =< 1999
                                                        THEN '3' AND '4' 
                                                    ELSE '다시입력'
                                               END);
-- 잉... 뭐잉?
-- 제약조건을 분기문으로 설정하는 경우는 없다.
-- 필요하다면 함수, 프로시저, 다른 OBJECT를 활용하면 된다.


--함께 풀이한 내용

-- 제약조건 추가
--(1)
ALTER TABLE TBL_TESTMEMBER
ADD ( CONSTRAINT TESTMEMBER_COL1_PK     PRIMARY KEY(SID)
--    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK () );
    
--(2)    
--    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK (주민번호 8번째 자리  1개가 '1' 또는 '2' 또는 '3' 또는 '4') );  
    
--(3)
--    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK (SUBSTR(SSN, 8, 1)가 '1' 또는 '2' 또는 '3' 또는 '4') );  
    
--(4)
--    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK (SUBSTR(SSN, 8, 1)가 ('1', '2', '3' ,'4') );     

--(5)
    , CONSTRAINT TESTMEMBER_COL3_CK     CHECK (SUBSTR(SSN, 8, 1) IN ('1', '2', '3' ,'4') ) );        
    
--==>> Table TBL_TESTMEMBER이(가) 변경되었습니다.    

--○ 제약조건 확인     
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMBER';
/*
    HR	TESTMEMBER_COL1_PK	TBL_TESTMEMBER	P	SID		
    HR	TESTMEMBER_COL3_CK	TBL_TESTMEMBER	C	SSN	SUBSTR(SSN, 8, 1) IN ('1', '2', '3' ,'4') 	
*/
    
-- 입력 테스트 
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES (1, '정임혜', '901212-1234567', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.    
    
INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES (2, '김선아', '940404-2234567', '010-2222-2222');

INSERT INTO TBL_TESTMEMBER(SID, NAME, SSN, TEL)
VALUES (3, '임나래', '940404-7234567', '010-3333-3333');
--==>> 에러 발생. check constraint (HR.TESTMEMBER_COL3_CK) violated

FROM TBL_


---------------------------------------------------------------------------------
/*
    ■■■ FOREIGN KEY (FK:F:R) ■■■
    
    1. 참조 키 또는 외래키 (FK)는
       두 테이블의 데이터 간 연결을 설정하고
       강제 적용시키는데 사용되는 열이다.
       한 테이블의 기본키 값이 있는 열을
       다른 테이블에 추가하면 테이블 간 연결을 설정할 수 있다.
       이 때, 두번째 테이블에 추가되는 열이 외래키 이다.
       
    2. 부모테이블(참조받는 컬럼이 포함된 테이블)이 먼저 생성된 후,
       자식테이블(잠초하는 컬럼이 포함된 테이블)이 생성되어야 한다.
       이때, 자식테이블에 FOREIGN KEY 제약조건이 설정된다,
       
    3. 형식 및 구조
    
        ① 컬럼 레벨의 형식
            
            컬럼명 데이터 타입 [CONSTRAINT CONSTRAINT명]
                               REFERENCES 참조테이블명(참조컬럼명)
                              [ON DELETE CASCADE | ON DELETE SET NULL] 
                               -----------------   ------------------
                                   설정해서 제약조건을 만들면... DELETE
                                                                FROM DEPT
                                                                WHERE DEPT =10 제거됨 (자식 레코드까지 모두 삭제됨)
                                   굉장히 위험해서 사용하지 않음. 
                                   제약조건이 설정되면 제거시 귀찮아짐 → DB 설계시 제약조건을 설정 안함.. → 무결성이 다 깨짐..
                              

            
        ② 테이블 레벨의 형식 
        
              컬럼명 데이터타입, 
              컬럼명 데이터타입, 
              CONSTRAINT CONSTRAINT명 FOREIGN KEY(컬럼명)
                        REFERENCES 참조테이블명(참조컬럼명) 
                        [ON DELETE CASCADE | ON DELETE SET NULL]
                        
        ※ FOREIGN KEY 제약조건을 설정하는 실습을 진행하기 위해서는
           독립적인 하나의 테이블을 생성하여 처리하는 것이 아니라
           부모테이블 생성 작업을 먼저 수행해야 한다.
           그리고 이때, 부모테이블에는 반드시 PK 또는 UK 제약조건이
           설정된 컬럼이 존재해야 한다. 
    */
    
 -- 실습 진행
 
 -- 부모 테이블 생성
 CREATE TABLE TBL_JOBS
 ( JIKWI_ID         NUMBER
 , JIKWI_NAME       VARCHAR2(30)
 , CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
 );
 --==>> Table TBL_JOBS이(가) 생성되었습니다.
 
 -- 부모 테이블에 데이터 입력
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES (1, '사원');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES (2, '대리');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES (3, '과장');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES (4, '부장');
--==>> 1 행 이(가) 삽입되었습니다. *  4

SELECT *
FROM TBL_JOBS;
/*
    1	사원
    2	대리
    3	과장
    4	부장
*/

COMMIT;
--==>> 커밋 완료.

--○ FK 지정 실습 (① 컬럼 레벨의 형식)
CREATE TABLE TBL_EMP1
( SID       NUMBER          PRIMARY KEY
, NAME      VARCHAR(30)
--, JIKWI_ID  NUMBER        FOREIGN KEY 이렇게 쓰면 좋겠지만.. 이렇게 간단하지 않다. 직접 명시하지 않음. 
, JIKWI_ID  NUMBER          REFERENCES TBL_JOBS(JIKWI_ID)           
);
--==>> Table TBL_EMP1이(가) 생성되었습니다.

--제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>
/*
                                                            DELETE_RULE 도 볼 줄 알아야 한다. 
    HR	SYS_C007030	TBL_EMP1	P	SID		        (NULL)      (NULL)          
    HR	SYS_C007031	TBL_EMP1	R	JIKWI_ID		(NULL)      NO ACTION
*/


--데이터 입력
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (1, '조수연', 1);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (2, '곽한얼', 2);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (3, '이승희', 3);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (4, '최은상', 4);
-- INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '권홍비', 5);      --에러발생. 부모테이블에서 5번 RECORD 가 없음.
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (5, '권홍비', 1);
INSERT INTO TBL_EMP1(SID, NAME) VALUES (6, '윤희진');                      --희진이나 기승이나 값이 없거나, NULL 이어도 입력된다. 
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES (7, '이기승', NULL);

SELECT *
FROM TBL_EMP1;

/*
    1	조수연	1
    2	곽한얼	2
    3	이승희	3
    4	최은상	4
    5	권홍비	1
    6	윤희진	(NULL)
    7	이기승	(NULL)
*/

COMMIT;
--==>> 커밋 완료.


--○ FK 지정 실습 (② 테이블 레벨의 형식)
CREATE TABLE TBL_EMP2
( SID       NUMBER
, NAME      VARCHAR2(30)
, JIKWI_ID     NUMBER
, CONSTRAINT EMP2_SID_PK        PRIMARY KEY(SID)
, CONSTRAINT EMP2_JIKWI_ID_FK   FOREIGN KEY(JIKWI_ID)
                                    REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>>Table TBL_EMP2이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP2';

/*
    HR	EMP2_SID_PK	        TBL_EMP2	P	    SID		     (NULL)     (NULL)
    HR	EMP2_JIKWI_ID_FK	    TBL_EMP2	R	    JIKWI_ID	 (NULL)   	NO ACTION
*/


--○ FK 지정 실습 (③ 테이블 생성 이후 제약조건 추가 → FK 제약조건 추가)

-- 테이블 생성
CREATE TABLE TBL_EMP3
( SID       NUMBER
, NAME      VARCHAR(30)
, JIKWI_ID  NUMBER
);
--==>> Table TBL_EMP3이(가) 생성되었습니다.


--제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP3';
--==>> 조회결과없음


--제약조건 확인
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK        PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK   FOREIGN KEY(JIKWI_ID)
                    REFERENCES TBL_JOBS(JIKWI_ID) );
--==>> Table TBL_EMP3이(가) 변경되었습니다.
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP3';
/*
    HR	EMP3_SID_PK	        TBL_EMP3    	P	SID		     (NULL)     (NULL)
    HR	EMP3_JIKWI_ID_FK	TBL_EMP3    	R	JIKWI_ID	 (NULL)   	NO ACTION
*/


/*
    4. FOREIGN KEY 생성 시 주의사항
       참조하고자 하는 부모테이블을 먼저 생성해야 한다.
       참조하고자 하는 컬럼이 PRIMARY KEY 나 UNIQUE 제약조건이 있어야 한다.
       
       테이블 사이에 PRIMARY KEY 와 FOREIGN KEY 가 정의되어 있으면 
       PRIMARY KEY 제약조건이 설정된 컬럼의 데이터 삭제 시
       FOREIGN KEY 컬럼에 그 값이 입력되어 있는 경우 삭제되지 않는다.
       
       (단, FK 설정 과정에서 『ON DELETE CASCADE』 나
       『ON DELETE SET NULL』 옵션이 사용하여 설정한 경우에는 삭제가 가능하다.)
       부모테이블을 제거하기 위해서는 자식테이블을 먼저 제거해야 한다.
       
*/


------------------------------------------------------------------- 20190405

SELECT *
FROM TBL_JOBS;
/*
1	사원
2	대리
3	과장
4   부장
*/

SELECT *
FROM TBL_EMP1;

/*
1	조수연	1
2	곽한얼	2
3	이승희	3
4	최은상	4
5	권홍비	1
6	윤희진	
7	이기승	
*/

-- 최은상 부장의 직위를 사원으로 변경

UPDATE TBL_EMP1
SET JIKWI_ID=1
WHERE SID=4;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_EMP1;
/*
1	조수연	1
2	곽한얼	2
3	이승희	3
4	최은상	1
5	권홍비	1
6	윤희진	
7	이기승	
*/

--커밋
COMMIT;
--==>> 커밋 완료.

-- 부모테이블(TBL_JOBS)의 부장 데이터를 참조하고 있는 
-- 자식테이블(TBL_EMP1)의 데이터가 존재하지 않는 상황.

-- 이와 같은 상황에서 부모테이블(TBL_JOBS)의 
-- 부장 데이터 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=4;
--==>> 1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_JOBS;
/*
1	사원
2	대리
3	과장
*/

-- 부모테이블(TBL_JOBS) 부장데이터가 삭제되었음을 확인하였으면 커밋

COMMIT;
--==>> 커밋 완료.


-- 부모테이블(TBL_JOBS)의 사원 데이터를 참조하고 있는
-- 자식테이블(TBL_EMP1)의 데이터가 3건 존재하는 상황.

-- 이와 같은 상황에서 부모테이블(TBL_JOBS)의 
-- 사원데이터 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;

--==>> 사원데이터 지우려고 하면 에러 발생. → 자식테이블에서 참조하는 데이터가 있기 때문에 제거되지 않는다.
/*
명령의 1,103 행에서 시작하는 중 오류 발생 -
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1
오류 보고 -
ORA-02292: integrity constraint (HR.SYS_C007031) violated - child record found
*/

-- 부모테이블(TBL_JOBS) 제거
DROP TABLE TBL_JOBS;

--==>> 부모테이블 지우려고 하면 에러 발생.
/*
명령의 1,118 행에서 시작하는 중 오류 발생 -
DROP TABLE TBL_JOBS
오류 보고 -
ORA-02449: unique/primary keys in table referenced by foreign keys
02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
*Cause:    An attempt was made to drop a table with unique or
           primary keys referenced by foreign keys in another table.
*Action:   Before performing the above operations the table, drop the
           foreign key constraints in other tables. You can see what
           constraints are referencing a table by issuing the following
           command:
           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";

*/


--※ 부모 테이블의 데이터를 자유롭게 삭제하기 위해서는
--   『ON DELETE CASCADE』 옵션 지정이 필요하다. 

--   TBL_EMP1 테이블(자식테이블) 에서 FK 제약조건을 제거한 후 
--   CASCADE 옵션을 포함하여 다시 FK 제약조건을 설정한다. 

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
/*
    HR	SYS_C007030	TBL_EMP1	P	SID		
    HR	SYS_C007031	TBL_EMP1	R	JIKWI_ID		NO ACTION
*/

--○ 제약조건 제거
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007031;
-- 참조키 제약조건 이름 확인하여 입력.
--==>> Table TBL_EMP1이(가) 변경되었습니다.


--○ 제약조건 제거 이후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
-- 제약조건이 하나만 남은 상태
/*
    HR	SYS_C007030	TBL_EMP1	    P	SID		
*/


--○ 『ON DELETE CASCADE』 옵션이 포함된 내용으로 제약조건 재지정
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKWIID_FK FOREIGN KEY(JIKWI_ID)
                REFERENCES TBL_JOBS(JIKWI_ID)
                ON DELETE CASCADE;
--==>> Table TBL_EMP1이(가) 변경되었습니다.


--○ 제약조건 재지정 이후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
/*  
    CASCADE 옵션을 지정한 후에는
    참조받고 있는 부모테이블의 데이터를
    언제든지 자유롭게 삭제하는 것이 가능하다. 
    단, ........ 부모테이블의 데이터가 삭제될 경우 
    이를 참조하는 자식테이블의 데이터도 모두 함께 삭제된다.
    CHECK-!!!!!!
*/
/*
HR	SYS_C007030	TBL_EMP1	P	SID		
HR	EMP1_JIKWIID_FK	TBL_EMP1	R	JIKWI_ID		CASCADE
*/

-- 부모테이블
SELECT *
FROM TBL_JOBS;
/*
1	사원
2	대리
3	과장
*/

-- 자식테이블
SELECT *
FROM TBL_EMP1;

/*
1	조수연	1
2	곽한얼	2
3	이승희	3
4	최은상	1
5	권홍비	1
6	윤희진	
7	이기승	
*/


--○ TBL_JOBS(부모테이블)의 사원 데이터 삭제

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 행 이(가) 삭제되었습니다.

-- 자식테이블
SELECT *
FROM TBL_EMP1;
-- 사원정보를 가진 레코드가 모두 삭제되었음음 확인
/*
2	곽한얼	2
3	이승희	3
6	윤희진	
7	이기승	
*/

----------------------------------------------------------------------------------------------------------
/*
    ■■■ NOT NULL (NN:CK:C) ■■■--
                    ------- 주의해서 볼 부분
    
    1. 테이블에서 지정한 컬럼의 데이터가 NULL을 갖지 못하도록 하는 제약조건
    
    2. 형식 및 구조
    
        ① 컬럼 레벨의 형식                                     → NOT NULL은 두 개의 형식 중 컬럼레벨형식이 많이 확용된다. 
                                                                  ALTER 보다 NORIFY 절을 더 많이 쓴다. 
            컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명] NOT NULL
            
        ② 테이블 레벨의 형식
        
            컬럼명 데이터타입,
            컬럼명 데이터타입,
            CONSTRAINT CONSTRAINT명 CHECK(컬럼명 IS NOT NULL)

    3. 기존에 생성되어 있는 테이블에 NOT NULL 제약조건을 추가할 경우
       ADD 보다 MODIFY 절이 더 많이 사용된다. 
    
        ALTER TABLE 테이블명
        MODIFY 컬럼명 테이터타입 NOT NULL;
    
    4. 기존 테이블에 데이터가 이미 들어있지 않은 컬럼(→ NULL 인 상태)을
       NOT NULL 제약조건을 갖게끔 수정하는 경우에는 에러 발생한다.
       
    관찰, 실습 꼼꼼이 합시다~!!!
*/


--○ NOT NULL (① 컬럼 레벨의 형식)

CREATE TABLE TBL_TEST11
( COL1      NUMBER(5)       PRIMARY KEY
, COL2      VARCHAR(30)     NOT NULL
);
--==>> Table TBL_TEST11이(가) 생성되었습니다.

--(1) 데이터 입력
INSERT INTO TBL_TEST11(COL1, COL2) VALUES (1, 'TEST');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES (2, 'ABCD');
--INSERT INTO TBL_TEST11(COL1, COL2) VALUSE (3, '')
--

--(2) 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST11';
/*
    HR	SYS_C007037	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
    HR	SYS_C007038	TBL_TEST11	P	COL1		
*/


--○ NOT NULL (② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TLB_TEST12
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>>Table TLB_TEST12이(가) 생성되었습니다.


-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TLB_TEST12';
/*
    HR	TEST12_COL2_NN	TLB_TEST12	C	COL2	COL2 IS NOT NULL	
    HR	TEST12_COL1_PK	TLB_TEST12	P	COL1		
*/


--○ NOT NULL 지정 실습 (③ 테이블 생성 이후 제약조건 추가 → NN 제약조건 추가)
CREATE TABLE TBL_TEST13
( COL1      NUMBER(5)
, COL2      VARCHAR(30)
);
--==>> Table TBL_TEST13이(가) 생성되었습니다.


--제약 조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST13';
--==>> 조회결과 없음

-- 제약조건 추가
ALTER TABLE TBL_TEST13
ADD ( CONSTRAINT TEST13_COL1_PK  PRIMARY KEY(COL1)
    , CONSTRAINT TEST13_COL2_NN   CHECK(COL2 IS NOT NULL));
--==>> Table TBL_TEST13이(가) 변경되었습니다.

-- 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST13';
/*
    HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
    HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
*/


--※ NOT NULL 제약조건만 TBL_TEST13 테이블의 COL2 에 추가하는 경우 
--   다음과 같은 방법도 가능하다.
        
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> Table TBL_TEST13이(가) 변경되었습니다.

-- 컬럼 레벨에서 NOT NULL 제약조건을 지정한 테이블
DESC TBL_TEST11;
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 

--> DESC 를 통해 COL2 컬럼의 NOT NULL 정보가 확인되는 상황

*/


-- 테이블 레벨에서 NOT NUL 제약조건을 지정한 테이블
DESC TLB_TEST12;
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30) 
     -------
     NOT NULL 이 확인되지 않음
     
--> DESC 를 통해 COL2 컬럼의 NOT NULL 정보가 확인되지 않는 상황 

*/


-- 테이블 생성 이후 ADD 를 통해 NOT NULL 제약조건을 추가하였으며 
-- 또한, MODIFY 절을 통해 NOT NULL 제약조건을 다시 추가한 테이블

DESC TBL_TEST13;

/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 

--> --> DESC 를 통해 COL2 컬럼의 NOT NULL 정보가 확인되는 상황

*/


-- 제약조건 확인 전용 뷰(VIEW) 조회
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN ('TBL_TEST11', 'TLB_TEST12', 'TBL_TEST13');

/*
    HR	SYS_C007037	    TBL_TEST11	C	COL2	    "COL2" IS NOT NULL	
    HR	SYS_C007038	    TBL_TEST11	P	COL1		
    HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
    HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	    COL2 IS NOT NULL	
    HR	SYS_C007044	    TBL_TEST13	C	COL2	    "COL2" IS NOT NULL	
    HR	TEST12_COL2_NN	TLB_TEST12	C	COL2	    COL2 IS NOT NULL	
    HR	TEST12_COL1_PK	TLB_TEST12	P	COL1		

*/

















































