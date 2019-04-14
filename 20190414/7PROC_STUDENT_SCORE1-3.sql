-- 관리자 -> 사용자 권한 부여


-- 관리자 접속
-- 1. 관리자의 동의어 생성.
-- EX) CREATE OR REPLACE SYNONYM 시노님명 FOR 소유계정명.해당객체
CREATE OR REPLACE SYNONYM PROC_SCORE1 FOR SIST_A001.PROC_STUDENT_SCORE1;

-- 2. 사용자 계정에게 동의어 생성 권한 부여.
-- EX) GRANT CREATE SYNONYM TO 대상계정명;
GRANT CREATE SYNONYM TO SIST_B001;


-- 사용자 접속
-- 3. 사용자의 동의어 생성.
-- EX) CREATE OR REPLACE SYNONYM 시노님명 FOR 소유계정명.해당객체
CREATE OR REPLACE SYNONYM PROC_SCORE1 FOR SIST_A001.PROC_SCORE1;


-- 관리자 접속
-- 4. 관리자의 동의어 EXECUTE 권한을 대상계정명에 부여.
-- EX) GRANT EXECUTE ON 소유계정명.시노님명 TO 대상계정명
GRANT EXECUTE ON PROC_SCORE1 TO SIST_B001;


-- 사용자 접속
-- 5. 프로시저 실행
EXEC PROC_SCORE1(1, 10, 40, 50);

-- 6. 변경된 테이블 칼럼값 조회.
SELECT *
FROM SUBJECT
;
