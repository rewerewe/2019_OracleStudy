-- 왼쪽 상단에 PERSPECTIVE로 현재 접속(플러그인)된 사용자 모드로 전환이 가능하다. (상단 파일명으로도 구분 가능)
-- 헷갈리니 수업에선 가급적 사용하지 않는다.

--○ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  출력 :    JIH

--오라클에서 제일 중요한 개념이 ORACLE 에 등장 : TABLE(표)
-- 1) 컬럼(항목) 을 두개 만든다. NO 와 NAME 
-- 2) NUMBER(숫자), VARCHAR2(문자) 
-- 3) () 괄호는 길이 

--○ 테이블 생성(테이블명 : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)
, NAME  VARCHAR2(30)
);
--==>>  출력 :    에러발생
/*
오류 보고 -
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/
-->> 현재 JIH 계정은 CREATE SESSION 권한만 갖고 있으며 
--   테이블을 생성할 수 있는 권한은 갖고 있지 않은 상태이다.
--   그러므로 관리자로부터 테이블 생성 권한을 부여받아야 한다. 



--○ SYS로부터 CREATE TABLE 권한을 부여받은 이후 
-- 다시 테이블 생성(테이블명 : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)
, NAME  VARCHAR2(30)
);
--==>>  출력 :    에러발생
/*
ORA-01950: no privileges on tablespace 'TBS_EDUA'
01950. 00000 -  "no privileges on tablespace '%s'"
*Cause:    User does not have privileges to allocate an extent in the
           specified tablespace.
*Action:   Grant the user the appropriate system privileges or grant the user
           space resource on the tablespace.
*/
-->> 건축업자로 사업자등록증은 받았지만, 집 지을 토지가 없는 상황과 같다. 
--   테이블 생성 권한까지 부여받은 상황이지만 
--   JIH 사용자 계정의 기본 테이블스페이스(DEFAULR TABLESPACE)는 
--   『TBL_EDUA』이며, 이 공간에 대한 할당량을 부여받지 못한 상태.
--   그러므로 이 테이블스페이스를 사용할 권한이 없다는 에러메세지를
--   오라클이 출력해주고 있는 상황. (할당량이 O인 상태) 


--○ SYS로부터 테이블스페이스(TBS_EDUA)에 대한 할당량을 부여받은 이후 
-- 다시 테이블 생성(테이블명 : TBL_ORAUSERTEST)
CREATE TABLE TBL_ORAUSERTEST
( NO    NUMBER(10)
, NAME  VARCHAR2(30)
);
--==>>  출력 :    Table TBL_ORAUSERTEST이(가) 생성되었습니다.


--※ 자신에게 부여된 할당량 조회
SELECT *
FROM USER_TS_QUOTAS;
--==>>  출력 :    TBS_EDUA	65536	-1	8	-1	NO
-- MAX_BYTES 가 음수라는건 UNLIMITED 라는 것 


--○ 생성된 테이블(TBL_ORAUSERTEST)이
--   어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
--==>>  출력 :    TBL_ORAUSERTEST	TBS_EDUA


