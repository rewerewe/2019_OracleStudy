-- 관리자 접속
-- 1. 뷰 생성.
CREATE OR REPLACE VIEW VW_SUBJECT_SIST_B001
AS
SELECT *
FROM SUBJECT
WHERE 1=1
AND TEACHER_ID = 'SIST_B001'
;

-- 2. 생성된 뷰를 다른 계정에서 조회가능하도록 SELECT 권한을 대상계정에 부여.
-- EX) GRANT SELECT ON 소유계정명.시노님명 TO 대상계정명
GRANT SELECT ON VW_SUBJECT_SIST_B001 TO SIST_B001;


-- 사용자 접속
-- 3. 해당 뷰 조회
-- EX) 계정명(=스키마명).뷰명
SELECT *
FROM SIST_A001.VW_SUBJECT_SIST_B001
;