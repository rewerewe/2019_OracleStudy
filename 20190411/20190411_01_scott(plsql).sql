SELECT USER
FROM DUAL;
--==>> SCOTT

SET SERVEROUTPUT ON;

--○ TBL_입고 테이블에서 입고수량을 수정(변경)하는 프로시저를 작성한다.
--      프로시저명 : PRC_입고_UPDATE(입고번호, 변경할입고수량);  ← 재고만 변경되면 됩니다.
--   입고 수량 변경을 하면, 시간의 흐름을 모두 파악한 뒤 본래 재고와 출고 테이블까지 연결된 수량 모두 자동으로 UPDATE 되게끔 구성행야 하나
--   이번 실습에서는 재고수량만 변동되는 프로지서를 작성한다.

CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
(   V_입고번호       IN  TBL_입고.입고번호%TYPE
,   V_변경입고수량   IN  TBL_입고.입고수량%TYPE
)
IS
    V_이전입고수량    TBL_입고.입고수량%TYPE;
    V_상품코드        TBL_상품.상품코드%TYPE;
    USER_DEFINE_ERROR  EXCEPTION;
BEGIN
    -- 예외발생 : 입고수량이 0 보다 작으면 예외 발생시킨다.  
--    IF (V_변경입고수량 < 0)
--       THEN RAISE USER_DEFINE_ERROR;
--    END IF;
    
    -- 입고번호로 입고수량, 상품코드 찾기
    SELECT 입고수량, 상품코드 INTO V_이전입고수량, V_상품코드
    FROM TBL_입고 
    WHERE 입고번호=V_입고번호;
    
    -- 변경할 입고수량으로 업데이트
    UPDATE TBL_입고
    SET 입고수량 = V_변경입고수량
    WHERE 입고번호=V_입고번호; 
    
    -- 상품테이블의 재고수량 업데이트
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_이전입고수량 + V_변경입고수량
    WHERE 상품코드=V_상품코드;
    
    COMMIT;
    
    -- 예외처리
    EXCEPTION
--        WHEN USER_DEFINE_ERROR
--            THEN RAISE_APPLICATION_ERROR(-20001, '입고수량은 0 이상으로 입력해주세요');
 --               ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_입고_UPDATE이(가) 컴파일되었습니다.


--○ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
--      프로시저명 : PRC_출고_DELETE(출고번호);
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( V_출고번호    IN TBL_출고.출고번호%TYPE
)
IS
BEGIN
   
    --출고번호의 출고건을 삭제한다.
    DELETE
    FROM TBL_출고
    WHERE 출고번호=V_출고번호;
    
END;



--○ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
--      프로시저명 : PRC_입고_DELETE(입고번호);
--   재고가 -마이너스만 되지 않게 작성하자. 
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( V_입고번호    IN TBL_입고.입고번호%TYPE
)
IS
    V_상품코드  TBL_입고.입고번호%TYPE;
    V_재고수량  TBL_상품.재고수량%TYPE;
    USER_DEFINE_ERROR   EXCEPTION; 
BEGIN
    -- 예외발생
    IF ( V_재고수량 < 0 )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- 입고번호로 상품코드 알아내기
    SELECT 상품코드 INTO V_상품코드
    FROM TBL_입고
    WHERE 입고번호=V_입고번호;
    
    SELECT 재고수량 INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드=V_상품코드;
    
    -- 입고번호의 입고건을 삭제한다. 
    DELETE 
    FROM TBL_입고
    WHERE 입고번호=V_입고번호;
    
    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '재고가 마이너스이므로 삭제할 수 없습니다');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;


----------------------------------------------------------------

/*
    ■■■ CURSOR (커서) ■■■
    
    1. 오라클에서 하나의 레코드가 아닌 여러 레코드로 구성된
       작업 영역에서 SQL 문을 실행하고 그 과정에서 발생한 정보를 
       저장하기 위하여 커서(CURSOR)를 사용하며, 
       커서에는 암시적 커서와 명시적 커서가 있다.
       
    2. 암시적 커서는 모든 SQL 문에 존재하며, 
       SQL문 실행 후 오직 하나의 행(ROW)만 출력하게 된다. 
       그러나 SQL 문을 실행한 결과문(RESULT SET)이
       여러 행(ROW)으로 구성된 경우
       커서(CURSOR)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다. 
       
    = 상자안에 압축되어 담긴 스프링 담긴 인형 같은 것.
*/

--○ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;
    
    DBMS_OUTPUT.PUT_LINE(V_NAME||','||V_TEL);
END;
--==>> 홍길동, 011-2356-4528

--○ 커서 이용 전 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME, V_TEL
    FROM TBL_INSA;    
    
    DBMS_OUTPUT.PUT_LINE(V_NAME||','||V_TEL);
END;
--==>> 에러 발생
/*
ORA-01422: exact fetch returns more than requested number of rows
*/


--○ 커서 이용 전 상황(다중 행 접근 시 - 반복문을 활용하는 경우)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
    --> (1) 시리얼화 되어있는 상황. 1씩 증가한다. 그러나 증가에 규칙이 없을 경우 CURSOR로 쓸 수 있다.
    --> (2) 시작값을 지정해야 한다. 직접 확인한 후 구문을 작성할 수 있다. 그러나 이경우도 CURSOR 로 쓰면 된다. 
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME, V_TEL
        FROM TBL_INSA
        WHERE NUM=V_NUM;
    
        DBMS_OUTPUT.PUT_LINE(V_NAME||','||V_TEL);
        V_NUM := V_NUM +1;
        
        EXIT WHEN V_NUM >= 1061;
    END LOOP;
END;
/*
    홍길동,011-2356-4528
    이순신,010-4758-6532
    이순애,010-4231-1236
    김정훈,019-5236-4221
    한석봉,018-5211-3542
    이기자,010-3214-5357
    장인철,011-2345-2525
    김영년,016-2222-4444
    나윤균,019-1111-2222
    김종서,011-3214-5555
    유관순,010-8888-4422
    정한국,018-2222-4242
    조미숙,019-6666-4444
    황진이,010-3214-5467
    이현숙,016-2548-3365
    이상헌,010-4526-1234
    엄용수,010-3254-2542
    이성길,018-1333-3333
    박문수,017-4747-4848
    유영희,011-9595-8585
    홍길남,011-9999-7575
    이영숙,017-5214-5282
    김인수,
    김말자,011-5248-7789
    우재옥,010-4563-2587
    김숙남,010-2112-5225
    김영길,019-8523-1478
    이남신,016-1818-4848
    김말숙,016-3535-3636
    정정해,019-6564-6752
    지재환,019-5552-7511
    심심해,016-8888-7474
    김미나,011-2444-4444
    이정석,011-3697-7412
    정영희,
    이재영,011-9999-9999
    최석규,011-7777-7777
    손인수,010-6542-7412
    고순정,010-2587-7895
    박세열,016-4444-7777
    문길수,016-4444-5555
    채정희,011-5125-5511
    양미옥,016-8548-6547
    지수환,011-5555-7548
    홍원신,011-7777-7777
    허경운,017-3333-3333
    산마루,018-0505-0505
    이기상,
    이미성,010-6654-8854
    이미인,011-8585-5252
    권영미,011-5555-7548
    권옥경,010-3644-5577
    김싱식,011-7585-7474
    정상호,016-1919-4242
    정한나,016-2424-4242
    전용재,010-7549-8654
    이미경,016-6542-7546
    김신제,010-2415-5444
    임수봉,011-4151-4154
    김신애,011-4151-4444
       
    PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

--○ 커서 이용 후 상황(다중 행 접근 시)
DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;

    -- 커서 이용을 위한 커서변수 선언(→ 커서 정의)
    -- 커서는 규모가 커서 [변수 변수타입]으로 쓰지 않는다.
    --[커서 커서명] 으로 변수를 선언한다. 
    CURSOR  CUR_INSA_SELECT 
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;
    
BEGIN
    
    --(1) 커서 오픈 
    OPEN CUR_INSA_SELECT;   
    --커서를 오픈하면 와아앙아아아아앙아아 하고 쏟아져 나온다. 
    
    --(2) 커서 오픈하면 쏟아져 나오는 데이터들 처리(잡아내기)
    LOOP
        --(3) 한 행, 한 행 끄집어내어 가져오는 행위 → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;
        
        --(5) 
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        
        --(4) 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME||','||V_TEL);
        
    END LOOP;
    
    --(6) 커서 닫기
    CLOSE CUR_INSA_SELECT;
    
END;


/*
    ▶ 커서의 장점
    (1) 시리얼화 되어있는 상황. 1씩 증가한다. 그러나 증가에 규칙이 없을 경우 CURSOR로 쓸 수 있다.
    (2) 시작값을 지정해야 한다. 직접 확인한 후 구문을 작성할 수 있다. 그러나 이경우도 CURSOR 로 쓰면 된다.
    ? (무엇이..?) 커서의 닫아주는 기능 때문이다.
*/

----------------------------------------------------------------

/*
    ■■■ TRIGGER (트리거) ■■■
    
    사전적 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다, 는 의미
    
    1. TRIGGER(트리거)란 DML 작업 즉, INSERTM, UPDATE, DELETE 작업이 일어날 때
       자동적으로 실행되는 (유발되는, 촉발되는) 객체로
       이와 같은 특징을 강조하여(부각시켜) DML TRIGGER 라고 부르기도 한다.
       TRIGGER 는 데이터 무결성 뿐 아니라 다음과 같은 작업에도 널리 이용된다.
       
       - 자동으로 파생된 열 값 생성    TBL_떠든사람 의 TBL_히든  
       - 잘못된 트랜잭션 방지          PRC_입고_INSERT 에 데이터 입력시 상품 테이블 재고에 UPDATE 실행됨
       - 복잡한 보안 권한 강제 수행    업무시간에 주식사이트에서 접근 금지 
       - 분산 데이터베이스 노드 상에서  부산 사무소 테이블에 입고했더니, 대구 사무소 테이블에 같이 UPDATE 됨
                    참조 무결성 강제 수행
       - 복잡한 업무 규칙 강제 적용        
       - 투명한 이벤트 로깅 제공      TBL_히든과 같은 개념 : INSERT UPDATE DELETE 기록 로그가 남는 것 
       - 복잡한 감사 제공              
       - 동기 테이블 복제 유지관리    TBL_떠든사람_BACKUP
       - 테이블 액세스 통계 수집      

    2. TRIGGER 내에서는 COMMIT, ROLLBACK 문을 사용할 수 없다. (논리적으로 말이 안됨)
    
    3. 특징 및 종류
    
        BEFORE TRIGGER : 사전에 실행됨 
        / 
        AFTER TRIGGER : 행위 이후에 실행됨

        STATEMENT TRIGGER : 1건만 실행되고 끝
        /
        ROW TRIGGER : '행 트리거'라고 부름. 모든 정보를 줄 단위로 파악함.
        
        
        BEFORE STATEMENT
        SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행. 

        BEFORE ROW
        SQL 구문이 실행되지 전에(DML 작업을 수행하기 전에)
        각 행(ROW)에 대해 한번씩 실행
        
        AFTER STATEMENT
        SQL 구문이 실행된 후 그 문장에 대해 한번 실행
        
        AFTER ROW
        SQL 구문이 실행된 후(DML 작업을 수행한 후에)
        각 행(ROW)에 대해 한번씩 실행
        
    
    4. 형식 및 구조

        CREATE [OR REPLACE] TRIGGER 트리거명
            [BEFORE | AFTER]
             이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명 
                         ------               ----------(TBL_떠든사람)
                         INSERT, UPDATE, DELETE 와 조합해 씀 
            [FOR EACH ROW [WHEN TRIGGER 조건]]
            --------- 
            행 트리거에만 붙는다. 
        [DECLARE]
            --선언 구문;
        BEGIN
            --실행 구문;
        END;
*/
--------------------------------------------------
/*
    ■■■ AFTER STATEMENT TRIGGER 상황 실습 ■■■
    ※ DML 작업에 대한 이벤트 기록

*/
-- 테이블, 제약조건은 20190411_02_scott 에 만들고
-- 트리거 생성은 20190411_02_scott(plsql) 파일에 만들었어야 더 편함.
 
--○ TRIGGER(트리거) 생성(TGR_EVENTLOG)
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
DECLARE
BEGIN
    --이벤트 종류 구분 (조건문을 통한 분기)
    IF ( INSERTING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT 쿼리문이 수행되었습니다.');
    ELSIF ( UPDATING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('UPDATE 쿼리문이 수행되었습니다.');
    ELSIF ( DELETING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('DELETE 쿼리문이 수행되었습니다.');
    END IF;
    
    --COMMIT;
    -- ※ TRIGGER 내에서는 COMMIT 구문 사용불가 
    
END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.


--------------------------------------------------
/*
    ■■■ BEFORE STATEMENT TRIGGER 상황 실습 ■■■
    ※ DML 작업 수행 전에 작업 가능여부 확인
        (보안 정책 적용 / 업무 규칙 적용)
*/
--○ TRIGGER(트리거) 작성(TRG_TEST1_DML)
CREATE OR REPLACE TRIGGER TRG_TEST1_DML
            BEFORE
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
/*
    IF ( 시간이 오전 8시 이전이거나, 오후 6시 이후라면... )
        THEN 작업을 하지 못하도록 처리하겠다. 
             = 예외를 발생시키도록 하겠다.
    END IF;
*/
    --   시간만 추출
    IF ( TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 
            OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) >= 18 )
                THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08:00 ~ 18:00 까지만 가능합니다.');  
    END IF;
END;
--==>> Trigger TRG_TEST1_DML이(가) 컴파일되었습니다.


--------------------------------------------------
/*
    ■■■ BEFORE ROW TRIGGER 상황 실습 ■■■
    ※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델
    
    부모테이블 데이터 보다 자식테이블 데이터를 먼저 삭제해주면서 실행 
    
    1 : 다 테이블 구조에서 
    부모테이블 (1) 의 행은 자식테이블 (다) 와 관계 있어 삭제 할 수 없다.
    그러나 자식테이블 (다) 에서 참조하는 행을 모두 삭제하면, 
    부모테이블 (1)의  행을 지울 수 있게될 것이다.    
*/
--○ TRIGGER(트리거) 작성(TRG_TEST2_DELETE)
-- (1) TEST2 인지, TEST3 일지 헷갈리면 안됩니다. 
--     → TEST2에 장착되어 TEST3 에 적용되므로 ON TBL_TEST2 이다. 
-- (2) FOR EACH ROW 이 구문이 없으면 BEFORE STATEMENT 트리거 입니다. 
-- (3) 『:OLD』  NOW 에서 살짝 이전 
--     『:NEW』  NOW 에서 살짝 이후
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
        BEFORE
        DELETE ON TBL_TEST2
        FOR EACH ROW 
       
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;
END;
--==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.
/*
    ※ 『:OLD』
        참조 전 열의 값
        (INSERT : 입력하기 이전 자료, DELETE : 삭제하기 이전 자료 즉, 삭제할 자료)
        
    ※ UPDATE → DELETE 그리고 INSERT 가 결합된 형태
                 이 과정에서 UPDATE 하기 이전의 자료는 :OLD
                 이 과정에서 UPDATE 한 후의 자료는 :NEW
*/
DELETE
FROM TBL_TEST2
WHERE CODE=1;


--------------------------------------------------
/*
    ■■■ AFTER ROW TRIGGER 상황 실습 ■■■
    ※ 참조 테이블 관련 트랜잭션 처리
    
       EX) TBL_상품, TBL_입고, TBL_출고
*/    
--○ TBL_입고 테이블의 데이터 입력시 (입고 이벤트 발생시)
--   TBL_상품 테이블의 재고수량 변동(업데이트) 트리거 작성

/*
    IF ( INSERTING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + 새로입고되는입고수량
             WHERE 상품코드 =새로입고되는상품코드;
    END IF;
*/  
CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT ON TBL_입고
        FOR EACH ROW
BEGIN
  
    IF ( INSERTING ) 
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
        
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.


--< 실습 >

--○ TBL_상품, TBL_입고, TBL_출고의 관계에서
--   입고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_IBGO 트리거를 수정한다. 

CREATE OR REPLACE TRIGGER TRG_IBGO
        AFTER
        INSERT OR UPDATE OR DELETE ON TBL_입고
        FOR EACH ROW
BEGIN 
    IF ( INSERTING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF ( UPDATING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :OLD.입고수량 + :NEW.입고수량
             WHERE 상품코드 = :OLD.상품코드;
    ELSIF ( DELETING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :OLD.입고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>> Trigger TRG_IBGO이(가) 컴파일되었습니다.


--○ TBL_상품, TBL_입고, TBL_출고의 관계에서
--   출고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_CHULGO 트리거를 작성한다. 

CREATE OR REPLACE TRIGGER TRG_CHULGO
        AFTER
        INSERT OR UPDATE OR DELETE ON TBL_출고
        FOR EACH ROW
BEGIN
    IF ( INSERTING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 - :NEW.출고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF ( UPDATING )
        THEN UPDATE TBL_상품 
             SET 재고수량 = 재고수량 + :OLD.출고수량 - :NEW.출고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF ( DELETING )
        THEN UPDATE TBL_상품
             SET 재고수량 = 재고수량 + :OLD.출고수량
             WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
--==>> Trigger TRG_CHULGO이(가) 컴파일되었습니다.


/*
    ▶ 프로시저와 트리거의 차이
    
    프로시저와 트리거는 쓰임새와 기능이 아예 다르다.
    프로시저는 사용자 직접사용하는 함수인거네. 여러 구문을 쓸거 한번에 쓰려고 쓰는거.
    즉, 어떤 목적을 이루기 위해 수행하기 위해 호출해서 한번에 수행하는 것. 
    트리거는 관리자 적용해 둔, 주로 데이터베이스의 무결성을 위한 제약조건 같은 것 일하는 것. 
    사용자는 사용하는 지도 모르는 사이 진행되기에 이용자 편의가 아니다.  
    
    프로시저는 단계별, 절차별로 수행하는 걸 모듈화 시켜서 모아놓는 걸.
    시간과 절차를 요하기 때문에, 절차적으로 편하게 쓸 수 있는 단축키 (프로시저의 목적)
    = 사용자가 쓰기 편하려고 만드는 것. 직접 설계해서 쓰거나 요청할 수 있는 것
    사용자가 목적, 기능을 알기에 쓰려고 작정하고(?) 사용하는 것 (매크로다.)
    
    트리거는 관리자 측면에서 사용자는 늘 불안하기에, 감시하면서 사전에 제약을 가하는 작업  
*/

------------------------------------------
--○ TRIGGER 의 정보 조회
SELECT *
FROM USER_TRIGGERS;
/*
TRG_EVENTLOG	AFTER STATEMENT	INSERT OR UPDATE OR DELETE	SCOTT	TABLE	TBL_TEST1		REFERENCING NEW AS NEW OLD AS OLD		ENABLED	"TRG_EVENTLOG
            AFTER
            INSERT OR UPDATE OR DELETE ON TBL_TEST1
"	PL/SQL     	"DECLARE
BEGIN
    --이벤트 종류 구분 (조건문을 통한 분기)
    IF ( INSERTING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT 쿼리문이 수행되었습니다.');
    ELSIF ( UPDATING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('UPDATE 쿼리문이 수행되었습니다.');
    ELSIF ( DELETING )
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('DELETE 쿼리문이 수행되었습니다.');
    END IF;

    --COMMIT;
    -- ※ TRIGGER 내에서는 COMMIT 구문 사용불가 

END;
--==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.



------------------------------------------
/*
    ■■■ PACKAGE(패키지) ■■■
    
    1. PL/SQL 의 패키지는 관계되는 타입, 프로그램 객체,
       서브 프로그램(PROCEDURE, FUNCTION 등)을
       논리적으로 묶어놓은 것으로 
       오라클에서 제공하는 패키지 중 하나가 바로 『DBMS_OUTPUT』 이다.
       
    2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를
       하나의 패키지로 만들어 관리함으로써 향후 유지보수가 편리하고 
       전체 프로그램을 모듈화 할 수 있는 장점이 있다.
    
    3. 패키지는 명세부(PACKAGE SPECIFICATION)와
       몸체부(PACKAGE BODY)로 구성되어 있으며,
       명세 부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR,
       SUBPROGRAM 이 선언되고
       몸체 부분에는 이들의 실제 내용이 존재하게 된다.
       그리고 호출할 때에는 『패키지명.프로시저명』형식의 참조를 이용해야 한다.
       
    4. 형식 및 구조(명세부)
      
        CREATE [OR REPLACE] PACKAGE 패키지명
        IS
            전역변수 선언;
            커서 선언;
            예외 선언;
            함수 선언;
            프로시저 선언;
                :
        END 패키지명;
        
    5. 형식 및 구조 (몸체부) 
    
        CREATE [OR REPLACE] PACKAGE BODY 패키지명    ※ 패키지명은 같아야 한다. 
        IS 
            FUNCTION 함수명[(인수, ...)]
            RETURN 자료형
            IS
                변수 선언;
            BEGIN 
                함수 몸체 구성 코드;
                RETURN 값;
            END;
            
            PROCEDURE 프로시저명[(인수, ...)]
            IS 
                변수 선언;
            BEGIN
                프로시저 몸체 구성 코드;
            END;
            
        END 패키지명;

*/

--○ 주민번호 입력시 성별을 반환하는 함수
--   이 함수를 구성요소로 하는 패키지 작성

-- 함수 준비
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)
RETURN VARCHAR2
IS 
    V_RESULT VARCHAR2(20);
BEGIN
    IF (SUBSTR(V_SSN, 8, 1) IN ('1','3'))
        THEN V_RESULT := '남자';
    ELSIF (SUBSTR(V_SSN, 8, 1) IN ('2', '4'))
        THEN V_RESULT := '여자';
        
    ELSE 
        V_RESULT := '확인불가';
    END IF;
    
    RETURN V_RESULT;
END;
--==>> Function FN_GENDER이(가) 컴파일되었습니다.


-- 패키지 등록

-- 1. 명세부 작성
CREATE OR REPLACE PACKAGE INSA_PACK
IS 
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;

END INSA_PACK;
--==>> Package INSA_PACK이(가) 컴파일되었습니다.

-- 2. 몸체부 작성
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2
    IS 
        V_RESULT VARCHAR2(20);
    BEGIN
        IF (SUBSTR(V_SSN, 8, 1) IN ('1','3'))
            THEN V_RESULT := '남자';
        ELSIF (SUBSTR(V_SSN, 8, 1) IN ('2', '4'))
            THEN V_RESULT := '여자';
            
        ELSE 
            V_RESULT := '확인불가';
        END IF;
        
        RETURN V_RESULT;
    END;

END INSA_PACK;
--==>> Package Body INSA_PACK이(가) 컴파일되었습니다.

