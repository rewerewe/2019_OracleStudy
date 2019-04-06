SELECT USER
FROM DUAL;

 
--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "��", ROUND(48.678, 2) "��"      -- �Ҽ��� ���� ��°�ڸ����� ǥ��(��°�ڸ����� �ݿø�)
                  , ROUND(48.674, 2) "��"
                  , ROUND(48.674, 1) "��"
                  , ROUND(48.674, 0) "��"       -- �����κи� ǥ���ض�.
                  , ROUND(48.674) "��"          -- �ι�° �Ķ���� ���� 0�� ��� ���� ����
                  , ROUND(48.674, -1) "��"
                  , ROUND(48.674, -2) "��"
                  , ROUND(48.674, -3) "��"
FROM DUAL;
--==>> 48.678   48.68   48.67   48.7   49   49   50   0   0


--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678
        , TRUNC(48.678, 2) ""
        , TRUNC(48.674, 2) ""
        , TRUNC(48.678, 1) ""
        , TRUNC(48.678, 0) ""
        , TRUNC(48.678) ""
        , TRUNC(48.678, -1) ""
        , TRUNC(48.678, -2) ""
        , TRUNC(48.678, -3) ""
FROM DUAL;


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2)
FROM DUAL;
-- 5�� 2�� ���� ������ ����� ��ȯ
--==>> 1

--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5,3)
FROM DUAL;
-- 5�� 3���� ��������� ��ȯ
--==>> 125


--�� SQRT() ��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
-- ��� 2�� ���� ����� ��ȯ
--==>> 1.41421356237309504880168872420969807857


--�� LOG() �α� �Լ�
-- (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�)
SELECT LOG(10,100), LOG(10, 20) 
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--�� �ﰢ�Լ� 
-- ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>> 
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/


--�� �ﰢ�Լ��� ���Լ� (���� : -1 ~ 1)
-- �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;

/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805
0.4636476090008061162142562314612144020295
*/


--�� SIGN()   ����, ��ȣ, Ư¡
-- ���� ������� ����� 1.0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-7)
FROM DUAL;
-- �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�. 
/*
    1	0	-1
*/


--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ� 
SELECT ASCII('A'), CHR(65)
FROM DUAL;
-- ASCII() : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
-- CHR()   : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.
/*
    65	A   
*/





----------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>  Session��(��) ����Ǿ����ϴ�.

--�� ��¥�� ������ �⺻������ 'DAY(�ϼ�)' �Դϴ�. [CHECK]
SELECT SYSDATE, SYSDATE+1, SYSDATE-2, SYSDATE-29
FROM DUAL;
/*
    2019-03-29 09:29:14     -- ����
    2019-03-30 09:29:14	    -- 1�� �� 
    2019-03-27 09:29:14	    -- 2�� ��
    2019-02-28 09:29:14     -- 29�� �� 
*/


--�� �ð����� ����
SELECT SYSDATE, SYSDATE + 1/24, SYSDATE - 2/24
FROM DUAL;

/*
    2019-03-29 09:31:17	    -- ����
    2019-03-29 10:31:17	    -- 1�ð� �� 
    2019-03-29 07:31:17     -- 2�ð� ��
*/

--�� ���� �ð���... ���� �ð� ��� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
/*
--------------------------------------------
        ����ð�             ���� �� �ð�
--------------------------------------------
 2019-03-29 09:30:48    2019-03-30 11:33:52
--------------------------------------------
*/

--SELECT SYSDATE"����ð�", SYSDATE+1 +2/24 + 3/1440 + 4/86400 "���� �� �ð�"
SELECT SYSDATE"����ð�", SYSDATE+1 +2/24 + 3/(24*60) + 4(24*60*60)"���� �� �ð�"
FROM DUAL;

-- ���1.
SELECT SYSDATE"���� �ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"���� �� �ð�"  
FROM DUAL;
/*

    2019-03-29 09:41:19	    2019-03-30 11:44:23
*/

-- ���2.
SELECT SYSDATE"���� �ð�"
     , SYSDATE + ( (24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60)"���� �� �ð�"
--                     1��         2�ð�      3��    4�� 
FROM DUAL;
/*
          ���� �ð�              ���� �� �ð� 
    2019-03-29 09:44:35	    2019-03-30 11:47:39
*/



--�� ��¥ - ��¥ = �ϼ� 
-- ex) (2019-07-18) - (2019-03-29)
--       ������          ������
SELECT TO_DATE('2019-07-18', 'YYYY-MM-DD') - TO_DATE('2019-03-29', 'YYYY-MM-DD')
FROM DUAL;
--==>> 111

--V------------------------------------------------------------------------------------------------------9


SELECT TO_DATE('2019-13-29', 'YYYY-MM-DD')
FROM DUAL;
-- ������ ���� ���� ������ ���� 
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/


--�� TO_DATE() �Լ��� ���� ���� Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ �� 
-- ���������� �ش� ��¥�� ���� ��ȿ�� �˻簡 �̷������.



--�� ADD_MONTHS() ���� ���� ���� �ִ� �Լ� 
SELECT SYSDATE "1"
, ADD_MONTHS(SYSDATE, 2) "2"
, ADD_MONTHS(SYSDATE, 3) "3"
, ADD_MONTHS(SYSDATE, -2) "4"
, ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
-- ���� ���ϰ� ���� 
/*
    2019-03-29 10:06:18     --����
    2019-05-29 10:06:18	    -- 2���� �� 
    2019-06-29 10:06:18	    -- 3���� �� 
    2019-01-29 10:06:18	    -- 2���� ��
    2018-12-29 10:06:18     -- 3���� ��
*/



--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  Session��(��) ����Ǿ����ϴ�.



--�� MONTHS_BETWEEN()
-- '�� ��' ��ȯ. ���� ���� ���̸� ��ȯ�ϴ� �Լ� 
-- ù ��° ���ڰ����� �� ��° ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD'))
FROM DUAL;
--==>>  201.949151359020310633213859020310633214

--�� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
-- ù ��° ���ڰ��� �ش��ϴ� ��¥����
-- �� ��° ���ڰ��� �ش��ϴ� ��¥�� ���̷������ �ǹ̷� Ȯ���� �� �ִ�.
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-07-18', 'YYYY-MM-DD'))
FROM DUAL;
--==>>  -3.63143593189964157706093189964157706093



--�� NEXT_DAY()
-- ù ��° ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>>  2019-03-30	2019-04-01

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> 
Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� ������ ���� ���� �������� �ٽ� �ѹ� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��'), NEXT_DAY(SYSDATE, '��')
FROM DUAL;
--==>> ���� �߻� 
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT'), NEXT_DAY(SYSDATE, 'MON')
FROM DUAL;
--==>> 2019-03-30	2019-04-01

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE ='KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.



--�� LAST_DAY()
-- �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;
--==>> 2019-03-31

SELECT LAST_DAY(TO_DATE('2019-02-01', 'YYYY-MM-DD'))
FROM DUAL;
--==>> 2019-02-28

--�� ���úη�, �����Դ��� ���뿡 �� ����(?)����.
--   ���� �Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.

-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ� �Ѵٰ� �����ϸ� 
--    ���԰� �� ���� �Ծ�� ���� �����ٱ�.

SELECT ADD_MONTHS(SYSDATE, 22)"��������"
FROM DUAL;
/*  
    1.
    ��������
    2021-01-29
*/

SELECT (TO_DATE('2021-01-29', 'YYYY-MM-DD') - TO_DATE('2019-03-29', 'YYYY-MM-DD') * 3)"���԰� �Ծ���ϴ� ����"
FROM DUAL;
/*
    �����Ⱓ * 3
    --------
    (�������� - ��������)
    
    (�������� - ��������) * 3 
*/

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3
FROM DUAL; 
--==>> 2016

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

/*
--�� ���� ��¥ �� �ð����κ���, ������(2019-07-18 18:00:00) ����
--   ���� �Ⱓ�� ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.

---------------------------------------------------------------------------
      ����ð�      |        ������         |     �� |   �ð� |   �� |  �� |
---------------------------------------------------------------------------
2019-03-29 10:33:27 |  2019-07-18 18:00:00 |    110 |     7  |  26  |  33 |
---------------------------------------------------------------------------
*/

-- ���� Ǯ���� ���� 
-- TO_CHAR �� ��ȯ, ��¥Ÿ�� �ƴ� ����Ÿ��   
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "����ð�"                      -- ����Ÿ��
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "������"                  -- ��¥Ÿ��
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) "��"        -- ����Ÿ��
     , TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') -
     TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))  "�ú���"
     
     , TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') -          --  Ʈ��ũ(�Ҽ���-Ʈ��ũ)
     TRUNC(TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) *24) "��"  -- Ʈ��ũ 
    
FROM DUAL;    
    
    
    
 /*    
     -- TO_DATE - TO_DATE = �� 
     --, TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24 "�ð�(24)"
     --  -TRUNC(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))/24*60 "�ð�(24)"
     ,TRUNC((TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24) 
     - TRUNC(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24 "��(24)"
     
     
     --,(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))) * (24*60) "��(24*60)" 
     --,TRUNC((TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')) * 24*60*60)/ "��(24*60*60)"
     
     --, TO_DATE(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') - TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'))"�ð�"  
     --, TO_CHAR(TO_DATE('2019-07-18', 'YYYY-MM-DD HH24:MI:SS') + (2/24))"�ð�"
     --, "��"
     --, "��"    
*/

--V------------------------------------------------------------------------------------------------------10
-- ������ �ð�....
/*

SELECT SYSDATE"���� �ð�"
     , SYSDATE + ( (24*60*60) + (2*60*60) + (3*60) + 4) / (24*60*60)"���� �� �ð�"
--                     1��         2�ð�      3��    4�� 
*/


--V------------------------------------------------------------------------------------------------------11
-- �Բ� Ǯ���� ���� 
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

-- ��1�� 2�ð� 3�� 4�ʡ���... �ʷ� ȯ���ϸ�?
SELECT (1��) + (2�ð�) + (3��) + (4��)
FROM DUAL;

SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)"�ʷ� ȯ��"
FROM DUAL;
--==>> 93784

-- ��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�...
SELECT 
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)
FROM DUAL;
--==>> 1	2	3	4



-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����)    �� ���� : �ϼ� 
SELECT �������� - �������� 
FROM DUAL;


-- �������� 
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2019-07-18 18:00:00  �� ��¥ ����



-- �����ϱ��� ���� �ϼ� 
SELECT TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 111.238287037037037037037037037037037037     ��



-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����)    �� ���� : ��
SELECT �����ϱ��������ϼ� * �Ϸ縦 �����ϴ� ��ü ��
FROM DUAL;


SELECT �����ϱ��������ϼ� * (24*60*60)    -- (24*60*60) : 1���� �����ϴ� ��ü �� 
FROM DUAL;


SELECT ( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60)    -- (24*60*60) : 1���� �����ϴ� ��ü �� 
FROM DUAL;
--==>> 9610811.00000000000000000000000000000001


SELECT TRUNC(TRUNC(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60)/60)/24)"��"
     , MOD(TRUNC(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60)/60), 24)"��"
     , MOD(TRUNC(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) /60), 60)"��"
     , TRUNC(MOD(( TO_DATE('2019-07-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE ) * (24*60*60) , 60))"��"
FROM DUAL;
--==>> 111	5	36	7

/*
�ɰ��� �����ߴ� ���� ���� ������.... �˴ϴ�.
��ȣ������ �������� �ʾƵ� �ȴ�. �̷��� �ȵȴ�....
*/


/*
--�� ����
-- ������ �¾�� ������� �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��� �ִ��� ��ȸ�Ѵ�.

---------------------------------------------------------------------------
     ���� �ð�      |      �¾ �ð�      |     �� |   �ð� |   �� |  �� |
---------------------------------------------------------------------------
2019-03-29 10:33:27 |  1987-11-03 05:30:10 |  XXXX  |   XXX  |  XXX | XXX |
---------------------------------------------------------------------------

*/

SELECT SYSDATE"���� �ð�"
FROM DUAL;



-- 1�� 5�� 30�� 10�ʸ� �ʷ� ���
SELECT (1��) + (5��) + (30��) + (10��)
FROM DUAL;

SELECT (1*24*60*60) + (5*60*60) + (30*60) + (10)
FROM DUAL;
--==>> 106210


-- 95410�� 1�� 5�� 30�� 10�ʷ� ��ȯ
SELECT
     MOD(TRUNC(TRUNC(106210/60)/60), 24)"��"
     , MOD(TRUNC(106210/60), 60)"��"
     , MOD(106210
     
     , 60)"��"
FROM DUAL;



-- ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.



--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                       -- 2019-03-29 : �⺻ ���� ��¥ 
     , ROUND(SYSDATE, 'YEAR') "2"        -- 2019-01-01 : �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� ����)	
     , ROUND(SYSDATE, 'MONTH') "3"       -- 2019-04-01 : ������ ��ȿ�� ������(15�� ����)
     , ROUND(SYSDATE, 'DD') "4"          -- 2019-03-30 : ��¥���� ��ȿ�� ������(���� ����)
     , ROUND(SYSDATE, 'DAY') "5"         -- 2019-03-31 : ��¥���� ��ȿ�� ������(������ ����)
FROM DUAL;

--==>> 2019-03-29	2019-01-01	2019-04-01	2019-03-30	2019-03-31


--�� ��¥ ����
SELECT SYSDATE "1"                       -- 2019-03-29 : �⺻ ���� ��¥ 
     , TRUNC(SYSDATE, 'YEAR') "2"        -- 2019-01-01 : �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "3"       -- 2019-03-01 : ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "4"          -- 2019-03-29 : ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"         -- 2019-03-24 : ��¥���� ��ȿ�� ������ 
FROM DUAL;


---------------------------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()    : ����, ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�                 ����, ��¥ �� ���� 
-- TO_DATE()    : ���� ������(��¥ ���� ���ϴ�)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�           ���� �� ��¥
-- TO_NUMBER()  : ���� ������(���� ���� ���ϴ�)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�           ���� �� ����

--�� ��¥�� ��ȭ ������ ���� ���� ���
--   ���� �������� ���� ������ �� �ֵ��� �Ѵ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';           -- ����� ����
--==>>  Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';       -- ������ ����� ����
--==>>  Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET MLS_CURRENCY = '\'; --��ȭ ��� ���� ?

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')       -- 2019-03-29
     , TO_CHAR(SYSDATE, 'YYYY')             -- 2019
     , TO_CHAR(SYSDATE, 'YEAR')             -- TWENTY NINETEEN
     , TO_CHAR(SYSDATE, 'MM')               -- 03
     , TO_CHAR(SYSDATE, 'MONTH')            -- 3��
     , TO_CHAR(SYSDATE, 'MON')              -- 3��
     , TO_CHAR(SYSDATE, 'DD')               -- 29
     , TO_CHAR(SYSDATE, 'DAY')              -- �ݿ���
     , TO_CHAR(SYSDATE, 'DY')               -- ��
     , TO_CHAR(SYSDATE, 'HH24')             -- 14
     , TO_CHAR(SYSDATE, 'HH')               -- 02
     , TO_CHAR(SYSDATE, 'HH AM')            -- 02 ����
     , TO_CHAR(SYSDATE, 'HH PM')            -- 02 ���� 
     , TO_CHAR(SYSDATE, 'MI')               -- 
     , TO_CHAR(SYSDATE, 'SS')               -- 
     , TO_CHAR(SYSDATE, 'SSSSS')            -- 51547 �� ���� �귯�� ��ü ��
     , TO_CHAR(SYSDATE, 'Q')                -- �б�

FROM DUAL;


SELECT TO_CHAR(4), '4'
FROM DUAL;
--==>>  4	4
--���ڴ� �������� 

SELECT '04', TO_NUMBER('04')
FROM DUAL;
--==>>  04	4
--���ڴ� ��������

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))
FROM DUAL;
--==>> 2019
--��¥�� ��������
-- ����Ÿ���� ����Ÿ������ ��ȯ�صξ�� ������ �����ϴ�.



--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY')         --2019              �� ������ �����Ͽ� ����Ÿ������.   
, TO_CHAR(SYSDATE, 'MM')                --03                ��                ����Ÿ������.
, TO_CHAR(SYSDATE, 'DD')                --29                ��                ����Ÿ������.
, EXTRACT(YEAR FROM SYSDATE)            --         2019     �� ������ �����Ͽ� ����Ÿ������. 
, EXTRACT(MONTH FROM SYSDATE)           --            3     ��                ����Ÿ������.
, EXTRACT(DAY FROM SYSDATE)             --           29     ��                ����Ÿ������.
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�


--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ 

SELECT 60000                            --          60000
     , TO_CHAR(60000)                        --60000
     , TO_CHAR(60000, '999,999')             --  60,000
     , TO_CHAR(60000, '$99,999')             -- $60,000
     , LTRIM(TO_CHAR(60000, 'L99,999'))      --          ��60,000 : ����Ÿ���ӿ��� ���������� ����?
--                                            ---------- ��ȭ��ȣ�� ���� �� �ִ� �ڸ� ������ �δ� ��. �׷��� LTRIM()�Լ��� ���� ����.
                                             --��60,000
FROM DUAL;


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>>  Session��(��) ����Ǿ����ϴ�.


--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE"����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60))"1��2�ð�3��4�� ��"
FROM DUAL;
/*
        ����ð�              1��2�ð�3��4�� ��
    2019-03-29 14:47:09	    2019-03-30 16:50:13
*/



--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
-- TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "���� �ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06')"���� ���" 
                    ------------------       ----------
--                  YM = YEAR + MONTH   /  DS = DAY + S�� �ð� ��ü 
--                  �� 1�� 2������ ����     �� 3�� 4�ð�:5��:6���� ���� 
FROM DUAL;


--V------------------------------------------------------------------------------------15:00

--�� CASE ����(���ǹ�, �б⹮)
/*
CASE
WHEN
THEN
ELSE
END
-- �����Ұ�. �� ��� �մϴ�.
-- STATEMENT ����. 
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2=7


SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2�� �����' END "��� Ȯ��"
FROM DUAL;
--==>> 5+2�� �����


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'         -- IF...ELSE ������ �����. 
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '����'
        END "��� Ȯ��"
FROM DUAL;
-- TRUE ����, FALSE ���� Ȯ���ϴ� �� 
--==>> 1+1=2


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=3', 3, '5-3=2', '5-2�� ����') "��� Ȯ��"
FROM DUAL;
-- �Լ� �ȿ� �Ű������� �ִ� ��, �Ű������� ���� ������ ����. ������ �� ���� ����ؾ� �մϴ�. 
--==>>  5-3=2


--�� CASE WHEN THEN ELSE END ����Ȱ��

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
       ------------- 
--     ���� ���, ���� ���� �Ⱥ��� ����    
            ELSE '5�� 2�� �񱳺Ұ�'
        END "��� Ȯ��"
FROM DUAL;
-- ��� ��츦 �� Ȯ���غ��� TRUE �̸� THEN ���� ��ȯ�ϰ� �����ϴ� ��
--==>> 5>2


SELECT CASE WHEN 5<2 OR 3>1 AND 2=2 THEN '��������'
            WHEN 5>2 OR 2=3 THEN '��¸���'         -- T OR F �̸� T
            ELSE '��������'
        END "��� Ȯ��"
FROM DUAL;
--==>> ��������


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>> ���Ǹ���


SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '���Ǹ���'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���󸸼�'
        END "��� Ȯ��"
FROM DUAL;
--==>> ���󸸼�


/*
--�� ����
    TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
    �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
    , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�
    
    ��, ���糪�̴� �ѱ����� ������ ���� ������ �����Ѵ�.
    ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(�⵵)�� 
    �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
    
    �׸��� ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
    �� ����� ���� �޿� ���� 30% ����.
    
    2000�� �̻� �ٹ��� �����
    �� ����� ���� �޿� ���� 50%�� ������ �� �ֵ��� ó���Ѵ�.
    (�¾�鼭 1���� ���) 
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

SELECT SANO"�����ȣ"
     , SANAME"�����"
     , JUBUN"�ֹι�ȣ"
     , CASE WHEN (JUBUN LIKE '______2______' OR JUBUN LIKE '______4______') THEN '����'
            WHEN (JUBUN LIKE '______1______' OR JUBUN LIKE '______3______') THEN '����'
            ELSE '�ǵ��Ұ�'
        END"����"
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))+1)
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))+1)
            ELSE 0
        END"���糪��" 
     , HIREDATE"�Ի���"
/*
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2)))
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2)))
            ELSE 0  -- ���ڷ� ����
        END "����~���Ⳳ������"        
*/    
     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))
            ELSE '����'  -- CONCAT()�̶� ���ڷ� ����
        END"����������"
     , TRUNC(SYSDATE - HIREDATE) "�ٹ��ϼ�"

     , CASE WHEN (SUBSTR(JUBUN, 1, 2)) > 50 THEN TRUNC(TO_DATE(CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('19',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))) - SYSDATE)
            WHEN (SUBSTR(JUBUN, 1, 2)) < 50 THEN TRUNC(TO_DATE(CONCAT((TO_NUMBER(2019) + (TO_NUMBER(60) - TO_NUMBER(2019 - CONCAT('20',SUBSTR(JUBUN, 1, 2))))-1), SUBSTR(HIREDATE, 5))) - SYSDATE)
            ELSE 0  -- CONCAT()�̶� ���ڷ� ����
        END"�����ϼ�"
    
     , SAL"�޿�"
     , CASE WHEN TRUNC(SYSDATE - HIREDATE) >= 1000 AND TRUNC(SYSDATE - HIREDATE) < 2000 THEN TO_NUMBER(SAL * 0.3)
            WHEN TRUNC(SYSDATE - HIREDATE) >= 2000 THEN TO_NUMBER(SAL * 0.5)
            ELSE 0
        END"���ʽ�"
     
FROM TBL_SAWON;



--V--------------------------------------------------------------------------------14:00

-- �Բ� Ǯ���� ���� 
-- TBL_SAWON ���̺� �����ϴ� �������
-- �Ի���(HIREDATE) �÷����� ��, �ϸ� ��ȸ�ϱ�
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM'), TO_CHAR(HIREDATE, 'DD')
FROM TBL_SAWON;


SELECT *
FROM TBL_SAWON;
--     �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿� 
--                               ----   -------
--     (����������, �ٹ��ϼ�, �����ϼ�, ���ʽ�)

/*
SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
     , CASE WHEN �ֹι�ȣ 7��°�ڸ� 1���� 1 �Ǵ� 3 THEN '����'
            WHEN �ֹι�ȣ 7��°�ڸ� 1���� 2 �Ǵ� 4 THEN '����'
            ELSE '����Ȯ�κҰ�'
        END"����"
FROM TBL_SAWON;
*/

SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
        END"����"
FROM TBL_SAWON;

------------------------------------------------------------ �������� Ȯ��

SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
            ELSE '����Ȯ�κҰ�'
        END"����"
/*        
--      ���糪�� = ����⵵ - �¾�⵵ + 1 (1900��� �� / 2000��� ��)
     , CASE WHEN 1900��� ���̶��...
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ�) + 1899)
            WHEN 2000��� ���̶��....
            THEN ����⵵ - (�ֹι�ȣ �� ���ڸ�) + 2000)
            ELSE 0      -- WHEN~THEN ���� ���� Ÿ���̱� ������ '���� Ȯ�� �Ұ�' �̷��� �� �� ����. 
            
*/            
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0      -- WHEN~THEN ���� ���� Ÿ���̱� ������ '���� Ȯ�� �Ұ�' �̷��� �� �� ����. 
            END "���糪��"
FROM TBL_SAWON;



------------------------------------------------------------ ���� ���̱��� Ȯ��

UPDATE TBL_SAWON
SET JUBUN = '0405064234567'
WHERE SANAME = '������';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.





