-- 1. 20190403_01_scott.sql �Դϴ�. 

SELECT USER
FROM DUAL;
--==>> SCOTT

--���� UNION / UNION ALL ����--

--�� �ǽ� ���̺� ���� (TBL_JUMUN)
CREATE TABLE TBL_JUMUN              -- �ֹ� ���̺� ����
( JUNO        NUMBER                -- �ֹ� ��ȣ 
, JECODE      VARCHAR2(30)          -- �ֹ��� ��ǰ �ڵ�
, JUSU        NUMBER                -- �ֹ� ����
, JUDAY       DATE DEFAULT SYSDATE  -- �ֹ� ���� 
);
--==>> Table TBL_JUMUN��(��) �����Ǿ����ϴ�.
--> ������ �ֹ��� �߻����� ���,
--  �ֹ����뿡 ���� �����Ͱ� �Էµ� �� �ִ� ���̺� 

--�� ������ �Է� �� ������ �ֹ��߻� / ����
INSERT INTO TBL_JUMUN VALUES
(1, 'Ȩ����', 20, TO_DATE('2001-11-01 09:00:10', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(2, '������', 10, TO_DATE('2001-11-01 09:23:24', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(3, '����', 30, TO_DATE('2001-11-02 12:00:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(4, '��īĨ', 10, TO_DATE('2001-11-02 15:16:17', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(5, '���Ͻ�', 10, TO_DATE('2001-11-03 10:22:33', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(6, '���Ͻ�', 12, TO_DATE('2001-11-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(7, 'Ȩ����', 50, TO_DATE('2001-11-06 11:11:11', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(8, '��īĨ', 40, TO_DATE('2001-11-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(9, '������', 10, TO_DATE('2001-11-13 09:14:03', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN VALUES
(10, '�ܲʹ��', 20, TO_DATE('2001-11-13 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));

-- 1 �� ��(��) ���ԵǾ����ϴ�. * 10

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;

/*

      JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 Ȩ����                                 20 2001-11-01 09:00:10
         2 ������                                 10 2001-11-01 09:23:24
         3 ����                                   30 2001-11-02 12:00:11
         4 ��īĨ                                 10 2001-11-02 15:16:17
         5 ���Ͻ�                                 10 2001-11-03 10:22:33
         6 ���Ͻ�                                 12 2001-11-04 16:00:00
         7 Ȩ����                                 50 2001-11-06 11:11:11
         8 ��īĨ                                 40 2001-11-10 19:00:00
         9 ������                                 10 2001-11-13 09:14:03
        10 �ܲʹ��                               20 2001-11-13 14:20:00
        
*/

--�� Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.

--�� ������ �߰� �Է� �� 2001����� ���۵� �ֹ��� ����(2019��)���� ��� �߻��ߴٴ� ����.
INSERT INTO TBL_JUMUN VALUES(98765, 'Ȩ����', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98766, '�Ǻ���', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98767, '������Ĩ', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98768, '���Ͻ�', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98769, '���Ͻ�', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98770, '������', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98771, 'Ȩ����', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98772, '���ڼ���', 10, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98773, 'Ȩ����', 30, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_JUMUN VALUES(98774, '����Ĩ', 20, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_JUMUN;

/*
      JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 Ȩ����                                 20 2001-11-01 09:00:10
         2 ������                                 10 2001-11-01 09:23:24
         3 ����                                   30 2001-11-02 12:00:11
         4 ��īĨ                                 10 2001-11-02 15:16:17
         5 ���Ͻ�                                 10 2001-11-03 10:22:33
         6 ���Ͻ�                                 12 2001-11-04 16:00:00
         7 Ȩ����                                 50 2001-11-06 11:11:11
         8 ��īĨ                                 40 2001-11-10 19:00:00
         9 ������                                 10 2001-11-13 09:14:03
        10 �ܲʹ��                               20 2001-11-13 14:20:00
              :                                          :
     98765 Ȩ����                                 10 2019-04-03 09:25:11
     98766 �Ǻ���                                 20 2019-04-03 09:25:51
     98767 ������Ĩ                               30 2019-04-03 09:26:29
     98768 ���Ͻ�                                 10 2019-04-03 09:27:18
     98769 ���Ͻ�                                 20 2019-04-03 09:27:49
     98770 ������                                 20 2019-04-03 09:28:28
     98771 Ȩ����                                 20 2019-04-03 09:29:03
     98772 ���ڼ���                               10 2019-04-03 09:29:51
     98773 Ȩ����                                 30 2019-04-03 09:30:32
     98774 ����Ĩ                                 20 2019-04-03 09:31:16

*/

-- ���� ����(��ǰ)�� �ľ��Ϸ��� ��ǰ ���̺�(��ǰ �ڵ�)�� ������ ���̴�.
--                            ---------------------  �ѹ� �ۼ��Ǹ� �� ������ �ʴ´�. = �����Ͱ� �����Ǵ� ���̺� 
-- �ݸ�, �ֹ����� ���̺��� �ýð��� ���Ѵ�. (�ֹ� ��� �ϴ���, �������� �ʴ´�)      =  �����Ͱ� ��� ���̴� ���̺� 
-- �����Ͱ� ��� ���̴� ���̺��� ��� �ֹ������� �޸𸮿� �� �÷��� �ϴ� ������ �����.
-- �׷� ���� �����Ͱ� ���� ���̺��� �״�� �ΰ�, ���ο� ���̺��� ������ �� ������ ������ �׷����� ���α׷� �� ���� ��.���� �����ؾ���.
-- �׷��� �������� �����͸� �߶� ��� ���̺��� �Ű� �����͸� ���� �����صδ� ������� �������� ���� ���δ�.  


------------------------------------------------------------------------------------------------------------10:00

--�� ���� ���θ� ���...
--   TBL_JUMUN ���̺��� �ʹ� ���ſ��� ��Ȳ.
--   ���ø����̼ǰ��� �������� ���� �ֹ������� �ٸ� ���̺���
--   ����� �� �ֵ��� ����� ���� �Ұ����� ��Ȳ.
--   ������ ��� �����͸� ������� ����� �͵� �Ұ����� ��Ȳ.
--   �� ���������, ������� ������ �ֹ������� ��
--      ���� �߻��� �ֹ������� �����ϰ� �������� �ٸ� ���̺�(TBL_JUMUNBACKUP)�� 
--      ������ �̰��� ������ ��ȹ


DESC TBL_JUMUN;

--�� ���� �ֹ����� ������ �ֹ����� ��ȸ
SELECT * 
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--WHERE EXTRACT(YEAR FROM JUDAY) < 2019;

--�� ���� ��ȸ ����� TBL_JUMUNBACKUP ���̺� ����
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT * 
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
--==>> Table TBL_JUMUNBACKUP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_JUMUNBACKUP;

/*
1	Ȩ����	20	2001-11-01 09:00:10
2	������	10	2001-11-01 09:23:24
3	����	    30	2001-11-02 12:00:11
4	��īĨ	10	2001-11-02 15:16:17
5	���Ͻ�	10	2001-11-03 10:22:33
6	���Ͻ�	12	2001-11-04 16:00:00
7	Ȩ����	50	2001-11-06 11:11:11
8	��īĨ	40	2001-11-10 19:00:00
9	������	10	2001-11-13 09:14:03
10	�ܲʹ��	20	2001-11-13 14:20:00
*/
-->> TBL_JUMUN ���̺��� �����͵� ��
--   ���� �ֹ����� �̿��� �����ʹ� ��� TBL_JUMUNBACKUP�� ����� ��ģ ����.

--�� TBL_JUMUN ���̺��� �����͵� ��
--   ����� ��ģ �����͵� ���� �� ���� �ֹ��� �ƴ� �����͵��� ����

--�� ����
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- WHERE EXTRACT(YEAR FROM JUDAY) < 2019;
--==>> 10�� �� ��(��) �����Ǿ����ϴ�.   �� 98764 ���� ������ ����

-- ���� ��ǰ�߼��� �Ϸ���� ���� ���� �ֹ������͸� �����ϰ� 
-- ������ ��� �ֹ� �����͵��� ������ ��Ȳ�̹Ƿ�
-- ���̺��� ��(���ڵ�)�� ������ �پ��� �ſ� �������� ��Ȳ.

--�� Ȯ��
SELECT * 
FROM TBL_JUMUN;
/*
    98765	Ȩ����	10	2019-04-03 09:25:11
    98766	�Ǻ���	20	2019-04-03 09:25:51
    98767	������Ĩ	30	2019-04-03 09:26:29
    98768	���Ͻ�	10	2019-04-03 09:27:18
    98769	���Ͻ�	20	2019-04-03 09:27:49
    98770	������	20	2019-04-03 09:28:28
    98771	Ȩ����	20	2019-04-03 09:29:03
    98772	���ڼ���	10	2019-04-03 09:29:51
    98773	Ȩ����	30	2019-04-03 09:30:32
    98774	����Ĩ	20	2019-04-03 09:31:16
*/

--�� Ŀ�� 
COMMIT;
--==>> Ŀ�� �Ϸ�.


/*
    �׷���, ���ݱ��� �ֹ����� ������ ���� ������
    ��ǰ�� �� �ֹ������� ��Ÿ����� �� ��Ȳ�� �߻��ߴ�.
    �׷��ٸ�, TBL_JUMUNBACKUP ���̺��� ���ڵ�(��)��
    TBL_JUMUN ���̺��� ���ڵ�(��)�� ���ļ� �ϳ��� ���̺���
    ��ȸ�ϴ� �� ���� ����� Ȯ���� �� �ִ� �������� �����ؾ� �Ѵ�.
    
    �÷��� �÷��� ���踦 �����Ͽ� ���̺��� �����ϰ��� �ϴ� ��� JOIN �� ���������
    ���ڵ�(��)�� ���ڵ�(��)�� �����ϰ��� �ϴ� ��� UNION�� UNION ALL �� ����Ѵ�. 
*/

-- JOIN : ���� �÷����� ������ �����Ͽ� ��ȸ�ϴ� ���� 
-- UNION / UNION ALL : ���� �ೢ�� ���Ʒ��� �����Ͽ� ��ȸ�ϴ� ���� 

SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;


SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;

--> UNION �� UNION ALL �� ���̰� ����.

-- ���̺� ������ �ٲ㺸�Ҵ�. 

SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

/*
--> UNION �� ù��°�÷��� �������� �����ϴ� ����� ���ԵǾ� �ִ�.
  �� UNION�� �׻� ������� ù ��° �÷��� �������� �������� ������ �����Ѵ�. �� UNION ������ �ϱ� ������ �ǵ�ġ �ʰ� ���ϰ� ���� �߻��Ѵ�. 
                                                                                 �ߺ��� ���� �����Ѵ�. 
     UNION ALL �� ���յ� ������� ��ȸ�� ����� ��ȯ�Ѵ� (���� ����) �� UNION ALL (����ڰ� ������ ���)�� ���� ���δ�. 
     �̷� ���� UNION �� ���ϰ� �� ũ��. 
     ����, UNION �� ��������� �ߺ��� ���� ������ ���
     �ߺ��� �����ϰ� 1�� �ุ ��ȸ�� ����� ��ȯ�Ѵ�.
*/

-------------------------------------------------------------------------------------------------------------- 11:00 

--�� ���ݱ��� �ֹ����� ��� �����͸� ����
--   ��ǰ�� �� �ֹ����� ��ȸ�ϴ� �������� �����Ѵ�

/*
----------------------------------------
        ��ǰ�ڵ�        �� �ֹ���    
----------------------------------------
         ....              XX
         ....             XXX
         ....              XX
----------------------------------------
*/

SELECT JECODE "��ǰ�ڵ�", SUM(JUSU) "�� �ֹ���"
FROM
(
    SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
)
GROUP BY JECODE;

-->> UNION ���� ��ȸ�ϸ�, �ߺ����� �����ϱ� ������ UNION �� ���� �ȵǴ� ���̽��̴�. 
-- �� ������ �ذ��ϴ� �������� UNION �� ����ؼ��� �ȵȴ�.
-- �� JECODE �� JUSU �� ��ȸ�ϴ� �������� �ߺ��Ǵ� ���� �����ϴ� ��Ȳ �߻�-!!!

SELECT *
FROM TBL_JUMUN;


--�� INTERSECT / MINUS (�� ������ / ������)

-- TBL_JUMUNBACKUP ���̺��� TBL_JUMUN ���̺����� 
-- ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� �ุ �����ϰ��� �Ѵ�.

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP;
SELECT JECODE, JUSU
FROM TBL_JUMUN;

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
-- ��, �Ʒ� ���ÿ� �����ϴ� ������ ���Ͻ� 10 , Ȩ���� 20 ��ȯ
/*
���Ͻ�	10
Ȩ����	20
*/

------------------------------------------------------------------------------------------------------ 12:00

--�� TBL_JUMUNBACKUP ���̺��� TBL_JUMUN ���̺����� 
--   ��ǰ�ڵ�� �ֹ����� ���� �Ȱ��� ���� ������
--   �ֹ���ȣ, ��ǰ�ڵ�, �ֹ�����, �ֹ����� �׸����� ��ȸ�Ѵ�.


    SELECT "�ֹ���ȣ", "��ǰ�ڵ�", "�ֹ�����", "�ֹ�����"
    FROM TBL_JUMUN J JOIN TBL_JUMUNBACKUP JB
    ON J.JECODE = JB.JECODE
    INTERSECT
    SELECT I.JECODE "��ǰ�ڵ�", I.JUSU "�ֹ�����"
    FROM 
    (
        SELECT JECODE, JUSU
        FROM TBL_JUMUNBACKUP
        INTERSECT
        SELECT JECODE, JUSU 
        FROM TBL_JUMUN
    ) I ;



SELECT J.JUNO "�ֹ���ȣ", J.JECODE "��ǰ�ڵ�", J.JUSU "�ֹ�����", J.JUDAY"�ֹ�����"
    FROM
    (
        SELECT JECODE, JUSU
        FROM TBL_JUMUNBACKUP
        INTERSECT
        SELECT JECODE, JUSU 
        FROM TBL_JUMUN
            
    ) I JOIN TBL_JUMUN J
ON J.JECODE = JB.JECODE AND J.JUSU = JB.JUSU;


-- �Բ� Ǯ���� ����

-- ��� 1.

SELECT T2.JUNO "�ֹ���ȣ", T1.JECODE "��ǰ�ڵ�", T1.JUSU "�ֹ�����", T2.JUDAY "�ֹ�����"
FROM
(  
 -- ���յ� ������(��ȸ�� Į���� �����Ͱ� ����)   SELECT JECODE, JUSU
    FROM TBL_JUMUNBACKUP
    INTERSECT
    SELECT JECODE, JUSU
    FROM TBL_JUMUN
) T1
JOIN 
(
-- ��ȸ�� Į���� ������(���յ� �����Ͱ� ����)
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;

-- ���2
-- �ζ��� ��� ���� ������ �����ϱ� ���ؼ� �����ߴ�. 
SELECT T. *
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
--(1) (��)������� ����ó�� �Ǽ� 4���� ������ �����ϴ� �����ʹ� ��� ��ȸ�ȴ�. 
--WHERE JECODE='Ȩ����' OR JECODE='���Ͻ�'
--  AND JUSU= 20 OR JUSU=10;
--(2)
--WHERE JECODE || JUSU IN ('Ȩ����20', '���Ͻ�10');
--(3)
--WHERE CONCAT(JECODE, JUSU) IN ('Ȩ����20', '���Ͻ�10');
--(4)
WHERE CONCAT(JECODE, JUSU) =ANY ('Ȩ����20', '���Ͻ�10');

--    :
--    :
-- �����ϸ� 

SELECT T. *
FROM 
(
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUNBACKUP
    UNION ALL
    SELECT JUNO, JECODE, JUSU, JUDAY
    FROM TBL_JUMUN
) T
WHERE CONCAT(T.JECODE, T.JUSU) =ANY (SELECT CONCAT(JECODE, JUSU)
                                     FROM TBL_JUMUNBACKUP
                                     INTERSECT
                                     SELECT CONCAT(JECODE, JUSU)
                                     FROM TBL_JUMUN);
 

-- �����յ� ������ 
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
-->> ('���Ͻ�', '10', 'Ȩ����', '20')
/*
���Ͻ�10
Ȩ����20
*/
-->> CONCAT �� ���� ('���Ͻ�10', 'Ȩ����20') ���� ����� ��. 


--�� MIUNS : ������

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT                -- �� ���̺����� ��ġ�� �κ�
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
���Ͻ�	10
Ȩ����	20
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS                   -- �� ���̺����� ��ġ�� �κ��� ���� ������ �κ�
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
������	10
�ܲʹ��	20
����  	30
���Ͻ�	12
��īĨ	10
��īĨ	40
Ȩ����	50
*/

/*
    A = {10, 20, 30, 40, 50}
    B = {10, 20, 30}
    
    A - B = {40, 50}
*/

--------- ������ ������, �̷��� ���̴� ���� �����ϴ�.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

-- 1992 �ڵ� �� NATURAL JOIN �� �ִ�.
-- ������ �� ���̺� ���̿� NATURAL JOIN �� ���ָ� �ȴ�.
-- ����Ŭ�� ã�Ƽ� �˾Ƽ� ����. 
-- �� ������ �ۼ����� ����, �����ϳ� �����ս��鿡�� ������ ��������. (����Ŭ�� �� ���̺� �� ���� ������)
--(��) �̷��Դ� �Ƚ��
SELECT DEPTNO,  DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;

--(��) �̷��Դ� �Ƚ��
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING(DEPTNO);

------------------------------------------------------ JOIN ��.
-- 1) PARSING ���� 6����
-- 2) JOIN �� ���� ���� �ɰſ���
-- 3) ����ȭ, ������ (DBA���� �߿��ϴ�) �� ����� �ľ����� ���ϸ� ������Ʈ ����
--          < ��ȹ >            < �ڵ� >
--  �����м�,�䱸����, ��ȹ  /               / 
--  �߿䵵:         DB����    >    �ڵ��ۼ�
