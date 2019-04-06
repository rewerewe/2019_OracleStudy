SELECT USER
FROM DUAL;
--==>> SCOTT

/*
 �������� ���� ���·� ��ø�� �����ϴ�.
 �������� ǰ�� ������ �Ϲ������� ��ø �������̶� �Ѵ�.
 ��� ����?
 
 �÷������� �˼� ����, �����ؼ� � �÷��� � �������� ���� �ߴ��� �� �� ����.
 SANAME "�����", SAL*12 "����", ���� *2 "�ι迬��"���� �� �� ����.(A)
 SANAME "�����", SAL*12 "����", SAL*2 *2 "�ι迬��" �̷��� ��� �� (��)

SUB QUERY �ۼ���
    
    1) 
    SELECT �����, ����*2"�ι迬��"
    FROM 
    (
        SELSECT SANAME"�����", SAL*12"����"
        FROM TBL_SAWON
    );
    
    2) 
    SELECT T.�����, T.����*2"�ι迬��"
    FROM 
    (
        SELSECT SANAME"�����", SAL*12"����"
        FROM TBL_SAWON
    ) T;        -- ������ T��� ���̺��� ����� ����� �� �ִ�. 
 
 
ALIAS �Ⱥ��̸� �̷��� ���� ������, ���� AS �Ⱦ��� ȿ���� ��������. 

    SELECT SANAME, SAL*2"�ι迬��"
    FROM 
    (
        SELSECT SANAME, SAL*12
        FROM TBL_SAWON
    );
 
���� ���� ����� �Ͽ� <��>, ���δ����� �ۼ��Ѵ� �Ͽ� <�ζ��κ�> �� �Ѵ�. 
*/

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
          
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
            ELSE 0      -- WHEN~THEN ���� ���� Ÿ���̱� ������ '���� Ȯ�� �Ұ�' �̷��� �� �� ����. 
            END "���糪��"
FROM TBL_SAWON;

------------------------------------------------------------ ���� ���̱��� Ȯ��

--     �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���, �޿� 
--                               ----   -------
--     (����������, �ٹ��ϼ�, �����ϼ�, ���ʽ�)

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���
        -- ����������
        -- ���������⵵ �� �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��
        -- ���� ���̰�, 58��.....    2�� �� �� 2019... 2021
        -- ���� ���̰�, 35��.....   25�� �� �� 2019... 2044
        -- ADD_MONTHS(SYSDATE, �������*12)
        --                     --------
        --                     60 - ���糪��
        -- ADD_MONTHS(SYSDATE, (60 - ���糪��)*12)
        -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��)*12), 'YYYY') �� �������� �⵵�� ����
        -- TO_CHAR(HIREDATE, 'MM-DD')                              �� �Ի���   ���ϸ� ����   
        -- TO_CHAR(ADD_MONTHS(SYSDATE, (60 - ���糪��)*12), 'YYYY') || '-'
        --      || TO_CHAR(HIREDATE, 'MM-DD')"����������"
        , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��)*12), 'YYYY') || '-'
        || TO_CHAR(T.�Ի���, 'MM-DD')"����������"
        
------------------------------------------------------------ ���������ϱ��� Ȯ��  

--     ����������, �ٹ��ϼ�, �����ϼ�, ���ʽ�
--                --------
--              ������ - �Ի��� 
    , TRUNC(SYSDATE - T.�Ի���)"�ٹ��ϼ�"
    
------------------------------------------------------------ �ٹ��ϼ����� Ȯ��  

--     ����������, �ٹ��ϼ�, �����ϼ�, ���ʽ�
--                         --------
--                       ���������� - ������   
--  , TO_DATE(�����������ڿ�, 'YYYY-MM-DD') - SYSDATE"�����ϼ�"    
--    ��  �ٹ��ϼ�ó�� �ϼ��� �ȵ� �ð��� �Ҽ������� �������Ŷ� TRUNC() ������ 
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��)*12), 'YYYY') || '-'
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)"�����ϼ�"
    , T.�޿�
    
------------------------------------------------------------ �����ϼ����� Ȯ�� 

--      ���ʽ�
--      �ٹ��ϼ��� 1000�� �̻� 2000�� �̸� �� ���� �޿��� 30%
--      �ٹ��ϼ��� 2000�� �̻�             �� ���� �޿��� 50%
--      ������                            �� 0%

     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5 
            WHEN TRUNC(SYSDATE - T.�Ի���) > 1000  THEN T.�޿� * 0.3
            ELSE 0 
        END"���ʽ�"
    
------------------------------------------------------------ SUB QUERY ���� 
FROM 
(
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE '����Ȯ�κҰ�'
            END"����"
              
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE 0      -- WHEN~THEN ���� ���� Ÿ���̱� ������ '���� Ȯ�� �Ұ�' �̷��� �� �� ����. 
                END "���糪��"
         , HIREDATE"�Ի���"
         , SAL"�޿�"
         
    FROM TBL_SAWON
) T;            -- SUB QUERY�� ������ ���̺� T�� �����ش�. 

------------------------------------------------------------ SUB QUERY �� 

/*
1001	�̿���	8706241234567	����	    33	2001-01-03	2046-01-03	6662 	9773	3000	1500
1002	    ���ֿ�	9405022234567	����	    26	2010-11-05	2053-11-05	3069	12636	2000	    1000
1003	������	9710012234567	����  	23	1999-08-16	2056-08-16	7168	13651	5000	2500
1004	��ȫ��	9504102234567	����	    25	1997-11-05	2054-11-05	7817	13001	4000	2000
1005	�̺��	7210101234567	����  	48	1998-02-02	2031-02-02	7728	    4324	    2000	    1000
1006	������	8004271234567	����  	40	1998-02-02	2039-02-02	7728    	7246	    2000	    1000
1007	������	0405064234567	����  	16	2010-07-15	2063-07-15	3182	    16175	1000	500
1008	������	0506074234567	����  	15	2011-07-15	2064-07-15	2817	    16541	1000	500
1009	������	0505053234567	����	    15	2011-07-15	2064-07-15	2817	    16541	3000	1500
1010	���켱	9505052234567	����  	25	1999-11-11	2054-11-11	7081	13007	4000	2000
1011	������	7512122234567	����  	45	1999-11-11	2034-11-11	7081	5702	    5000	2500
1012    	������	9302131234567	����	    27	2010-11-11	2052-11-11	3063	12277	3000	1500
1013	���ü�	7202021234567	����  	48	1992-10-10	2031-10-10	9669	4574	2000    	1000
*/

-------------------------------------------------------------------------------------- 10:00

-- ��� ���뿡��, Ư�� �ٹ��ϼ��� ����� Ȯ���ؾ� �Ѵٰų�,
-- Ư�� ���ʽ� �ݾ��� �޴� ����� Ȯ���ؾ� �� ��찡 ���� �� �ִ�.
-- �̿� ���� ���... �ش� �������� �ٽ� �����ϴ� ���ŷο��� ���� �� �ֵ���
-- ��(VIEW)�� ����� ������ �� �� �ִ�.

------------------------------------------------------------ ��� �����ص���.
-- VIEW ���������� ���̺��� ����°� �ƴ϶�, �ӽ������� �������� ��Ƶδ� ��
-- REPLACE �Ҷ����� VIEW �� �����ȴ�. 
-- �� �������� ª�� �������� ����� ���´�. ���̺� �����̽� �Ҵ緮�� ������� ���ڿ� �����ؼ� ���� ��
-- ���� �����Ǵ� VIEW�� �������, ����� �ȴ�. 

CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.�����ȣ, T.�����, T.�ֹι�ȣ, T.����, T.���糪��, T.�Ի���   
     , TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��)*12), 'YYYY') || '-'
        || TO_CHAR(T.�Ի���, 'MM-DD')"����������"
     , TRUNC(SYSDATE - T.�Ի���)"�ٹ��ϼ�"
     , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.���糪��)*12), 'YYYY') || '-'
        || TO_CHAR(T.�Ի���, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)"�����ϼ�"
     , T.�޿�
     , CASE WHEN TRUNC(SYSDATE - T.�Ի���) >= 2000 THEN T.�޿� * 0.5 
            WHEN TRUNC(SYSDATE - T.�Ի���) > 1000  THEN T.�޿� * 0.3
            ELSE 0 
        END"���ʽ�"
        
FROM 
(
    SELECT SANO"�����ȣ", SANAME"�����", JUBUN"�ֹι�ȣ"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '����'
                ELSE '����Ȯ�κҰ�'
            END"����"
              
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                ELSE 0      
                END "���糪��"
         , HIREDATE"�Ի���"
         , SAL"�޿�"
         
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON��(��) �����Ǿ����ϴ�.


/*
    ABC ���̺� ���
    - �� ����      10:20
    
    - ������ �Է�(����, ����) 10:24
    
    �� �� ���� ���� �����͸� �����߾ ����ȴ�. 

*/


INSERT INTO TBL_SAWON(SANO, SANAME, SAL, HIREDATE)
VALUES(2000, '�輱��', 5000, SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� TBL_SAWON ���̺��� �̿��� ����� �Ի��� �� �޿� ������ ����

SELECT *
FROM VIEW_SAWON;
-- ����(TBL_SAWON ��ȸ) :  1001 	�̿���	8706241234567	2001-01-03	3000
--      VIEW_SAWON ��ȸ : 1001	�̿���	8706241234567	����	    33	2001-01-03	2046-01-03	6662	9773	3000	1500


-- UPDATE�� WHERE���� �ۼ��Ѵ�.  
UPDATE TBL_SAWON
SET HIREDATE=SYSDATE, SAL=100 
WHERE SANO=1001;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.


COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT *
FROM TBL_SAWON;
--==>> 1001	�̿���	8706241234567	2019-04-01	100
-- �̿��� ����� �Ի���, �޿� ����Ǿ���

SELECT *
FROM VIEW_SAWON;
--==>> 1001	�̿���	8706241234567	����	33	2019-04-01	2046-04-01	0	9861	100	0
-- VIEW_SAWON ���� �Ի���, �޿� ����Ǿ����� Ȯ��



--�� ����
-- ���� ������ Ȱ���Ͽ� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �Ѵ�.

/*
----------------------------------------------------
    �����     ����      ���糪��    �޿�  ���̺��ʽ�  
----------------------------------------------------
 
 ��, ���̺��ʽ��� ���� ���̰� 40�� �̻��̸� �޿��� 70%
    30�� �̻� 40�� �̸��̸� �޿��� 50% 
    20�� �̻� 30�� �̸��̸� �޿��� 30%�� �Ѵ�.
    
 ����, �ϼ��� ��ȸ ������ ������� 
 VIEW_SAWON2 ��� �̸��� ��(VIEW)�� �����Ѵ�. 
 
*/



SELECT T.�����, T.����, T.���糪��, T.�޿�
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7 
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
            ELSE 0
        END "���̺��ʽ�"
FROM
(
    SELECT SANAME"�����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4')  THEN '����'
                ELSE '����Ȯ�κҰ�'
           END"����"
         
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)      
                ELSE 0
            END"���糪��"
            
         , SAL"�޿�"
        
    FROM TBL_SAWON
) T;


CREATE OR REPLACE VIEW VIEW_SAWON2;
AS
SELECT T.�����, T.����, T.���糪��, T.�޿�
     , CASE WHEN T.���糪�� >= 40 THEN T.�޿� * 0.7 
            WHEN T.���糪�� >= 30 THEN T.�޿� * 0.5
            WHEN T.���糪�� >= 20 THEN T.�޿� * 0.3
        ELSE 0
        END "���̺��ʽ�"
FROM
(
    SELECT SANAME"�����"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4')THEN '����'
                ELSE '����Ȯ�κҰ�'
           END"����"
         
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)      
                ELSE 0
            END"���糪��"
         , SAL"�޿�"
      
    FROM TBL_SAWON
) T;

-------------------------------------------------------------------------------------- 11:00 

--�� RANK() �� ���(����)�� ��ȯ�ϴ� �Լ�

SELECT EMPNO"�����ȣ", ENAME"�����", DEPTNO"�μ���ȣ", SAL"�޿�"
     , RANK() OVER(ORDER BY SAL DESC)"��ü �޿�����"
FROM EMP;

/*
    7839	KING	    10	5000	1
    7902	    FORD    	20	3000	2
    7788	SCOTT	20	3000	2
    7566	JONES	20	2975    	4
    7698	BLAKE	30	2850    	5
    7782	    CLARK	10	2450    	6
    7499	ALLEN	30	1600	7
    7844	TURNER	30	1500	8
    7934	MILLER	10	1300	9
    7521	    WARD    	30	1250	    10
    7654	MARTIN	30	1250	    10
    7876	ADAMS	20	1100	12
    7900	JAMES	30	950	    13
    7369	SMITH	20	800	    14
*/

/*
    RANK() �Լ� ���� 
     RANK() OVER() 
     RANK() OVER(ORDER BY SAL DESC)
     RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)
*/


SELECT EMPNO"�����ȣ", ENAME"�����", DEPTNO"�μ���ȣ", SAL"�޿�"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)"�μ��� �޿�����"
     , RANK() OVER(ORDER BY SAL DESC)"��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;
--     3 : �μ���ȣ �������� , 4 DESC : �޿��� �������� 

/*
    7839	KING	    10	5000	1	1
    7902    	FORD    	20	3000	1	2
    7788	SCOTT	20	3000	1	2
    7566	JONES	20	2975    	3	4
    7698	BLAKE	30	2850	    1	5
    7782    	CLARK	10	2450	    2	6
    7499	ALLEN	30	1600	2	7
    7844	TURNER	30	1500	3	8
    7934	MILLER	10	1300	3	9
    7521	    WARD	    30	1250    	4	10
    7654	MARTIN	30	1250	    4	10
    7876	ADAMS	20	1100	4	12
    7900	JAMES	30	950	    6	13
    7369	SMITH	20	800	    5	14
*/


--�� DENSE_RANK() �� ������ ��ȯ�ϴ� �Լ� 

/*
    RANK() ��            DENSE_RANK()��
    1                       1
    
    2   2   2               2   2   2
    
    5                       3

*/

SELECT EMPNO"�����ȣ", ENAME"�����", DEPTNO"�μ���ȣ", SAL"�޿�"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC)"�μ��� �޿�����"
     , DENSE_RANK() OVER(ORDER BY SAL DESC)"��ü �޿�����"
FROM EMP
ORDER BY 3, 4 DESC;

/*
    7839	KING	    10	5000	1	1
    7902    	FORD	    20	3000	1	2
    7788	SCOTT	20	3000	1	2
    7566	JONES	20	2975    	2	3
    7698	BLAKE	30	2850    	1	4
    7782    	CLARK	10	2450	    2	5
    7499	ALLEN	30	1600	2	6
    7844	TURNER	30	1500	3	7
    7934	MILLER	10	1300	3	8
    7521    	WARD	    30	1250    	4	9
    7654	MARTIN	30	1250    	4	9
    7876	ADAMS	20	1100	3	10
    7900	JAMES	30	950	    5	11
    7369	SMITH	20	800	    4	12
*/


--------------------------------------------------------------------------< �ǽ� ���� > 
--�� EMP ���̺��� ��� ������
--   �����, �μ���ȣ, ����, �μ��� ��������, ��ü �������� �׸����� ��ȸ�Ѵ�.

SELECT *
FROM EMP;

/*
    EMPNO   ENAME   JOB     MGR     HIREDATE    SAL     COMM    DEPTNO
    7369	SMITH	CLERK	7902    	1980-12-17	800		        20
    7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300 	30
    7521    	WARD	    SALESMAN	7698	1981-02-22	1250	    500 	30
    7566	JONES	MANAGER	7839	1981-04-02	2975		        20
    7654	MARTIN	SALESMAN	7698	1981-09-28	1250    	1400	30
    7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
    7782	    CLARK	MANAGER	7839	1981-06-09	2450		        10
    7788	SCOTT	ANALYST	7566	1987-07-13	3000	       	20
    7839	KING	    PRESIDENT		1981-11-17	5000	       	10
    7844	TURNER	SALESMAN	7698	1981-09-08	1500	0   	30
    7876	ADAMS	CLERK	7788	1987-07-13	1100	    	20
    7900	JAMES	CLERK	7698	1981-12-03	950		        30
    7902	    FORD    	ANALYST	7566	1981-12-03	3000		    20
    7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/

SELECT T.�����, T.�μ���ȣ, T.����
     , RANK() OVER(PARTITION BY T.�μ���ȣ ORDER BY T.���� DESC)"�μ��� ��������"
     , RANK() OVER(ORDER BY T.���� DESC)"��ü ��������"
FROM 
(     
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", (SAL*12+NVL(COMM, 0))"����"
    FROM EMP
) T;

/*
        �����  �μ���ȣ    ����      �μ���       ��ü
                                    ��������   ��������
        KING	    10	       60000	    1	    1
        FORD    	20	       36000	    1	    2
        SCOTT	20	       36000	    1	    2
        JONES	20	       35700	    3	    4
        BLAKE	30	       34200        	1	    5
        CLARK	10	       29400        	2	    6
        ALLEN	30	       19500    	2	    7
        TURNER	30	       18000    	3	    8
        MARTIN	30	       16400    	4	    9
        MILLER	10	       15600    	3	    10
        WARD	    30	       15500    	5	    11
        ADAMS	20	       13200	        4	    12
        JAMES	30         11400    	6	    13
        SMITH	20	       9600	        5	    14
*/


-- �Բ� Ǯ���� ����
SELECT ENAME"�����", DEPTNO"�μ���ȣ", (SAL*12+NVL(COMM, 0))"����" 
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"�μ��� ��������"
     , RANK() OVER(ORDER BY (SAL*12+NVL(COMM, 0)) DESC)"��ü ��������"
FROM EMP
ORDER BY 2, 3 DESC;



--�� EMP ���̺��� ��ü ���� ������ 1����� 5�������,
--   �����, �μ���ȣ, ����, ��ü�������� �׸����� ��ȸ�Ѵ�.

SELECT T.*
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ" , SAL*12+NVL(COMM, 0)"����"
         , DENSE_RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC)"��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� <=5;

/*
    KING	    10	60000	1
    SCOTT	20	36000	2
    FORD	2   0	36000	2
    JONES	20	35700	3
    BLAKE	30	34200	4
    CLARK	10	29400	5
*/

-------------------------------------------------------------------------------------- 12:00 


SELECT T.*
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM, 0)"����"
         , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC)"��ü��������"
    FROM EMP
) T
WHERE T.��ü�������� <= 5;

/*
    KING	    10	60000	1
    SCOTT	20	36000	2
    FORD    	20	36000	2
    JONES	20	35700	4
    BLAKE	30	34200	5
*/

--�� EMP ���̺��� �� �μ����� ���� ����� 1����� 2�� ������ ��ȸ�Ѵ�.
--   �����, �μ���ȣ, ����, �μ��� �������, ��ü �������

SELECT T.*     
FROM
(
    SELECT ENAME"�����", DEPTNO"�μ���ȣ", SAL*12+NVL(COMM, 0)"����"
    , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM, 0) DESC)"�μ����������"
    , RANK() OVER(ORDER BY SAL*12*NVL(COMM, 0) DESC)"��ü�������"
    FROM EMP
) T 
WHERE T.�μ���������� <=2;

/*
    KING	    10	60000	1	4
    CLARK	10	29400	2	4
    SCOTT	20	36000	1	4
    FORD	    20	36000	1	4
    BLAKE	30	34200	1	4
    ALLEN	30	19500	2	3
*/

----------------------------------------------------------------------------------------
--���� �׷� �Լ� ����-- 

-- SUM() ��, AVG() ���, COUNT() ī��Ʈ, MAX() �ִ밪, MIN() �ּҰ�
-- VARIANCE �л�, STDDEV ǥ������ 

-- �׷� �Լ��� ���� ū Ư¡�� ��� �������� NULL �� �����ϸ�, �׷� �Լ��� �� NULL ���� ���� ó���Ѵ�. 
-- ó���ؾ� �� �����͵� �� NULL �� �����ϸ�
-- �� NULL �� �����ϰ� ������ �����Ѵٴ� ���̴�.

--��SUM()
-- EMP ���̺��� ������� ��ü ������� �޿� ������ ��ȸ�Ѵ�.
SELECT SUM(SAL) -- 800+1600+...+1300  
FROM EMP;
--==>> 29025

SELECT SUM(COMM)  -- NULL + 300 + 500 (��) 
FROM EMP;
--==>> 2200

--�� COUNT()
--���� ���� ��ȸ�Ͽ� ����� ��ȯ
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(SAL)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)  --COMM �÷��� ���� ���� ��ȸ �� NULL �� ����
FROM EMP;
--==>> 4


-- ��ü ���� ��ȸ�� ���� * �� �������� �˻��ؾ� NULL ������ ��ȸ�ȴ�.
SELECT COUNT(*)
FROM EMP;
--==>> 14


--�� AVG()
-- ��� ��ȯ
SELECT SUM(SAL) / COUNT(SAL), AVG(SAL)
FROM EMP;
--==>> 
/*
    SUM(SAL)                                    AVG(SAL)
    2073.214285714285714285714285714285714286	2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM)
FROM EMP;
--==>> 550 --COMM �� ����� �ƴϴ�. 


SELECT SUM(COMM)
FROM EMP;
--==>> 2200


SELECT SUM(COMM) / 14 
FROM EMP;
--==>> 157.142857142857142857142857142857142857


SELECT SUM(COMM) / COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--�� ǥ�������� ������ �л�
-- �л��� �������� ǥ������
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;

/*
AVG(SAL)
2073.214285714285714285714285714285714286	

VARIANCE(SAL)
1398313.87362637362637362637362637362637	

STDDEV(SAL)
1182.503223516271699458653359613061928508
*/

SELECT POWER(STDDEV(SAL), 2), VARIANCE(SAL)
FROM EMP;

/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)), STDDEV(SAL)
FROM EMP;

/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/

--�� MAX() / MIN()
-- �ִ밪, �ּҰ� ��ȯ
-- NULL ���� ���� ���� ū ��/ ���� ���� �� ��ȯ 
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000	800

-- �׷� �Լ� ���� ������ �� 
-- ���� ó���� ���� ��ȯ�Ѵ�. �� ������ ���ڵ�� 1:1 ��ȯ�� �ƴϴ�.

--�� ����
SELECT ENAME, SUM(SAL)
       ----- ENAME�� ���ڵ尪 14�� ��ȯ, SUM(SAL)�� 1�� ��ȯ 
FROM EMP;
--==>> ���� �߻� 
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
705��, 8������ ���� �߻�
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> ���� ������.


--�� �μ��� �޿��� ��ȸ
SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
--==>>

/*
10	8750
20	10875
30	9400
*/

SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM EMP
GROUP BY ROLLUP(DEPTNO);
--==>> 
/*
�μ� �޿���
��ȣ 
10	8750
20	10875
30	9400
	29025  
    ----- ��ü�μ� �޿��� 
*/  


SELECT *
FROM TBL_EMP;
    

--�� ������ �Է�
INSERT INTO TBL_EMP VALUES
(8001, '���μ�', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8002, '������', 'CLERK', 7566, SYSDATE, 1000, 0, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8003, '����', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8004, '�嵿��', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP VALUES
(8005, '����', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL); 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

/*

DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

*/


--�� Ȯ��
SELECT *
FROM TBL_EMP;

/*
    7369	SMITH	CLERK	    7902	    1980-12-17	800		        20
    7499	ALLEN	SALESMAN    	7698	1981-02-20	1600	300	    30
    7521    	WARD	    SALESMAN	    7698	1981-02-22	1250    	500	    30
    7566	JONES	MANAGER	    7839	1981-04-02	2975		        20
    7654	MARTIN	SALESMAN	    7698	1981-09-28	1250	    1400	30
    7698	BLAKE	MANAGER	    7839	1981-05-01	2850		        30
    7782	    CLARK	MANAGER	    7839	1981-06-09	2450		        10
    7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
    7839	KING	    PRESIDENT		    1981-11-17	5000		    10
    7844	TURNER	SALESMAN	    7698	1981-09-08	1500	 0	    30
    7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
    7900	JAMES	CLERK	    7698	1981-12-03	950		        30
    7902	    FORD	    ANALYST	    7566	1981-12-03	3000		    20
    7934	MILLER	CLERK	    7782    	1982-01-23	1300		    10
    8001	���μ�	CLERK	    7566	2019-04-01	1500	        10	
    8002    	������	CLERK	    7566	2019-04-01	1000	         0	
    8003	����	    SALESMAN	    7698	2019-04-01	2000		
    8004	�嵿��	SALESMAN	    7698	2019-04-01	2500		
    8005	����	    SALESMAN	    7698	2019-04-01	1000		
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

/*
    �μ�    �޿���
    ��ȣ  
    10	    8750
    20	    10875
    30	    9400
    (null)	8000   �� �μ���ȣ�� NULL�� �����͵鳢���� �޿� ��    
    (null)  37025  �� ��� �μ��� �޿� �� �հ�
*/

--�� ������ ���� ��ȸ�Ѵ�. 
/*
    �μ���ȣ    �޿��� 
 ------------------------
    10	        8750
    20	        10875
    30	        9400
    ���� 	    8000   �� �μ���ȣ�� NULL�� �����͵鳢���� �޿� ��    
    ���μ�    37025   �� ��� �μ��� �޿� �� �հ�
*/

-- ���� Ǯ���� ����

SELECT CASE WHEN DEPTNO  = NULL THEN '����'    
            WHEN DEPTNO != NULL THEN DEPTNO
            ELSE 0
        END"�μ���ȣ"
     , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);

--==>> �����߻�. ����? 


--�Բ� Ǯ���� ����

SELECT CASE DEPTNO WHEN NULL
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
/*
    ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
    00932. 00000 -  "inconsistent datatypes: expected %s got %s"
    *Cause:    
    *Action:
    844��, 42������ ���� �߻�
*/

SELECT CASE DEPTNO WHEN NULL
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
FROM TBL_EMP;
/*
20
30
30
20
30
30
10
20
10
30
20
30
20
10
(null)
(null)
(null)
(null)
*/

SELECT CASE WHEN DEPTNO IS NULL
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
    , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);        --SELECT ���� ���� ����ȴ�. 

/*
    10	    8750
    20	    10875
    30	    9400
    ����	    8000
    ����	    37025
*/

SELECT CASE WHEN DEPTNO IS NULL
            THEN '����'
            ELSE TO_CHAR(DEPTNO)
        END "�μ���ȣ"
    , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY DEPTNO 
ORDER BY DEPTNO;

/*
    10	    8750
    20	    10875
    30	    9400
    ����	    8000
*/

SELECT T.*
FROM
(
    SELECT CASE WHEN DEPTNO IS NULL
                THEN '����'
                ELSE TO_CHAR(DEPTNO)
            END "�μ���ȣ"
        , SUM(SAL)"�޿���"
    FROM TBL_EMP
    GROUP BY DEPTNO 
    ORDER BY DEPTNO
) T
GROUP BY ROLLUP(T.�μ���ȣ);
--==>> �����߻�
/*
    ORA-00979: not a GROUP BY expression
    00979. 00000 -  "not a GROUP BY expression"
    *Cause:    
    *Action:
    926��, 10������ ���� �߻�
*/


--���� GROUPING()

SELECT DEPTNO"�����ȣ", SUM(SAL)"�޿���", GROUPING(DEPTNO)
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
 �����ȣ   �޿���  GROUPING
---------------------------
    10	    8750	  0     ��   
    20	    10875     0     �������� �׷� 0
    30	    9400	  0
            8000	  0     ��
            37025	  1     - �׷�� �� �ٽ� �ѹ� �׷� �� �� 1
*/


--���� Ǯ���� ����
--(1)
SELECT CASE WHEN GROUPING(DEPTNO) = '1' THEN '���μ�'
            WHEN DEPTNO IS NULL         THEN '����' 
            ELSE TO_CHAR(DEPTNO)
        END"�μ���ȣ"
     , SUM(SAL)"�޿���" 
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
    �μ���ȣ �޿���
  -----------------
    10	    8750
    20	    10875
    30	    9400
    ����  	8000
    ���μ�	37025
*/


--(2)
SELECT CASE WHEN (T.�μ���ȣ = NULL) AND GROUPING(T.�μ���ȣ) = '1'     THEN '���μ�'
            WHEN (T.�μ���ȣ = NULL) AND GROUPING(T.�μ���ȣ) = '0'     THEN '����'
            ELSE TO_CHAR(T.�μ���ȣ)
        END"�μ���ȣ"
     , T.�޿���
FROM
(
    SELECT DEPTNO"�μ���ȣ", SUM(SAL)"�޿���", GROUPING(DEPTNO)"�׷���"
    FROM TBL_EMP
    GROUP BY ROLLUP(DEPTNO);
) T;

--==>> �����߻�. ����? 

-------------------------------------------------------------------------------------- 15:00 
-- �Բ� Ǯ���� ���� 

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
        ELSE '���μ�' END"�μ���ȣ"
     , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
    �μ���ȣ  �޿���
---------------------
    10	      8750
    20	      10875
    30	      9400
    ����  	  8000
    ���μ�	  37025
*/


--�� TBL_SAWON ���̺��� ������ ���� ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
-------------------------
    ����        �޿��� 
-------------------------
     ��         XXXXX
     ��         XXXXX
  �����       XXXXX
-------------------------
*/

-- ���� Ǯ���� ���� 

SELECT CASE WHEN T.���� = '����'    THEN SUM(T.�޿�) 
            WHEN T.���� = '����'    THEN SUM(T.�޿�)
            ELSE '�����'
        END "����"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN (1, 3) THEN '����'
                WHEN SUBSTR(JUBUN, 7, 1) IN (2, 4) THEN '����' 
                ELSE '����Ȯ�κҰ�'
            END"����"
         , SAL"�޿�"     
    FROM TBL_SAWON
) T   
GROUP BY ROLLUP(T.����);
--==>> ���� �߻�. ����?



--�Բ� Ǯ���� ����
SELECT CASE GROUPING(T.����) WHEN 0 THEN T.���� 
        ELSE '�����' 
        END"����"
    , SUM(T.�޿�)"�޿���"
FROM
(
    SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '��'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '��'
                ELSE 'Ȯ�κҰ�'
           END "����"
        , SAL"�޿�"
    FROM TBL_SAWON
) T 
GROUP BY ROLLUP(T.����);
/*
    ����       �޿���
    -----------------
    ��	        21100
    ��	        22000
    Ȯ�κҰ�	     5000
    �����    	48100
*/


--�� TBL_SAWON ���̺��� ������ ���� ���ɴ뺰 �ο��� ���·� 
--   ��ȸ�� �� �ֵ��� �������� �����Ѵ�.

/*
--------------------------------
    ���ɴ�         �ο���
--------------------------------
    0                X
    10               X
    20               X
    30               X
    40               X
    50               X
    ��ü             XX
--------------------------------
*/
-- ���� Ǯ���� ���� 
SELECT *
FROM TBL_SAWON;

SELECT CASE GROUPING(T.���ɴ�) WHEN 0 THEN T.���ɴ�
        ELSE '��ü'
        END"���ɴ�"
     , COUNT(*)"�ο���"
FROM
(
    SELECT CASE WHEN TO_NUMBER(SUBSTR(JUBUN, 1, 2)) >= 60 AND TO_NUMBER(SUBSTR(JUBUN, 1, 2)) < 70 THEN '50'
                WHEN TO_NUMBER(SUBSTR(JUBUN, 1, 2)) >= 70 AND TO_NUMBER(SUBSTR(JUBUN, 1, 2)) < 80 THEN '40'
                WHEN TO_NUMBER(SUBSTR(JUBUN, 1, 2)) >= 80 AND TO_NUMBER(SUBSTR(JUBUN, 1, 2)) < 90 THEN '30'
                WHEN TO_NUMBER(SUBSTR(JUBUN, 1, 2)) >= 90 AND TO_NUMBER(SUBSTR(JUBUN, 1, 2)) < 99 THEN '20'
                WHEN TO_NUMBER(SUBSTR(JUBUN, 1, 2)) >= 00 AND TO_NUMBER(SUBSTR(JUBUN, 1, 2)) < 10 THEN '10'
                ELSE '0'
            END"���ɴ�"
    FROM TBL_SAWON
          
) T
GROUP BY ROLLUP(T.���ɴ�);

/*
      ���ɴ�  �ο���
    ----------------
        0	    1
        10	    3
        20	    5
        30	    3
        40	    3
        50	    1
        ��ü	    16
*/
-- �Բ� Ǯ���� ���� 

-- ���1. �ζ��� �� �ι� ��ø

SELECT CASE GROUPING(Q.���ɴ�) WHEN 0 THEN TO_CHAR(Q.���ɴ�)
            ELSE '��ü'
        END "���ɴ�"
     , COUNT(Q.���ɴ�)"�ο���"

FROM 
(
    --���ɴ�
    SELECT CASE WHEN T.���� >= 50 THEN 50 
                WHEN T.���� >= 40 THEN 40
                WHEN T.���� >= 30 THEN 30
                WHEN T.���� >= 20 THEN 20
                WHEN T.���� >= 10 THEN 10
                ELSE 0
            END"���ɴ�"
    FROM 
    (
        --����
        SELECT CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE 0
                END"����"
        FROM TBL_SAWON
    
    ) T
)Q

GROUP BY ROLLUP(Q.���ɴ�);
/*
    0	1
    10	3
    20	5
    30	2
    40	4
    50	1
    ��ü	16
*/


-- ���2. �ζ��� �� �ѹ� ��� 

SELECT TRUNC(CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1899)
                    WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                    THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1999)
                    ELSE 0
            END, -1) "���ɴ�"
FROM TBL_SAWON;


SELECT TRUNC(23, -1)"Ȯ��"
FROM DUAL;



---------------------------------------------------------------------------------------------
--�� ROLLUP Ȱ�� �� CUBE
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)       -- ����ó���� ��� �ϴ��Ŀ� ���� �����ش�. 
ORDER BY 1, 2;

/*  
    10	    CLERK	    1300
    10	    MANAGER	    2450
    10	    PRESIDENT	5000
    10	    (null)	    8750        -- 10�� �μ� ��� ������ �޿���
    20	    ANALYST	    6000
    20	    CLERK	    1900
    20	    MANAGER	    2975
    20	    (null)	    10875       -- 20�� �μ� ��� ������ �޿���
    30	    CLERK	    950
    30	    MANAGER	    2850
    30	    SALESMAN    	5600
    30	    (null)	    9400       -- 30�� �μ� ��� ������ �޿���
    (null)  (null)      29025       -- ��� �μ� ��� ������ �޿���
*/


--�� CUBE() �� ROLLUP() ���� ���� �� �ڼ��� ����� ��ȯ�� �� �ִ�.

SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;

/*
    10	CLERK	    1300
    10	MANAGER	    2450
    10	PRESIDENT	5000
    10	(null)      8750    -- 10�� �μ� ��� ������ �޿���
    20	ANALYST	    6000
    20	CLERK	    1900
    20	MANAGER	    2975
    20	(null)      10875    -- 20�� �μ� ��� ������ �޿���
    30	CLERK        950
    30	MANAGER	    2850
    30	SALESMAN	    5600
    30	(null)       9400    -- 30�� �μ� ��� ������ �޿���
(null)   ANALYST	    6000     -- ��� �μ� ANALYST   ������ �޿��� 
(null)   CLERK	    4150     -- ��� �μ� CLERK     ������ �޿���
(null)   MANAGER	    8275     -- ��� �μ� MANAGER   ������ �޿���
(null)   PRESIDENT	5000     -- ��� �μ� PRESIDENT ������ �޿���
(null)   SALESMAN	5600     -- ��� �μ� SALSEMAN  ������ �޿���
(null)   (null)      29025    -- ��� �μ� ��� ������ �޿���
*/

/*
�� ROLLUP()�� CUBE() �� 
   �׷��� �����ִ� ����� �ٸ���. (����)

    ROLLUP(A, B, C)
    �� (A, B, C) / (A, B) / (A) / ()

    CUBE(A, B, C)
    �� (A, B, C) / (A, B) / (A, C) / (B, C) / (A) / (B) / (C) / ()

--==>> CUBE�� �ʹ� ���� ������� ��µǱ� ������
       ������ ���� ���¸� �� ���� ����Ѵ�.
       ���� �ۼ��ϴ� ������ ��ȸ�ϰ��� �ϴ� �׷츸 ��GROUPING SETS�� ��
       �̿��Ͽ� �����ִ� ����̴�. 
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
        END"����"
     , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)                                     -- ROLLUP
ORDER BY 1, 2;
/*
    10	    CLERK	    1300
    10	    MANAGER	    2450
    10	    PRESIDENT	5000
    10	    ��ü����	    8750
    20	    ANALYST	    6000
    20	    CLERK	    1900
    20	    MANAGER	    2975
    20	    ��ü����	    10875
    30	    CLERK	    950
    30	    MANAGER	    2850
    30	    SALESMAN	    5600
    30	    ��ü����	    9400
    ����	    CLERK	    2500
    ����  	SALESMAN    	5500
    ����	    ��ü����    	8000
    ��ü�μ�	��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
        END"����"
     , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)                                        -- CUBE
ORDER BY 1, 2;

/*
    �μ���ȣ     ����       �޿���
------------------------------------
    10	        CLERK	    1300
    10	        MANAGER	    2450
    10	        PRESIDENT	5000
    10	        ��ü����    	8750
    20	        ANALYST	    6000
    20	        CLERK	    1900
    20	        MANAGER	    2975
    20	        ��ü����	    10875
    30	        CLERK	    950
    30	        MANAGER	    2850
    30	        SALESMAN    	5600
    30	        ��ü����    	9400
    ����	        CLERK	    2500
    ����	        SALESMAN	    5500
    ����	        ��ü����    	8000
    ��ü�μ�	    ANALYST	    6000
    ��ü�μ�	    CLERK	    6650
    ��ü�μ�	    MANAGER	    8275
    ��ü�μ�    	PRESIDENT	5000
    ��ü�μ�	    SALESMAN	    11100
    ��ü�μ�	    ��ü����	    37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
        END"����"
     , SUM(SAL)"�޿���"
FROM TBL_EMP    
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())             -- GROUPING SETS / ROLLUP �� ���� ��� 
ORDER BY 1, 2;

/*
    10	    CLERK	    1300
    10	    MANAGER	    2450
    10	    PRESIDENT	5000
    10	    ��ü����    	8750
    20	    ANALYST	    6000
    20	    CLERK	    1900
    20	    MANAGER	    2975
    20	    ��ü����	    10875
    30	    CLERK	    950
    30	    MANAGER	    2850
    30	    SALESMAN	    5600
    30	    ��ü����	    9400
    ����	    CLERK	    2500
    ����	    SALESMAN	    5500
    ����	    ��ü����    	8000
    ��ü�μ�	��ü����	    37025
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '����')
            ELSE '��ü�μ�'
        END "�μ���ȣ"
     , CASE GROUPING(JOB) WHEN 0 THEN JOB
            ELSE '��ü����'
        END"����"
     , SUM(SAL)"�޿���"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())      -- GROUPING SETS / CUBE �� ���� ��� 
ORDER BY 1, 2;
/*
10	CLERK	1300
10	MANAGER	2450
10	PRESIDENT	5000
10	��ü����	8750
20	ANALYST	6000
20	CLERK	1900
20	MANAGER	2975
20	��ü����	10875
30	CLERK	950
30	MANAGER	2850
30	SALESMAN	5600
30	��ü����	9400
����	CLERK	2500
����	SALESMAN	5500
����	��ü����	8000
��ü�μ�	ANALYST	6000
��ü�μ�	CLERK	6650
��ü�μ�	MANAGER	8275
��ü�μ�	PRESIDENT	5000
��ü�μ�	SALESMAN	11100
��ü�μ�	��ü����	37025
*/


--�� TBL_EMP ���̺��� �Ի�⵵�� �ο����� ��ȸ�Ѵ�.
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;
/*
------------------
  �Ի�⵵  �ο���
------------------
    1980      1
    1981     10
    1982      1
    1987      2
    2019      5
    ��ü     19
------------------
*/

-- ���� Ǯ���� ���� 
SELECT CASE GROUPING(T.�Ի�⵵) WHEN 0 THEN TO_CHAR(T.�Ի�⵵)
            ELSE '��ü'
        END "�Ի�⵵"
     , COUNT(T.�Ի�⵵)"�ο���"
FROM
(
    EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
    FROM TBL_EMP
) T
GROUP BY ROLLUP(T.�Ի�⵵);
--==>> ���� �߻� 


-- �Բ� Ǯ���� ���� 
SELECT EXTRACT(YEAR FROM HIREDATE)"�Ի�⵵"
     , COUNT(*)"�ο���"
FROM TBL_EMP
GROUP BY GROUPING SETS(EXTRACT(YEAR FROM HIREDATE), ());
--                     ---------------------------  ROLLUP [CUBE / GROUPING SETS](TO_CHAR(HIREDATE, 'YYYY')) �� �ۼ��ϸ� ������. 
--                                                  �� SELECT ���� PARSING ���� ������. (GROUP BY ���� ���� PARSING �ȴ�) 
ORDER BY 1;

/*
1980	1
1981	10
1982	    1
1987	2
2019    	5
(null)	19
*/

-------------------------------------------------------------------------------------------------------------------------

