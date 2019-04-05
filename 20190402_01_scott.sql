--���� having ����--

--�� EMP ���̺��� �μ���ȣ�� 20, 30�� �μ��� ������� 
-- �μ��� �� �޿��� 10000 ���� ���� ��츸 �μ��� �� �޿��� ��ȸ�Ѵ�.

SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL) < 10000          
GROUP BY DEPTNO;


SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
  AND SUM(SAL) < 10000          -- 'group function is not allowed here'
GROUP BY DEPTNO;
--==>> �����߻� 
/*
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
*Cause:    
*Action:
9��, 5������ ���� �߻�
*/

/*
WHERE�� �� �� ���� �׷��Լ����� HAVING ���� ����Ѵ�. 
�̷� ��� ����� �� �ִ� �� HAVING ���� �� 
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP 
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
--==>> 30	9400


SELECT DEPTNO, SUM(SAL)
FROM EMP 
GROUP BY DEPTNO
HAVING DEPTNO IN (20, 30)       -- �Ϲ� ������ WHERE �������� ���°� �� ����. 
   AND SUM(SAL) < 10000;
   
/*
    30	9400
*/

--------------------------------------------------------------------------------
--���� ��ø �׷��ռ� / �м��Լ� ����--

-- �׷� �Լ� 2 LEVEL���� ��ø�ؼ� ����� �� �ִ�.
-- �̸����� MSSQL�� �Ұ��� �ϴ�
SELECT MAX(SUM(SAL))        -- �̰��� 2���� ��ø�ؼ� �� ��. 
FROM EMP
GROUP BY DEPTNO;
--==>> 10875

-- RANK()
-- DENSE_RANK() 
-- ORACLE 9i���� ����, MSSQL 2005���� ���� 

-- ����Ŭ 11g ����ϰ� ������, ���������� ���������� ����ϰ� ���� ���̴�.
-- ���� ���׷��̵带 �ٷ� �����ϴ� ȸ��� �幰��. �ƴ�, ���������� ��ƴ�.
-- �׷� ���� ������ ����Ŭ�� ����� ��� ����, ������ ��� �ұ�?

-- ���� ���������� RANK() �� DENSE_RANK() �� ����� �� ���� ������
-- �̸� ��ü�Ͽ� ������ ������ �� �ִ� ����� �˰� �־�� �Ѵ�.

-- ���� ���, �޿��� ������ ���ϰ��� �Ѵٸ�,
-- �ش� ����� �޿����� �� ū ���� �� ������ Ȯ���� �� 
-- Ȯ���� ���ڿ� +1 �� �߰� �������ָ�, �װ��� �� ����� �ȴ�.

-- ���̽� ����� �޿� �����?
SELECT ENAME, SAL
FROM EMP;

SELECT COUNT(*) 
FROM EMP
WHERE SAL > 800;
--==>> 13 + 1 = 14 �� SMITH �� �޿����
-- �޿��� 800���� ���� ����� 13���̴�. ���⿡ 1�� �����ָ�?

SELECT COUNT(*) + 1
FROM EMP
WHERE SAL > 1600;
--==>> 7 �� ALLEN �� �޿����   


/*
����� QUERY ������ �˰� �־�� �Ѵ�.

�� ���� ��� ���� (��� ���� ����)

    ���� ������ �ִ� ���̺��� �÷���
    ���� ������ ������(WHERE��, HAVING��)�� ���Ǵ� ���
    �츮�� �� �������� ���� ��� ������� �θ���. 

*/

--1) 
SELECT ENAME "�����", SAL "�޿�", 1 "�޿����"
FROM EMP;

--2)
SELECT ENAME "�����", SAL "�޿�", (1)"�޿����"
FROM EMP;

--3)
SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 -- ���� ������ E2�̶� ���̸�,
        WHERE SAL > 800)"�޿����"
FROM EMP E1; -- ���̺� ��Ī E1 �̶� ���̰�, 

--4)
SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL)"�޿����"
FROM EMP E1;
/*
    SMITH	800	    14
    ALLEN	1600	7
    WARD	    1250    	10
    JONES	2975    	4
    MARTIN	1250	    10
    BLAKE	2850	    5
    CLARK	2450	    6
    SCOTT	3000	2
    KING    	5000	1
    TURNER	1500	8
    ADAMS	1100	12
    JAMES	950	    13
    FORD	    3000	2
    MILLER	1300	9
*/

--5)
SELECT ENAME "�����", SAL "�޿�"
     , (SELECT COUNT(*) + 1
        FROM EMP E2 
        WHERE E2.SAL > E1.SAL)"�޿����"
FROM EMP E1
ORDER BY 3;
/*
    KING    	5000	1
    FORD	    3000	2
    SCOTT	3000	2
    JONES	2975	    4
    BLAKE	2850	    5
    CLARK	2450	    6
    ALLEN	1600	7
    TURNER	1500	8
    MILLER	1300	9
    WARD	    1250    10
    MARTIN	1250	    10
    ADAMS	1100	12
    JAMES	950	    13
    SMITH	800	    14
*/


--�ǽ� ����
--�� EMP ���̺��� ������� 
-- �����, �޿�, �μ���ȣ, �μ����޿����, ��ü�޿���� �׸��� ��ȸ�Ѵ�.
-- ��, RANK() �Լ��� ������� �ʰ�, ��� ���� ������ Ȱ���� �� �ֵ��� �Ѵ�.

DESC EMP;

SELECT ENAME "�����", SAL "�޿�", DEPTNO "�μ���ȣ"
     , (SELECT COUNT (*) + 1
        FROM EMP E2
        WHERE E1.DEPTNO = E2.DEPTNO AND E1.SAL > E2.SAL)"�μ����޿����"
     , (SELECT COUNT (*) + 1
        FROM EMP E2
        WHERE E1.SAL > E2.SAL)"��ü�޿����"
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL;
/*
    MILLER	1300	10	1	6
    CLARK	2450	    10	2	9
    KING	    5000	10	3	14
    SMITH	800	    20	1	1
    ADAMS	1100	20	2	3
    JONES	2975	    20	3	11
    SCOTT	3000	20	4	12
    FORD	    3000	20	4	12
    JAMES	950	    30	1	2
    MARTIN	1250	    30	2	4
    WARD	    1250	    30	2	4
    TURNER	1500	30	4	7
    ALLEN	1600	30	5	8
    BLAKE	2850	    30	6	10
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� EMP ���̺��� ������� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
-------------------------------------------------------------
 �����    �μ���ȣ    �Ի���     �޿�      �μ����Ի纰�޿�����
-------------------------------------------------------------
 CLARK	    10	    1981-06-09	 2450       
 KING	    10	    1981-11-17	 5000
 MILLER	    10	    1982-01-23	 1300
 SMITH	    20	    1980-12-17	 800
 JONES	    20	    1981-04-02	 2975
 FORD	    20	    1981-12-03	 3000
 SCOTT	    20	    1987-07-13	 3000
 ADAMS	    20	    1987-07-13	 1100
 ALLEN	    30	    1981-02-20	 1600
 WARD	    30	    1981-02-22	 1250
 BLAKE	    30	    1981-05-01	 2850
 TURNER	    30	    1981-09-08	 1500
 MARTIN	    30	    1981-09-28	 1250
 JAMES	    30	    1981-12-03	 950
*/

-- ���� Ǯ���� ���� 
SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (SELECT SUM(E2.SAL)     
        FROM EMP E2
        WHERE E1.DEPTNO = E2.DEPTNO AND E1.HIREDATE >= E2.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY DEPTNO, HIREDATE;

-------------------------------------------------------------------------------------------- 10:00

-- �Բ� Ǯ���� ���� 
SELECT ENAME "�����", DEPTNO "�μ���ȣ", HIREDATE "�Ի���", SAL "�޿�"
     , (SELECT SUM(E2.SAL)     --�޿��� �հ踦 ���ϱ� ���� SUM()
        FROM EMP E2
        WHERE E2.DEPTNO = E1.DEPTNO 
          AND E2.HIREDATE <= E1.HIREDATE)"�μ����Ի纰�޿�����"
FROM EMP E1
ORDER BY 2, 3;
/*
 CLARK	10	1981-06-09	2450	    2450
 KING	10	1981-11-17	5000	7450
 MILLER	10	1982-01-23	1300	8750
 SMITH	20	1980-12-17	800	    800
 JONES	20	1981-04-02	2975	    3775
 FORD	20	1981-12-03	3000	6775
 SCOTT	20	1987-07-13	3000	10875
 ADAMS	20	1987-07-13	1100	10875
 ALLEN	30	1981-02-20	1600	1600
 WARD	30	1981-02-22	1250	    2850
 BLAKE	30	1981-05-01	2850	    5700
 TURNER	30	1981-09-08	1500	7200
 MARTIN	30	1981-09-28	1250    	8450
 JAMES	30	1981-12-03	950	    9400
*/

--�� TBL_EMP ���̺��� ������� �Ի��� ����� ���� ���� ������ ����
--  �Ի����� �ο����� ��ȸ�� �� �ִ� �������� �����Ѵ�.
/*
    -------------------------------
        �Ի���        �ο��� 
    -------------------------------
        2019-04           5
    -------------------------------
*/

-- ���� Ǯ���� ����
SELECT MAX(T.�Ի���) "�Ի���", MAX(T.�ο���) 
FROM
(
    SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
         , COUNT(*) "�ο���"
    FROM TBL_EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
) T;

--------------------------------------------------------------------------------------------- 11:00

-- �Բ� Ǯ���� ����
--1) 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
, COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
1981-05	1
1981-12	2
1982-01	1
1981-09	2
2019-04	5
1981-02	2
1981-11	1
1980-12	1
1981-04	1
1987-07	2
1981-06	1
*/

--2) 
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
, COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5;
--==>> 2019-04	5

--3) 
SELECT COUNT(*)
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
    1
    2
    1
    2
    5
    2
    1
    1
    1
    2
    1
*/
--4)
SELECT MAX(COUNT(*))
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
--==>> 5


--5)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
, COUNT(*) "�ο���"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM TBL_EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
--==>> 2019-04	5

--6)
SELECT TO_CHAR(HIREDATE, 'YYYY-MM')"�Ի���"
, COUNT(*) "�ο���"
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM EMP
                   GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM'));
/*
    1981-12	2
    1981-09	2
    1981-02	2
    1987-07	2
*/

---------------------------------------------------------------------------------------------

--���� ROW_NUMBER() ����--

SELECT ROW_NUMBER() OVER(ORDER BY SAL DESC) "�׽�Ʈ"
     , ENAME "�����", SAL "�޿�", HIREDATE "�Ի���"
FROM EMP;
/*
�׽�Ʈ  �����   �޿�     �Ի��� 
 1	    KING	    5000	1981-11-17
 2	    FORD    	3000	1981-12-03
 3	    SCOTT	3000	1987-07-13
 4	    JONES	2975	    1981-04-02
 5	    BLAKE	2850	    1981-05-01
 6	    CLARK	2450	    1981-06-09
 7	    ALLEN	1600	1981-02-20
 8	    TURNER	1500	1981-09-08
 9	    MILLER	1300	1982-01-23
 10	    WARD	    1250	    1981-02-22
 11	    MARTIN	1250	    1981-09-28
 12	    ADAMS	1100	1987-07-13
 13	    JAMES	950	    1981-12-03
 14	    SMITH	800	    1980-12-17
*/

/*
    �Խ����� �Խù� ��ȣ�� SEQUENCE �� INDENTIFY �� ����ϰ� �Ǹ�
                        ------- ex.������ ��ȣǥ 
        �Ʒ� ����ó�� �������� �������� �� ��, ������ ���� ���� ������ ó���� ����������. 
    �Խù��� �������� ���, ������ �Խù��� �ڸ��� ���� ��ȣ�� ����
    �Խù��� ��ϵ� ��Ȳ�� �߻��ϰ� �ȴ�.
    �̴� ���� ���鿡����... �̰���... �ٶ������� �ʴ� ��Ȳ�� �� �ֱ� ������
    ROW_NUMBER() �� ����� ����غ� �� �ִ�.
    ������ �������� ����� ������ SEQUENCE �� INDENTIFY �� ���������
    �ܼ��� �Խù��� ���ȭ�Ͽ� ����ڿ��� ����Ʈ �������� ������ ������ 
    ������� �ʴ� ���� ����. 
    
    �ش��ϴ� �÷��� ������ ���� �־�� �۾��ϴµ� ���ϴ�. 
*/

--�� ����
CREATE TABLE TBL_AAA
( NO    NUMBER
, NAME  VARCHAR2(30)
, GRADE CHAR(10)
);
--==>> Table TBL_AAA��(��) �����Ǿ����ϴ�.

INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(1, '������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(2, '�̱��', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(3, '������', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(4, '��ȫ��', 'C');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(5, '��ȫ��', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(6, '�̱��', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES(7, '�̱��', 'A');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_AAA;

--(��)
UPDATE TBL_AAA
SET GRADE='C'
WHERE NAME = '�̱��';

--(��)
UPDATE TBL_AAA
SET GRADE='C'
WHERE GRADE = 'A';

DELETE
FROM TBL_AAA
WHERE NO=6;
-- Ư�� ���� �����ؾ� ��Ȯ�� ó���� �����ϴ�. 

--�� SEQUENCE (������ : �ֹ���ȣ)
--   �� ������ �ǹ� : 1.(�Ϸ���) �������� ��ǵ�   2.(���, �ൿ ����) ���� 
--   �������� �����Ͽ� ����ϸ�, �����Ͱ� ��ĥ ���� ����. 

CREATE SEQUENCE SEQ_BOARD       -- ������ ���� �⺻ ����(MSSQL �� IDENTIFY �� ������ ����)
START WITH 1                    -- ���۰�
INCREMENT BY 1                  -- ������
NOMAXVALUE                      -- �ִ밪 ���� ����
NOCACHE;                        -- ĳ�� ��� ����(����) �� �ǵ帱 ������ 1�� �����ϰڴ�. 
                                -- ĳ�ø� Ȯ���صΰ� �̸� ��ȣǥ�� �����صδ� ��
                                -- ĳ�� ��� �Ѵٸ� �� �̸� ��ȣǥ�� 10�� Ȯ���صΰ� �����ִ� ���� (Ʈ������ ���� ��� ����Ѵ�) 
                                -- ADMIN ��Ʈ�� �ǵ帮�� �����̻� ĳ�ñ��� �Ű澲�� �ʾƵ� �˴ϴ�. 
--==>> Sequence SEQ_BOARD��(��) �����Ǿ����ϴ�.



--�� ���̺� ����(TBL_BOARD)
CREATE TABLE TBL_BOARD               -- TBL_BORAD �̸��� ���̺���� �� �Խ���
( NO            NUMBER               -- �Խù� ��ȣ          ��
, TITLE         VARCHAR2(50)         -- �Խù� ����          ��
, CONTENTS      VARCHAR2(2000)       -- �Խù� ����          ��
, NAME          VARCHAR2(20)         -- �Խù� �ۼ���        �� (��� �����ߴ��Ŀ� ���� �ٸ���)
, PW            VARCHAR2(20)         -- �Խù� �н�����      ��
, CREATED       DATE DEFAULT SYSDATE -- �Խù� �ۼ���        ��
);
--==>> Table TBL_BOARD��(��) �����Ǿ����ϴ�.
-- ����ڰ� �Խ��ǿ� �Խù��� �ۼ��ϸ�, ���ø����̼��� �˾Ƽ� ����ڰ� �ۼ��� �Խù��� ���μ����� ���� �����Ѵ�.

ALTER TABLE TBL_BOARD ADD COLUMN TILTE VARCHAR2(50);

--�� ������ �Է� �� �Խ��ǿ� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ѽ�~1��', '���� 1�� ������', '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�ǰ�����', '�ٵ� �ǰ� ì��ô�', '������', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '���� �� ����....', '�ֺ���', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�̼����� ����?', '������', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ϰ� ������', '�̼����� ����?', '������', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ֽ��ϴ�', '������ �ϸ� �ȵǳ���', '������', 'JAVA006$', DEFAULT);

INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '�����ֽ��ϴ�', '�������� �ٽ� �����ҰԿ�', '�ѽ¿�', 'JAVA006$', DEFAULT);

--------------------------------------------------------------------------------------------------------12:00

--�� Ȯ��
SELECT *
FROM TBL_BOARD;


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=4;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.


--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '������', '�� �׳� �߷���' , '������', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOARD;


--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
/*
    1	�ѽ�~1��	���� 1�� ������	������	JAVA006$	2019-04-02
    3	������	���� �� ����....	�ֺ���	JAVA006$	2019-04-02
    5	�����ϰ� ������	�̼����� ����?	������	JAVA006$	2019-04-02
    6	�����ֽ��ϴ�	������ �ϸ� �ȵǳ���	������	JAVA006$	2019-04-02
    7	�����ֽ��ϴ�	�������� �ٽ� �����ҰԿ�	�ѽ¿�	JAVA006$	2019-04-02
    8	������	�� �׳� �߷���	������	JAVA006$	2019-04-02
*/


--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=8;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
/*
    1	�ѽ�~1��	���� 1�� ������	������	JAVA006$	2019-04-02
    3	������	���� �� ����....	�ֺ���	JAVA006$	2019-04-02
    5	�����ϰ� ������	�̼����� ����?	������	JAVA006$	2019-04-02
    6	�����ֽ��ϴ�	������ �ϸ� �ȵǳ���	������	JAVA006$	2019-04-02
    7	�����ֽ��ϴ�	�������� �ٽ� �����ҰԿ�	�ѽ¿�	JAVA006$	2019-04-02
*/

--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '���¿�', '�� ������ �ֽ��ϴ�.', '�̿���', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

COMMIT;

SELECT *
FROM TBL_BOARD;
/*
    1	�ѽ�~1��	        ���� 1�� ������	        ������	JAVA006$	2019-04-02
    3	������	        ���� �� ����....	        �ֺ���	JAVA006$	2019-04-02
    5	�����ϰ� ������	�̼����� ����?	        ������	JAVA006$	2019-04-02
    6	�����ֽ��ϴ�	    ������ �ϸ� �ȵǳ���	    ������	JAVA006$	2019-04-02
    7	�����ֽ��ϴ�	    �������� �ٽ� �����ҰԿ�	�ѽ¿�	JAVA006$	2019-04-02
    9	���¿�	        �� ������ �ֽ��ϴ�.	    �̿���	JAVA006$	2019-04-02
*/

-- �ش� �Խ����� ������ ��ȣ�� ���� �����Ű�� �ʽ��ϴ�. 
-- ����ǵ��� �������� �ۼ��ϸ� �ȵ˴ϴ�. (���ȼ��� �ǰ�)

SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
    ,  TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
-- �Ϲ����� �Խ����� ���·� ��ȸ��. 
�Խù��� ������ �۹�ȣ �������� ������
/*
    6	���¿�	        �̿���	2019-04-02
    5	�����ֽ��ϴ�	    �ѽ¿�	2019-04-02
    4	�����ֽ��ϴ�	    ������	2019-04-02
    3	�����ϰ� ������	������	2019-04-02
    2	������	        �ֺ���	2019-04-02
    1	�ѽ�~1��	        ������	2019-04-02
*/


--�� �Խù� �ۼ�
INSERT INTO TBL_BOARD VALUES
(SEQ_BOARD.NEXTVAL, '����', '�� ���� �ȵ���', '�輱��', 'JAVA006$', DEFAULT);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

/*
1	�ѽ�~1��	���� 1�� ������	������	JAVA006$	2019-04-02
3	������	���� �� ����....	�ֺ���	JAVA006$	2019-04-02
5	�����ϰ� ������	�̼����� ����?	������	JAVA006$	2019-04-02
6	�����ֽ��ϴ�	������ �ϸ� �ȵǳ���	������	JAVA006$	2019-04-02
7	�����ֽ��ϴ�	�������� �ٽ� �����ҰԿ�	�ѽ¿�	JAVA006$	2019-04-02
9	���¿�	�� ������ �ֽ��ϴ�.	�̿���	JAVA006$	2019-04-02
10	����	�� ���� �ȵ���	�輱��	JAVA006$	2019-04-02
*/
SELECT *
FROM TBL_BOARD;

--�� �Խù� ����
DELETE
FROM TBL_BOARD
WHERE NO=7;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.
/*
    1	�ѽ�~1��	���� 1�� ������	������	JAVA006$	2019-04-02
    3	������	���� �� ����....	�ֺ���	JAVA006$	2019-04-02
    5	�����ϰ� ������	�̼����� ����?	������	JAVA006$	2019-04-02
    6	�����ֽ��ϴ�	������ �ϸ� �ȵǳ���	������	JAVA006$	2019-04-02
    9	���¿�	�� ������ �ֽ��ϴ�.	�̿���	JAVA006$	2019-04-02
    10	����	�� ���� �ȵ���	�輱��	JAVA006$	2019-04-02
*/

COMMIT;


SELECT ROW_NUMBER() OVER(ORDER BY CREATED) "�۹�ȣ"
    ,  TITLE "����", NAME "�ۼ���", CREATED "�ۼ���"
FROM TBL_BOARD
ORDER BY 4 DESC;
/*
    6	����	�輱��	2019-04-02
    5	���¿�	�̿���	2019-04-02
    4	�����ֽ��ϴ�	������	2019-04-02
    3	�����ϰ� ������	������	2019-04-02
    2	������	�ֺ���	2019-04-02
    1	�ѽ�~1��	������	2019-04-02
*/


------------------------------------------------------------------------------------------------------------------------

--���� JOIN(����) ����--

--1. SQL 1992 CODE
SELECT *
FROM EMP, DEPT;
--==>> ���п��� ���ϴ� ��ī��Ʈ ��(Catersian Product)
-- �� ���̺��� ��ģ(������) ��� ����� �� 
-- ��ȸ�� ������� �ǹ̸� ã�� �� ������, ��� ��츦 �� �����ش�. 


--�� Equi join : ���� ��Ȯ�� ��ġ�ϴ� �����͵鳢�� �����Ű�� ����
SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT *
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

-- Equi Join �� ��(+)�� �� Ȱ���� ���� ���


-- ���մ���� ���� ���, ��ȸ���� �ʴ´� (��)
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--> �� 14���� �����Ͱ� ���յǾ� ��ȸ�� ��Ȳ
-- ��, �μ���ȣ�� ���� ���� �����(S)�� ��� ����~!!!
/*
    7369	SMITH	CLERK	7902	1980-12-17	800		20	20	RESEARCH	DALLAS
    7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30	30	SALES	CHICAGO
    7521    	WARD	SALESMAN	7698	1981-02-22	1250	500	30	30	SALES	CHICAGO
    7566	JONES	MANAGER	7839	1981-04-02	2975		20	20	RESEARCH	DALLAS
    7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30	30	SALES	CHICAGO
    7698	BLAKE	MANAGER	7839	1981-05-01	2850		30	30	SALES	CHICAGO
    7782	    CLARK	MANAGER	7839	1981-06-09	2450		10	10	ACCOUNTING	NEW YORK
    7788	SCOTT	ANALYST	7566	1987-07-13	3000		20	20	RESEARCH	DALLAS
    7839	KING	PRESIDENT		1981-11-17	5000		10	10	ACCOUNTING	NEW YORK
    7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	30	30	SALES	CHICAGO
    7876	ADAMS	CLERK	7788	1987-07-13	1100		20	20	RESEARCH	DALLAS
    7900	JAMES	CLERK	7698	1981-12-03	950		30	30	SALES	CHICAGO
    7902	    FORD	ANALYST	7566	1981-12-03	3000		20	20	RESEARCH	DALLAS
    7934	MILLER	CLERK	7782	1982-01-23	1300		10	10	ACCOUNTING	NEW YORK
*/

SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

-- (+) ��ȣ�� ���մ���� ���� ��쵵 ��ȸ�� ���Խ�Ų��. 


SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO = D.DEPTNO(+);
--   --------- �޸𸮿� �� �ø� ��, ���� ���Ѵ�. (+) ��ȣ�� ������ ���ΰ�.
--==>> �� 19���� �����Ͱ� ���յǾ� ��ȸ��
-- ��, �μ���ȣ�� ���� ���� ����鵵 ��� ��ȸ�� ��Ȳ


SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
--==>> �� 16���� �����Ͱ� ���յǾ� ��ȸ��
-- ��, �μ��� �Ҽӵ� ����� �ƹ��� ���� �μ��� ��� ��ȸ�� ��Ȳ

--�� (+)�� ���� �� ���̺��� �����͸� ��� �޸𸮿� ������ �� 
--   (+)�� �ִ� �� ���̺��� �����͸� �ϳ��ϳ� Ȯ���Ͽ� ���ս�Ű�� ���·� 
--   JOIN�� �̷������. 

--(��) 
SELECT *
FROM TBL_EMP E, TBL_DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO;
-- ���� ���� ������ �̷��� ������ JOIN ������ �������� �ʴ´�. 



--�� Non Equi join : ���ڰ� ��Ȯ�ϱ� ��ġ���� ������, ���� �ȿ� ������ �����͵鳢�� �����Ű�� ����
SELECT *
FROM SALGRADE;
SELECT *
FROM EMP;

SELECT *
FROM EMP E, SALGRADE S 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


--2. SQL 1999 CODE �� ���� ���� ��� �׸��� ��JOIN�� Ű���� ����, �� JOIN ���� 
--                    ���� ������ ��WHERE�� ��� ��ON �� ���
-- CROSS JOIN
SELECT *
FROM EMP CROSS JOIN DEPT;

-- INNER JOIN
SELECT *
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;

SELECT *
FROM EMP E INNER JOIN SALGRADE S
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--�� INNER JOIN �� INNER �� ���� ����
SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO= D.DEPTNO;


SELECT *
FROM EMP E JOIN SALGRADE S 
ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- OUTER JOIN
SELECT *
FROM TBL_EMP E LEFT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO;
-- ȥ���� �ʷ��� �� ������ ����, (+)�� �پ� �ִ°� �ƴ϶�. ���ΰ� ������ �������ش�. 

--�� ������ ������ �� ���̺�(�� LEFT)�� �����͸� ��� �޸𸮿� ������ ��
--   ������ �������� ���� �� ���̺���� �����͸� ���� Ȯ���Ͽ� ���ս�Ű�� ���·� 
--  JOING�� �̷������.

SELECT *
FROM TBL_EMP E RIGHT OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO; 

SELECT *
FROM TBL_EMP E FULL OUTER JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO; 
--�μ� ��ȣ�� ���� ���� ���ڵ���� ���� ��ȸ��

--�� OUTER JOIN ���� OUTER �� ���� ����
-- �Ʒ� �� ���� ��� OUTER JOIN �̴�. 
SELECT *
FROM TBL_EMP E LEFT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E RIGHT JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

SELECT *
FROM TBL_EMP E FULL JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);


-- �Ʒ��� ���� ���⼺�� ������ INNER JOIN 
SELECT *
FROM TBL_EMP E JOIN TBL_DEPT D
ON E.DEPTNO = D.DEPTNO(+);

------------------------------------------------------

SELECT *
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
-- �� ������� ������ CLERK �� ����鸸 ��ȸ

SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
AND JOB = 'CLERK';
--�̷��� �������� �����ص� ��ȸ�ϴ� ���� ������ ����.


SELECT *
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'CLERK';
-- ������, �̿� ���� �����Ͽ� ��ȸ�� �� �ֵ��� �����Ѵ�.
-- ������ ������� ���� WHERE�� ����. 
------------------------------------------------------

--�� EMP ���̺�� DEPT ���̺��� 
--   ������ MAMAGER �� CLERK �� ����鸸 
--   �μ���ȣ, �μ���, �����, ������, �޿� �׸��� ��ȸ�Ѵ�. 
--   -------  ------  ------  -----  -----
--    DEPTNO   DNAME   ENAME   JOB    SAL
--   -------  ------  ------  -----  -----
--    E, D      D        E      E      E
--(1) �� ���̺��� ����� �÷��� ã�ƾ� �Ѵ�. 
--(2) ����Ŭ�� ����Ǵ� �� ���̺��� ����� �÷��� �� ã�ư���.
--(3) �׷��� ������ �Ҽ� ���̺��� ������־�� �Ѵ�. 
--(4) �ߺ��� �÷���...? 
--(5) ����Ŭ����...MSSQL������... �ƴ� ������ �����ͺ��̽����� �ٶ����� ����� 1�� �� �̴�.
-- �� �÷��� �տ� �Ҽ� ���̺��� ����� ������? ����Ŭ���� JOIN�� �� ���̺� ��θ� Ȯ���ϱ� ������ 
-- �����ս� ����� ���ؼ� �Դϴ�. 

--(��)
SELECT DEPTNO, DNAME, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>> �����߻�
/*
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
*Cause:    
*Action:
823��, 8������ ���� �߻�
*/
--> �� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� 
-- �������(����� ���) �Ѵ�. 

--(��)
SELECT DNAME, ENAME, JOB, SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
--==>>
/*
�� ���̺� �� �ߺ��Ǵ� �÷��� �������� �ʴ� ��ȸ ������
���� �߻����� �ʴ´�.
  DNAME     ENAME     JOB       SAL
------------------------------------
 RESEARCH	SMITH	CLERK	    800
 SALES	    ALLEN	SALESMAN	    1600
 SALES	    WARD	    SALESMAN	    1250
 RESEARCH	JONES	MANAGER	    2975
 SALES	    MARTIN	SALESMAN    	1250
 SALES	    BLAKE	MANAGER	    2850
 ACCOUNTING	CLARK	MANAGER	    2450
 RESEARCH	SCOTT	ANALYST	    3000
 ACCOUNTING	KING	    PRESIDENT	5000
 SALES	    TURNER	SALESMAN    	1500
 RESEARCH	ADAMS	CLERK	    1100
 SALES	    JAMES	CLERK	    950
 RESEARCH	FORD    	ANALYST	    3000
 ACCOUNTING	MILLER	CLERK	    1300
*/

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL 
-- SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;
/*
�� ���̺� �� �ߺ��� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
�μ�(DEPT), ���(EMP) �� � ���̺��� �����ص� 
������ ���࿡ ���� ��� ��ȯ�� ������ ����.

�� ������,
�� ���̺� �� �ߺ��Ǵ� �÷��� ���� �Ҽ� ���̺��� ����ϴ� ���
�θ� ���̺��� �÷��� ������ �� �ֵ��� �ؾ� �Ѵ�.
 DEPTNO DNAME       ENAME       JOB     SAL
----------------------------------------------
 20	    RESEARCH	    SMITH	    CLERK	    800
 30	    SALES	    ALLEN	    SALESMAN	    1600
 30	    SALES	    WARD	        SALESMAN    	1250
 20	    RESEARCH	    JONES	    MANAGER	    2975
 30	    SALES	    MARTIN	    SALESMAN	    1250
 30	    SALES	    BLAKE	    MANAGER	    2850
 10	    ACCOUNTING	CLARK	    MANAGER	    2450
 20	    RESEARCH	    SCOTT	    ANALYST	    3000
 10	    ACCOUNTING	KING	        PRESIDENT	5000
 30	    SALES	    TURNER	    SALESMAN	    1500
 20	    RESEARCH	    ADAMS	    CLERK	    1100
 30	    SALES	    JAMES	    CLERK	    950
 20	    RESEARCH	    FORD	        ANALYST	    3000
 10	    ACCOUNTING	MILLER	    CLERK	    1300
*/


SELECT *
FROM DEPT; -- �θ� ���̺�

SELECT *
FROM EMP;  -- �ڽ� ���̺�

--�� �θ� �ڽ� ���̺� ���踦 ��Ȯ�� ������ �� �ֵ��� �Ѵ�.

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
ON E.DEPTNO = D.DEPTNO;
--> �� ���̺� �� �ߺ��� �÷��� �ƴϴ���,
-- �Ҽ� ���̺��� ����� �� �ֵ��� �����Ѵ�. 


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- �θ� �÷��� ���
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> �� 14�� ��ȸ��
/*
DEPTNO DNAME    ENAME   JOB     SAL 
-------------------------------------
10	ACCOUNTING	MILLER	CLERK	1300
10	ACCOUNTING	KING	PRESIDENT	5000
10	ACCOUNTING	CLARK	MANAGER	2450
20	RESEARCH	FORD	ANALYST	3000
20	RESEARCH	ADAMS	CLERK	1100
20	RESEARCH	SCOTT	ANALYST	3000
20	RESEARCH	JONES	MANAGER	2975
20	RESEARCH	SMITH	CLERK	800
30	SALES	JAMES	CLERK	950
30	SALES	TURNER	SALESMAN	1500
30	SALES	BLAKE	MANAGER	2850
30	SALES	MARTIN	SALESMAN	1250
30	SALES	WARD	SALESMAN	1250
30	SALES	ALLEN	SALESMAN	1600
*/

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- �ڽ� �÷��� ���
FROM EMP E LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;


------------

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- �θ� �÷��� ���
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 15�� ��ȸ

SELECT E.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
--    -- �ڽ� �÷��� ���
FROM EMP E RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 15�� ��ȸ
/*
�μ���ȣ �� �ȳ���.
DEPTNO DNAME ENAME JOB SAL
--------------------------------
20	RESEARCH	SMITH	CLERK	800
30	SALES	ALLEN	SALESMAN	1600
30	SALES	WARD	SALESMAN	1250
20	RESEARCH	JONES	MANAGER	2975
30	SALES	MARTIN	SALESMAN	1250
30	SALES	BLAKE	MANAGER	2850
10	ACCOUNTING	CLARK	MANAGER	2450
20	RESEARCH	SCOTT	ANALYST	3000
10	ACCOUNTING	KING	PRESIDENT	5000
30	SALES	TURNER	SALESMAN	1500
20	RESEARCH	ADAMS	CLERK	1100
30	SALES	JAMES	CLERK	950
20	RESEARCH	FORD	ANALYST	3000
10	ACCOUNTING	MILLER	CLERK	1300
	OPERATIONS			

*/

-- ���� Ǯ���� ���� 
SELECT D.DEPTNO, D.DNAME, E.ENAME, E.JOB, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE JOB = 'MANAGER' OR JOB = 'CLERK';


-----------------------------

--�� SELF JOIN (�ڱ� ����)
-- EMP ���̺��� ������ ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.

/*
      E       E      E         E         E           E
    EMPNO   ENAME   JOB       MGR       
                             EMPNO      ENAME       JOB
---------------------------------------------------------------
  �����ȣ  �����  ������  �����ڹ�ȣ  �����ڸ�  ������������ 
---------------------------------------------------------------
    7369    SMITH   CLERK     7902       FORD     ANALYST
                            :
    ENP      EMP     EMP     EMP
    ----------------------------- (1)
                             EMP         EMP        EMP
                          ------------------------------- (2)
---------------------------------------------------------------
*/

SELECT *
FROM EMP;
/*
7369	SMITH	CLERK	7902	    1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521    	WARD	    SALESMAN	7698	1981-02-22	1250    	500	    30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782    	CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		    20
7839	KING	    PRESIDENT		1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD	    ANALYST	7566	1981-12-03	3000		    20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/


SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������", E1.MGR "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������" 
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;

--���� Ǯ���� ����
/*
7902    	FORD    	ANALYST	    7566	JONES	MANAGER
7788	SCOTT	ANALYST	    7566	JONES	MANAGER
7900	JAMES	CLERK	    7698	BLAKE	MANAGER
7844	TURNER	SALESMAN	    7698	BLAKE	MANAGER
7654	MARTIN	SALESMAN	    7698	BLAKE	MANAGER
7521	    WARD	    SALESMAN	    7698	BLAKE	MANAGER
7499	ALLEN	SALESMAN	    7698	BLAKE	MANAGER
7934	MILLER	CLERK	    7782    	CLARK	MANAGER
7876	ADAMS	CLERK	    7788	SCOTT	ANALYST
7782	    CLARK	MANAGER	    7839	KING	    PRESIDENT
7698	BLAKE	MANAGER	    7839	KING	    PRESIDENT
7566	JONES	MANAGER	    7839	KING	    PRESIDENT
7369	SMITH	CLERK	7   902	    FORD	    ANALYST
7839	KING	    PRESIDENT			
*/�����ͺ��̽� ��Ű�� ���� ����



-- �Բ� Ǯ���� ����

SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;


SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;


SELECT E1.EMPNO "�����ȣ", E1.ENAME "�����", E1.JOB "������"
     , E2.EMPNO "�����ڹ�ȣ", E2.ENAME "�����ڸ�", E2.JOB "������������"
FROM EMP E1 LEFT JOIN EMP E2
ON E1.MGR = E2.EMPNO;
--==>> 13���� ��ȸ�ȴ�. 
--==>> LEFT JOIN �ϰ� �Ǹ� 14�� (�׷��ϱ� KING����) ��ȸ�ȴ�. 

