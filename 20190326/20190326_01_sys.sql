
--  1줄 주석문 처리(단일행 주석문 처리)

/*
    여러줄 
    (다중행)
    주석문
    처리 
*/

-- ○ 현재 오라클 서버에 접속한 자신의 계정 조회 

show user;
--==>>  결과 :    USER이(가) "SYS"입니다.
-- sqlplus 상태일 때 사용하는 명령어 (앞으로 사용 안함)

-- Query문은 대소문자를 구분하지 않지만, Oracle 에서는 대문자 사용할 예정
-- 실행은 Ctrl+Enter

SELECT USER
FROM DUAL;
--==>>  결과 :    SYS

SELECT 1+2
FROM DUAL;
--==>>  결과 :    3

SELECT 1 + 2
FROM DUAL;
--==>>  결과 :    3

SELECT '쌍용강북F강의장'
FROM DUAL;
--==>>  결과 :    쌍용강북F강의장

--※ 세미콜론은 종결자로 사용. 마지막에 찍어주자.
--   문자열 표현시 작은따옴표 사용. 
--   더미의 형태로 FROME DUAL을 사용. SELECT 절에 입력한 결과 

SELECT '아직은 지루한 오라클 수업';
/*
ORA-00923: FROM keyword not found where expected
00923. 00000 -  "FROM keyword not found where expected"
*Cause:    
*Action:
40행, 23열에서 오류 발생
*/

SELECT '아직은 지루한 오라클 수업'
FROM DUAL;
--==>>  결과 :    아직은 지루한 오라클 수업

SELECT 3.14 + 1.36
FROM DUAL;
--==>>  결과 :     4.5

SELECT 1.234 + 2.345
FROM DUAL;
--==>>  결과 :    3.579

SELECT 10*5
FROM DUAL;
--==>>  결과 :    50

SELECT 1000/23
FROM DUAL;
--==>   결과 :    43.47826086956521739130434782608695652174

SELECT 100-23
FROM DUAL;
--==>>  결과 :    77

SELECT "테스트"
FROM DUAL;
--==>>  결과 :    
/*
ORA-00904: "테스트": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
73행, 8열에서 오류 발생
*/

SELECT '김정규' + '윤희진'
FROM DUAL;
--==>>  결과 :    
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

-- 내가 보고자하는 표(테이블)을 먼저 설정해야 한다. 
-- 앞으로는 쿼리문 작성할 때, FROM절 부터 쓴다. 
-- 불편함을 감수하고서라도 뒤→앞, 아래→위로 순서고 쓴다.  

SELECT *
FROM DBA_USERS;

--『DBA』로 시작하는 Oracle Data Dictionary View 는 
-- 오로지 관리자 권한으로 접속했을 경우에만 조회가 가능하다
-- 아직은 데이터 딕셔너리 개념을 잡지 못해도 상관없다.

-- ○『HR』 사용자 계정을 잠금 상태로 설정
ALTER USER HR ACCOUNT LOCK;
--==>>  결과 :   User HR이(가) 변경되었습니다.

-- ○ 사용자 계정 정보 조회(확인)
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>  결과 :   
/*
:
HR	LOCKED
:
*/

-- ○ 다시 『HR』 사용자 계정을 잠금으로 설정
ALTER USER HR ACCOUNT UNLOCK;

--○ 다시 HR 사용자 계정 조회(확인)
SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
--==>>  결과 :   
/*
:
HR	OPEN
:
*/

-- CREATE : 구조적, 없던걸 새로 만들 때 사용
-- INSERT : 데이터적, 없던걸 새로 만들 때 사용

--○ TABLESPACE 생성
--※ TABLESPACE 란?
-- 세그먼트(테이블, 인덱스,...) 를 담아두는 (저장해두는)
-- 오라클의 논리적인 저장 구조를 의미한다. 
-- ↔ 물리적인 저장공간과 이어져야 한다는 말은? TABLESPACE 과 실제 저장공간을 연결해주겠다. 
-- C드라이브 / D드라이브 
CREATE TABLESPACE TBS_EDUA                           -- 생성 : CREATE 유형 개체명 / 생성 이하 구문은 옵션 설정  
DATAFILE 'C:\TESTORADATA\TBS_EDUA01.DBF'             -- 물리적으로 연결되는 데이터 파일                                   
SIZE 4M                                             -- 물리적 데이터 파일의 용량
EXTENT MANAGEMENT LOCAL                             -- 오라클 서버가 세그먼트를 알아서 관리
SEGMENT SPACE MANAGEMENT AUTO;                      -- 세그먼트 공간 관리도 자동으로 오라클 서버가...

-- 테이블스페이스 생성 구문을 실행하기 전에 
-- 물리적인 경로에 디렉터리(TABLESPACE) 생성할 것. → C드라이브에 TABLESPACE 폴더를 만들어주어야한다.

--==>>  결과 :    TABLESPACE TBS_EDUA이(가) 생성되었습니다.

--○ 생성된 테이블스페이스(TBS_EDUA) 조회
SELECT *
FROM DBA_TABLESPACES;
--==>>  결과 : 테이블딕셔너리 뷰라 한다. 
/*
    :
TBS_EDUA	8192	65536		1	2147483645	2147483645		65536	ONLINE	PERMANENT	LOGGING	NO	LOCAL	SYSTEM	NO	AUTO	DISABLED	NOT APPLY	NO	HOST	NO	                
    :
*/


--○ 물리적인 파일 이름 조회
SELECT *
FROM DBA_DATA_FILES;
--==>>  결과 :
/*
    :
C:\TESTORADATA\TBS_EDUA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
    :
*/


--○ 오라클 사용자 계정 생성
CREATE USER jih IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
--> jih 라는 사용자 계정을 만들겠다. (생성하겠다.)
--  이 계정을 통해 생성하는 오라클 객체는 (세그먼트들은)
--  기본적으로 TBS_EDUA 라는 테이블스페이스에 생성할 수 있도록 설정하겠다. 
--==>>  결과 :    User JIH이(가) 생성되었습니다.

--※ 생성된 오라클 사용자 계정(jih)을 통해 
--   접속을 시도해 보았으나 접속 불가.
--   → 『create session』 권한이 없기 때문이다.

--○ 생성된 오라클 사용자 계정(jih)에 
--   서버 접속이 가능할 수 있도록 create session 권한 부여 → sys가 해준다.
--   계정이름은 대소문자 구분안함/ 계정패스워드는 소문자만 가능함. 
GRANT CREATE SESSION TO JIH;
--==>>  결과 :    Grant을(를) 성공했습니다.

--○ 생성된 오라클 사용자 계정(jih)의 
--   DEFAULT TABLESPACE 조회
SELECT USERNAME, DEFAULT_TABLESPACE
FROM DBA_USERS;
--==>>  결과 :   
/*
SYS	                SYSTEM
SYSTEM	            SYSTEM
ANONYMOUS	        SYSAUX
-- 여기만 확인하자. 
HR	                USERS
JIH	                TBS_EDUA
--
APEX_PUBLIC_USER	    SYSTEM
FLOWS_FILES	        SYSAUX
APEX_040000	        SYSAUX
OUTLN	            SYSTEM
DIP	                SYSTEM
ORACLE_OCM	        SYSTEM
XS$NULL	            SYSTEM
MDSYS	            SYSAUX
CTXSYS	            SYSAUX
DBSNMP	            SYSAUX
XDB	                SYSAUX
APPQOSSYS	        SYSAUX
*/

--○ 생성된 오라클 사용자 계정(jih)의
--   시스템 관련 권한 조회
SELECT *
FROM DBA_SYS_PRIVS;
--==>>  결과 :   
/*
    :
JIH	CREATE SESSION	NO
    :
*/

--○ 생성된 오라클 계정(JIH)에 
--   테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여

GRANT CREATE TABLE TO JIH;
--==>>  결과 :    Grant을(를) 성공했습니다.

--○ 생성된 오라클 사용자 계정(JIH)에 
--   테이블스페이스(TBS_EDUA)에서 사용할 수 있는 공간(할당량)
--   의 크기를 무제한으로 지정.
--   (구조적인 변경이므로 ALTER)
--   QUOTA 설정할 용량 ON 어떤 테이블에서 
ALTER USER JIH
QUOTA UNLIMITED ON TBS_EDUA;
--==>>  결과 :    User JIH이(가) 변경되었습니다.











