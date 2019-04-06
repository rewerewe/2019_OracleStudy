

--1.
SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM EMP
WHERE JOB = 'salesman';
--==>> ��ȸ ��� ����

--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "1", UPPER('oRaCLe') "2", LOWER ('oRaCLe') "3", INITCAP('oRaCLe') "4"
FROM DUAL;
--==>>  ���� :    oRaCLe	ORACLE	oracle	Oracle 
-- UPPER()�� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
-- LOWER()�� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
-- INITCAP() ��  ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ 

SELECT *
FROM EMP
WHERE EMPNO ='�Է°�';
--'�Է°�' �� �̸� ����������

SELECT *
FROM EMP
WHERE EMPNO=UPPER('�Է°�');

SELECT *
FROM EMP
WHERE EMPNO=UPPER('SaLSemAn');

SELECT *
FROM EMP
WHERE UPPER(JOB) = UPPER('SalEsmAn');

SELECT *
FROM EMP
WHERE LOWER(JOB) = LOWER('SalEsmAn');

SELECT *
FROM EMP
WHERE INITCAP(JOB) = INITCAP('SalEsmAn');

--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������ 
-- �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.
SELECT �����, ������, �Ի��� 
FROM TBL_EMP
WHERE �Ի����� 1981�� 9�� 28��;

SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���" 
FROM TBL_EMP
WHERE �Ի����� 1981�� 9�� 28��;

SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���" 
FROM TBL_EMP
WHERE HIREDATE='1981-09-28';
--             ------------ ��¥Ÿ�� �ƴ� ����Ÿ��
--==>> MARTIN	SALESMAN    	81/09/28
-- ����� ��ȸ������, Ʋ�� �������̴�. 
-- ���� �� ��¥ ��ȯ�ؾ��� �� ����Ŭ�� �ڵ�����ȯ�� ���ݴϴٸ�, ���̸� ������� ������ ���� �����Ϳ� �ǹ̰� ����.
-- � ���� �ڵ�����ȯ�� �̷�������, � ���� �̷����� ���� �� �ִ�.
-- �ڹٴ� �ϰ������� �����ϴ� �� ����, ����Ŭ�� �ƴϹǷ� �ڵ�����ȯ�� ������� ���ô�.

--�� TO_DATE()
-- ���ڿ��� ��¥Ÿ������ ��ȯ
-- ����Ŭ���� ��¥�� ũ��񱳰� �����ϴ�. 
SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28','YYYY-MM-DD');


--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)�� �Ի��� ������ 
-- �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.


SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>  ��� : 
/*
MARTIN	SALESMAN	    81/09/28
SCOTT	ANALYST	    87/07/13
KING	    PRESIDENT	81/11/17
ADAMS	CLERK	    87/07/13
JAMES	CLERK	    81/12/03
FORD	    ANALYST	    81/12/03
MILLER	CLERK	    82/01/23
*/

--�� ����Ŭ������ ��¥ �������� ũ��񱳰� �����ϴ�.
--   ����Ŭ���� ��¥ �����Ϳ� ���� ũ�� �� �� 
--   ���ź��� �̷��� �� ū ������ �����Ͽ� ó���Ѵ�.(���ĵ� ����) 

--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�Ϻ���
--   1981�� 9�� 28�� ���̿� �Ի��� �������� 
--   �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)
-- ���� Ǯ���� ���� 
SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP 
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') && HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD')
-- ����Ŭ���� �̷� ǥ���� ������� �ʴ´�.

-- �Բ� Ǯ���� ���� 
SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP 
WHERE HIREDATE TO_DATE('1981-04-02', 'YYYY-MM-DD') ����
      HIREDATE TO_DATE('1981-09-28', 'YYYY-MM-DD') ����;
      
SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP 
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD')
  AND HIREDATE  <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>  ��� :
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN    	81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN    	81/09/08
*/




-- 2. 
--�� BETWEEN �� AND ��
-- ��¥Ÿ�� �� �ƴ϶�, ����Ÿ�Կ��� �����Ͽ� ��밡�� 
SELECT ENAME"�����", JOB"������", HIREDATE"�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') 
                   AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
                   
-- ���� ���� ��� ��ȯ��
--==>>  ��� :
/*
JONES	MANAGER	    81/04/02
MARTIN	SALESMAN	    81/09/28
BLAKE	MANAGER	    81/05/01
CLARK	MANAGER	    81/06/09
TURNER	SALESMAN	    81/09/08
*/
SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 2000 AND 3000;
--==>>  ��� :
/*
7566	JONES	MANAGER	7839	81/04/02    	2975	    	20
7698	BLAKE	MANAGER	7839	81/05/01	2850	    	30
7782	    CLARK	MANAGER	7839	81/06/09	2450	    	10
7788	SCOTT	ANALYST	7566	87/07/13	3000		20
7902	    FORD	    ANALYST	7566	81/12/03	    3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
-- Ʋ�� �������� �ȴ�. SMITH, SCOTT�� ��ȸ�ȵ�.
-- ������ �迭�� �����Ѵ�. C...CA...CS ���� ������ ��.
-- S�� ���� �޺κп� �־� ��ȸ���� �ʴ´�.


SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
-- �ƽ�Ű�ڵ忡�� ���� �빮�� �� �ҹ��� ������ �Ǿ��ִ�.
-- �빮�� C���� �ҹ��� s������ �������� ��ȸ�ȴ�.

--�� BETWEEN �� AND �� �� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--  ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������
--  �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--  ����, BETWEEN �� AND �δ� �������� ����Ǵ� ��������
--  ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ������ ó���ȴ�. 

-- ASCII()
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('b')
FROM DUAL;
--==>>  ��� :    65  	66	97	98





--�� TBL_EMP ���̺��� ������ SALSEMAN �� CLERK �� ����� 
--  �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
--���� Ǯ���� ����
SELECT ENAME"�����", JOB"������", SAL"�޿�"
FROM TBL_EMP
WHERE JOB='SALSEMAN'
   OR JOB='CLERK'
-- ������ �߰��ص� �����ϴ�. 
   OR JOB='MAAGER';

--�Բ� Ǯ���� ����
SELECT ENAME"�����", JOB"������", SAL"�޿�"
FROM TBL_EMP
WHERE JOB IN ('SALSEMAN', 'CLERK');

SELECT ENAME"�����", JOB"������", SAL"�޿�"
FROM TBL_EMP
WHERE JOB =ANY ('SALSEMAN', 'CLERK','MAAGER');  -- cf. ��ALL��

--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�. 
-- ������, �� ���� �������� ���� ������ ó���ȴ�.
-- ����, �޸𸮿� ���� ������ �ƴ϶� CPU�� ���� �����̹Ƿ�
-- �� �κб��� �����Ͽ� �������� ������ �����ϴ� ���� ���� �ʴ�.
-- �� ��IN�� �� ��=ANY���� ���� ������ ȿ���� ������.
--  ��� ���������δ� ��OR�������� ����Ǿ� ���� ó���ȴ�.

--------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
( SANO      NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN     CHAR(13)
, HIREDATE  DATE DEFAULT SYSDATE
, SAL       NUMBER(10)
);
--==>>  ��� :    Table TBL_SAWON��(��) �����Ǿ����ϴ�.


SELECT *
FROM TBL_SAWON;

DESC TBL_SAWON;
--==>>  ��� :    
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAEM      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10) 
*/

--�� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '�̿���', '8706241234567', TO_DATE('2001-01-03', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '���ֿ�', '9405022234567', TO_DATE('2010-11-05', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '9710012234567', TO_DATE('1999-08-16', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '��ȫ��', '9504102234567', TO_DATE('1997-11-05', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '�̺��', '7210101234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '������', '8004271234567', TO_DATE('1998-02-02', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '������', '0405062234567', TO_DATE('2010-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '0506074234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '0505053234567', TO_DATE('2011-07-15', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '���켱', '9505052234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '������', '7512122234567', TO_DATE('1999-11-11', 'YYYY-MM-DD'), 5000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '������', '9302132234567', TO_DATE('2010-11-11', 'YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '���ü�', '7202021234567', TO_DATE('1992-10-10', 'YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '����', '6912121234567', TO_DATE('1987-10-10', 'YYYY-MM-DD'), 4000);

DELETE 
FROM TBL_SAWON
WHERE SANAME ='����';

--==>>  ��� :    1 �� ��(��) ���ԵǾ����ϴ�. * 14

SELECT *
FROM TBL_SAWON;
--==>>  ��� :    
/*
1001	�̿���	8706241234567	01/01/03	3000
1002    	���ֿ�	9405022234567	10/11/05	2000
1003	������	9710012234567	99/08/16	5000
1004	��ȫ��	9504102234567	97/11/05	4000
1005	�̺��	7210101234567	98/02/02	    2000
1006	������	8004271234567	98/02/02	    2000
1007	������	0405062234567	10/07/15	1000
1008	������	0506074234567	11/07/15	1000
1009	������	0505053234567	11/07/15	3000
1010	���켱	9505052234567	99/11/11	4000
1011	������	7512122234567	99/11/11	5000
1012	    ������	9302132234567	10/11/11	3000
1013	���ü�	7202021234567	92/10/10	    2000
1014	����  	6912121234567	81/10/10	4000
*/

--��Ŀ��
COMMIT;
--Ŀ�� �Ϸ�.

--�� TBL_SAWON ���̺��� �̿��� ����� ������ ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '�̿���';
--==>>  ��� :    1001	�̿���	8706241234567	01/01/03	3000

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '�̿���';
--==>>  ��� :    1001	�̿���	8706241234567	01/01/03	3000

-- LIKE : ���� �� �����ϴ�
--        �λ� �� ~�� ����, ~ó��

--�� WILD CHARACTER �� ��%��
--   ��LIKE�� �� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE�� �� �Բ� ���Ǵ� ��_���� �ƹ� ���� 1���� �ǹ��Ѵ�. 

--�� TBL_SAWON ���̺��� ������ ���̡����� ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='��';
--==>>  ��� :    ��ȸ ��� ���� 

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME='��__';
--==>>  ��� :    ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��';
--==>>  ��� :    ��ȸ ��� ����

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>  ��� : 
/*
�̿���	8706241234567	3000
�̺��	7210101234567	2000
������	0405062234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>  ��� : 
/*
�̿���	8706241234567	3000
�̺��	7210101234567	2000
������	0405062234567	1000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>  ��� : 
/*
������	9302132234567	3000
���ü�	7202021234567	2000
����  	6912121234567	4000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>>  ��� :
-- ����	6912121234567	4000


SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>  ��� :
/*
������	9302132234567	3000
���ü�	7202021234567	2000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ���񡻷� 
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.

SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--==>>  ��� :
/*
������	9710012234567	99/08/16	5000
��ȫ��	9504102234567	97/11/05	4000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ���̡��� 
--   ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '__��';
--==>>  ��� :
-- ������	0405062234567	10/07/15	1000
-- ��
-- _ (�����)�� ����ϸ� ���ڼ��� ����ϰ� �Ǵµ� �̷��� ��µǸ� �ȵȴ�. 
-- 1���� �ƴ� ��θ� ��ȸ�ϴ� % ����ϱ�
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>  ��� :
/*
������	0405062234567	10/07/15	1000
����	    6912121234567	87/10/10	4000
*/

--�� ������ �߰� �Է� 
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '���̰�', '8410141234567', TO_DATE('1997-10-10', 'YYYY-MM-DD'), 5000);
--==>>  ��� :    1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ŀ��
COMMIT;
--Ŀ�� �Ϸ�.

--�� TBL_SAWON ���̺��� ��� �̸� �ȿ� ���̡���� ���ڰ� 
--   �ϳ��� ���ԵǾ� ������ �� ����� 
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>  ��� :    
/*
1001	�̿���	01/01/03	3000
1005	�̺��	98/02/02    	2000
1007	������	10/07/15	1000
1008	������	11/07/15	1000
1014	����	    87/10/10	4000
1015	���̰�	97/10/10	5000
*/

--�� TBL_SAWON ���̺��� ��� �̸� �ȿ� ���̡���� ���ڰ� 
--   �� �� ���ԵǾ� ������ �� ����� 
--   �����ȣ, �����, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
-- ���� Ǯ���� ����
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%��%';
--==>>  ��� : 
/*
1007	������	10/07/15	1000
1015	���̰�	97/10/10	5000
*/

-- �Բ� Ǯ���� ����
SELECT SANO, SANAME, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';  -- ���̡��� ���������� �� �� ����ִ� ������ ��ȸ 

--�� TBL_SAWON ���̺��� ������ ������ ����� 
--   �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>  ��� :
/*
������	9302131234567	3000
���ü�	7202021234567	2000
����	    6912121234567	4000
*/

-- ��������� �� ������ ���� ���� ������. �ذ��� ���� ����. 
-- ��ȸ��� '���ü�'�� �ִµ�, �� ����� ���� �ϼ���, ���þ� �ϼ��� �ִ�.
-- �̸� �� �� ���⿡ �̴� ���̺� ���谡 �߸��� ���̶� �� �� �ִ�. 
-- ���̺��� ������ �� ���� �̸��� �и��ؼ� �Է� �޾ƾ� �Ѵ�. �÷��� �и��� ��.

--�� �����ͺ��̽� ���� �� ���� �̸��� �и��ؼ� ó���ؾ� ��
--   ���� ��ȹ�� �ִٸ�(���� ������ �ƴϴ���) ���̺��� �� �÷��� 
--   �̸� �÷��� �и��Ͽ� �����ؾ� �Ѵ�.



--�� TBL_SAWON ���̺��� ���������� �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' 
   OR JUBUN LIKE '______4______';
--==>>  ��� :    
/*
���ֿ�	9405022234567	2000
������	9710012234567	5000
��ȫ��	9504102234567	4000
������	0405062234567	1000
������	0506074234567	1000
���켱	9505052234567	4000
������	7512122234567	5000
*/


-- �Բ� Ǯ���� ����
SELECT �����, �ֹι�ȣ, �޿� 
FROM TBL_SAWON
WHERE ������;

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE ������; -- �ֹι�ȣ�÷����� �Ǻ�
/*
WHERE �ֹι�ȣ�÷��� 7��° �ڸ� 1���� 2
      �ֹι�ȣ�÷��� 7��° �ڸ� 1���� 4;
      
WHERE JUBUN LIKE '______2'
      JUBUN LIKE '______4';            -- 7�ڸ� ���ڸ� �ǹ��ϹǷ� ��ȸ���� �ʴ´�. 
      
WHERE JUBUN LIKE '______2______'
      JUBUN LIKE '______4______';      -- ��ȿ�� ���鿡�� ���� �ڸ����� �������ִ� �� �� ����. 
      
WHERE JUBUN LIKE '______2%'
      JUBUN LIKE '______4%';           -- �̷��Ե� ������. 
*/

--�� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
( WATCH_NAME    VARCHAR(20)
, BINGO         VARCHAR(100)
);
--==>>  ��� :    Table TBL_WATCH��(��) �����Ǿ����ϴ�.


--�� ������ �Է�
INSERT INTO TBL_WATCH VALUES ('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH VALUES ('���ð�', '�� ������ 99.99���� ȹ���� �ð�');
--==>>  ��� :    1 �� ��(��) ���ԵǾ����ϴ�. * 2

--�� Ŀ��
COMMIT;
--==>>  ��� :    Ŀ�� �Ϸ�.

--�� TBL_WATCH ���̺��� BINGO �÷���
--   ��99.99%�� ��� ���ڰ� ����ִ� ��(���ڵ�)�� ������ ��ȸ�Ѵ�.
-- ���� Ǯ���� ����
SELECT *
FROM TBL_WATCH 
WHERE BINGO LIKE '%99.99%%%';

-- �Բ� Ǯ���� ����
SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '99.99%';
--==>> ��ȸ ��� ����

SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99%%';
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99\%%' ESCAPE '\';        -- Ż���Ű�� ��. ���󵵰� ���� ���� Ư�����ڸ� ����ϸ� �˴ϴ�. 
--==>>  ��� :    �ݽð�	���� 99.99% ������ �ְ�� �ð�


SELECT *
FROM TBL_WATCH
WHERE BINGO LIKE '%99.99$%%' ESCAPE '$';
--==>>  ��� :    �ݽð�	���� 99.99% ������ �ְ�� �ð�


--�� ESCAPE �� ���� ������ ���� �� ���ڴ� ���ϵ�ĳ���Ϳ��� Ż����Ѷ�....
--   ��ESCAPE '\'��
--   �Ϲ������� ���󵵰� ���� Ư������(Ư����ȣ)�� ����Ѵ�.

--------------------------------------------------------------------------

--���� COMMIT / ROLLBACK ����-- 

SELECT *
FROM TBL_DEPT;
--==>>  ��� :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� ������ �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');
--==>>  ��� :    1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>  ��� :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ� 	    ����
*/

-- 50   ���ߺ�     ����
-- �� �����ʹ� TBL_DEPT ���̺��� ����Ǿ� �ִ�
-- �ϵ��ũ�� ���������� ����Ǿ� ����� ���� �ƴ϶�
-- �޸�(RAM) �� �Էµ� ���̴�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;

--�� �ѹ� 
ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>  ��� :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH    	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/
-- 50... ���ߺ�... ����... �� ���� �����Ͱ� �ҽǵǾ����� Ȯ��(�������� ����)

--�� �ٽ� �Է�
INSERT INTO TBL_DEPT VALUES(50, '���ߺ�', '����');

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ŀ�� ���� �ٽ� Ȯ�� 
SELECT *
FROM TBL_DEPT;
--==>>  ��� :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>  ��� :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ� 
-- 50��... ���ߺ�... ����... �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT �� ������ ���ķ� DML ����(INSERT, UPDATE, DELETE)�� ����
--   ����� �����͸� ����� �� �ִ� ���� ��...
--   DML ����� ����� �� COMMIT �ϰ��� ROLLBACK �� �����غ���
--   ���� ���·� �ǵ��� �� ����. (�ƹ��� �ҿ��� ����.)

--�� ������ ����(TBL_DEPT)
                                -- �ۼ����� 
UPDATE TBL_DEPT                 -- ��
SET DNAME='������', LOC='��õ'   -- ��
WHERE DEPTNO=50;                -- �� �����ϰ��� �ϴ� ���� 
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_DEPT;
--==>>  ��� :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	������	    ��õ
*/


--�۷ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

SELECT *
FROM TBL_DEPT;
--==>>  ��� :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/
--> ����(UPDATE)�� �����ϱ� ���� ���·� �����Ǿ����� Ȯ��



--��UPDATE ������ ���� 
/*
UPDATE ���̺� �� 
SET �÷�1 = '�Է��� ��'
WHERE ����;
*/

UPDATE TBL_SAWON
SET JUBUN = '9302131234567' 
WHERE SANAME='������';
--==>>  ��� :    1 �� ��(��) ������Ʈ�Ǿ����ϴ�.



--�� ������ ����(DELETE)
SELECT *
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 50	���ߺ�	����

DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_DEPT;
--==>>  ��� :    
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	    DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

SELECT *
FROM TBL_DEPT;
--==>>  ��� :
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH    	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/


-- DML ������ CTRL+S ���θ� �Ǵ��ؼ� ó���Ѵ�.
-- �׷��� AUTO COMMIT �Ǵ� ��.

/*
1. ABC ���̺� ����
2. ABC ���̺� ������ �Է�
3. Ŀ��
4. ABC ���̺��� ������ ����
5. ABC ���̺� ���� - AUTO COMMIT
*/


--------------------------------------------------------------
--���� ����(ORDER BY) �� ����--

SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP;
/*
SMITH	20	CLERK	          800	 9600
ALLEN	30	SALESMAN	    1600	    19500
WARD	    30	SALESMAN    	1250	        15500
JONES	20	MANAGER	    2975	        35700
MARTIN	30	SALESMAN	    1250	        16400
BLAKE	30	MANAGER	    2850	        34200
CLARK	10	MANAGER	    2450	        29400
SCOTT	20	ANALYST	    3000	    36000
KING	    10	PRESIDENT	5000	    60000
TURNER	30	SALESMAN    	1500	    18000
ADAMS	20	CLERK	    1100	    13200
JAMES	30	CLERK	          950	11400
FORD	    20	ANALYST	    3000	    36000
MILLER	10	CLERK	    1300	    15600
*/

SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY COMM;
/*
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
WARD	    30	SALESMAN	1250	    15500
MARTIN	30	SALESMAN	1250	    16400
SCOTT	20	ANALYST	3000	36000
KING	    10	PRESIDENT5000	60000
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	 950	11400
FORD    	20	ANALYST	3000	36000
MILLER	10	CLERK	1300	15600
BLAKE	30	MANAGER	2850	    34200
JONES	20	MANAGER	2975	    35700
SMITH	20	CLERK	 800	 9600
CLARK	10	MANAGER	2450	    29400
*/


SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY COMM ASC; 

-- ����Ŭ������ NULL ���� ���� ū ������ �����Ͽ� ó���Ѵ�.

SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY DEPTNO ASC;   -- ASC : �������� �� ��������-!!!


SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY DEPTNO DESC;   -- DESC : �������� �� �����Ұ�-!!!
/*
BLAKE	30	MANAGER	    2850	    34200
TURNER	30	SALESMAN	    1500	18000
ALLEN	30	SALESMAN	    1600	19500
MARTIN	30	SALESMAN	    1250    	16400
WARD    	30	SALESMAN	    1250	    15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	3    5700
SMITH	20	CLERK	     800     9600
ADAMS	20	CLERK	    1100	13200
FORD	    20	ANALYST	    3000	36000
KING	    10	PRESIDENT    5000   60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450    	29400
*/


SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY ���� DESC;

-- ORDER BY ������ SELECT ���� ���� ó���Ǳ� ������
-- �÷��� ��� SELECT ������ ����� ALIAS(��Ī) ��
-- ORDER BY ������ ����ص� ������ �߻����� �ʴ´�. (�����ϴ�.)

SELECT ENAME"�����", DEPTNO"�μ���ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY �μ� ��ȣ DESC;
--==>> ���� �߻�


SELECT *
FROM TBL_EMP;


SELECT ENAME"�����", DEPTNO"�μ� ��ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY "�μ� ��ȣ" DESC;

/*
BLAKE	30	MANAGER	    2850 	34200
TURNER	30	SALESMAN    	1500	18000
ALLEN	30	SALESMAN	    1600	19500
MARTIN	30	SALESMAN	    1250	    16400
WARD	    30	SALESMAN    	1250	    15500
JAMES	30	CLERK	     950	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	    35700
SMITH	20	CLERK	     800	 9600
ADAMS	20	CLERK	    1100	13200
FORD	    20	ANALYST	    3000	36000
KING	    10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	    29400
*/


SELECT ENAME"�����", DEPTNO"�μ� ��ȣ", JOB"����", SAL"�޿�"
     , SAL*12+NVL(COMM, 0)"����" 
FROM TBL_EMP
ORDER BY 2;         -- �����ϸ� ���������� ����
-- ORDER BY�� 2�� SELECT�� DEPTNO�� �������� 2��°�� ����. 
--> TBL_EMP ���̺��� ���� �ִ� ���̺��� ������ �÷� ������ �ƴ϶�
-- SELECT ó�� �Ǵ� �� ��° �÷�(��, DEPTNO)�� �������� ���ĵǴ� ���� Ȯ��
-- ASC ������ ���� �� �������� ���ĵǴ� ���� Ȯ��

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4;      -- DEPTNO ���� 1�� ����, SAL ���� 2�� ���� ... ASC 
--1�� ������ DEPTNO, 2�� ������ SAL �� �ش޶�.
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/



SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;
-- 1) DEPTNO(�μ���ȣ) ���� �������� ����
-- 2) JOB(������) ���� �������� ����
-- 3) SAL(�޿�) ���� �������� ����
-- (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	1300
CLARK	10	MANAGER	2450
KING	    10	PRESIDENT	5000
SCOTT	20	ANALYST	3000
FORD	    20	ANALYST	3000
ADAMS	20	CLERK	1100
SMITH	20	CLERK	800
JONES	20	MANAGER	2975
JAMES	30	CLERK	950
BLAKE	30	MANAGER	2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
WARD	    30	SALESMAN	1250
*/



------------------------------------------------------------------------------
-- 14:00
--�� CONCAT()
-- ���ڿ� �����ϴ� �Լ� 
SELECT '������' || '������' "��"
     , CONCAT('������', '������') "��"
FROM DUAL;
--==>> ������������	������������

SELECT ENAME||JOB"��"
    , CONCAT(ENAME, JOB) "��"
FROM TBL_EMP;
/*
SMITHCLERK	SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	ADAMSCLERK
JAMESCLERK	JAMESCLERK
FORDANALYST	FORDANALYST
MILLERCLERK	MILLERCLERK
*/

-- CONCAT()�� ���ڿ� ���� �Լ�������, �� ���� ���Ǹ� ������ �� �ִ�.
SELECT ENAME || JOB || DEPTNO "��"
     , CONCAT(ENAME, JOB, DEPTNO)"��"
FROM TBL_EMP;
-- �����߻�
--> 2���� ���ڿ��� ���ս����ִ� ����� ���� �Լ�.
-- ������ 2���� ���ս�ų�� �ִ�. 


FROM TBL_EMP
--> �������� �� ��ȯ�� �Ͼ�� ������ �����ϰ� �ȴ�.
-- CONCAT()�� ���ڿ��� ���ڿ��� ���ս����ִ� �Լ�������
-- ���������δ� ���ڳ� ��¥�� ����Ÿ������ �ٲپ��ִ� ������ ���ԵǾ� �ִ�.


---------------------------------------------------------------------------
/*
obj.substring()
---
��
���ڿ�.substring(n, m);
                n���� m-1����... (0���� �����ϴ� �ε��� ����)
                �ڹٴ� �Ѵ� �ε����� 
*/

--�� SUBSTR() / SUBSTRB()
--   -----     -------
--  �������  ����Ʈ���    �� �ڹ��� substring �� ����Ŭ�� substring �� �� �����ؼ� ����ص� ��. (�򰥸��ϴ�)

-- ���ڿ� ���� �Լ� 

SELECT ENAME"��"
     , SUBSTR(ENAME, 1, 2)"��"
     , SUBSTR(ENAME, 2, 2)"��"
     , SUBSTR(ENAME, 3, 2)"��"
     , SUBSTR(ENAME, 2)"��"
FROM TBL_EMP;
-->> ���ڿ��� �����ϴ� ����� ���� �Լ�
--   �ڹٰ� 0���� �����ߴ� �Ͱ� �޸�, ����Ŭ�� 1���� �����Ѵ�. 
--   ù ��° �Ķ���� ���� ��� ���ڿ�(������ ���) 
--   �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(��, �ε����� 1���� ����) 
--   �� ��° �Ķ���� ���� ������ ���ڿ��� ����(������... ������ġ���� ������)
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/

--�� TBL_SAWON ���̺��� ������ ������ �����
-- �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
-- ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�
-- �޿� �������� �������� ������ ������ �� �ֵ��� �Ѵ�.
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) = '1' 
   OR SUBSTR(JUBUN, 7, 1) = '3'
ORDER BY SAL DESC; 
-- ����Ŭ�� �ڵ�����ȯ ��Ģ�� ���������, ������ݽô�. 
--==>>  ��� :
/*
1015	���̰�	8410141234567	5000
1014	����	    6912121234567	4000
1001	�̿���	8706241234567	3000
1009	������	0505053234567	3000
1012	    ������	9302131234567	3000
1013	���ü�	7202021234567	2000
1005	�̺��	7210101234567	2000
1006	������	8004271234567	2000
*/
-- Ȯ�� 
SELECT *
FROM TBL_SAWON;

-- IN �̳� =ANY �� ����ص� �ȴ�. 
SELECT SANO, SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7, 1) IN ('1', '3')
ORDER BY SAL DESC; 
/*
1015	���̰�	8410141234567	5000
1014	����  	6912121234567	4000
1001	�̿���	8706241234567	3000
1009	������	0505053234567	3000
1012	    ������	9302131234567	3000
1013	���ü�	7202021234567	2000
1005	�̺��	7210101234567	2000
1006	������	8004271234567	2000
*/

SELECT *
FROM TBL_SAWON;

--�� LENGTH() / LENGTHB()
--   -------   ---------
-- ���ڰ������ ����Ʈ���
-- ����Ʈ ����� �ѱ��� ��� �ſ� ó���ϱ� ���������.

SELECT ENAME"��"
     , LENGTH(ENAME)"��"
     , LENGTHB(ENAME)"��"
FROM TBL_EMP;
-->> LENGTH()�� ���� ���� ��ȯ, LENGTHB()�� ����Ʈ ���� ��ȯ
--==>>  ��� : 
/*
SMITH	5	5
ALLEN	5	5
WARD    	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	    4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD    	4	4
MILLER	6	6
*/

SELECT '�̿���'"��"
     , LENGTH('�̿���')"��"
     , LENGTHB('�̿���')"��"
FROM DUAL;
--==>> �̿���	3	9

SELECT *
FROM NLS_DATABASE_PARAMETERS;

--�� INSTR()
-- ��ġ���� ��ȯ�ϴ� �Լ� 
SELECT 'ORACLE ORAHOME BIORA'"��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1)"��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2)"��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1)"��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2)"��"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2)"��"
FROM DUAL;
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����... (��� ���ڿ�)
--  �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�-!!!
--  �� ��° �Ķ���� ���� ã�� �����϶�.(��, ��ĵ�� �����ϴ�) ��ġ
--  �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ���� (1�� ��������) �� ������ �뿡 �ش�.(��, ��� ����)

SELECT '���ǿ���Ŭ �����ο��� �մϴ�'"��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 1)"��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 2)"��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 10)"��"
     , INSTR('���ǿ���Ŭ �����ο��� �մϴ�', '����', 11)"��"
                                                  ---
--                                        ã�� �����ϴ� ��ġ 
FROM DUAL;
-- ������ �Ķ��ó(�� ��° �Ķ����) ���� ������ ���·� ���-!!! �� 1 
--==>> ��� :     ���ǿ���Ŭ �����ο��� �մϴ�	    3	3	10	0



--�� REVERSE()
--  ���ڿ� ���� 
SELECT 'ORACLE'"��"
     , REVERSE('ORACLE')"��"
     , REVERSE('����Ŭ')"��"
FROM DUAL;
--==>> ��� :     ORACLE	    ELCARO	???




--�� �ǽ� ��� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>> ��� :     Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� �ǽ� ������ �Է�
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20190328_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT FILENO"���Ϲ�ȣ", FILENAME"�����̸�"
FROM TBL_FILES;

/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20190328_01_SCOTT.SQL
*/

/*
���Ϲ�ȣ ���ϸ�
------- -----------------------------
    1	SALES.DOC
    2	PANMAE.XXLS
    3	RESEARCH.PPT
    4	STUDY.HWP
    5	SQL.TXT
    6	TEST.PNG
    7	SPRING.JPG
    8	20190328_01_SCOTT.SQL
*/
--�� TBL_FILES ���̺��� ������� ���� ���� ��ȸ�� �� �ֵ���
--  �������� �����Ѵ�. 
-- ���� Ǯ���� ����
SELECT *
FROM TBL_FILES;
SELECT FILENAME
, SUBSTR(FILENAME, LENGTH(FILENAME) - INSTR(REVERSE(FILENAME), '\', '1')+2)
--, SUBSTR(REVERSE(FILENAME), 1, 10)
--, LENGTH(FILENAME) 
--, SUBSTR(FILENAME, 5)
FROM TBL_FILES;

-- �Բ� Ǯ���� ����
SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(FILENAME, 16, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;
--==>> ��� :      1  	C:\AAA\BBB\CCC\SALES.DOC	    SALES.DOC
--���� ������ �ٸ��� ���־�� ���� ��������.

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(FILENAME, �׹�°\��ġ+1, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(FILENAME, �ι�°\��ġ+1, 9)"���ϸ�"
FROM TBL_FILES
WHERE FILENO=2;
--'\'�� ��ġ�� �Ϲ����� ��Ģ���� ã�� �� ���� �����̴�.
--REVERSE() �� ��������? 
--'ó�������ϴ�\�� ��ġ'�� ǥ������������.

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , REVERSE(FILENAME)"�Ųٷε����ϸ�"
FROM TBL_FILES;
--'ó�������ϴ�\�� ��ġ'�� 

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(�Ųٷε����ϸ�, ���������ġ, ���ⰹ��) REVERSE(FILENAME)"�Ųٷε����ϸ�"
FROM TBL_FILES;

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, ����''�� �����ϴ� ��ġ -1) REVERSE(FILENAME)"�Ųٷε����ϸ�"
FROM TBL_FILES;

    -- ����'\'�� �����ϴ� ��ġ
    INSTR(REVERSE(FILENAME), '\', 1);           -- ������ �Ű����� 1 ����

SELECT FILENO"���Ϲ�ȣ", FILENAME"����������ϸ�"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1)"�Ųٷε����ϸ�"
FROM TBL_FILES;


SELECT FILENO"���Ϲ�ȣ"
     ,REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1))"���ϸ�"
FROM TBL_FILES;
--==>> ���:
/*
1	SALES.DOC
2	PANMAE.XXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20190328_01_SCOTT.SQL
*/



--�� LPAD()
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
-- ó���Ǵ� ������ �� ����صӽô�. 

SELECT 'ORACLE'"��"
     , LPAD('ORACLE', 10, '*')"��"
--          -------   --  -- 
--                    ��
FROM DUAL;
--==>> ��� :
-- ORACLE	****ORACLE

-- 1) 10Byte ������ Ȯ���Ѵ�.                   �� �� ��° �Ķ���� ���� ����
-- 2) Ȯ���� ������ 'ORACLE'���ڿ��� ��´�.     �� ù ��° �Ķ���� ���� ����
-- 3) �����ִ� BytE ������ ���ʺ��� �� ��° �Ķ���� ������ ä���.
-- 4) �̷��� ������ ���� ������� ��ȯ�Ѵ�. 



--�� RPAD()
--> Byte ������ Ȯ���Ͽ� �����ʺ��� ���ڷ� ä��� ����� ���� �Լ�
-- ó���Ǵ� ������ �� ����صӽô�. 

SELECT 'ORACLE'"��"
     , RPAD('ORACLE', 10, '*')"��"
--          -------   --  -- 
--                    ��
FROM DUAL;
--==>> ��� :
-- ORACLE	ORACLE****
-- 1) 10Byte ������ Ȯ���Ѵ�.                   �� �� ��° �Ķ���� ���� ����
-- 2) Ȯ���� ������ 'ORACLE'���ڿ��� ��´�.     �� ù ��° �Ķ���� ���� ����
-- 3) �����ִ� BytE ������ �����ʺ��� �� ��° �Ķ���� ������ ä���.
-- 4) �̷��� ������ ���� ������� ��ȯ�Ѵ�. 


--�� LTRIM()
-- ������� ���� ���� 
-- 1) ���� ���� ��ȯ�Ѵ�. 
-- 2) 'ORA' �ϼ����� �ƴ϶� O R A �̷��� ���� �ִ� ���̶� �ϳ��� �߶�.
-- ��ҹ��� ���� �����Ͽ� ���ǰ� ���� ������, �� �̻� �߶��� ����. ���鵵 ���� �߶��� ����.
-- 3) �ڸ��ٰ� �޺κ��� �ĳ� �� ����.
-- ��'��������'�Լ��� ���� Ȱ���
-- ex. ���̵� �Է½� ������ ���� �� ���� 
--     �� APP ���� DB�� �Ѿ�� �� ������ �־��� ��쿡, ������ �ִ� ä�� DB�� ����� �� ���� ������ ������ ������ ��.
SELECT 'ORAORAORACLEORACLE' "��"                -- ���� ���� ����Ŭ ����Ŭ
    , LTRIM('ORAORAORACLEORACLE', 'ORA')"��"    
    , LTRIM('AAAORAORAORACLEORACLE', 'ORA')"��"
    , LTRIM('ORAoRAORACLEORACLE', 'ORA')"��"
    , LTRIM('ORA ORAORACLEORACLE', 'ORA')"��"
    , LTRIM('ORA               ')"��"          -- ���� ���� ���� �Լ��� Ȱ�� (�� ��° �Ķ���� �� ����, ����)
FROM DUAL;
/*
ORAORAORACLEORACLE	
CLEORACLE	
CLEORACLE	
oRAORACLEORACLE	 
 ORAORACLEORACLE
*/
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
-- ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ��� 
-- �̸� ������ ������� ��ȯ�Ѵ�.
-- ��, �ϼ������� ó������ �ʴ´�.
--==>> ��� :

SELECT LTRIM('�̱���̱�����̽Žű��̽����̱���̽Ź��̱��','�̱��')"TEST"
FROM DUAL;
--==>> ��� : ���̱��


--�� RTRIM()
-- ������� ���� ���� 
-- 1) ���� ���� ��ȯ�Ѵ�. 
-- 2) 'ORA' �ϼ����� �ƴ϶� O R A �̷��� ���� �ִ� ���̶� �ϳ��� �߶�.
-- ��ҹ��� ���� �����Ͽ� ���ǰ� ���� ������, �� �̻� �߶��� ����. ���鵵 ���� �߶��� ����.
-- 3) �ڸ��ٰ� �޺κ��� �ĳ� �� ����.
-- ��'��������'�Լ��� ���� Ȱ���
-- ex. ���̵� �Է½� ������ ���� �� ���� 
--     �� APP ���� DB�� �Ѿ�� �� ������ �־��� ��쿡, ������ �ִ� ä�� DB�� ����� �� ���� ������ ������ ������ ��.
SELECT 'ORAORAORACLEORACLE' "��"                -- ���� ���� ����Ŭ ����Ŭ
    , RTRIM('ORAORAORACLEORACLE', 'ORA')"��"    
    , RTRIM('AAAORAORAORACLEORACLE', 'ORA')"��"
    , RTRIM('ORAoRAORACLEORACLE', 'ORA')"��"
    , RTRIM('ORA ORAORACLEORACLE', 'ORA')"��"
    , RTRIM('ORA                ')"��"          -- ������ ���� ���� �Լ��� Ȱ�� (�� ��° �Ķ���� �� ����, ����)
FROM DUAL; 
/*
ORAORAORACLEORACLE	
ORAORAORACLEORACLE	
AAAORAORAORACLEORACLE	
ORAoRAORACLEORACLE	
ORA ORAORACLEORACLE	
ORA
*/


--�� TRANSLATE()
-- 1:1 �� �ٲپ��ش�.
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                               -
                , 'abcdefghijklmnopqrstuvwxyz')
                               -
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-6575-2297'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�')
FROM DUAL;
--==>> ���Ͽ�-����ĥ��-���̱�ĥ


--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����')
FROM DUAL;
--==>> MY ����CLE ����HOME

