SELECT USER
FROM DUAL;
--==>> SCOTT

TRUNCATE TABLE TBL_MEMBER;
--==>>Table TBL_MEMBER이(가) 잘렸습니다.

CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.

--○ 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL,'최은상', '010-1111-1111')
;

SELECT *
FROM TBL_MEMBER;

--○ 인원수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;

--○ 인원수 쿼리문 한줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER
;

--○ 전체 리스트 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;

--○ 전체 리스트 쿼리문 한줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
