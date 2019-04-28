SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/*
1	전훈의	010-1111-1111
2	전훈의	010-1111-1111
3	전훈의	010-1111-1111
4	윤진석	010-2222-2222
5	최보라	010-3333-3333
6	이지혜	010-1212-1212
7	이지혜	010-1212-1212
8	이기승	010-9090-9090
9	윤희진	010-7777-7777
*/

SET SERVEROUTPUT ON;
--○ CallableStatement 실습을 위한 프로시저 작성
--   프로시저 명 : PRC_MEMBERINSERT
--   프로시저 기능 : TLB_MEMBER 테이블에 데이터를 입력하는 프로시저
CREATE OR REPLACE PROCEDURE PRC_MEMBERINSERT
( VNAME IN TBL_MEMBER.NAME%TYPE
, VTEL  IN TBL_MEMBER.TEL%TYPE
)
IS
    VSID       TBL_MEMBER.SID%TYPE;
BEGIN

    -- 기존 SID 의 최대값 얻어오기
    SELECT NVL(MAX(SID), 0) INTO VSID
    FROM TBL_MEMBER;
    
    -- 데이터 입력 
    INSERT INTO TBL_MEMBER(SID, NAME, TEL)
    VALUES (VSID+1, VNAME, VTEL);
    
    -- 커밋
    COMMIT;
    
END;
--==>> Procedure PRC_MEMBERINSERT이(가) 컴파일되었습니다.


--○ 생성된 프로시저 테스트 (확인)
EXEC PRC_MEMBERINSERT('유진석', '010-1111-2222');

DELETE
FROM TBL_MEMBER
WHERE SID =14;

SELECT *
FROM TBL_MEMBER
ORDER BY SID;

-- CallableStatement 로 INSERT 프로시저 실행한 결과
/*
1	전훈의	010-1111-1111
2	전훈의	010-1111-1111
3	전훈의	010-1111-1111
4	윤진석	010-2222-2222
5	최보라	010-3333-3333
6	이지혜	010-1212-1212
7	이지혜	010-1212-1212
8	이기승	010-9090-9090
9	윤희진	010-7777-7777
10	유진석	010-1111-2222
11	정임혜	010-1212-3434
12	최보라	010-5454-5454
13	유진석	010-6767-6767
*/


--○ CallableStatement 실습을 위한 프로시저 작성
--   프로시저명 : PRC_MEMBERSELECT
--   프로시저기능 : TBL_MEMBER 테이블의 데이터를 읽어오는 프로시저
--   ※ 『SYS_REFCURSOR』 자료형을 이용하여 커서 다루기
--   내가 운용하던 자료형을, 훈이씨에게 주는 것. 운용하기 쉽겠죠?
CREATE OR REPLACE PROCEDURE PRC_MEMBERSELECT
( VRESULT   OUT SYS_REFCURSOR
)
IS
BEGIN
    -- 커서를 오픈하고 사용하면, 닫아주어야 하는데, 처리결과를 VRESULT 에 담기 때문에 CLOSE 해주지 않는다. 
    OPEN VRESULT FOR
        SELECT SID, NAME, TEL
        FROM TBL_MEMBER
        ORDER BY SID;
    -- CLOSE VRESULT;
END;
--==>> Procedure PRC_MEMBERSELECT이(가) 컴파일되었습니다.















