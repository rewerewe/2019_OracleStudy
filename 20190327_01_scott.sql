--�� ���ӵ� ����� ��ȸ
SELECT USER
FROM DUAL;
--==>>  ��� :    SCOTT


--�� EMP ���̺��� ������ CLERK �� ����� ��
--   20�� �μ����� �ٹ��ϴ� ������� 
--   �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.

FROM EMP
������ CLERK �μ���ȣ�� 20��


�����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ
FROM EMP
������ CLERK �μ���ȣ�� 20��


SELECT �����ȣ, �����, ������, �޿�, �μ���ȣ
FROM EMP 
WHERE ������ CLERK �μ���ȣ�� 20��;


SELECT EMPNO "�����ȣ", ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP 
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>  ��� :   
/*
7369	SMITH	CLERK	 800	20
7876	ADAMS	CLERK	1100	20
*/


--�� EMP ���̺��� 10�� �μ��� �ٹ��ϴ� ���� �� 
--   �޿��� 2500 �̻��� �������
--   �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�. 

SELECT �����, ������, �޿�, �μ���ȣ
FROM EMP 
WHERE DEPT=10�� 
GROUP BY SAL
HAVING 2500;


SELECT ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP 
WHERE �μ���ȣ�� 10��  �޿��� 2500 �̻�;


SELECT ENAME "�����", JOB "������", SAL "�޿�", DEPTNO "�μ���ȣ"
FROM EMP 
WHERE DEPTNO=10 AND SAL>=2500;
--==>>  ��� : KING	PRESIDENT	5000	10


-- �� ���̺� ����
-- ���������� ��� ���̺� �ȿ� �ִ� ������ ���븸 �����ϴ� ���� 

--�� EMP ���̺��� ������ Ȯ���Ͽ� 
--   �̿� �Ȱ��� �����Ͱ� ����ִ� EMPCOPY���̺��� �����Ѵ�. (������)
-- ���� Ǯ���� ���� 
DESCRIBE EMP;
DESC EMP;
--==>>  ��� : 
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

/*
CREATE TABLE EMPCOPY AS
SELECT *
FROM EMP
*/

CREATE TABLE EMPCOPY
( EMPNO NUMBER(4) CONSTRAINT PK_EMPCOPY PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNOCOPY REFERENCES DEPT
);

SELECT *
FROM EMPCOPY;

INSERT INTO EMPCOPY
SELECT *
FROM EMP;


-- �Բ� Ǯ���� ���� 
SELECT *
FROM EMP;

CREATE TABLE EMP2
AS 
SELECT *
FROM EMP;
--==>>  ��� :    Table EMP2��(��) �����Ǿ����ϴ�.

-- ������ ���̺� Ȯ��
SELECT *
FROM EMP2;

--==>>  ��� :    ���� ���̺� EMP�� �����Ͽ� EMP2 �� �������
/*
7369	SMITH	CLERK	7902	    80/12/17 	800		        20
7499	ALLEN	SALESMAN	7698	81/02/20 	1600	300	    30
7521    	WARD	S   ALESMAN	7698	81/02/22	    1250	    500	    30
7566	JONES	MANAGER	7839	81/04/02    	2975		        20
7654	MARTIN	SALESMAN	7698	81/09/28	    1250    	1400    30
7698	BLAKE	MANAGER	7839	81/05/01	2850		        30
7782	    CLARK	MANAGER	7839	81/06/09	2450		        10
7788	SCOTT	ANALYST	7566	87/07/13	3000	    	20
7839	KING	    PRESIDENT		81/11/17	5000	    	10
7844	TURNER	SALESMAN	7698	81/09/08	1500	0	    30
7876	ADAMS	CLERK	7788	87/07/13	1100		    20
7900	JAMES	CLERK	7698	81/12/03    	950		        30
7902    	FORD	    ANALYST	7566	81/12/03	    3000	    	20
7934	MILLER	CLERK	7782	    82/01/23	    1300		    10
*/

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>>  ��� :    Session��(��) ����Ǿ����ϴ�.


--�� ���̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>  ��� :    Table TBL_EMP��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>>  ��� :    Table TBL_DEPT��(��) �����Ǿ����ϴ�.

--�� ������ ���̺� Ȯ��
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;


-- ���̺� ��ü�� �ּ��� ���� ������, ���̺� ������ �˼� �ִ� ����� 
-- �ڸ�Ʈ ������ �ο�, �����ϴ� �������� �ִ�.
-- DBA�� �ƴϴ��� �� ����صθ� ���� ���ϴ� ����� �������ϴ�.

--�� ���̺� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  ��� : 
/*
DEPT	    TABLE	
EMP	        TABLE	
BONUS	    TABLE	
SALGRADE    	TABLE	
TBL_EXAMPLE1	TABLE	
TBL_EXAMPLE2	TABLE	
EMPCOPY	    TABLE	
EMP2	        TABLE	
TBL_EMP	    TABLE	
TBL_DEPT    	TABLE	
*/

--�� ���̺��� Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '�������';
--==>>  ��� : Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  ��� : 
/*
TBL_DEPT	    TABLE	
TBL_EMP	    TABLE	�������
EMP2	        TABLE	
EMPCOPY 	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	    TABLE	
EMP	        TABLE	
DEPT	    TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է�(TBL_DEPT �� �μ�����)
COMMENT ON TABLE TBL_DEPT IS '�μ�����';
--==>>  ��� : Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>  ��� : 
/*
TBL_DEPT	TABLE	�μ�����
TBL_EMP	TABLE	�������
EMP2	TABLE	
EMPCOPY	TABLE	
TBL_EXAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	TABLE	
BONUS	TABLE	
EMP	TABLE	
DEPT	TABLE	
*/

--�� �÷� ������ Ŀ��Ʈ ���� Ȯ��
-- ���ڵ� ���Ʒ�, �÷� �յ� ��µǴ� ������ ���ǹ��մϴ�. ORDER BY �� ��ȸ�ϴ� �Ը���� ���� �˴ϴ�.
-- �̸��� �̻��ϰ� ������ ��, DROP ���������� �Ϻ� �������κ��� �����뿡 ���� �־ �׷�����.
-- �� ������ ���� ���ְ� �ٽ� ��ȸ������. 
SELECT *
FROM USER_COL_COMMENTS;
--==>>  ��� : ����� ��� �� 
/*
EMP2	            EMPNO	
DEPT	        LOC	
BONUS	        COMM	
SALGRADE	        LOSAL	
EMPCOPY	        ENAME	
EMP2	            COMM	
TBL_EMP	        EMPNO	
EMP	            DEPTNO	
SALGRADE	        HISAL	
EMP	            EMPNO	
TBL_EMP	        DEPTNO	
DEPT	        DEPTNO	
DEPT	        DNAME	
EMPCOPY	        SAL	
TBL_EXAMPLE2	    NO	
EMPCOPY	        HIREDATE	
BONUS	        JOB	
TBL_EXAMPLE1   	NO	
EMP2            	DEPTNO	
EMP	            ENAME	
EMP	            JOB	
TBL_EXAMPLE2	    NAME	
TBL_EMP	        HIREDATE	
BONUS	        SAL	
EMP	            SAL	
TBL_EMP	        ENAME	
EMP2	            ENAME	
TBL_EMP	        COMM	
TBL_EMP	        JOB	
TBL_EXAMPLE1    	NAME	
EMP2            	SAL	
EMP2            	HIREDATE	
TBL_DEPT	        LOC	
EMPCOPY	        EMPNO	
EMPCOPY	        COMM	
EMP	            COMM	
EMP2	            JOB	
TBL_DEPT        	DEPTNO	
SALGRADE        	GRADE	
TBL_EXAMPLE1    	ADDR	
EMP2	            MGR	
TBL_EXAMPLE2    	ADDR	
EMP	            HIREDATE	
TBL_EMP	        MGR	
EMPCOPY	        MGR	
TBL_EMP	        SAL	
EMP	            MGR	
EMPCOPY	        JOB	
TBL_DEPT        	DNAME	
EMPCOPY	        DEPTNO	
BONUS	        ENAME	
*/

--�� ������ ����
PURGE RECYCLEBIN;
--==>>  ��� :    RECYCLEBIN��(��) ��������ϴ�.

--DB������ ���̺� �̸�, �÷��� ������ �ſ� �߿��մϴ�.


--�� ������ ��ȸ
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>  ��� :  
/*
TBL_DEPT    	DEPTNO	
TBL_DEPT	    DNAME	
TBL_DEPT    	LOC	
*/


--�� ���̺� �Ҽӵ�(���Ե�) �÷� ������ Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ���ȣ';
--==>>  ��� :    Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==>>  ��� :    Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ���ġ';
-- Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ������ �Էµ� ���̺��� �÷� ������ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME ='TBL_DEPT';
/*
TBL_DEPT	DEPTNO	�μ���ȣ
TBL_DEPT	DNAME	�μ���
TBL_DEPT	LOC	�μ���ġ
*/

DESC EMP;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)     -- �����ȣ 
ENAME             VARCHAR2(10) -- �����
JOB               VARCHAR2(9)  -- ������
MGR               NUMBER(4)    -- �����ڻ����ȣ
HIREDATE          DATE         -- �Ի���
SAL               NUMBER(7,2)  -- �޿�
COMM              NUMBER(7,2)  -- ����
DEPTNO            NUMBER(2)    -- �μ���ȣ 
*/

--�� TBL_EMP ���̺� �Ҽӵ�(���Ե�) �÷��� ���� Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_EMP.EMPNO IS '�����ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB IS '������';
COMMENT ON COLUMN TBL_EMP.MGR IS '�����ڻ����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';
--Comment��(��) �����Ǿ����ϴ�.
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>  ��� :  
/*
TBL_EMP	EMPNO	�����ȣ
TBL_EMP	ENAME	�����
TBL_EMP	JOB	    ������
TBL_EMP	MGR	    �����ڻ����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	    �޿�
TBL_EMP	COMM	����
TBL_EMP	DEPTNO	�μ���ȣ
*/


--���� �÷� ������ �߰� �� ���� ����--

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ ������ ���� �� �ִ� �÷� �߰�
ALTER TABLE TBL_EMP 
ADD SSN CHAR(13);
--==>>  ��� :    Table TBL_EMP��(��) ����Ǿ����ϴ�.
-- �� �տ� 0�� ���� ���ɼ��� �ִ� ���ڰ� ���յ� �����Ͷ��
-- �������� �ƴ� ���������� ������Ÿ���� ó���ؾ� �Ѵ�.

SELECT 0012121234567
FROM DUAL;
--==>>  ��� :    12121234567 
-- 0 �� ������. �ֹι�ȣ ������ �ƴϰԵ�. 

SELECT '0012121234567'
FROM DUAL;
--==>>  ��� :    0012121234567

--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>>  ��� :    
/*
    EMPNO      ENAME      JOB        MGR    HIREDATE     SAL       COMM       DEPTNO SSN          
---------- ---------- --------- ---------- ---------- ---------- ---------- ---------- 
      7369 SMITH      CLERK           7902 1980-12-17        800                20              
      7499 ALLEN      SALESMAN        7698 1981-02-20       1600    300         30              
      7521 WARD       SALESMAN        7698 1981-02-22       1250    500          30              
      7566 JONES      MANAGER         7839 1981-04-02       2975                 20              
      7654 MARTIN     SALESMAN        7698 1981-09-28       1250    1400         30              
      7698 BLAKE      MANAGER         7839 1981-05-01       2850                    30              
      7782 CLARK      MANAGER         7839 1981-06-09       2450                    10              
      7788 SCOTT      ANALYST         7566 1987-07-13       3000                    20              
      7839 KING       PRESIDENT            1981-11-17       5000                    10              
      7844 TURNER     SALESMAN        7698 1981-09-08       1500          0         30              
      7876 ADAMS      CLERK           7788 1987-07-13       1100                    20              
      7900 JAMES      CLERK           7698 1981-12-03        950                    30              
      7902 FORD       ANALYST         7566 1981-12-03       3000                    20              
      7934 MILLER     CLERK           7782 1982-01-23       1300                    10        
*/

DESC TBL_EMP;
--==>>  ��� :    
/*
�̸�     ��?       ����           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
EMPNO           NUMBER(4)    
ENAME           VARCHAR2(10) 
JOB             VARCHAR2(9)  
MGR             NUMBER(4)    
HIREDATE        DATE         
SAL             NUMBER(7,2)  
COMM            NUMBER(7,2)  
DEPTNO          NUMBER(2)    
SSN             CHAR(13)     
*/
--> ssn�÷��� ���������� �߰��� ��Ȳ���� Ȯ��


SELECT EMPNO, ENAME, SSN, HIREDATE, SAL, COMM
FROM TBL_EMP;
--> ���̺� ������ �÷��� ������ ���������� �ǹ� ����

--�� TBL_EMP ���̺��� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ���� 
-- �߰��� ���� �÷��� ������� ������, ������ ���� �÷����� ������־�� �Ѵ�. 
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>>  ��� :    Table TBL_EMP��(��) ����Ǿ����ϴ�.

--��Ȯ�� 
SELECT *
FROM TBL_EMP;
/*
7369	SMITH	CLERK	7902	    1980-12-17	800		        20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521    	WARD	    SALESMAN	7698	1981-02-22	1250    	500 	30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782	    CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000	    	20
7839	KING	    PRESIDENT		1981-11-17	5000	    	10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD    	ANALYST	7566	1981-12-03	3000	       	20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/

DESC TBL_EMP;
-- SSN COLUMN �����Ǿ���.
--==>>  ��� :    
/*
�̸�       ��? ����           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
*/
--> SSN(�ֹε�Ϲ�ȣ) �÷��� ���������� ���ŵǾ����� Ȯ��

DELETE
FROM TBL_EMP
WHERE ENAME='SMITH';
--==>>  ��� : 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT * 
FROM TBL_EMP;
--==>>  ��� :    SMITH ���� �����Ͱ� �����Ǿ����� Ȯ�� 
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30
7521	    WARD    	SALESMAN	7698	1981-02-22	1250	    500	    30
7566	JONES	MANAGER	7839	1981-04-02	2975		        20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	    1400	30
7698	BLAKE	MANAGER	7839	1981-05-01	2850		        30
7782	    CLARK	MANAGER	7839	1981-06-09	2450		        10
7788	SCOTT	ANALYST	7566	1987-07-13	3000		    20
7839	KING    	PRESIDENT		1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	7788	1987-07-13	1100		    20
7900	JAMES	CLERK	7698	1981-12-03	950		        30
7902	    FORD    	ANALYST	7566	1981-12-03	3000		    20
7934	MILLER	CLERK	7782	    1982-01-23	1300		    10
*/

DELETE TBL_EMP;     -- �������� ����

DELETE
FROM TBL_EMP;       -- ����
--==>>  ��� :    13�� �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_EMP;
--> ���̺��� ������ �״�� �����ִ� ���¿��� 
--  ������ ��� �ҽ�(����)�� ��Ȳ���� Ȯ��

DROP TABLE TBL_EMP;
--==>>  ��� :    Table TBL_EMP��(��) �����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_EMP;
--==>>  ��� :    �����߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
519��, 6������ ���� �߻�
*/


--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>>  ��� :    Table TBL_EMP��(��) �����Ǿ����ϴ�.


-------------------------------------------------------------

--�� NULL �� ó��
-- NULL �� ���� �ƴ� ���� 
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>>  ��� :    2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2, 10+NULL, 10-NULL, 10*NULL, 10/NULL
FROM DUAL;
--==>> (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  (NULL)  


--�� ���� ���
-- NULL�� ������ ���� �ǹ��ϸ� ���� �������� �ʴ� ���̱� ������ 
-- NULL�� ���꿡 ���Ե� ���, ����� ������ NULL �� �ȴ�. 

--�� TBL_EMP ���̺��� Ŀ�̼�(COMM, ����)�� NULL �� ������
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.

SELECT �����, ������, �޿�, Ŀ�̼�
FROM TBL_EMP
WHERE Ŀ�̼��� NULL;

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE Ŀ�̼��� NULL;

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM=NULL;
--==>> ��ȸ ��� ���� ** ���� ����ؾ� �� �κ�

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM=(null);
--==>> ��ȸ ��� ���� ** ��ҹ��� ���о���. (��ȣ)�� ����Ŭ�� �Ȱ��� �����ڿ켱������ �����.

SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM='null';
--==>>  ��� :    ���� �߻� 
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

DESC TBL_EMP;
--> COMM �÷��� ������ ������ Ÿ���� ���ϰ� ������ Ȯ��
/*
    :
COMM        NUMBER(7,2) 
    :
*/


--�� NULL�� ���� �������� �ʴ� ���̱� �빮�� �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--   ��, ������� �� ������ ������ �� ���ٴ� �ǹ��̴�.
--   NULL�� ������� ����� �� ���� �����ڵ�....
--   >=, <=, >, <, ���迬���� !=, ^=, <> �� ��� "�����ʴ�"�� �ǹ�  


SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NULL;
--==>>  ��� :    
/*
SMITH	CLERK	    800	
JONES	MANAGER	    2975	
BLAKE	MANAGER	    2850	
CLARK	MANAGER	    2450	
SCOTT	ANALYST	    3000	
KING	    PRESIDENT	5000	
ADAMS	CLERK	    1100	
JAMES	CLERK	    950	
FORD    	ANALYST	    3000	
MILLER	CLERK	    1300	
*/

--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� �������� 
--   �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP 
WHERE DEPTNO != 20;     -- != ��ſ� ^=, <> �ᵵ �ȴ�. 
-- WHERE DEPTNO = 10 OR DEPTNO = 30
-- WHERE DEPTNO IN (10, 30)
-- �̿Ͱ��� ������ �����ص� ������, 40����..  50����.. �����ȣ�� �߰��Ǹ� �������� ������ �ǹǷ� ����.
-- �������� �ܼ� ��ȸ�� ��ġ�� �ʰ� �߰����� ������ ȹ���� �� �־�� �Ѵ�. 
-- Ư���Ⱓ���� ��ȿ�� ���� �÷�ȭ ��Ű�� ���ǿ� ���� ��� ���� �� �����Ƿ�, �÷�ȭ ���Ѽ� �ȵ�. 
--==>>  ��� :    
/*
ALLEN	SALESMAN	    30
WARD    	SALESMAN	    30
MARTIN	SALESMAN	    30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
KING	    PRESIDENT	10
TURNER	SALESMAN	    30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

--�� TBL_EMP ���̺��� ��ü �μ���ȣ ��ȸ 
SELECT ENAME "�����", JOB "������", DEPTNO "�μ���ȣ"
FROM TBL_EMP;
--==>>  ��� : 
/*
SMITH	CLERK	    20
ALLEN	SALESMAN	    30
WARD    	SALESMAN	    30
JONES	MANAGER	    20
MARTIN	SALESMAN	    30
BLAKE	MANAGER	    30
CLARK	MANAGER	    10
SCOTT	ANALYST	    20
KING	    PRESIDENT	10
TURNER	SALESMAN	    30
ADAMS	CLERK	    20
JAMES	CLERK	    30
FORD    	ANALYST	    20
MILLER	CLERK	    10
*/


--�� TBL_EMP ���̺��� Ŀ�̼��� NULL �� �ƴ� �������� 
--   �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "Ŀ�̼�"
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--WHERE NOT COMM IS NULL;
--==>>  ��� : 
/*
ALLEN	SALESMAN    	1600	 300
WARD	    SALESMAN	    1250	     500
MARTIN	SALESMAN	    1250    	1400
TURNER	SALESMAN	    1500 	   0
*/




--�� TBL_EMP ���̺��� ��� ������� 
--  �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--  ��, �޿�(SAL)�� �ſ� �����Ѵ�.
--  ����, ����(COMM)�� �ų� �����Ѵ�.

SELECT �����ȣ, �����, �޿�, Ŀ�̼�, ??? ���� 
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", ??? "����" 
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", SAL*12 "����" 
FROM TBL_EMP;

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�", SAL*12+COMM "����" 
FROM TBL_EMP;

SELECT 1600*12+300
FROM DUAL;
--==>>  ��� :    19500


--�� NVL()
-- �ڹ��� �޼ҵ� = ����Ŭ�� �Լ�, �ܵ����� �� �� �ִ�. 
-- NULL�� ó���ϴ� �Լ� 
SELECT NULL "��", NVL(NULL, 10)"��", NVL(10, 20)"��"
FROM DUAL;
--==>>  ��� :    (NULL)   10  10 
-->ù ��° �Ķ���� ���� NULL �̸�, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
-- ù ��° �Ķ���� ���� NULL �� �ƴϸ�, �� ���� �״�� ��ȯ�Ѵ�

-- ����
SELECT *
FROM TBL_EMP
WHERE EMPNO=7369;
--==>>  ��� :    7369	SMITH	CLERK	7902 	80/12/17	    800		20

SELECT ENAME, COMM
FROM TBL_EMP
WHERE EMPNO=7369;
--==>>  ��� :    SMITH	(NULL)

SELECT ENAME, NVL(COMM, 0)"Ȯ�ο���"
FROM TBL_EMP
WHERE EMPNO=7369;
--==>>  ��� :    SMITH	   0

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL(COMM, 0)"Ŀ�̼�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP;
--==>>  ��� :
/*
7369	SMITH	 800	0	    9600
7499	ALLEN	1600	300	    19500
7521	    WARD	    1250	    500	    15500
7566	JONES	2975	    0	    35700
7654	MARTIN	1250	    1400	16400
7698	BLAKE	2850	    0	    34200
7782	    CLARK	2450    	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	    5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950 	0	    11400
7902	    FORD	    3000	0	    36000
7934	MILLER	1300	0	    15600
*/


--�� NVL2()
--> ù ��° �Ķ���� ���� NULL�� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
--  ù ��° �Ķ���� ���� NULL�� ���, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.
SELECT ENAME, COMM, NVL2(COMM,'û��÷�', '���÷�')"Ȯ�ο���"
FROM TBL_EMP;
--==>>  ��� :
/*
SMITH		    ���÷�
ALLEN	300	    û��÷�
WARD	    500	    û��÷�
JONES		    ���÷�
MARTIN	1400	û��÷�
BLAKE		    ���÷�
CLARK		    ���÷�
SCOTT		    ���÷�
KING		        ���÷�
TURNER	0	    û��÷�
ADAMS		    ���÷�
JAMES		    ���÷�
FORD		        ���÷�
MILLER		    ���÷�
*/

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL2(COMM, COMM, 0)"Ŀ�̼�"
     , SAL*12+NVL2(COMM, 'F','T')"����"
FROM TBL_EMP;

-- ���� Ǯ���� ����
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL2(COMM, COMM, 0)"Ŀ�̼�"
     , SAL*12+NVL2(COMM, COMM, 0)"����"
FROM TBL_EMP;

-- �Բ� Ǯ���� ����
SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", NVL2(COMM, COMM, 0)"Ŀ�̼�"
     , NVL2(COMM, SAL*12+COMM, SAL*12)"����"
FROM TBL_EMP;
--==>>  ��� :
/*
7369	SMITH	 800	0	    9600
7499	ALLEN	1600	300	    19500
7521    	WARD	    1250 	500	    15500
7566	JONES	2975 	0	    35700
7654	MARTIN	1250 	1400	16400
7698	BLAKE	2850 	0	    34200
7782    	CLARK	2450 	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	    5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950	    0	    11400
7902    	FORD	    3000	0	    36000
7934	MILLER	1300	0	    15600
*/

--�� COALESCE()
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
-- �� �տ� �ִ� �Ű��������� ���ʷ� NULL ���� �ƴ��� Ȯ���Ͽ�
-- NULL�� �ƴ� ��� ����(��ȯ, ó��)�ϰ�,
-- NULL  �� ��쿡�� �� ���� �Ű������� ������ ����(��ȯ, ó��)�Ѵ�.
-- NVL() ��, NVL2()�� ����... ��� ����� ���� ����� �� �ִ� Ư¡�� ���� �ִ�.

SELECT NULL "�⺻Ȯ��"
     , COALESCE(NULL, NULL, NULL, 30) "�Լ� Ȯ��1"
     , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, 100) "�Լ� Ȯ��2"
     , COALESCE(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100) "�Լ� Ȯ��3"
     , COALESCE(NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, 100) "�Լ� Ȯ��4"
FROM DUAL;
--==>>  ��� : 	(NULL)  30	100	10	80

--�� �ǽ��� ���� ������ �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '�¿���', 'SALESMAN', 7839, SYSDATE, 10);
--==>>  1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO)
VALUES(8001, '������', 'SALESMAN', 7839, SYSDATE, 100, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP;

COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT EMPNO "�����ȣ", ENAME "�����", SAL "�޿�", COMM "Ŀ�̼�"
     , COALESCE((SAL*12+COMM), (COMM), (SAL*12), 0)"����"
--                              ---- ������ NULL �̶�� COMM �� ��� 
--                                     ------- Ŀ�̼��� NULL �̶�� SAL�� ��� 
FROM TBL_EMP;
/*
7369	SMITH	800		        9600
7499	ALLEN	1600	300	    19500
7521    	WARD	    1250    	500	    15500
7566	JONES	2975		        35700
7654	MARTIN	1250	    1400	16400
7698	BLAKE	2850		        34200
7782    	CLARK	2450		        29400
7788	SCOTT	3000		    36000
7839	KING	    5000		    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100		    13200
7900	JAMES	950		        11400
7902    	FORD	    3000		    36000
7934	MILLER	1300		    15600
8000	�¿���			            0
8001	������	        100	      100
*/


-----------------------------------------------------------

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==> Session��(��) ����Ǿ����ϴ�.

--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>>
/*
2019-03-27 15:46:13	
2019-03-27 15:46:13	
19/03/27 15:46:13.000000000
*/
--SYSDATE �� ���� ���� ���ϴ�.

--�� ��¥�� ���� ���� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� �÷��� �÷��� ����(����)
--   ����Ÿ�԰� ����Ÿ���� ����
--   ��+�������ڸ� ���� ���� ������ �Ұ��� �� ��||�� 
  
SELECT 1+1
FROM DUAL;

SELECT '�̿���' + '������'
FROM DUAL;
--==>> 
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '�̿���', '������'
FROM DUAL;
--==>> �̿���	������

SELECT '�̿���' || '������'
FROM DUAL;
--==>> �̿���������

SELECT EMPNO, ENAME
FROM TBL_EMP;

SELECT EMPNO || ENAME
FROM TBL_EMP;
--==>> 
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000�¿���
8001������
*/

--      ����Ÿ��    ��¥Ÿ�� ����Ÿ�� ����Ÿ�� ����Ÿ�� 
--     ---------  --------  -------  ----  -------------
SELECT '�����̴�', SYSDATE, '�� ����', 500, '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�	2019-03-27	�� ����	500	���� ���Ѵ�.

--
--      ����Ÿ��    ��¥Ÿ�� ����Ÿ�� ����Ÿ�� ����Ÿ�� 
--     ---------  --------  -------  ----  -------------
SELECT '�����̴�'|| SYSDATE || '�� ����' || 500 || '���� ���Ѵ�.'
FROM DUAL;
--==>> �����̴�2019-03-27�� ����500���� ���Ѵ�.

--�� ����Ŭ������ ����Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ������ ó���� ����ó�� ��||���� �������ָ� ������ �÷��� �÷��� 
--   (���� �ٸ� ������ ������) �����ϴ� ���� �����ϴ�.
--   MSSQL������ ��� �����͸� ����Ÿ������ CONVERT �ؾ� �Ѵ�.

--�� TBL_EMP ���̺� ������ Ȱ���Ͽ� 
--   ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.

--   SMITH �� ���� ������ 9600�ε� ��� ������ 19200�̴�.
--   ALLEN �� ���� ������ 19500���� ��� ������ 39000�̴�.
--                        :

SELECT *
FROM TBL_EMP
WHERE EMPNO IN (8000, 8001);


DELETE
FROM TBL_EMP
WHERE EMPNO IN (8000, 8001);
--==>> 2�� �� ��(��) �����Ǿ����ϴ�.

COMMIT;
--==>> Ŀ�� �Ϸ�.

--���� Ǯ���� ����
SELECT ENAME || ' �� ���� ������' || NVL2(COMM, SAL*12+COMM, SAL*12) || '�ε� ��� ������ ' || NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;

--�Բ� Ǯ���� ����
--���1
SELECT ENAME || ' �� ���� ������' || NVL(SAL*12+COMM, SAL*12) || '�ε� ��� ������ ' || NVL(SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;

--���2
SELECT ENAME || ' �� ���� ������' || NVL2(COMM, SAL*12+COMM, SAL*12) || '�ε� ��� ������ ' || NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '�̴�.'
FROM TBL_EMP;

--���3
SELECT ENAME || ' �� ���� ������' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0) || '�ε� ��� ������ ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '�̴�.'
FROM TBL_EMP;

--==>>  ��� :
/*
SMITH �� ���� ������9600�ε� ��� ������ 19200�̴�.
ALLEN �� ���� ������19500�ε� ��� ������ 39000�̴�.
WARD �� ���� ������15500�ε� ��� ������ 31000�̴�.
JONES �� ���� ������35700�ε� ��� ������ 71400�̴�.
MARTIN �� ���� ������16400�ε� ��� ������ 32800�̴�.
BLAKE �� ���� ������34200�ε� ��� ������ 68400�̴�.
CLARK �� ���� ������29400�ε� ��� ������ 58800�̴�.
SCOTT �� ���� ������36000�ε� ��� ������ 72000�̴�.
KING �� ���� ������60000�ε� ��� ������ 120000�̴�.
TURNER �� ���� ������18000�ε� ��� ������ 36000�̴�.
ADAMS �� ���� ������13200�ε� ��� ������ 26400�̴�.
JAMES �� ���� ������11400�ε� ��� ������ 22800�̴�.
FORD �� ���� ������36000�ε� ��� ������ 72000�̴�.
MILLER �� ���� ������15600�ε� ��� ������ 31200�̴�.
*/
SELECT *
FROM TBL_EMP;


--�������� �����ϱ�
--               --'' Ȭ����ǥ �ΰ��� �ϳ�ó�� ����Ѵ�. 
SELECT ENAME || '''s �Ի����� ' || HIREDATE || '�̴�. �׸��� �޿��� ' || SAL || '�̴�.'
FROM TBL_EMP;
/*
SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
WARD's �Ի����� 1981-02-22�̴�. �׸��� �޿��� 1250�̴�.
JONES's �Ի����� 1981-04-02�̴�. �׸��� �޿��� 2975�̴�.
MARTIN's �Ի����� 1981-09-28�̴�. �׸��� �޿��� 1250�̴�.
BLAKE's �Ի����� 1981-05-01�̴�. �׸��� �޿��� 2850�̴�.
CLARK's �Ի����� 1981-06-09�̴�. �׸��� �޿��� 2450�̴�.
SCOTT's �Ի����� 1987-07-13�̴�. �׸��� �޿��� 3000�̴�.
KING's �Ի����� 1981-11-17�̴�. �׸��� �޿��� 5000�̴�.
TURNER's �Ի����� 1981-09-08�̴�. �׸��� �޿��� 1500�̴�.
ADAMS's �Ի����� 1987-07-13�̴�. �׸��� �޿��� 1100�̴�.
JAMES's �Ի����� 1981-12-03�̴�. �׸��� �޿��� 950�̴�.
FORD's �Ի����� 1981-12-03�̴�. �׸��� �޿��� 3000�̴�.
MILLER's �Ի����� 1982-01-23�̴�. �׸��� �޿��� 1300�̴�.
*/

--�� ���ڿ��� ��Ÿ���� Ȧ����ǥ ���̿���(���۰� ��)
--   Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�. 
--   Ȭ����ǥ ��'�� �ϳ��� ���ڿ��� ������ ��Ÿ����
--   Ȭ����ǥ ��''���� ���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--   �ٽ� �����ϴ� Ȭ����ǥ ��'�� �ϳ��� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.

--�÷��� Ȯ��
SELECT *
FROM TBL_EMP;
